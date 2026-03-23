# Do Concealed Carry Laws Reduce Crime?

### A Causal Inference and Decision-Oriented Analysis Using U.S. Panel Data (1977–1999)

---

## 1. Research Question

Do “shall-issue” concealed carry laws reduce violent crime rates?

More importantly:
**How should we interpret and use this effect in decision-making?**

---

## 2. Why This Matters

This question is a canonical example in applied econometrics and highlights a broader issue:

> **Naive correlations often lead to misleading conclusions in policy and business contexts.**

The same challenge appears in real-world data science:

* Measuring marketing effectiveness
* Evaluating product feature impact
* Assessing policy interventions

This project focuses on **causal identification**, not just prediction.

---

## 3. Data

* **Unit**: U.S. states (incl. D.C.)
* **Period**: 1977–1999
* **Observations**: 1,173 (balanced panel)

### Key Variables

* `log_violent_crime_rate`: Outcome variable
* `shall_issue`: Treatment indicator
* Controls:

  * Income per capita
  * Unemployment rate
  * Population density
  * Demographics

---

## 4. Identification Strategy

To estimate causal effects, I use a **two-way fixed effects (TWFE) model**, leveraging variation across states and over time.

### Model

* State FE → controls for time-invariant heterogeneity
* Year FE → controls for common shocks

This corresponds to a **difference-in-differences framework**.

### Key Assumption

* **Parallel trends**: Treated and control states would evolve similarly absent treatment

### Diagnostics

* Compare OLS, OLS + controls, FE, and TWFE
* Hausman test supports FE over RE

### Limitations

* Policy adoption may be endogenous
* Possible time-varying confounders
* No full event-study validation of parallel trends

---

## 5. Results

### Main Estimates

| Model          | Effect               | Interpretation                    |
| -------------- | -------------------- | --------------------------------- |
| OLS            | Not significant      | Confounded                        |
| OLS + Controls | -4.6%                | Sensitive                         |
| State FE       | -4.0%                | Controls unobserved heterogeneity |
| **TWFE**       | **-3.8% (p < 0.05)** | Preferred estimate                |

### Interpretation

Shall-issue laws are associated with a **~3.8% reduction in violent crime** after accounting for state and time effects.

However:

* Effects vary across crime types
* Magnitude is **modest**
* Results depend on specification

👉 The evidence supports a **limited, context-dependent effect**, not a universal reduction.

---

## 6. Robustness Checks

* Clustered standard errors (state level)
* Alternative specifications (OLS / FE / RE)
* Subsample analysis by crime type

Findings are directionally stable but not uniform.

---

## 7. From Causality to Decision-Making

While this project focuses on causal estimation, real-world data science requires going further:

### 1. Treatment Effect ≠ Decision Rule

A statistically significant average effect does not imply:

* The policy works everywhere
* The effect is large enough to justify implementation

### 2. Heterogeneity Matters

In practice, we need to answer:

* **Where does it work?**
* **For whom does it work?**

### 3. Business Analogy

This framework directly maps to:

* Marketing campaigns (treatment = exposure)
* Product rollouts (treatment = feature launch)
* A/B testing with panel structure

### 4. Extensions

* Heterogeneous treatment effects (HTE)
* Causal ML (e.g., causal forests, double ML)
* Policy targeting based on predicted impact

### Key Insight

> Data scientists must combine:
>
> * **Causal inference (what works)**
> * **Prediction (where it works best)**

This project establishes the first and outlines the path to the second.

---

## 8. Reproducibility

### Environment

* Python (pandas, statsmodels, linearmodels)
* Stata

### Steps

```bash
# Stata
stata code/analysis.do

# Python
python code/analysis.py
```

Outputs (tables, figures) are saved in `/output`.

---

## 9. Repository Structure

```
project/
├── data/
├── code/
├── output/
├── report/
└── README.md
```

---

## 10. Limitations and Future Work

* Address endogeneity via instrumental variables
* Implement event-study design
* Estimate heterogeneous effects
* Integrate causal ML methods

---

## 11. Key Takeaways

* Correlation-based models can be misleading
* Identification strategy is central to credible inference
* Statistically significant ≠ practically large
* Causal estimation is necessary, but not sufficient, for decision-making

---
