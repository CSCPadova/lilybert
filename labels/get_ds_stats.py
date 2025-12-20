import os
import json
import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter, defaultdict

# Config variables
LABELS_PATH = "./data/preprocessing_out/"
SAVE_FIGS = True                            # save figures as PNG
FIG_DIR = "./data/figures/"
os.makedirs(FIG_DIR, exist_ok=True)

# Keep track of labels
records = []
pitch_counter = Counter()
composer_counter = Counter()
period_counter = Counter()
musical_form_counter = Counter()
movement_name_counter = Counter()
midi_instrument_counter = Counter()

key_counter = Counter()
tempo_counter = Counter()
time_counter = Counter()

for file_name in os.listdir(LABELS_PATH):
    if not file_name.endswith(".json"):
        continue

    with open(os.path.join(LABELS_PATH, file_name), "r", encoding="utf-8") as f:
        data = json.load(f)

    stats = data["statistics"]
    labels = data.get("labels", {})

    raw_len = len(data.get("raw_text", ""))
    proc_len = len(data.get("text", ""))
    len_diff = raw_len - proc_len  # positive → reduction

    # Record structured row
    records.append({
        "file": file_name,
        "raw_len": raw_len,
        "proc_len": proc_len,
        "len_diff": len_diff,
        "note_count": stats.get("note_count", 0),
        "chord_count": stats.get("chord_count", 0),
        "rest_count": stats.get("rest_count", 0),
        "directive_count": stats.get("directive_count", 0),
        "unique_pitch_count": len(stats.get("unique_pitches", [])),
    })

    # Aggregate pitch frequencies
    for p in stats.get("unique_pitches", []):
        pitch_counter[p] += 1

    # Label statistics
    if "composer" in labels and labels["composer"]:
        composer_counter[labels["composer"]] += 1

    if "period" in labels and labels["period"]:
        period_counter[labels["period"]] += 1

    for mf in labels.get("musical_form", []):
        musical_form_counter[mf] += 1
    
    for i in labels.get("midi_instruments",[]):
        midi_instrument_counter[i] += 1

    # Movement name(s) under 'meta' key
    meta = labels.get("meta", {})
    for movement_name, movement_data in meta.items():
        # Remove leading number index if present (e.g. "1: allegro" --> "allegro")
        clean_name = movement_name.split(":")[-1].strip().lower()
        movement_name_counter[clean_name] += 1

         # Extract key/tempo/time from the nested dict
        if "key" in movement_data and movement_data["key"]:
            key_counter[movement_data["key"]] += 1
        if "tempo" in movement_data and movement_data["tempo"]:
            tempo_counter[movement_data["tempo"]] += 1
        if "time" in movement_data and movement_data["time"]:
            time_counter[movement_data["time"]] += 1



# Convert to DataFrame
# To write this one quickly for the report I used Chat. Sorry in advance for the sloppiness.

df = pd.DataFrame(records)

print("\n============================")
print(" Summary of Loaded Dataset")
print("============================")
print(df.describe())

# 1) ELEMENT STATISTICS (notes/chords/rests/directives)
print("\n============================")
print(" Element Type Summary")
print("============================")
element_summary = df[["note_count", "chord_count", "rest_count", "directive_count"]].describe()
print(element_summary)

plt.figure(figsize=(8,5))
df[["note_count", "chord_count", "rest_count", "directive_count"]].sum().plot(kind="bar")
plt.title("Total Parsed Musical Elements Across Dataset")
plt.xlabel("Element Type")
plt.ylabel("Total Count")
plt.tight_layout()
if SAVE_FIGS: plt.savefig(os.path.join(FIG_DIR, "element_totals.png"), dpi=300)
plt.show()

# 2) RAW vs PROCESSED TEXT LENGTH DIFFERENCES
# To show that processing text (removing excess whitespace, standardizing commands, etc) reduces character count
print("\n============================")
print(" Text Compression Statistics")
print("============================")
print(df["len_diff"].describe())

plt.figure(figsize=(8,5))
df["len_diff"].plot(kind="hist", bins=30)
plt.title("Raw → Processed Text Length Reduction")
plt.xlabel("Raw Length – Processed Length")
plt.ylabel("Frequency")
plt.tight_layout()
if SAVE_FIGS: plt.savefig(os.path.join(FIG_DIR, "text_length_reduction.png"), dpi=300)
plt.show()


# 3) UNIQUE PITCH DISTRIBUTION
pitch_df = pd.DataFrame(pitch_counter.items(), columns=["pitch", "count"]).sort_values("count", ascending=False)
print("\n============================")
print(" Pitch Frequencies")
print("============================")
print(pitch_df)

plt.figure(figsize=(10,5))
pitch_df.plot(x="pitch", y="count", kind="bar")
plt.title("Pitch Frequency Across Dataset")
plt.xlabel("Pitch")
plt.ylabel("Count")
plt.tight_layout()
if SAVE_FIGS: plt.savefig(os.path.join(FIG_DIR, "pitch_distribution.png"), dpi=300)
plt.show()


# 4) LABEL DISTRIBUTIONS
def plot_horizontal_bar(df, x_col, y_col, title, xlabel, ylabel, filename, base_height=6, width=8):
    # Scale figure height based on number of rows
    height = max(base_height, 0.25 * len(df))  # 0.25 inch per label
    plt.figure(figsize=(width, height))
    
    ax = df.plot(x=x_col, y=y_col, kind="barh", legend=False)
    plt.title(title, fontsize=16)
    plt.xlabel(xlabel, fontsize=14)
    plt.ylabel(ylabel, fontsize=14)
    
    # Invert y-axis so highest counts are at the top
    ax.invert_yaxis()
    
    # Shrink tick label font sizes
    ax.tick_params(axis="y", labelsize=12)  # y-axis labels (composer/movement names)
    ax.tick_params(axis="x", labelsize=12)  # x-axis labels (counts)
    
    plt.tight_layout()
    if SAVE_FIGS:
        plt.savefig(os.path.join(FIG_DIR, filename), dpi=300)
    plt.show()


# 5) Key, Time, Tempo Counts
key_df = pd.DataFrame(key_counter.items(), columns=["key","count"]).sort_values("count",ascending=False)
print("\n============================")
print(" Key Frequency")
print("============================")
print(key_df)

plot_horizontal_bar(key_df, "key", "count",
                    "Key", "Count", "Key",
                    "key_frequency.png", base_height=10, width=8)

time_df = pd.DataFrame(time_counter.items(), columns=["time","count"]).sort_values("count",ascending=False)
print("\n============================")
print(" Time Frequency")
print("============================")
print(key_df)

plot_horizontal_bar(time_df, "time", "count",
                    "Time Signature", "Count", "Key",
                    "time_frequency.png", base_height=10, width=8)

tempo_df = pd.DataFrame(tempo_counter.items(), columns=["tempo","count"]).sort_values("count",ascending=False)
print("\n============================")
print(" Tempo Frequency")
print("============================")
print(key_df)

plot_horizontal_bar(tempo_df, "tempo", "count",
                    "Tempo", "Count", "Key",
                    "tempo_frequency.png", base_height=10, width=8)

# 6) Instrument counts
instruments_df = pd.DataFrame(midi_instrument_counter.items(), columns=[
    "instrument","count"]).sort_values("count",ascending=False)
print("\n============================")
print(" Instrument Frequency")
print("============================")
print(instruments_df)

plot_horizontal_bar(instruments_df, "instrument", "count",
                    "Instrument Frequency", "Count", "Instrument",
                    "instrument_frequency.png", base_height=10, width=8)


# 7) Composer counts
composer_df = pd.DataFrame(composer_counter.items(), columns=["composer", "count"]).sort_values("count", ascending=False)
print("\n============================")
print(" Composer Frequency")
print("============================")
with pd.option_context('display.max_rows', None,):   
    print(composer_df)

plot_horizontal_bar(composer_df, "composer", "count",
                    "Composer Frequency", "File Count", "Composer",
                    "composer_frequency.png", base_height=10, width=8)


# 8) Period counts
period_df = pd.DataFrame(period_counter.items(), columns=["period", "count"]).sort_values("count", ascending=False)
print("\n============================")
print(" Period Frequency")
print("============================")
print(period_df)

plot_horizontal_bar(period_df, "period", "count",
                    "Musical Period Frequency", "File Count", "Period",
                    "period_frequency.png", base_height=6, width=8)


# 9) Musical form counts
form_df = pd.DataFrame(musical_form_counter.items(), columns=["musical_form", "count"]).sort_values("count", ascending=False)
print("\n============================")
print(" Musical Form Frequency")
print("============================")
print(form_df)

plot_horizontal_bar(form_df, "musical_form", "count",
                    "Musical Form Frequency", "Count", "Musical Form",
                    "musical_form_frequency.png", base_height=8, width=8)


# 10) Movement name counts
movement_df = pd.DataFrame(movement_name_counter.items(), columns=["movement", "count"]).sort_values("count", ascending=False)
print("\n============================")
print(" Movement Title Frequency")
print("============================")
with pd.option_context('display.max_rows', None,): 
    print(movement_df)

plot_horizontal_bar(movement_df, "movement", "count",
                    "Movement Title Frequency (e.g., Allegro, Largo, Bourrée)",
                    "Count", "Movement Title", "movement_frequency.png",
                    base_height=12, width=10)

