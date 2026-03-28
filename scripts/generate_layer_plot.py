#!/usr/bin/env python3
"""Generate Figure 2: layer-wise probing accuracy across models."""

import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

# ── Style ──────────────────────────────────────────────────────────────
mpl.rcParams.update({
    "font.family": "serif",
    "font.size": 9,
    "axes.labelsize": 10,
    "xtick.labelsize": 9,
    "ytick.labelsize": 9,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "legend.fontsize": 8,
    "legend.framealpha": 0.9,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "savefig.transparent": True,
    "savefig.pad_inches": 0.05,
})

# ── Data from notebooks (Top-1 accuracy, mean across 5 folds) ─────────
layers = [3, 6, 9, 12]

# Composer classification
composer = {
    "CB + PDMX$_{\\mathrm{full}}$":       [0.807, 0.808, 0.816, 0.803],
    "CB + BMdataset":                        [0.827, 0.829, 0.834, 0.825],
    "CB + PDMX$_{\\mathrm{90M}}$":         [0.811, 0.817, 0.818, 0.816],
    "CB + PDMX → BM":                      [0.826, 0.843, 0.839, 0.839],
}

# Style classification
style = {
    "CB + PDMX$_{\\mathrm{full}}$":       [0.823, 0.826, 0.819, 0.815],
    "CB + BMdataset":                        [0.833, 0.837, 0.832, 0.832],
    "CB + PDMX$_{\\mathrm{90M}}$":         [0.824, 0.823, 0.822, 0.818],
    "CB + PDMX → BM":                      [0.830, 0.829, 0.823, 0.821],
}

COLORS = ["#2C699A", "#E07A5F", "#81B29A", "#F2CC8F"]
MARKERS = ["o", "s", "^", "D"]

def plot_panel(ax, data, title):
    for i, (label, values) in enumerate(data.items()):
        ax.plot(layers, values, color=COLORS[i], marker=MARKERS[i],
                markersize=5, linewidth=1.5, label=label)
    ax.set_xticks(layers)
    ax.set_xlabel("Layer")
    ax.set_ylabel("Top-1 Accuracy")
    ax.set_title(title, fontsize=10, fontweight="bold")
    ax.grid(axis="y", alpha=0.25)


fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(6.5, 2.8), sharey=False)

plot_panel(ax1, composer, "Composer Classification")
plot_panel(ax2, style, "Style Classification")

# Shared legend below
handles, labels = ax1.get_legend_handles_labels()
fig.legend(handles, labels, loc="lower center", ncol=4, bbox_to_anchor=(0.5, -0.08))

fig.tight_layout()
fig.subplots_adjust(bottom=0.18)
fig.savefig("paper/images/layer_accuracy.png")
plt.close(fig)
print("Saved paper/images/layer_accuracy.png")
