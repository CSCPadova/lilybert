#!/usr/bin/env python3
"""Generate t-SNE embedding visualization for the best model (CB + PDMX → BM, layer 6)."""

import json
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from sklearn.manifold import TSNE
from collections import Counter
from pathlib import Path

# ── Style (match generate_layer_plot.py) ─────────────────────────────────
mpl.rcParams.update({
    "font.family": "serif",
    "font.size": 9,
    "axes.labelsize": 10,
    "xtick.labelsize": 9,
    "ytick.labelsize": 9,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "legend.fontsize": 7,
    "legend.framealpha": 0.9,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "savefig.transparent": True,
    "savefig.pad_inches": 0.05,
})

DATA_ROOT = Path("data/mutopia")
META_FILE = DATA_ROOT / "mutopia-cb-pdmx-bm.json"
LAYER = "layer_6"

# ── Load data ────────────────────────────────────────────────────────────
meta = json.loads(META_FILE.read_text())

embeddings = []
composers = []
styles = []

for entry in meta:
    emb_path = DATA_ROOT / entry["embeddings"][LAYER]
    embeddings.append(np.load(emb_path))
    composers.append(entry["composer"])
    styles.append(entry["style"])

X = np.stack(embeddings)
composers = np.array(composers)
styles = np.array(styles)

# ── t-SNE ────────────────────────────────────────────────────────────────
tsne = TSNE(n_components=2, random_state=42, perplexity=30, max_iter=1000)
X_2d = tsne.fit_transform(X)

# ── Plot: style (left) and composer top-10 (right) ──────────────────────
# Style panel: use all samples, color by style
style_counts = Counter(styles)
# Sort styles by frequency for legend order
style_order = [s for s, _ in style_counts.most_common()]

# Composer panel: filter to top-10 composers (>=10 samples), gray out rest
composer_counts = Counter(composers)
top_composers = [c for c, n in composer_counts.most_common(10) if n >= 10]

# Color palettes
style_cmap = plt.cm.get_cmap("tab20", len(style_order))
style_colors = {s: style_cmap(i) for i, s in enumerate(style_order)}

composer_cmap = plt.cm.get_cmap("tab10", len(top_composers))
composer_colors = {c: composer_cmap(i) for i, c in enumerate(top_composers)}

# Friendly names for composers
composer_names = {
    "BachJS": "J.S. Bach",
    "Traditional": "Traditional",
    "GiulianiM": "M. Giuliani",
    "MozartWA": "W.A. Mozart",
    "BeethovenLv": "L.v. Beethoven",
    "SorF": "F. Sor",
    "HoretzkyF": "F. Horetzky",
    "HandelGF": "G.F. Handel",
    "SchubertF": "F. Schubert",
    "ChopinFF": "F. Chopin",
}

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(6.5, 3.2))

# -- Style panel --
for s in style_order:
    mask = styles == s
    ax1.scatter(X_2d[mask, 0], X_2d[mask, 1], c=[style_colors[s]], s=8,
                alpha=0.6, label=s, edgecolors="none")
ax1.set_title("Colored by Style", fontsize=10, fontweight="bold")
ax1.set_xticks([])
ax1.set_yticks([])
ax1.legend(loc="center left", bbox_to_anchor=(1.0, 0.5), markerscale=2,
           fontsize=6, frameon=False)

# -- Composer panel --
other_mask = ~np.isin(composers, top_composers)
ax2.scatter(X_2d[other_mask, 0], X_2d[other_mask, 1], c="#d0d0d0", s=6,
            alpha=0.3, label="Other", edgecolors="none")
for c in top_composers:
    mask = composers == c
    label = composer_names.get(c, c)
    ax2.scatter(X_2d[mask, 0], X_2d[mask, 1], c=[composer_colors[c]], s=8,
                alpha=0.7, label=label, edgecolors="none")
ax2.set_title("Colored by Composer (top 10)", fontsize=10, fontweight="bold")
ax2.set_xticks([])
ax2.set_yticks([])
ax2.legend(loc="center left", bbox_to_anchor=(1.0, 0.5), markerscale=2,
           fontsize=6, frameon=False)

fig.tight_layout()
fig.savefig("paper/images/tsne_embeddings.png")
plt.close(fig)
print("Saved paper/images/tsne_embeddings.png")
