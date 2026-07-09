# R for Multi-omics — Summer School 2026

**Refreshing / Basic Knowledge: R**
Part of the Summer School *"Trends in multi-omics data analysis for Microbial
Ecology and Biotechnology"* — UFZ, Leipzig.

**Instructor:** Anderson Santos · anderson.santos@ufz.de

---

## 👋 Welcome

This is a **hands-on R refresher built for biologists** — you need **no prior
programming experience** at all. Over one relaxed ~2-hour session we start from
the very beginning (*"what is a vector?"*) and build up, step by step, to a
complete microbial-ecology analysis on a **real, published** human-gut microbiome
dataset.

**By the end of the session you will be able to:**

- read and write basic R, and work in **RStudio** with confidence;
- **import** a data table and inspect it (types, dimensions, missing values);
- **wrangle** data with the tidyverse — `filter`, `select`, `mutate`,
  `group_by` + `summarise`, **joins**, and reshaping wide ↔ long;
- make publication-style figures with **ggplot2** (scatter, boxplot, bar,
  stacked-bar, facets) and save them to files;
- run a small **microbial-ecology workflow** end to end: clean → wrangle →
  diversity → composition figure → a simple statistical test → export.

Everything is taught on **one real dataset** (the HITChip Atlas, below), so every
concept connects to data you actually work with — not toy numbers.

> This R session is the companion to the parallel **Python** refresher. It is
> **not** a translation — it is designed around R's strengths (the tidyverse and
> the grammar of graphics) and uses a **different, real dataset**.

---

## ✅ Prerequisites — none

You do **not** need to know any R, Python, or programming to follow this session.
If you can open a web browser, you can do this. Everything you need is either
installed for you (Posit Cloud) or set up by one command (`setup.R`).

The only thing to decide **before** you arrive is *how* you want to run the
lessons — see **[How to run](#-how-to-run-the-lessons)** below. If you are unsure,
pick **Posit Cloud** (nothing to install) and you are done.

---

## 📅 Logistics

| | |
|---|---|
| **When** | **Tuesday, 14 July 2026, 10:15–12:15** |
| **Where** | **Building 1.0, Room 254** — UFZ, Permoserstr. 15, 04318 Leipzig |
| **Bring** | Your **laptop and its charger** |
| **Arrive** | ~**15 minutes early** so you can sit down, connect to Wi-Fi, and be ready to run the first chunk at 10:15 |

Your name will be at the entrance — please identify yourself and follow the site
map to Building 1.0. If you plan to run the lessons **locally** (Option B), it is
best to install R + RStudio **before** you arrive, as the downloads can be large.
If in doubt, use **Posit Cloud** and there is nothing to install.

---

## 🚀 How to run the lessons

There are two ways. If you have never programmed before, **use Posit Cloud** — it
runs RStudio in your browser with nothing to install (the R analogue of Google
Colab). Both options use the **same** files and the **same** `setup.R`.

### Option A — Posit Cloud (easiest, nothing to install)

[Posit Cloud](https://posit.cloud) gives you a free, browser-based RStudio. No
downloads, no admin rights — perfect if you have never programmed before.

1. **Create a free account** at **https://posit.cloud** (click *Sign Up*, or log
   in with Google/GitHub).
2. On your **Workspace** page, click **New Project ▸ New Project from Git
   Repository**.
3. Paste the repository URL and click **OK**:
   ```
   https://github.com/andersonavilasantos/ufz-summerschool-r.git
   ```
   Posit Cloud copies all the lessons **and the data** into your own project.
4. When the project opens, go to the **Console** (bottom-left) and install the
   packages **once**:
   ```r
   source("setup.R")
   ```
   *(This takes a few minutes the first time — do it before the session if you
   can.)*
5. In the **Files** pane (bottom-right), open `notebooks/01_r_essentials.Rmd` and
   either run chunks one by one (the green ▶ at each chunk's top-right) or click
   **Knit** to build the HTML.

> The data ships **with** the repository (it is public-domain, CC0), so nothing
> needs to be downloaded separately — the lessons just work.

### Option B — On your own computer (local RStudio)

Best if you would rather keep everything offline. Please install **before** the
session — the downloads are large.

1. Install **R** — https://cran.r-project.org
2. Install **RStudio Desktop** (free) — https://posit.co/download/rstudio-desktop/
3. Get the materials:
   ```bash
   git clone https://github.com/andersonavilasantos/ufz-summerschool-r.git
   ```
   *(No git? On the GitHub page click **Code ▸ Download ZIP** and unzip it.)*
4. Open **`ufz-summerschool-r.Rproj`** in RStudio by double-clicking it (this
   anchors the working directory to the project, which prevents "file not found"
   errors).
5. In the **Console**, install everything **once**:
   ```r
   source("setup.R")
   ```
6. Open the lessons in `notebooks/` **in order** and run or **Knit** them.

---

## 📚 What's inside

### Core session (~2 h taught live)

| # | Lesson | ~min | You will learn |
|---|--------|------|----------------|
| 01 | [R & RStudio essentials](notebooks/01_r_essentials.Rmd) | 25 | objects, types, **vectors**, indexing, `NA`, factors, **functions**, the **pipe** `|>` / `%>%` |
| 02 | [Data frames & tibbles](notebooks/02_data_frames_tibbles.Rmd) | 25 | import with **readr**, `glimpse`/`summary`, columns, **factors**, the three data tables |
| 03 | [Data wrangling (dplyr & tidyr)](notebooks/03_data_wrangling.Rmd) | 45 | `filter`/`select`/`mutate`/`arrange`, `group_by`+`summarise`, **joins**, `pivot_longer`/`pivot_wider` |
| 04 | [Visualization (ggplot2)](notebooks/04_visualization_ggplot2.Rmd) | 40 | grammar of graphics: scatter, histogram, boxplot, bar/stacked, colour, **faceting**, themes, `ggsave` |
| 05 | [Capstone project](notebooks/05_capstone_project.Rmd) | 45–60 | **fill-in** guided analysis (blank chunks + collapsible solutions): clean → reshape → join → diversity → figures → ANOVA → **NMDS** → export |

Every lesson opens with **learning objectives**, is full of runnable examples
with **line-by-line comments** (so it can be taught straight from the chunks),
has **exercises with collapsible solutions**, **📌 Teaching-note** callouts, and
closes with a **recap**.

> The core is deliberately padded so it can flex to the room. In a 2-hour slot,
> teach **01–04** live and use **07** as the worked demo; run **05** (fill-in
> capstone) live if time allows, or hand it out for self-study.

### Optional / extension

| # | Lesson | When to use |
|---|--------|-------------|
| 06 | [Bonus — heatmaps, correlation, PCA](notebooks/06_bonus_heatmap_ordination.Rmd) | if the session finishes early: an abundance **heatmap**, a phylum **correlation** map, and a **PCA** ordination (with a scree plot) — all CRAN-only |
| 07 | [Worked analysis](notebooks/07_worked_analysis.Rmd) | the **fully worked, read-and-run** version of the capstone — every chunk written out, end-to-end (import → clean → wrangle → summarise → 3 figures → ANOVA + Tukey → **NMDS** → export). Use as the instructor's live demo or as the capstone's worked solution |

**Suggested flow:** teach **01–04** live; use **05** (fill-in capstone) so
participants *do* the analysis in pairs; use **07** as the worked solution / live
demo of the same analysis; keep **06** as a buffer / self-study.

> **Two distinct capstone experiences** (mirroring the parallel Python course):
> **05** is the *fill-in activity* students complete themselves; **07** is the
> *fully worked reference analysis* they can read and run start to finish.

> Pre-rendered **HTML** versions of each lesson sit next to the `.Rmd` files and
> are **committed** with the course, so you can open `notebooks/*.html` in any
> browser and read a lesson (with all figures) **without running R** — handy for
> revising later or if setup fails.

---

## 🧬 The data (`data/`)

We use the **HITChip Atlas** — a *real, published* human-gut microbiome study of
**1,006 healthy Western adults**, profiling **130 genus-like taxa**, from:

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

**Why this dataset:** it is real and published, has a genuine ecological signal
(e.g. the Firmicutes/Bacteroidetes balance, diversity varying with age and
region), several **categorical** (sex, nationality, BMI group) and **numeric**
(age, diversity, 130 abundances) variables, real **missing values** to teach
cleaning, and 1,006 rows — big enough to make `group_by`/`summarise` and faceted
plots meaningful. It needs **CRAN only** (no Bioconductor).

---

## 🆘 Troubleshooting & FAQ (for beginners)

Almost every first-day error is one of these. Don't worry — they are normal.

- **`could not find function "read_csv"` (or `mutate`, `ggplot`, `diversity`…).**
  The package that provides that function is not loaded. Run `source("setup.R")`
  once to install everything, then **run the first chunk of the lesson** (the
  `library(...)` chunk) before the chunk that errored. Every lesson's setup chunk
  loads what it needs.

- **`object 'meta' not found` (or `abund`, `alpha`…).** You ran a chunk before
  the chunk that *creates* that object. Fix it by running from the top: in
  RStudio, **Session ▸ Restart R**, then run the chunks **in order** from the
  first one (or use *Run ▸ Run All*). Lessons are designed to be run top to
  bottom.

- **`Error: unexpected symbol` / a plot that just won't appear, with a `+` at the
  end of a line.** In **ggplot2** you join layers with `+`, and the `+` must be
  at the **end** of the line, never the start:
  ```r
  ggplot(meta, aes(age, diversity_shannon)) +   # ✅ + at the end
    geom_point()

  ggplot(meta, aes(age, diversity_shannon))     # ❌ this ends the statement…
    + geom_point()                              #    …so this line errors
  ```
  (Also: chain **ggplot layers with `+`**, but chain **data steps with the pipe
  `|>` / `%>%`** — mixing them up is the most common ggplot slip.)

- **`cannot open file ... : No such file or directory`.** This is almost always
  the **working directory**. Open the project by double-clicking
  `ufz-summerschool-r.Rproj` first (not the `.Rmd` on its own). The lessons then
  find `data/` automatically.

- **`there is no package called 'vegan'` (or another package).** The install did
  not finish. Re-run `source("setup.R")`, or install that one package directly,
  e.g. `install.packages("vegan")`.

- **A red message when a package loads (e.g. "The following objects are
  masked…").** That is a normal, harmless **message**, not an error. You only need
  to act on lines that say `Error`.

- **Knitting fails but running chunks works.** Knit builds the whole document in a
  fresh session, so an object defined only in your console won't exist. Make sure
  every object a chunk needs is created **earlier in the same file**, then Knit
  again.

Still stuck? Just ask during the session — that is exactly what it's for. You can
also open the committed `notebooks/*.html` files in a browser to read any lesson
without running R.

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
└── notebooks/                 # 01–04 core, 05 fill-in capstone, 06 bonus,
                               # 07 worked analysis (.Rmd + .html)
```

---

## 📦 Requirements

Everything is installed by **`setup.R`** (all from CRAN — no Bioconductor):
`readr`, `dplyr`, `tidyr`, `tibble`, `ggplot2`, `forcats`, `stringr`, `vegan`,
plus `rmarkdown` + `knitr` to knit the lessons. You need **R ≥ 4.1** (for the
native pipe `|>`); any recent R and RStudio (or Posit Cloud) is fine.

---

## 📄 License

Teaching materials: **Creative Commons Attribution 3.0 (CC BY 3.0)** — see
[LICENSE](LICENSE).
Dataset: **CC0** (public domain) — please still cite Lahti *et al.* 2014. See
[data/SOURCE.md](data/SOURCE.md).
