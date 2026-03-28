#!/usr/bin/env python3
"""Generate confusion matrix for composer classification (CB + PDMX → BM, layer 6)."""

import json
from pathlib import Path
from collections import Counter

import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from sklearn.model_selection import StratifiedKFold
from sklearn.neural_network import MLPClassifier
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.metrics import confusion_matrix

# ── Style (match generate_layer_plot.py) ─────────────────────────────────
mpl.rcParams.update({
    "font.family": "serif",
    "font.size": 9,
    "axes.labelsize": 10,
    "xtick.labelsize": 7,
    "ytick.labelsize": 7,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "figure.dpi": 300,
    "savefig.dpi": 300,
    "savefig.bbox": "tight",
    "savefig.transparent": True,
    "savefig.pad_inches": 0.05,
})

SEED = 42
N_FOLDS = 5
MIN_COUNT = 10
DATA_DIR = Path("data/mutopia")
META_FILE = DATA_DIR / "mutopia-cb-pdmx-bm.json"
LAYER = "layer_6"

# Friendly composer names
COMPOSER_NAMES = {
    "AguadoD": "Aguado",
    "Anonymous": "Anonymous",
    "BachJS": "J.S. Bach",
    "BeethovenLv": "Beethoven",
    "BrahmsJ": "Brahms",
    "BurgmullerJFF": "Burgmüller",
    "CarcassiM": "Carcassi",
    "ChopinFF": "Chopin",
    "CzernyC": "Czerny",
    "DiabelliA": "Diabelli",
    "FaureG": "Fauré",
    "GiulianiM": "Giuliani",
    "GriegE": "Grieg",
    "HandelGF": "Handel",
    "HaydnFJ": "Haydn",
    "HoretzkyF": "Horetzky",
    "JoplinS": "Joplin",
    "KnjzeF": "Knjze",
    "Mendelssohn-BartholdyF": "Mendelssohn",
    "MontePd": "de Monte",
    "MonteverdiC": "Monteverdi",
    "MozartWA": "Mozart",
    "RachmaninoffS": "Rachmaninoff",
    "SatieE": "Satie",
    "SchubertF": "Schubert",
    "SchumannR": "Schumann",
    "SorF": "Sor",
    "SousaJP": "Sousa",
    "TitelouzeJ": "Titelouze",
    "Traditional": "Traditional",
    "VerdiG": "Verdi",
    "VivaldiA": "Vivaldi",
}

# ── Load data ────────────────────────────────────────────────────────────
meta = json.loads(META_FILE.read_text())

embeddings = []
composers = []
for entry in meta:
    emb_path = DATA_DIR / entry["embeddings"][LAYER]
    embeddings.append(np.load(emb_path))
    composers.append(entry["composer"])

X = np.stack(embeddings)
composers = np.array(composers)

# Filter to classes with >= MIN_COUNT samples
counts = Counter(composers)
valid = {c for c, n in counts.items() if n >= MIN_COUNT}
mask = np.array([c in valid for c in composers])

X = X[mask]
composer_labels = composers[mask]

le = LabelEncoder()
y = le.fit_transform(composer_labels)
n_classes = len(le.classes_)

# ── 5-fold CV, aggregate predictions ─────────────────────────────────────
all_y_true = []
all_y_pred = []

skf = StratifiedKFold(n_splits=N_FOLDS, shuffle=True, random_state=SEED)
for fold_idx, (train_idx, val_idx) in enumerate(skf.split(X, y)):
    X_train, X_val = X[train_idx], X[val_idx]
    y_train, y_val = y[train_idx], y[val_idx]

    scaler = StandardScaler()
    X_train = scaler.fit_transform(X_train)
    X_val = scaler.transform(X_val)

    clf = MLPClassifier(hidden_layer_sizes=(), max_iter=400, random_state=SEED)
    clf.fit(X_train, y_train)
    y_pred = clf.predict(X_val)

    all_y_true.extend(y_val)
    all_y_pred.extend(y_pred)

all_y_true = np.array(all_y_true)
all_y_pred = np.array(all_y_pred)

# ── Confusion matrix (row-normalized) ────────────────────────────────────
cm = confusion_matrix(all_y_true, all_y_pred)
cm_norm = cm.astype(float) / cm.sum(axis=1, keepdims=True)

# Pretty labels
labels = [COMPOSER_NAMES.get(c, c) for c in le.classes_]

fig, ax = plt.subplots(figsize=(7, 6))
im = ax.imshow(cm_norm, cmap="Blues", vmin=0, vmax=1, aspect="equal")

ax.set_xticks(range(n_classes))
ax.set_yticks(range(n_classes))
ax.set_xticklabels(labels, rotation=90, ha="center")
ax.set_yticklabels(labels)
ax.set_xlabel("Predicted")
ax.set_ylabel("True")

# Annotate cells with count where off-diagonal and significant
for i in range(n_classes):
    for j in range(n_classes):
        val = cm_norm[i, j]
        if val > 0.04:
            color = "white" if val > 0.5 else "black"
            ax.text(j, i, f"{val:.2f}", ha="center", va="center",
                    fontsize=5, color=color)

cbar = fig.colorbar(im, ax=ax, fraction=0.046, pad=0.04)
cbar.set_label("Recall (row-normalized)", fontsize=9)

fig.tight_layout()
fig.savefig("paper/images/confusion_matrix.png")
plt.close(fig)
print("Saved paper/images/confusion_matrix.png")
