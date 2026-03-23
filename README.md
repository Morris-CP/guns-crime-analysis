# Do Concealed Carry Laws Reduce Crime?

### Causal Inference with U.S. Panel Data (1977–1999)

---

## 1. Problem

Do “shall-issue” concealed carry laws reduce violent crime?

More broadly:
**How do we avoid misleading conclusions when evaluating policy or interventions using observational data?**

---

## 2. Dataset

* 51 U.S. states (including D.C.)
* 1977–1999 (23 years)
* 1,173 observations (balanced panel)

### Key Variables

* `vio`: violent crime rate
* `shall`: policy indicator
* Controls:

  * incarceration rate
  * income
  * population
  * density
  * demographics

---

## 3. Why This Is Non-Trivial

A simple comparison is misleading because:

* States differ systematically (culture, baseline crime)
* Policies are not randomly assigned
* Crime trends evolve over time

👉 This is a **causal inference problem**, not just regression.

---

## 4. Data → Model Decisions

The modeling strategy is directly informed by the data:

* Crime variables are highly skewed
  → log transformation

* Policy adoption varies across states and time
  → staggered DID setting

* Large cross-state heterogeneity
  → state fixed effects

* Strong time trends
  → year fixed effects

---

## 5. Methodology

I estimate progressively stricter models:

1. OLS
2. OLS + controls
3. State fixed effects
4. Two-way fixed effects (TWFE)

Standard errors are clustered at the state level.

---

## 6. Results

### Main Finding (Violent Crime)

* OLS: significant negative effect
* OLS + controls: still negative
* Fixed effects: effect shrinks
* **TWFE: not statistically significant**

👉 Interpretation:

The initial “crime-reducing effect” disappears once we control for:

* unobserved state differences
* common time trends

→ **Evidence does not support a robust causal effect**

---

### Other Crime Types

* Robbery and murder show the same pattern
  → results are **not robust across outcomes**

---

## 7. What This Means

### Key Insight

> Naive models overstate policy effects.

### Implications

* Correlation ≠ causation
* Model specification fundamentally changes conclusions
* Careful identification is critical in both:

  * public policy
  * business analytics

---

## 8. From Policy to Data Science

This framework generalizes to real-world DS problems:

| Policy Context | Business Equivalent    |
| -------------- | ---------------------- |
| Law adoption   | Feature rollout        |
| Treated states | Exposed users          |
| Crime outcome  | Conversion / retention |

👉 Same challenge:
**estimating causal impact, not just predicting outcomes**

---

## 9. Limitations

* Possible policy endogeneity
* No explicit event study
* TWFE limitations under staggered adoption

---

## 10. Reproducibility

```bash
stata code/analysis.do
```

---

## 11. Structure

```
project/
├── data/
├── code/
├── report/
└── README.md
```

---
