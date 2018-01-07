
library(tidyverse)
library(webuse)

# Construct a progress bar ------------------------------------------------

webuselist %>%
    length() %>%
    progress_estimated() -> pb

# Download all Stata system datasets --------------------------------------

webuselist %>%
    names() %>%
    map(~{
        pb$tick()$print()
        assign(.x, webuse(.x), envir = .GlobalEnv)
    })

# Build me a list of data names to copy and paste -------------------------

webuselist %>%
    names() %>%
    paste(collapse = ", ")

# Save them! --------------------------------------------------------------

devtools::use_data(auto, auto2, autornd, bplong, bpwide, cancer, census, citytemp, citytemp4, educ99gdp, gnp96, lifeexp, network1, network1a, nlsw88, nlswide1, pop2000, sandstone, sp500, surface, tsline1, tsline2, uslifeexp, uslifeexp2, voter, xtline1)
