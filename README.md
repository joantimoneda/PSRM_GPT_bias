# Replication Code: Is ChatGPT Conservative or Liberal?

**Walker, C.P. & Timoneda, J.C. (2025). "Is ChatGPT conservative or liberal? A novel approach to assess ideological stances and biases in generative LLMs." *Political Science Research and Methods*. DOI: 10.1017/psrm.2025.10057**

## Abstract

Extant work shows that generative AI such as GPT-3.5 perpetuates social stereotypes and biases. A less explored source of bias is ideology: do GPT models take ideological stances on politically sensitive topics? We develop a novel approach to identify ideological bias and show that it can originate in both the training data and the filtering algorithm. Using linguistic variation across countries with contrasting political attitudes, we evaluate average GPT responses in those languages. GPT output is more conservative in languages of conservative societies (Polish) and more liberal in languages used in liberal ones (Swedish). These differences persist from GPT-3.5 to GPT-4. We conclude that high-quality, curated training data are essential for reducing bias.

## Contents

| File | Description |
|------|-------------|
| `Multilevel_abortion_rep.R` | Replication code — abortion case (Swedish, Polish, English) |
| `Multilevel_catindep_rep.R` | Replication code — Catalan independence case (Catalan, Spanish) |
| `data_abortion.xlsx` | Data for abortion analysis |
| `data_catindep.xlsx` | Data for Catalan independence analysis |
| `Walker_Timoneda_2025_PSRM.pdf` | Published paper (Open Access) |

## Method

Multilevel logistic regression with random slopes by model, estimated with `lme4` in R. The design uses linguistic variation across countries with known ideological profiles to identify whether GPT-3.5 and GPT-4 output reflects biases from training data versus OpenAI's filtering algorithm.

## Requirements

R with the following packages:
```r
install.packages(c("lme4", "arm", "readxl", "stargazer"))
```

## Replication

1. Clone this repository
2. Set your working directory in each script (`setwd("")`)
3. Run `Multilevel_abortion_rep.R` or `Multilevel_catindep_rep.R`

## Citation

```bibtex
@article{walker_timoneda_2025,
  title   = {Is {ChatGPT} conservative or liberal? {A} novel approach to assess ideological stances and biases in generative {LLMs}},
  author  = {Walker, Christina P. and Timoneda, Joan C.},
  journal = {Political Science Research and Methods},
  year    = {2025},
  doi     = {10.1017/psrm.2025.10057}
}
```
