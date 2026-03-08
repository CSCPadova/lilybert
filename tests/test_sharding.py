"""Tests for sharded pretokenization and ShardedDataset."""

from __future__ import annotations

import json

import numpy as np
import pytest

from lilybert.data.sharded_dataset import ShardedDataset, ShardedMLMDataset
from lilybert.data.sharding import ShardManifest, ShardWriter

# ------------------------------------------------------------------
# ShardWriter + ShardManifest
# ------------------------------------------------------------------


class TestShardWriter:
    def test_single_shard(self, tmp_path):
        writer = ShardWriter(
            output_dir=tmp_path, shard_size=100, max_length=8, has_labels=True
        )
        for i in range(10):
            writer.add_sample(
                input_ids=np.ones(8, dtype=np.int32) * i,
                attention_mask=np.ones(8, dtype=np.int8),
                label=np.array(i % 3, dtype=np.int64),
                movement_id=f"mov_{i}",
                base_work=f"work_{i // 3}",
            )
        manifest = writer.finalize(
            label_to_index={"a": 0, "b": 1, "c": 2},
            config={"task": "test"},
        )

        assert manifest.total_samples == 10
        assert len(manifest.shards) == 1
        assert manifest.shards[0].num_samples == 10
        assert (tmp_path / "manifest.json").exists()
        assert (tmp_path / "shard_0000.npz").exists()

    def test_multiple_shards(self, tmp_path):
        writer = ShardWriter(
            output_dir=tmp_path, shard_size=4, max_length=8, has_labels=True
        )
        for i in range(10):
            writer.add_sample(
                input_ids=np.ones(8, dtype=np.int32) * i,
                attention_mask=np.ones(8, dtype=np.int8),
                label=np.array(i % 2, dtype=np.int64),
                movement_id=f"mov_{i}",
                base_work=f"work_{i}",
            )
        manifest = writer.finalize(label_to_index={"x": 0, "y": 1})

        assert manifest.total_samples == 10
        assert len(manifest.shards) == 3  # 4 + 4 + 2
        assert manifest.shards[0].num_samples == 4
        assert manifest.shards[1].num_samples == 4
        assert manifest.shards[2].num_samples == 2

        # Verify offsets
        assert manifest.shards[0].offset == 0
        assert manifest.shards[1].offset == 4
        assert manifest.shards[2].offset == 8

    def test_no_labels_mode(self, tmp_path):
        writer = ShardWriter(
            output_dir=tmp_path, shard_size=5, max_length=8, has_labels=False
        )
        for i in range(5):
            writer.add_sample(
                input_ids=np.zeros(8, dtype=np.int32),
                attention_mask=np.ones(8, dtype=np.int8),
            )
        manifest = writer.finalize()
        assert manifest.total_samples == 5

        data = np.load(tmp_path / "shard_0000.npz")
        assert "input_ids" in data
        assert "attention_mask" in data
        assert "labels" not in data

    def test_manifest_roundtrip(self, tmp_path):
        writer = ShardWriter(
            output_dir=tmp_path, shard_size=10, max_length=4, has_labels=True
        )
        for i in range(3):
            writer.add_sample(
                input_ids=np.array([1, 2, 3, 4], dtype=np.int32),
                attention_mask=np.array([1, 1, 1, 0], dtype=np.int8),
                label=np.array(0, dtype=np.int64),
                movement_id=f"m{i}",
                base_work="w0",
            )
        manifest = writer.finalize(label_to_index={"cls": 0})

        loaded = ShardManifest.load(tmp_path / "manifest.json")
        assert loaded.total_samples == manifest.total_samples
        assert len(loaded.shards) == len(manifest.shards)
        assert loaded.label_to_index == manifest.label_to_index
        assert loaded.movement_ids == manifest.movement_ids


# ------------------------------------------------------------------
# ShardedDataset
# ------------------------------------------------------------------


def _create_sharded_data(tmp_path, n_samples=20, shard_size=8, max_length=8):
    """Helper to create sharded data for testing."""
    writer = ShardWriter(
        output_dir=tmp_path,
        shard_size=shard_size,
        max_length=max_length,
        has_labels=True,
    )
    for i in range(n_samples):
        writer.add_sample(
            input_ids=np.ones(max_length, dtype=np.int32) * i,
            attention_mask=np.ones(max_length, dtype=np.int8),
            label=np.array(i % 3, dtype=np.int64),
            movement_id=f"mov_{i}",
            base_work=f"work_{i // 5}",
        )
    return writer.finalize(
        label_to_index={"a": 0, "b": 1, "c": 2},
        config={"task": "test", "max_length": max_length},
    )


class TestShardedDataset:
    def test_load_all(self, tmp_path):
        _create_sharded_data(tmp_path, n_samples=20, shard_size=8)
        ds = ShardedDataset(manifest_path=tmp_path / "manifest.json")

        assert len(ds) == 20
        sample = ds[0]
        assert "input_ids" in sample
        assert "attention_mask" in sample
        assert "label" in sample
        assert "movement_id" in sample
        assert "base_work" in sample

    def test_filter_by_movement_ids(self, tmp_path):
        _create_sharded_data(tmp_path, n_samples=20, shard_size=8)
        subset_ids = ["mov_2", "mov_5", "mov_15"]
        ds = ShardedDataset(
            manifest_path=tmp_path / "manifest.json",
            movement_ids=subset_ids,
        )

        assert len(ds) == 3
        returned_ids = {ds[i]["movement_id"] for i in range(len(ds))}
        assert returned_ids == set(subset_ids)

    def test_label_to_index(self, tmp_path):
        _create_sharded_data(tmp_path)
        ds = ShardedDataset(manifest_path=tmp_path / "manifest.json")
        assert ds.label_to_index == {"a": 0, "b": 1, "c": 2}

    def test_get_movement_ids(self, tmp_path):
        _create_sharded_data(tmp_path, n_samples=5, shard_size=10)
        ds = ShardedDataset(manifest_path=tmp_path / "manifest.json")
        mids = ds.get_movement_ids()
        assert len(mids) == 5
        assert mids[0] == "mov_0"

    def test_values_correct(self, tmp_path):
        _create_sharded_data(tmp_path, n_samples=10, shard_size=4, max_length=4)
        ds = ShardedDataset(manifest_path=tmp_path / "manifest.json")

        for i in range(10):
            sample = ds[i]
            expected_ids = np.ones(4, dtype=np.int32) * i
            np.testing.assert_array_equal(sample["input_ids"].numpy(), expected_ids)
            assert sample["movement_id"] == f"mov_{i}"


# ------------------------------------------------------------------
# ShardedMLMDataset
# ------------------------------------------------------------------


def _create_mlm_shards(tmp_path, n_samples=15, shard_size=8, max_length=8):
    writer = ShardWriter(
        output_dir=tmp_path,
        shard_size=shard_size,
        max_length=max_length,
        has_labels=False,
    )
    for i in range(n_samples):
        writer.add_sample(
            input_ids=np.ones(max_length, dtype=np.int32) * i,
            attention_mask=np.ones(max_length, dtype=np.int8),
        )
    return writer.finalize()


class TestShardedMLMDataset:
    def test_load(self, tmp_path):
        _create_mlm_shards(tmp_path, n_samples=15, shard_size=8)
        ds = ShardedMLMDataset(manifest_path=tmp_path / "manifest.json")

        assert len(ds) == 15
        sample = ds[0]
        assert "input_ids" in sample
        assert "attention_mask" in sample
        assert "label" not in sample

    def test_values(self, tmp_path):
        _create_mlm_shards(tmp_path, n_samples=5, shard_size=10, max_length=4)
        ds = ShardedMLMDataset(manifest_path=tmp_path / "manifest.json")

        for i in range(5):
            sample = ds[i]
            expected = np.ones(4, dtype=np.int32) * i
            np.testing.assert_array_equal(sample["input_ids"].numpy(), expected)


# ------------------------------------------------------------------
# Distributed utilities (unit-testable parts)
# ------------------------------------------------------------------


class TestDistributedUtils:
    def test_is_distributed_default(self, monkeypatch):
        monkeypatch.delenv("WORLD_SIZE", raising=False)
        from lilybert.training.distributed import is_distributed

        assert is_distributed() is False

    def test_is_distributed_true(self, monkeypatch):
        monkeypatch.setenv("WORLD_SIZE", "4")
        from lilybert.training.distributed import is_distributed

        assert is_distributed() is True

    def test_is_distributed_one(self, monkeypatch):
        monkeypatch.setenv("WORLD_SIZE", "1")
        from lilybert.training.distributed import is_distributed

        assert is_distributed() is False
