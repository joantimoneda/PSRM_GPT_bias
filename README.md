# Replication Code: GPT Bias Across Languages

**Walker, S. & Timoneda, J.C. (2025). "GPT Bias Across Languages." *Political Science Research and Methods*. DOI: 10.1017/psrm.2025.10057**

## Overview

This repository contains replication code and data for a study examining whether GPT-3.5 and GPT-4 produce systematically biased responses depending on the language of the prompt. We use multilevel models to estimate language-specific biases across two politically sensitive topics.

## Cases

| Case | File | Data |
|------|------|------|
| Abortion attitudes | `Multilevel_abortion_rep.R` | `data_abortion.xlsx` |
| Catalan independence | `Multilevel_catindep_rep.R` | `data_catindep.xlsx` |

## Method

Multilevel logistic regression (random slopes by model) estimated with `lme4` in R. Models allow GPT-3.5 and GPT-4 responses to vary by language, capturing differential bias across language communities.

## Requirements

R with the following packages:
```r
install.packages(c("lme4", "arm", "readxl", "stargazer"))
```

## Replication

1. Clone this repository
2. Set your working directory in each script
3. Run `Multilevel_abortion_rep.R` or `Multilevel_catindep_rep.R`

## Paper

The published paper is included as `Walker_Timoneda_2025_PSRM.pdf`.

## Citation

```
@article{walker_timoneda_2025,
  title     = {GPT Bias Across Languages},
  author    = {Walker, S. and Timoneda, Joan C.},
  journal   = {Political Science Research and Methods},
  year      = {2025},
  doi       = {10.1017/psrm.2025.10057}
}
```
