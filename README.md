# R for Multi-omics — Summer School 2026

**Refreshing / Basic Knowledge: R**
Part of the Summer School *"Trends in multi-omics data analysis for Microbial
Ecology and Biotechnology"* — UFZ, Leipzig.

**Instructor:** Anderson Santos

This repository is a **hands-on R refresher for biologists** — no prior
programming experience required. In ~3 hours you go from *"what is a vector?"* to
a complete microbial-ecology analysis: importing data, heavy wrangling with
**dplyr / tidyr**, rich visualisation with **ggplot2**, and a guided capstone
with a real ordination. Everything is taught on a **real, published human-gut
microbiome dataset** so every concept connects to data you actually work with.

> This R session is the companion to the parallel *Python* refresher. It is
> **not** a translation — it is designed around R's strengths (the tidyverse and
> the grammar of graphics) and uses a **different, real dataset**.

---

## 🚀 How to run the lessons

There are two ways. If you have never programmed before, **use Posit Cloud** — it
runs RStudio in your browser with nothing to install (the R analogue of Google
Colab).

### Option A — Posit Cloud (easiest, nothing to install)

[Posit Cloud](https://posit.cloud) gives you a free, browser-based RStudio.

1. Create a free account at **https://posit.cloud** (Sign Up).
2. **Get the course files.** Easiest: on the GitHub page click
   **Code ▸ Download ZIP** and unzip it. (Or, if you know git, copy the repo URL.)
3. In Posit Cloud, click **New Project ▸ New Project from Git Repository** and
   paste
   `https://github.com/andersonavilasantos/ufz-summerschool-r.git`
   — *or* choose **New RStudio Project** and then **Upload** the unzipped folder
   (use the Files pane, top-right **Upload** button).
4. In the RStudio **Console** (bottom-left), install the packages once:
   ```r
   source("setup.R")
   ```
   (This takes a few minutes the first time.)
5. Open a lesson from the **Files** pane (e.g. `notebooks/01_r_essentials.Rmd`)
   and either run chunks one by one (green ▶) or click **Knit** to build the HTML.

> The data ships **with** the repository (it is public-domain, CC0), so nothing
> needs to be downloaded — the lessons just work.

### Option B — On your own computer (local RStudio)

1. Install **R** — https://cran.r-project.org
2. Install **RStudio Desktop** (free) — https://posit.co/download/rstudio-desktop/
3. Get the materials:
   ```bash
   git clone https://github.com/andersonavilasantos/ufz-summerschool-r.git
   ```
   *(No git? Use **Code ▸ Download ZIP** on GitHub and unzip.)*
4. Open **`ufz-summerschool-r.Rproj`** in RStudio (this sets the working
   directory correctly).
5. In the Console, install everything once:
   ```r
   source("setup.R")
   ```
6. Open the lessons in `notebooks/` **in order** and run or **Knit** them.

---

## 📚 What's inside

### Core session (~3 h)

| # | Lesson | ~min | You will learn |
|---|--------|------|----------------|
| 01 | [R & RStudio essentials](notebooks/01_r_essentials.Rmd) | 25 | objects, types, **vectors**, indexing, `NA`, factors, **functions**, the **pipe** `|>` / `%>%` |
| 02 | [Data frames & tibbles](notebooks/02_data_frames_tibbles.Rmd) | 25 | import with **readr**, `glimpse`/`summary`, columns, **factors**, the three data tables |
| 03 | [Data wrangling (dplyr & tidyr)](notebooks/03_data_wrangling.Rmd) | 45 | `filter`/`select`/`mutate`/`arrange`, `group_by`+`summarise`, **joins**, `pivot_longer`/`pivot_wider` |
| 04 | [Visualization (ggplot2)](notebooks/04_visualization_ggplot2.Rmd) | 40 | grammar of graphics: scatter, histogram, boxplot, bar/stacked, colour, **faceting**, themes, `ggsave` |
| 05 | [Capstone project](notebooks/05_capstone_project.Rmd) | 45–60 | guided end-to-end analysis: clean → reshape → join → diversity → figures → ANOVA → **NMDS** → export |

Every lesson opens with **learning objectives**, is full of runnable examples
with **line-by-line comments** (so it can be taught straight from the chunks),
has **exercises with collapsible solutions**, **📌 Teaching-note** callouts, and
closes with a **recap**.

### Optional / extension

| # | Lesson | When to use |
|---|--------|-------------|
| 06 | [Bonus — heatmaps, correlation, PCA](notebooks/06_bonus_heatmap_ordination.Rmd) | if the core session finishes early: an abundance **heatmap**, a phylum **correlation** map, and a **PCA** ordination — all CRAN-only |

**Suggested flow:** teach **01–04** live; use **05** for the last ~45–60 min so
participants *do* the analysis in pairs; keep **06** as a buffer / self-study.

> Pre-rendered HTML versions of each lesson sit next to the `.Rmd` files (open
> `notebooks/*.html` in a browser). They are ignored by git by default so the
> repository stays light — see `.gitignore` if you want to commit them.

---

## 🧬 The data (`data/`)

We use the **HITChip Atlas** — a *real, published* human-gut microbiome study of
**1,006 healthy Western adults** profiling **130 genus-like taxa**, from:

> Lahti L, Salojärvi J, Salonen A, Scheffer M, de Vos WM (2014).
> *Tipping elements in the human intestinal ecosystem.*
> **Nature Communications** 5:4344. https://doi.org/10.1038/ncomms5344
> Data (CC0): Dryad, https://doi.org/10.5061/dryad.pk75d

| File | Description |
|------|-------------|
| `sample_metadata.csv` | 1,006 samples × 7: `sample_id`, `subject_id`, `age`, `sex`, `nationality`, `bmi_group`, `diversity_shannon` |
| `taxonomy.csv` | 130 genus-like taxa → `phylum`, `family` (8 phyla) |
| `genus_abundance.csv` | wide table: 1,006 samples × 130 genera (HITChip abundances) |
| `atlas1006_source.rda` | original object the CSVs are built from (provenance) |
| `get_data.R` | verifies / rebuilds the CSVs; downloads the source if missing; **synthetic offline fallback** |
| `SOURCE.md` | full source, citation and license details |

The dataset is released under **CC0** (public domain), so the tidy CSVs are
**committed with the course** and everything works offline. To re-verify or
rebuild them:

```r
source("data/get_data.R")
```

Why this dataset: it is real and published, has a genuine ecological signal
(e.g. the Firmicutes/Bacteroidetes balance, diversity varying with age and
region), several **categorical** (sex, nationality, BMI group) and **numeric**
(age, diversity, 130 abundances) variables, real **missing values** to teach
cleaning, and 1,006 rows — big enough to make `group_by`/`summarise` and faceted
plots meaningful. It needs **CRAN only** (no Bioconductor).

---

## 🗂️ Repository structure

```
R 2026/
├── README.md
├── LICENSE                    # CC BY 3.0 for the materials (dataset is CC0)
├── setup.R                    # installs the CRAN packages
├── ufz-summerschool-r.Rproj   # open this in RStudio
├── .gitignore
├── data/                      # committed CSVs + get_data.R + SOURCE.md
├── figures/                   # figures written by the lessons (git-ignored)
└── notebooks/                 # 01–04 core, 05 capstone, 06 bonus (.Rmd + .html)
```

---

## ✅ Requirements

Installed by `setup.R` (all from CRAN): `readr`, `dplyr`, `tidyr`, `tibble`,
`ggplot2`, `forcats`, `stringr`, `vegan`, plus `rmarkdown` + `knitr` to knit the
lessons. No Bioconductor needed.

---

## 📄 License

Teaching materials: **Creative Commons Attribution 3.0 (CC BY 3.0)** — see
[LICENSE](LICENSE).
Dataset: **CC0** (public domain) — please still cite Lahti *et al.* 2014. See
[data/SOURCE.md](data/SOURCE.md).
