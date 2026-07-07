# =============================================================================
# setup.R  —  install everything this course needs (CRAN only, no Bioconductor)
# =============================================================================
# Run ONCE before the session. In RStudio:  source("setup.R")
# From a shell:                              Rscript setup.R
#
# It installs the tidyverse pieces we use plus `vegan` (community ecology) and
# the tools to knit the .Rmd lessons to HTML. Everything is on CRAN, so it
# installs cleanly on Windows, macOS and Linux without compilers in most cases.
# =============================================================================

# The packages the lessons rely on.
required <- c(
  "readr",     # fast, friendly CSV/TSV import  (lesson 2, 5)
  "dplyr",     # the core data-wrangling verbs   (lesson 3, 5)
  "tidyr",     # reshape / pivot / separate      (lesson 3, 5)
  "tibble",    # modern data frames              (lesson 1, 2)
  "ggplot2",   # the grammar of graphics         (lesson 4, 5)
  "forcats",   # working with factors            (lesson 3, 4)
  "stringr",   # string helpers                  (lesson 3)
  "vegan",     # ecology: diversity + ordination (lesson 5, bonus)
  "rmarkdown", # knit .Rmd -> HTML
  "knitr"      # the engine behind rmarkdown
)

# Only install what is missing (fast to re-run).
installed <- rownames(installed.packages())
missing   <- setdiff(required, installed)

if (length(missing) == 0) {
  message("All required packages are already installed. You are ready to go!")
} else {
  message("Installing missing packages: ", paste(missing, collapse = ", "))
  install.packages(missing, repos = "https://cloud.r-project.org")
}

# Confirm they all load.
ok <- vapply(required, requireNamespace, logical(1), quietly = TRUE)
if (all(ok)) {
  message("\nSuccess - every package loads. Open notebooks/01_r_essentials.Rmd to start.")
} else {
  message("\nThese packages did not install correctly: ",
          paste(required[!ok], collapse = ", "),
          "\nTry running install.packages() on them individually.")
}
