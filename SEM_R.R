# SEM: Structural equation modeling
library(lm.beta) 
library(olsrr)
library(Hmisc)
library(lavaan)
library(semTools)

# Load raw data
datadata <- read.csv("data.csv", header = TRUE)



# SEm
SEMmodel <- '
                    PR     =~   PR_1	+ PR_2	+ PR_3	
                    SP     =~   SP_1  + SP_2  + SP_3
                    VZ    =~    VZ_1  + VZ_2  + VZ_3

                    VZ   ~  SP + PR 
          
             '
SEMfit <- sem(SEMmodel, data=datadata)
summary(SEMfit)
summary(SEMfit, SEMfit.measures=TRUE, standardize = TRUE)
fitMeasures(SEMfit, c("chisq", "df", "pvalue","RMSEA","CFI","SRMR"))
