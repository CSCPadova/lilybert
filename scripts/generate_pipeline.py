#!/usr/bin/env python3
"""Generate pipeline diagram for LilyBERT (Figure 1)."""

import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

mpl.rcParams.update({
    "font.family": "serif",
    "font.size": 9,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "savefig.transparent": True,
    "savefig.pad_inches": 0.05,
})

fig, ax = plt.subplots(figsize=(6.5, 2.4))
ax.set_xlim(-0.5, 10.5)
ax.set_ylim(-0.3, 2.6)
ax.axis("off")

# ── Color palette ────────────────────────────────────────────────────────
C_DATA = "#E8F0FE"       # light blue - data boxes
C_MODEL = "#FFF3E0"      # light orange - model boxes
C_EVAL = "#E8F5E9"       # light green - eval boxes
C_BORDER_DATA = "#2C699A"
C_BORDER_MODEL = "#E07A5F"
C_BORDER_EVAL = "#81B29A"
C_ARROW = "#555555"

BOX_H = 0.7
BOX_R = 0.15  # corner radius

def draw_box(x, y, w, text, subtext, fc, ec, fontsize=8, subfontsize=6):
    box = FancyBboxPatch(
        (x - w / 2, y - BOX_H / 2), w, BOX_H,
        boxstyle=f"round,pad={BOX_R}",
        facecolor=fc, edgecolor=ec, linewidth=1.2,
    )
    ax.add_patch(box)
    if subtext:
        ax.text(x, y + 0.08, text, ha="center", va="center",
                fontsize=fontsize, fontweight="bold", color="#333333")
        ax.text(x, y - 0.18, subtext, ha="center", va="center",
                fontsize=subfontsize, color="#666666", style="italic")
    else:
        ax.text(x, y, text, ha="center", va="center",
                fontsize=fontsize, fontweight="bold", color="#333333")

def draw_arrow(x1, y1, x2, y2, label=None):
    ax.annotate(
        "", xy=(x2, y2), xytext=(x1, y1),
        arrowprops=dict(
            arrowstyle="-|>", color=C_ARROW, lw=1.2,
            connectionstyle="arc3,rad=0",
        ),
    )
    if label:
        mx, my = (x1 + x2) / 2, (y1 + y2) / 2 + 0.15
        ax.text(mx, my, label, ha="center", va="center",
                fontsize=5.5, color="#666666")

# ── Layout: top row = pre-training path, bottom row = fine-tune + probe ─
# Positions (x, y)
Y_TOP = 1.9
Y_BOT = 0.6

# Row 1: LilyPond Source → Tokenizer → CodeBERT → MLM Pre-training
draw_box(0.6, Y_TOP, 1.6, "LilyPond", "source files", C_DATA, C_BORDER_DATA)
draw_box(2.8, Y_TOP, 1.6, "Tokenizer", "+115 LY tokens", C_MODEL, C_BORDER_MODEL)
draw_box(5.2, Y_TOP, 1.8, "CodeBERT", "RoBERTa-base", C_MODEL, C_BORDER_MODEL)
draw_box(7.8, Y_TOP, 2.0, "MLM Pre-training", "PDMX (~15B tok.)", C_MODEL, C_BORDER_MODEL)

draw_arrow(1.45, Y_TOP, 1.95, Y_TOP)
draw_arrow(3.65, Y_TOP, 4.25, Y_TOP)
draw_arrow(6.15, Y_TOP, 6.75, Y_TOP)

# Row 2: Fine-tuning → Frozen Encoder → Linear Probe → Tasks
draw_box(2.8, Y_BOT, 2.0, "Fine-tuning", "BMdataset (~90M tok.)", C_MODEL, C_BORDER_MODEL)
draw_box(5.6, Y_BOT, 2.0, "Frozen Encoder", "layer embeddings", C_MODEL, C_BORDER_MODEL)
draw_box(8.5, Y_BOT, 2.0, "Linear Probe", "composer / style", C_EVAL, C_BORDER_EVAL)

# Vertical arrow from MLM to Fine-tuning
draw_arrow(7.8, Y_TOP - BOX_H / 2 - 0.05, 4.0, Y_BOT + BOX_H / 2 + 0.05)

draw_arrow(3.85, Y_BOT, 4.55, Y_BOT)
draw_arrow(6.65, Y_BOT, 7.45, Y_BOT)

# Label: "Mutopia (eval)" going into frozen encoder
ax.text(5.6, Y_BOT - 0.55, "Mutopia corpus (eval)", ha="center",
        fontsize=6, color="#666666", style="italic")
ax.annotate(
    "", xy=(5.6, Y_BOT - BOX_H / 2), xytext=(5.6, Y_BOT - 0.45),
    arrowprops=dict(arrowstyle="-|>", color=C_ARROW, lw=0.8),
)

fig.tight_layout()
fig.savefig("paper/images/pipeline.png")
plt.close(fig)
print("Saved paper/images/pipeline.png")
