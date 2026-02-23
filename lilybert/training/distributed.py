"""Distributed training utilities for DDP and FSDP."""

from __future__ import annotations

import os
from dataclasses import dataclass
from typing import List, Optional

import torch
import torch.distributed as dist


@dataclass
class DistributedContext:
    """Holds distributed training state for the current process."""

    rank: int
    local_rank: int
    world_size: int
    backend: str = "nccl"

    @property
    def is_main_process(self) -> bool:
        return self.rank == 0


def is_distributed() -> bool:
    """Return ``True`` when running under ``torchrun`` / ``torch.distributed.launch``."""
    return os.environ.get("WORLD_SIZE", "1") != "1"


def setup_distributed(backend: str = "nccl") -> DistributedContext:
    """Initialise the process group from ``torchrun`` environment variables.

    Returns a :class:`DistributedContext` with rank, local_rank, and
    world_size populated.
    """
    rank = int(os.environ["RANK"])
    local_rank = int(os.environ["LOCAL_RANK"])
    world_size = int(os.environ["WORLD_SIZE"])

    dist.init_process_group(backend=backend, rank=rank, world_size=world_size)
    torch.cuda.set_device(local_rank)

    return DistributedContext(
        rank=rank,
        local_rank=local_rank,
        world_size=world_size,
        backend=backend,
    )


def cleanup_distributed() -> None:
    """Destroy the process group."""
    if dist.is_initialized():
        dist.destroy_process_group()


# ------------------------------------------------------------------
# Gathering helpers
# ------------------------------------------------------------------


def gather_tensors(
    tensor: torch.Tensor,
    world_size: int,
    device: torch.device,
) -> Optional[torch.Tensor]:
    """``all_gather`` a tensor from all ranks and concatenate.

    Returns the concatenated tensor on every rank.
    """
    gathered: List[torch.Tensor] = [
        torch.zeros_like(tensor) for _ in range(world_size)
    ]
    dist.all_gather(gathered, tensor)
    return torch.cat(gathered, dim=0)


def gather_objects(obj: object, world_size: int) -> List[object]:
    """``all_gather_object`` for arbitrary picklable objects.

    Returns a list of length *world_size* on every rank.
    """
    output: List[object] = [None] * world_size
    dist.all_gather_object(output, obj)
    return output
