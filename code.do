/********************************************************************

* Project: Concealed Carry Laws and Crime
* Description: Empirical analysis using U.S. state-level panel data
* Time Period: 1977–1999
  ********************************************************************/

*---------------------------------------------------------------*

* 1. Explore panel structure
     *---------------------------------------------------------------*
     br year stateid          // inspect time and cross-sectional identifiers
     tab year                 // distribution of years
     tab stateid              // distribution of states

* Generate year dummies (for time fixed effects)
  tab year, generate(yr)
  br yr*

* Store year dummies (optional manual specification)
  global yr_vars "yr2 yr3 yr4 yr5 yr6 yr7 yr8 yr9 yr10 yr11 yr12 yr13" ///
  "yr14 yr15 yr16 yr17 yr18 yr19 yr20 yr21 yr22 yr23"

* Control variables used across specifications
  global basevars "incarc_rate density avginc pop pb1064 pw1064 pm1029"

*---------------------------------------------------------------*

* 2. Declare panel structure
  *---------------------------------------------------------------*
* stateid: cross-sectional unit
* year: time dimension
  xtset stateid year

*---------------------------------------------------------------*

* 3. Descriptive statistics
  *---------------------------------------------------------------*
  sum

*---------------------------------------------------------------*

* 4. Baseline specification (OLS)
  *---------------------------------------------------------------*

* Log transformation of violent crime rate
  gen lnvio = ln(vio)

* Simple regression
  reg lnvio shall, vce(cluster stateid)

* With controls
  reg lnvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, ///
  vce(cluster stateid)

*---------------------------------------------------------------*

* 5. Fixed effects models
  *---------------------------------------------------------------*

* State fixed effects
  xtreg lnvio shall $basevars, fe vce(cluster stateid)

* Two-way fixed effects (state + year)
  xtreg lnvio shall $basevars i.year, fe vce(cluster stateid)

* Test joint significance of time fixed effects
  testparm i.year

*---------------------------------------------------------------*

* 6. Alternative outcome variables
  *---------------------------------------------------------------*

* Log transformation
  gen ln_rob = log(rob)
  gen ln_mur = log(mur)

* Robbery
  reg ln_rob shall, vce(cluster stateid)
  reg ln_rob shall $basevars, vce(cluster stateid)
  xtreg ln_rob shall $basevars, fe vce(cluster stateid)
  xtreg ln_rob shall $basevars i.year, fe vce(cluster stateid)
  testparm i.year

* Murder
  reg ln_mur shall, vce(cluster stateid)
  reg ln_mur shall $basevars, vce(cluster stateid)
  xtreg ln_mur shall $basevars, fe vce(cluster stateid)
  xtreg ln_mur shall $basevars i.year, fe vce(cluster stateid)
  testparm i.year

*---------------------------------------------------------------*

* 7. Model comparison: Fixed Effects vs Random Effects
  *---------------------------------------------------------------*

* Fixed effects model
  xtreg lnvio shall $basevars i.year, fe
  estimates store fixed

* Random effects model
  xtreg lnvio shall $basevars i.year, re
  estimates store random

* Hausman test
  hausman fixed random

* Re-run with adjustment
  xtreg lnvio shall $basevars i.year, re
  estimates store random

hausman fixed random, sigmamore

* Interpretation:

* H0: Random effects is consistent (no correlation between regressors and individual effects)

* H1: Fixed effects is preferred (correlation exists)

* Reject H0 → use fixed effects
  ********************************************************************/
