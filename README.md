# Do Concealed Carry Laws Reduce Crime?

### A Causal Inference Analysis Using U.S. State-Level Panel Data (1977–1999)

---

## 1. Research Question

Do “shall-issue” concealed carry laws reduce violent crime rates in the United States?

---

## 2. Why This Matters

This is a classic and highly debated question in applied econometrics and public policy.
Early studies suggested that expanding gun carry rights reduces crime, but results are sensitive to model specification.

This project revisits the question with a focus on:

* Distinguishing **correlation vs. causation**
* Demonstrating how **model choice affects conclusions**
* Applying **panel data methods to policy evaluation**

---

## 3. Data

* **Unit of observation**: U.S. states (including D.C.)
* **Time period**: 1977–1999
* **Total observations**: 1,173 (51 states × 23 years)

### Key Variables

* `violent_crime_rate`: Violent crimes per 100,000 population (log-transformed)
* `shall_issue`: Indicator for concealed carry law adoption
* Control variables:

  * Income per capita
  * Unemployment rate
  * Population density
  * Demographic structure

---

## 4. Identification Strategy

To estimate the causal effect of concealed carry laws, I exploit variation across states and over time using a **two-way fixed effects model**:

* **State fixed effects** control for time-invariant differences (e.g., culture, baseline crime levels)
* **Year fixed effects** control for nationwide shocks (e.g., macroeconomic trends)

This setup is equivalent to a **difference-in-differences framework**.

### Key Assumption

* **Parallel trends**: In the absence of the law, treated and untreated states would follow similar trends in crime.

### Validation and Diagnostics

* Compare results across:

  * Simple OLS
  * OLS with controls
  * State fixed effects
  * Two-way fixed effects
* Conduct Hausman test to justify fixed effects over random effects

### Limitations

* Policy adoption may be **endogenous** (states with rising crime may adopt laws)
* Potential **time-varying confounders**
* No explicit event-study to fully validate parallel trends

---

## 5. Results

### Main Estimates

| Model          | Effect on Violent Crime | Interpretation                        |
| -------------- | ----------------------- | ------------------------------------- |
| Simple OLS     | Not significant         | Fails to control for confounders      |
| OLS + Controls | -4.6%                   | Sensitive to observable controls      |
| State FE       | -4.0%                   | Accounts for unobserved heterogeneity |
| **Two-Way FE** | **-3.8% (p < 0.05)**    | Preferred specification               |

### Interpretation

After controlling for both state-specific factors and time trends, shall-issue laws are associated with a **3.8% reduction in violent crime**.

However:

* Effects are **not consistent across crime types**
* Estimates are **sensitive to specification choices**

👉 This suggests that the policy effect is **modest and context-dependent**, rather than universally strong.

---

## 6. Robustness Checks

* Alternative model specifications (OLS vs FE vs RE)
* Clustered standard errors at the state level
* Subsample analysis by crime type

Results remain directionally consistent but vary in magnitude.

---

## 7. Key Takeaways

* Naive models can produce **misleading conclusions**
* Controlling for unobserved heterogeneity is **critical in policy evaluation**
* Even statistically significant effects may be **economically modest**
* Causal claims require **careful identification, not just regression**

---

## 8. Reproducibility

### Environment

* Python (pandas, statsmodels, linearmodels)
* Stata

### How to Replicate

1. Prepare the dataset in `/data`
2. Run:

```bash
stata code/analysis.do
```

or

```bash
python code/analysis.py
```

All results and figures will be generated in `/output`.

---

## 9. Repository Structure

```
project/
├── data/          # Raw and cleaned datasets
├── code/          # Stata and Python scripts
├── output/        # Regression tables and figures
├── report/        # Final report
└── README.md
```

---

## 10. Extensions (Future Work)

* Event study to test parallel trends more rigorously
* Instrumental variable approach to address endogeneity
* Heterogeneous treatment effects across states
* Machine learning methods for policy effect heterogeneity

---
