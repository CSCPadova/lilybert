#!/usr/bin/env python3
"""Generate camera-ready Figure 1 (dataset statistics) for SMC 2026 paper.

Reads data/labels/labels_v1.json and outputs 6 PNGs to paper/images/.
"""

import json
from collections import Counter
from pathlib import Path

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

# ── Paths ──────────────────────────────────────────────────────────────
LABELS_JSON = Path("data/labels/labels_v1.json")
OUTPUT_DIR = Path("paper/images")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# ── Style ──────────────────────────────────────────────────────────────
BAR_COLOR = "#4878A8"
BAR_EDGE = "#2F5177"
DONUT_COLORS = ["#2C699A", "#54A5A0", "#83C5A8", "#BAE4BC"]
ANNOT_COLOR = "#333333"

mpl.rcParams.update({
    "font.family": "serif",
    "font.size": 9,
    "axes.labelsize": 9,
    "xtick.labelsize": 8,
    "ytick.labelsize": 8,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "axes.grid": False,
    "grid.alpha": 0.25,
    "axes.axisbelow": True,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "savefig.transparent": True,
    "savefig.pad_inches": 0.05,
})

# ── Mappings ───────────────────────────────────────────────────────────
SOLFEGE_TO_NOTE = {
    "do": "C", "re": "D", "mi": "E", "fa": "F",
    "sol": "G", "la": "A", "si": "B",
    "sib": "B♭", "mib": "E♭", "fad": "F♯",
}

INSTRUMENT_RENAME = {
    "voice oohs": "Voice",
    "synth voice": "Voice",
    "voice aahs": "Voice",
    "church organ": "Organ",
    "acoustic guitar (nylon)": "Guitar",
    "bright acoustic": "Piano",
    "pizzicato strings": "Pizz. Strings",
    "acoustic bass": "Bass",
    "french horn": "French Horn",
    "english horn": "English Horn",
}


# ── Data loading ───────────────────────────────────────────────────────
def load_data():
    with open(LABELS_JSON, "r", encoding="utf-8") as f:
        data = json.load(f)

    n_files = len(data)
    composer_ctr = Counter()
    period_ctr = Counter()
    form_ctr = Counter()
    instrument_ctr = Counter()
    key_ctr = Counter()
    time_ctr = Counter()

    for entry in data.values():
        # Composer
        c = entry.get("composer", "")
        if c:
            composer_ctr[c] += 1

        # Period
        p = entry.get("period", "")
        if p:
            period_ctr[p] += 1

        # Musical form
        for mf in entry.get("musical_form", []):
            clean = mf.replace("_", " ").capitalize()
            form_ctr[clean] += 1

        # Instruments
        for inst in entry.get("midi_instruments", []):
            name = INSTRUMENT_RENAME.get(inst, inst.title())
            instrument_ctr[name] += 1

        # Movement-level metadata
        for mov_data in entry.get("meta", {}).values():
            k = mov_data.get("key", "")
            if k:
                key_ctr[SOLFEGE_TO_NOTE.get(k, k)] += 1
            t = mov_data.get("time", "")
            if t:
                time_ctr[t] += 1

    print(f"Loaded {n_files} files")
    print(f"  Composers: {len(composer_ctr)}")
    print(f"  Periods: {len(period_ctr)}")
    print(f"  Forms: {len(form_ctr)}")
    print(f"  Instruments: {len(instrument_ctr)}")
    print(f"  Keys: {len(key_ctr)}")
    print(f"  Time sigs: {len(time_ctr)}")
    print(f"  Total movements: {sum(len(e.get('meta', {})) for e in data.values())}")

    return n_files, {
        "composer": composer_ctr,
        "period": period_ctr,
        "form": form_ctr,
        "instrument": instrument_ctr,
        "key": key_ctr,
        "time": time_ctr,
    }


# ── Plot helpers ───────────────────────────────────────────────────────
def _top_n(counter, n, other_label="Other"):
    """Return sorted list of (label, count) with tail grouped as 'Other'."""
    most = counter.most_common(n)
    rest = sum(c for _, c in counter.most_common()[n:])
    n_rest = len(counter) - n
    items = list(most)
    if rest > 0:
        items.append((f"{other_label} ({n_rest})", rest))
    return items


def plot_hbar(items, total, filename, show_pct=True, figsize=(3.0, 2.6)):
    """Horizontal bar chart with annotations."""
    labels = [l for l, _ in reversed(items)]
    values = [v for _, v in reversed(items)]

    fig, ax = plt.subplots(figsize=figsize)
    bars = ax.barh(labels, values, color=BAR_COLOR, edgecolor=BAR_EDGE, linewidth=0.4, height=0.65)

    for bar, v in zip(bars, values):
        if show_pct:
            txt = f"{v} ({v / total:.0%})"
        else:
            txt = str(v)
        ax.text(bar.get_width() + max(values) * 0.02, bar.get_y() + bar.get_height() / 2,
                txt, va="center", ha="left", fontsize=7, color=ANNOT_COLOR)

    ax.set_xlim(0, max(values) * 1.25)
    ax.set_xlabel("Count")
    ax.grid(axis="x", alpha=0.25)
    ax.grid(axis="y", visible=False)
    fig.savefig(OUTPUT_DIR / filename)
    plt.close(fig)
    print(f"  Saved {filename}")


def plot_vbar(items, filename, figsize=(3.0, 2.2), rotate_labels=0):
    """Vertical bar chart with count annotations above bars."""
    labels = [l for l, _ in items]
    values = [v for _, v in items]

    fig, ax = plt.subplots(figsize=figsize)
    bars = ax.bar(labels, values, color=BAR_COLOR, edgecolor=BAR_EDGE, linewidth=0.4, width=0.6)

    for bar, v in zip(bars, values):
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + max(values) * 0.02,
                str(v), ha="center", va="bottom", fontsize=7, color=ANNOT_COLOR)

    ax.set_ylim(0, max(values) * 1.15)
    ax.set_ylabel("Count")
    ax.grid(axis="y", alpha=0.25)
    ax.grid(axis="x", visible=False)
    if rotate_labels:
        ax.tick_params(axis="x", rotation=rotate_labels)
    fig.savefig(OUTPUT_DIR / filename)
    plt.close(fig)
    print(f"  Saved {filename}")


def plot_donut(counter, filename, figsize=(3.2, 2.8)):
    """Donut chart for period distribution."""
    # Sort by count descending
    items = counter.most_common()
    labels = [l for l, _ in items]
    values = [v for _, v in items]
    total = sum(values)

    fig, ax = plt.subplots(figsize=figsize)

    # Explode small wedges slightly for clarity
    explode = [0.03 if v / total < 0.1 else 0 for v in values]

    wedges, _ = ax.pie(
        values,
        colors=DONUT_COLORS[: len(items)],
        startangle=90,
        explode=explode,
        wedgeprops=dict(width=0.42, edgecolor="white", linewidth=1.5),
    )

    # Manually place labels with fixed y-offsets to avoid overlap
    # Order: Late Baroque (large, bottom-left), High Baroque (right),
    #        Transitional Classical (small, top), Early Baroque (small, top-left)
    label_offsets = {
        0: (1.15, None),   # Late Baroque — default position
        1: (1.15, None),   # High Baroque — default position
        2: (1.55, 0.15),   # Transitional Classical — push further right and down
        3: (1.55, -0.15),  # Early Baroque — push further left and up
    }

    for i, (wedge, label, val) in enumerate(zip(wedges, labels, values)):
        ang = (wedge.theta2 + wedge.theta1) / 2
        r_txt, y_nudge = label_offsets.get(i, (1.15, None))
        x = np.cos(np.radians(ang))
        y = np.sin(np.radians(ang))
        tx, ty = r_txt * x, r_txt * y
        if y_nudge is not None:
            ty += y_nudge
        ha = "left" if tx >= 0 else "right"
        ax.annotate(
            f"{label}\n{val / total:.1%}",
            xy=(0.77 * x, 0.77 * y),
            xytext=(tx, ty),
            ha=ha, va="center", fontsize=7,
            arrowprops=dict(arrowstyle="-", color="#888888", lw=0.6),
        )

    ax.text(0, 0, f"n = {total}", ha="center", va="center", fontsize=9, fontweight="bold")
    ax.set_aspect("equal")
    fig.savefig(OUTPUT_DIR / filename)
    plt.close(fig)
    print(f"  Saved {filename}")


# ── Main ───────────────────────────────────────────────────────────────
def main():
    n_files, counters = load_data()

    print("\nGenerating figures...")

    # (a) Musical form — top 8 + Other
    items = _top_n(counters["form"], 8)
    plot_hbar(items, n_files, "musical_form_frequency.png", figsize=(3.0, 2.6))

    # (b) Period — donut
    plot_donut(counters["period"], "period_frequency.png")

    # (c) Instruments — top 10
    items = _top_n(counters["instrument"], 10)
    plot_hbar(items, n_files, "instrument_frequency.png", figsize=(3.0, 3.0))

    # (d) Key — vertical bar (all keys, sorted by count)
    items = counters["key"].most_common()
    plot_vbar(items, "key_frequency.png", figsize=(3.0, 2.2))

    # (e) Time signature — top 8 + Other, vertical
    items = _top_n(counters["time"], 8)
    plot_vbar(items, "time_frequency.png", figsize=(3.2, 2.2), rotate_labels=35)

    # (f) Composer — top 10 + Other
    items = _top_n(counters["composer"], 10)
    plot_hbar(items, n_files, "composer_frequency.png", figsize=(3.0, 3.0))

    print("\nDone.")


if __name__ == "__main__":
    main()
