# R for Multi-omics — Summer School 2026

**Refreshing / Basic Knowledge: R**
Part of the Summer School *"Trends in multi-omics data analysis for Microbial
Ecology and Biotechnology"* — UFZ, Leipzig.

**Instructor:** Anderson Santos · anderson.santos@ufz.de

---

## Welcome

This is a hands-on R refresher built for biologists. You need no prior
programming experience at all. Over one roughly 2-hour session we start from the
very beginning ("what is a vector?") and build up, step by step, to a complete
microbial-ecology analysis on a real, published human-gut microbiome dataset.

By the end of the session you will be able to:

- read and write basic R, and understand how a notebook runs;
- **import** a data table and inspect it (types, dimensions, missing values);
- **wrangle** data with the tidyverse — `filter`, `select`, `mutate`,
  `group_by` + `summarise`, joins, and reshaping wide and long;
- make publication-style figures with **ggplot2** (scatter, boxplot, bar,
  stacked-bar, facets) and save them to files;
- run a small microbial-ecology workflow end to end: clean, wrangle, diversity,
  a composition figure, a simple statistical test, and export.

Everything is taught on one real dataset (the HITChip Atlas, below), so every
concept connects to data you actually work with rather than toy numbers.

> This R session is the companion to the parallel Python and SQL refreshers. Each
> uses a different dataset and plays to that language's strengths.

---

## Prerequisites — none

You do not need to know any R or programming to follow this session. If you can
open a web browser, you can do this. On Google Colab there is nothing to install.

Decide only *how* you want to run the lessons; see
[How to run](#how-to-run-the-lessons). If unsure, pick **Google Colab** and you
are done.

---

## Logistics

| | |
|---|---|
| **When** | **Tuesday, 14 July 2026, 10:15–12:15** |
| **Where** | **Building 1.0, Room 254** — UFZ, Permoserstr. 15, 04318 Leipzig |
| **Bring** | Your **laptop and its charger** |
| **Arrive** | about **15 minutes early** so you can sit down, connect to Wi-Fi, and be ready to run the first cell at 10:15 |

Your name will be at the entrance. Please identify yourself and follow the site
map to Building 1.0.

---

## How to run the lessons

The lessons are R notebooks. The easiest way to run them is **Google Colab** —
in your browser, nothing to install.

### Option A — Google Colab (recommended, nothing to install)

1. Make sure you have a **Google account** (the same one you use for Gmail).
2. Click an **Open in Colab** button in the table below.
3. Run the **first cell** (click it and press **Shift + Enter**). It installs the
   R packages and fetches the data. The first run takes about **1–2 minutes**;
   when it prints **Ready**, you are set. Run it before the session if you can.
4. Keep running the cells from top to bottom with **Shift + Enter**.

> If Colab shows *"Warning: This notebook was not authored by Google"*, click
> **Run anyway** — these are course materials. If Colab asks about the runtime,
> the notebooks already request the **R** runtime, so just accept.

| # | Lesson | ~min | Open in Colab |
|---|--------|------|:-------------:|
| 01 | R essentials | 25 | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/01_r_essentials.ipynb) |
| 02 | Data frames & tibbles | 25 | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/02_data_frames_tibbles.ipynb) |
| 03 | Data wrangling (dplyr & tidyr) | 45 | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/03_data_wrangling.ipynb) |
| 04 | Visualization (ggplot2) | 40 | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/04_visualization_ggplot2.ipynb) |
| 05 | Capstone project (fill-in) | 45–60 | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/05_capstone_project.ipynb) |
| 06 | *Bonus* — heatmap, correlation, PCA | — | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/06_bonus_heatmap_ordination.ipynb) |
| 07 | Worked analysis (read-and-run) | — | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/andersonavilasantos/ufz-summerschool-r/blob/main/notebooks/07_worked_analysis.ipynb) |

### Option B — On your own computer (local Jupyter with R)

Best if you would rather keep everything offline. Install **before** the session,
as the downloads are large.

1. Install **R** — https://cran.r-project.org
2. Install the **R Jupyter kernel** and Jupyter. In an R console:
   ```r
   install.packages("IRkernel")
   IRkernel::installspec()
   ```
   (You also need Jupyter — for example via `pip install jupyterlab`.)
3. Get the materials:
   ```bash
   git clone https://github.com/andersonavilasantos/ufz-summerschool-r.git
   cd ufz-summerschool-r/notebooks
   jupyter lab
   ```
   *(No git? On the GitHub page click **Code ▸ Download ZIP** and unzip it.)*
4. Open the lessons in order. The first cell installs any missing R packages and,
   because the data is already beside the notebooks, just prints **Ready**.

### How the notebooks work

Each notebook is a list of **cells** — text (explanations) or code. Click a code
cell and press **Shift + Enter** to run it; the result appears right below. Work
top to bottom. Each lesson ends with **exercises**: try them in the empty cell,
then open the **Solution** toggle to check. If things get confused, use
**Runtime ▸ Restart session and run all** (Colab) to start clean.

---

## What's inside

### Core session (~2 h taught live)

| # | Lesson | ~min | You will learn |
|---|--------|------|----------------|
| 01 | [R essentials](notebooks/01_r_essentials.ipynb) | 25 | objects, types, vectors, indexing, `NA`, factors, functions, the pipe `|>` / `%>%` |
| 02 | [Data frames & tibbles](notebooks/02_data_frames_tibbles.ipynb) | 25 | import with **readr**, `glimpse`/`summary`, columns, factors, the three data tables |
| 03 | [Data wrangling (dplyr & tidyr)](notebooks/03_data_wrangling.ipynb) | 45 | `filter`/`select`/`mutate`/`arrange`, `group_by`+`summarise`, joins, `pivot_longer`/`pivot_wider` |
| 04 | [Visualization (ggplot2)](notebooks/04_visualization_ggplot2.ipynb) | 40 | grammar of graphics: scatter, histogram, boxplot, bar/stacked, colour, faceting, themes, `ggsave` |
| 05 | [Capstone project](notebooks/05_capstone_project.ipynb) | 45–60 | fill-in guided analysis (blank cells + collapsible solutions): clean, reshape, join, diversity, figures, ANOVA, NMDS, export |

Every lesson opens with learning objectives, is full of runnable examples with
line-by-line comments, has exercises with collapsible solutions, instructor
notes, and closes with a recap.

### Optional / extension

| # | Lesson | When to use |
|---|--------|-------------|
| 06 | [Bonus — heatmaps, correlation, PCA](notebooks/06_bonus_heatmap_ordination.ipynb) | if the session finishes early: an abundance heatmap, a phylum correlation map, and a PCA ordination (with a scree plot) |
| 07 | [Worked analysis](notebooks/07_worked_analysis.ipynb) | the fully worked, read-and-run version of the capstone, end to end (import, clean, wrangle, summarise, 3 figures, ANOVA + Tukey, NMDS, export). Use as the instructor demo or as the capstone's worked solution |

**Suggested flow (instructor):** teach 01–04 live; use 05 (the fill-in capstone)
so participants do the analysis in pairs; use 07 as the worked solution or live
demo; keep 06 as a buffer or for self-study.

---

## The data (`data/`)

We use the **HITChip Atlas** — a real, published human-gut microbiome study of
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
| `get_data.R` | verifies / rebuilds the CSVs from the source object |
| `SOURCE.md` | full source, citation and license details |

The data ships **with** the repository (CC0), so on Colab the setup cell fetches
it automatically and locally it is already there.

---

## Troubleshooting / FAQ

| Symptom | Fix |
|---------|-----|
| **`could not find function …`** | A package is not loaded. Run the **first cell** (setup) and the lesson's own library cell at the top. |
| **`object '…' not found`** | Cells were run out of order. Use **Runtime ▸ Restart session and run all**. |
| **`cannot open file '…sample_metadata.csv'`** | The setup cell did not finish. Re-run it; on Colab it clones the data for you. |
| First cell is slow | The one-time package install takes ~1–2 minutes on Colab. Run it before the session. |
| A ggplot line fails | In ggplot the `+` must be at the **end** of a line, never at the start of the next one. |
| Colab: *"not authored by Google"* | Normal — click **Run anyway**. |

*Nothing to memorise — the notebooks stay with you after the course.*

---

## Repository structure

```
ufz-summerschool-r/
├── README.md
├── LICENSE                # CC BY 3.0 for the materials (dataset is CC0)
├── .gitignore
├── data/                  # committed CSVs + get_data.R + SOURCE.md
└── notebooks/             # 01–05 core, 06 bonus, 07 worked (Jupyter, R kernel)
```

## Requirements

- **Colab:** nothing — the first cell installs the R packages.
- **Local:** R + the R Jupyter kernel (`IRkernel`), plus the CRAN packages
  `readr, dplyr, tidyr, tibble, ggplot2, forcats, stringr, vegan` (the first cell
  installs any that are missing).

## License

Teaching materials: **Creative Commons Attribution 3.0 (CC BY 3.0)** — see
[LICENSE](LICENSE). Dataset: **CC0** (public domain) — please still cite Lahti
*et al.* 2014. See [data/SOURCE.md](data/SOURCE.md).
