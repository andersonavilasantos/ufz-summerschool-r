# Dataset source, citation and license

## What this data is

The course uses the **HITChip Atlas** — a large, real human-gut microbiome
dataset. It profiles **130 genus-like bacterial taxa** across **1,006 healthy
Western adults** using the HITChip phylogenetic microarray, together with
anonymised participant metadata (age, sex, geographic region, BMI group and a
pre-computed Shannon diversity index).

It comes from the study:

> **Lahti L, Salojärvi J, Salonen A, Scheffer M, de Vos WM (2014).**
> *Tipping elements in the human intestinal ecosystem.*
> **Nature Communications** 5:4344. https://doi.org/10.1038/ncomms5344

The underlying data are archived in the Dryad Digital Repository:

> Lahti L, Salojärvi J, Salonen A, Scheffer M, de Vos WM (2014).
> *Data from: Tipping elements in the human intestinal ecosystem* [Dataset].
> **Dryad.** https://doi.org/10.5061/dryad.pk75d

## License

The Dryad deposit is released under the **Creative Commons Zero (CC0 1.0)
public-domain dedication**. CC0 places no restrictions on reuse or
redistribution, so tidy CSV copies are shipped with this course for
convenience and offline teaching. Please still **cite the original paper**
(above) when you use the data — that is good scholarly practice even when not
legally required.

CC0 summary: https://creativecommons.org/publicdomain/zero/1.0/

> Note: the CC0 dedication covers the **dataset**. The teaching materials in
> this repository (the `.Rmd` lessons, README, scripts) are separately licensed
> under **CC BY 3.0** — see the top-level `LICENSE` file.

## Files in this folder

| File | What it is |
|------|------------|
| `sample_metadata.csv` | 1,006 samples × 7 columns: `sample_id`, `subject_id`, `age`, `sex`, `nationality`, `bmi_group`, `diversity_shannon` |
| `taxonomy.csv` | 130 genus-like taxa mapped to `phylum` and `family` |
| `genus_abundance.csv` | wide table: 1,006 samples (rows) × 130 genera (columns) of HITChip signal abundances |
| `atlas1006_source.rda` | the original phyloseq object the CSVs are built from (kept for provenance) |
| `get_data.R` | rebuilds/verifies the CSVs; downloads the source if missing; has a synthetic offline fallback |

## How the CSVs were produced

`get_data.R` reads the original `atlas1006` phyloseq object using **base R only**
(no Bioconductor), keeps the **baseline time point** (one cross-sectional row per
subject → 1,006 samples), and writes the three tidy CSVs above. Re-run it any
time with `source("data/get_data.R")`.

## Why this dataset for an R teaching session

- **Real and published** — participants analyse genuine data with a real
  ecological signal (e.g. the Firmicutes/Bacteroidetes balance, diversity that
  varies with age and region).
- **Rich for wrangling** — several categorical variables (sex, nationality,
  BMI group) and numeric variables (age, diversity, 130 abundance columns),
  plus real missing values to teach cleaning.
- **Big enough** — 1,006 rows make `group_by`/`summarise` and faceted ggplots
  meaningful, but it still fits comfortably in memory.
- **CRAN-only workflow** — no Bioconductor needed, so beginners can install
  everything easily.
