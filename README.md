# Bacteria_transformation

The objective of this study is to develop a data-driven predictive model for predicting the positive and negative natural transformations under the effect of various disinfection by- products (DBP) factors, such as Bromoacetic Acid (BAA), Di-bromoacetamide (DBAC), Formaldehyde (FA) and Trichloromethane (CHCL3), pharmacological factors like Carbamezpine (CMZ), environmental factors like: Solar irradiance and UV irradiance, drugs like: Ibuprofen, Naproxen, Gemfibrozil, Diclofenac, Propranolol and Iopromide.

The function predict_transformation will work as follows:

## Input

- filename: the path and name of the file
- sheet: name of the excel sheet
- op: option to predict with the best model or to predict with all the models

The input data of the file is organized as follows, first factor, second factor, third factor, fourth factor, the concentration of the first factor, the concentration of the second factor, the concentration of the third factor, the concentration of the fourth factor (in $\mu M$ for all the factors except Solar and UV irradiance where the concentration is given in $mJ/cm^2$). The factor were labeled the next way:

* None (0)
* BAA (1)
* CHCL3 (2)
* CMZ (3)
* DBAC (4)
* FA (5)
* Solar (6)
* UV (7)
* Ibuprofen (8)
* Naproxen (9)
* Gemfibrozil (10)
* Diclofenac (11)
* Propranolol (12)  
* Iopromide (13)

## Output
- R: The transofmration frequency prediction
- C: The classification fo the transofmration frequency prediction, where 0 is negative transofrmation and 1 is positive transformation

