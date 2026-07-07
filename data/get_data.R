# =============================================================================
# get_data.R  —  make the course data available in data/
# =============================================================================
# Summer School "Trends in multi-omics data analysis for Microbial Ecology and
# Biotechnology" (UFZ Leipzig) — R refresher session. Instructor: Anderson Santos.
#
# WHAT THIS SCRIPT DOES
# ---------------------
# The lessons use the *HITChip Atlas* human-gut microbiome dataset from
# Lahti et al. (2014) Nature Communications 5:4344, "Tipping elements in the
# human intestinal ecosystem". The data are released under CC0 (public domain)
# via the Dryad Digital Repository, DOI: 10.5061/dryad.pk75d.
#
# Because CC0 permits redistribution, tidy CSV copies are shipped WITH this
# course in data/ (sample_metadata.csv, taxonomy.csv, genus_abundance.csv), so
# everything works offline with nothing to download. This script exists for
# reproducibility and transparency: it can (1) confirm the shipped files are
# present, (2) rebuild them from the original source object if available, and
# (3) as a last resort, generate a small SYNTHETIC stand-in so notebooks still
# run even if the CSVs are missing and no internet is available.
#
# HOW TO RUN
# ----------
#   From RStudio:  open the project, then in the console:  source("data/get_data.R")
#   From a shell:  Rscript data/get_data.R
#
# It only uses base R (no extra packages needed).
# =============================================================================

# ---- 0. Locate the data folder (works whether run from project root or data/) ----
data_dir <- if (dir.exists("data")) "data" else if (basename(getwd()) == "data") "." else "data"
if (!dir.exists(data_dir)) dir.create(data_dir, showWarnings = FALSE)

f_meta <- file.path(data_dir, "sample_metadata.csv")
f_tax  <- file.path(data_dir, "taxonomy.csv")
f_ab   <- file.path(data_dir, "genus_abundance.csv")
f_src  <- file.path(data_dir, "atlas1006_source.rda")   # optional cached source object

message("Data directory: ", normalizePath(data_dir, mustWork = FALSE))

# ---- 1. If the tidy CSVs are already here, we are done ----------------------
if (all(file.exists(f_meta, f_tax, f_ab))) {
  message("All course CSVs are already present. Nothing to do.")
  message("  - ", f_meta)
  message("  - ", f_tax)
  message("  - ", f_ab)
  # Show a tiny summary so the user sees it worked.
  meta <- utils::read.csv(f_meta)
  message(sprintf("sample_metadata.csv : %d samples, %d columns",
                  nrow(meta), ncol(meta)))
  quit_ok <- TRUE
} else {
  quit_ok <- FALSE
}

# ---- 2. Helper: rebuild the CSVs from the original Dryad/phyloseq .rda -------
# The source object (atlas1006) is a phyloseq S4 object. We read its slots with
# BASE R ONLY (via attributes()), so Bioconductor is NOT required.
rebuild_from_source <- function(rda_path) {
  if (!file.exists(rda_path)) return(FALSE)
  message("Rebuilding CSVs from source object: ", rda_path)
  e <- new.env(); load(rda_path, envir = e)
  obj <- get(ls(e)[1], envir = e)
  at  <- attributes(obj)

  strip_matrix <- function(x) {                 # S4 matrix slot -> plain matrix
    a <- attributes(x); y <- unclass(x); attributes(y) <- NULL
    matrix(y, nrow = a$dim[1], ncol = a$dim[2], dimnames = a$dimnames)
  }
  otu <- strip_matrix(at$otu_table); storage.mode(otu) <- "double"
  tax <- strip_matrix(at$tax_table)
  sam_raw <- at$sam_data
  sl <- unclass(sam_raw); attr(sl, "class") <- NULL
  sam <- as.data.frame(sl[attr(sam_raw, "names")], stringsAsFactors = FALSE)

  # Baseline timepoint only (one clean cross-sectional row per subject)
  keep <- which(sam$time == 0)
  sam <- sam[keep, , drop = FALSE]
  otu <- otu[, keep, drop = FALSE]

  meta <- data.frame(
    sample_id         = sam$sample,
    subject_id        = sam$subject,
    age               = sam$age,
    sex               = sam$sex,
    nationality       = sam$nationality,
    bmi_group         = sam$bmi_group,
    diversity_shannon = round(sam$diversity, 3),
    stringsAsFactors  = FALSE)
  taxdf <- data.frame(genus = rownames(tax),
                      phylum = tax[, "Phylum"], family = tax[, "Family"],
                      stringsAsFactors = FALSE)
  ab <- round(t(otu), 1)
  abdf <- data.frame(sample_id = rownames(ab), ab,
                     check.names = FALSE, stringsAsFactors = FALSE)

  utils::write.csv(meta,  f_meta, row.names = FALSE, na = "")
  utils::write.csv(taxdf, f_tax,  row.names = FALSE)
  utils::write.csv(abdf,  f_ab,   row.names = FALSE)
  message("Rebuilt CSVs from source (", nrow(meta), " samples).")
  TRUE
}

# ---- 3. Helper: try to download the source object from a stable mirror ------
try_download_source <- function(dest) {
  url <- "https://raw.githubusercontent.com/microbiome/microbiome/master/data/atlas1006.rda"
  message("Attempting to download source object from:\n  ", url)
  ok <- tryCatch({
    utils::download.file(url, dest, mode = "wb", quiet = TRUE); TRUE
  }, error = function(e) { message("  download failed: ", conditionMessage(e)); FALSE })
  ok && file.exists(dest) && file.info(dest)$size > 1000
}

# ---- 4. Helper: last-resort SYNTHETIC fallback (offline safety net) ----------
# A small, clearly-labelled synthetic stand-in so notebooks still run. It mimics
# the SHAPE of the real data (same column names) but is NOT the real dataset.
make_synthetic <- function() {
  message("Generating a small SYNTHETIC fallback dataset (not the real data).")
  set.seed(42)
  n <- 120
  nats <- c("US", "Scandinavia", "CentralEurope", "SouthEurope", "UKIE")
  bmis <- c("lean", "overweight", "obese", "severeobese")
  meta <- data.frame(
    sample_id   = sprintf("Synth-%03d", seq_len(n)),
    subject_id  = seq_len(n),
    age         = round(rnorm(n, 45, 14)),
    sex         = sample(c("male", "female"), n, TRUE),
    nationality = sample(nats, n, TRUE),
    bmi_group   = sample(bmis, n, TRUE),
    stringsAsFactors = FALSE)
  meta$age[sample(n, 6)] <- NA                       # a few NAs, like the real data
  genera <- c("Bacteroides", "Prevotella", "Faecalibacterium prausnitzii",
              "Escherichia coli", "Bifidobacterium", "Akkermansia",
              "Clostridium", "Ruminococcus", "Lactobacillus", "Streptococcus")
  phyla  <- c("Bacteroidetes","Bacteroidetes","Firmicutes","Proteobacteria",
              "Actinobacteria","Verrucomicrobia","Firmicutes","Firmicutes",
              "Firmicutes","Firmicutes")
  taxdf <- data.frame(genus = genera, phylum = phyla,
                      family = genera, stringsAsFactors = FALSE)
  ab <- matrix(round(rlnorm(n * length(genera), 4, 1.4)), nrow = n)
  colnames(ab) <- genera
  abdf <- data.frame(sample_id = meta$sample_id, ab,
                     check.names = FALSE, stringsAsFactors = FALSE)
  # Shannon diversity from the synthetic abundances
  p <- ab / rowSums(ab)
  meta$diversity_shannon <- round(-rowSums(p * log(p), na.rm = TRUE), 3)

  utils::write.csv(meta,  f_meta, row.names = FALSE, na = "")
  utils::write.csv(taxdf, f_tax,  row.names = FALSE)
  utils::write.csv(abdf,  f_ab,   row.names = FALSE)
  message("Wrote SYNTHETIC fallback (", n, " samples). ",
          "Replace with the real CSVs when you have internet access.")
}

# ---- 5. Orchestrate ----------------------------------------------------------
if (!quit_ok) {
  message("Course CSVs not found - building them now...")
  built <- FALSE
  if (file.exists(f_src)) {
    built <- rebuild_from_source(f_src)
  }
  if (!built) {
    if (try_download_source(f_src)) built <- rebuild_from_source(f_src)
  }
  if (!built) {
    make_synthetic()
  }
  message("Done. The data/ folder is ready.")
}
