# guns-crime-analysis
# Guns Crime Analysis Project

## 1. Project Title

**Do Concealed Carry Laws Reduce Crime? Evidence from U.S. Panel Data (1977–1999)**

---

## 2. Research Question

Do "shall-issue" concealed carry laws reduce violent crime rates in the United States?

---

## 3. Data

* Dataset: Guns (Stock & Watson)
* Observations: 1,173 (51 states × 23 years)
* Period: 1977–1999

### Key Variables

* vio: violent crime rate
* rob: robbery rate
* mur: murder rate
* shall: concealed carry law dummy
* incarc_rate: incarceration rate
* density: population density
* avginc: income
* pop: population
* demographic variables

---

## 4. Methodology

This project applies standard econometric methods:

1. **OLS Regression**
2. **OLS with Controls**
3. **State Fixed Effects (FE)**
4. **Two-way Fixed Effects (State + Year FE)**
5. **Hausman Test (FE vs RE)**

---

## 5. Key Results

### OLS (with controls)

* Shall coefficient: -0.368
* Interpretation: ~30.8% reduction
* Significant (p < 0.01)

### State Fixed Effects

* Shall coefficient: -0.046
* Not significant

### Two-way Fixed Effects

* Shall coefficient: -0.028
* Not significant (p = 0.495)

---

## 6. Conclusion

Initial results suggest that shall-issue laws reduce crime. However, after controlling for state and time fixed effects, the effect disappears.

**Final conclusion:**
There is no statistically significant evidence that shall-issue laws reduce violent crime.

---

## 7. Key Insight

Naive OLS estimates are biased due to:

* Omitted state characteristics
* National time trends in crime

---

## 8. Code (Stata)

### Basic Setup

```stata
use guns.dta, clear

gen lnvio = ln(vio)
```

### OLS

```stata
reg lnvio shall, vce(cluster stateid)
```

### OLS with Controls

```stata
reg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, \
    vce(cluster stateid)
```

### State Fixed Effects

```stata
xtset stateid year
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, \
    fe vce(cluster stateid)
```

### Two-way Fixed Effects

```stata
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, \
    fe vce(cluster stateid)
```

### Hausman Test

```stata
xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, re
est store re

xtreg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe
est store fe

hausman fe re
```

---

## 9. How to Run

1. Open Stata
2. Load dataset
3. Run code in order

---

## 10. Author

This project demonstrates applied econometrics skills including causal inference, panel data modeling, and policy evaluation.
