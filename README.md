# Do Concealed Carry Laws Reduce Crime?

### A Causal Inference and Decision-Oriented Analysis Using U.S. Panel Data (1977–1999)

---

## 1. Research Question

Do “shall-issue” concealed carry laws reduce violent crime rates?

More broadly:
**How should we interpret estimated policy effects for real-world decision-making?**

---

## 2. Why This Matters

This question is a canonical example in applied econometrics and highlights a broader issue:

> Correlation-based analysis can lead to misleading conclusions in both policy and business contexts.

The same challenge appears in:

* Marketing effectiveness evaluation
* Product feature impact analysis
* Policy intervention assessment

This project emphasizes **causal identification over naive prediction**.

---

## 3. Data

* **Unit**: U.S. states (including D.C.)
* **Period**: 1977–1999
* **Observations**: 1,173 (balanced panel)

### Key Variables

* `vio`: Violent crime rate (per 100,000 population)
* `mur`: Murder rate
* `rob`: Robbery rate
* `shall`: Indicator for concealed carry law adoption
* `incarc_rate`: Incarceration rate
* Controls:

  * `avginc` (income)
  * `pop` (population)
  * `density`
  * demographic variables (`pb1064`, `pw1064`, `pm1029`)

---

## 4. Data Characteristics and Modeling Choices

Summary statistics reveal several important features that directly inform the empirical strategy:

### Skewness in Crime Variables

* Violent crime ranges from **47 to 2921**
* Indicates strong right-skewness

→ The dependent variable is log-transformed to stabilize variance and allow percentage interpretation.

### Staggered Policy Adoption

* The policy variable (`shall`) equals 1 in ~24% of observations
* States adopt the law at different times

→ This creates a **staggered difference-in-differences setting**, implemented via a two-way fixed effects model.
→ Potential bias in TWFE under staggered adoption is acknowledged.

### Cross-State Heterogeneity

* Large variation in population and density
* Substantial differences in crime levels

→ State fixed effects are necessary to control for time-invariant heterogeneity.

### Potential Policy Confounding

* Incarceration rates range from 19 to 1913

→ Suggests multiple policy channels affecting crime, raising concerns about omitted variable bias.

### Implication

These features motivate a fixed effects framework and careful interpretation of causal estimates.

---

## 5. Identification Strategy

To estimate causal effects, I use a **two-way fixed effects (TWFE) model**:

* State fixed effects → control for unobserved, time-invariant differences
* Year fixed effects → control for common shocks

This corresponds to a **difference-in-differences framework**.

### Key Assumption

* **Parallel trends**: In the absence of treatment, treated and control states would follow similar trends.

### Diagnostics

* Compare:

  * OLS
  * OLS + controls
  * State FE
  * Two-way FE
* Hausman test supports fixed effects over random effects

### Limitations

* Policy adoption may be endogenous
* Time-varying confounders may remain
* No full event-study validation

---

## 6. Results

### Main Findings

| Model          | Effect               | Interpretation         |
| -------------- | -------------------- | ---------------------- |
| OLS            | Not significant      | Confounded             |
| OLS + Controls | -4.6%                | Sensitive              |
| State FE       | -4.0%                | Controls heterogeneity |
| **Two-Way FE** | **-3.8% (p < 0.05)** | Preferred estimate     |

### Interpretation

Shall-issue laws are associated with a **~3.8% reduction in violent crime** after controlling for state and time effects.

However:

* Effects vary across crime types
* Magnitude is modest
* Results depend on specification

👉 The policy effect is **limited and context-dependent**, not universally strong.

---

## 7. Robustness Checks

* Clustered standard errors at the state level
* Alternative model specifications
* Subsample analysis by crime type

Results are directionally consistent but vary in magnitude.

---

## 8. From Causality to Decision-Making

Causal estimation alone is not sufficient for real-world applications.

### Key Considerations

* Average treatment effect ≠ actionable decision
* Effect heterogeneity matters
* Statistical significance ≠ economic significance

### Business Analogy

This framework applies directly to:

* Marketing campaign evaluation
* Product feature rollouts
* A/B testing with panel data

### Extensions

* Heterogeneous treatment effect estimation
* Causal machine learning (e.g., double ML, causal forests)
* Policy targeting strategies

### Key Insight

> Effective data science requires combining:
>
> * Causal inference (what works)
> * Prediction (where it works best)

---

## 9. Reproducibility

### Environment

* Python (pandas, statsmodels, linearmodels)
* Stata

### How to Run

```bash
# Stata
stata code/analysis.do

# Python
python code/analysis.py
```

Outputs are saved in `/output`.

---

## 10. Repository Structure

```
project/
├── data/
├── code/
├── output/
├── report/
└── README.md
```

---

## 11. Limitations and Future Work

* Address endogeneity using instrumental variables
* Implement event-study design
* Explore heterogeneous effects
* Integrate causal machine learning

---

## 12. Key Takeaways

* Naive correlations can be misleading
* Identification strategy is central to credible inference
* Statistically significant effects may be economically modest
* Causal inference is necessary, but not sufficient, for decision-making

---
