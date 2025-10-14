############################################################################
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# Simple linear regression example
#
# Rohner, Patrick T.; Moczek, Armin (2023). Evolutionary and plastic
# variation in larval growth and digestion reveal the complex underpinnings
# of size and age at maturation in dung beetles [Dataset].
# Dryad. https://doi.org/10.5061/dryad.j9kd51cdc
#
# Rohner, P. T., & Moczek, A. P. (2021). Evolutionary and plastic
# variation in larval growth and digestion reveal the complex underpinnings
# of size and age at maturation in dung beetles. Ecology and Evolution,
# 11, 15098–15110. https://doi.org/10.1002/ece3.8192
#
# 14 October 2025
#
############################################################################

# Load the data
library(readxl)
growth <- read_excel(path = "week8/SLR_example/data_for_dryad_larval_growth.xlsx",
                   sheet = "weight and age by stage",
                   range = "A1:T176")

str(growth)
summary(growth)

# how many species are in the data set?
growth$species <- as.factor(growth$species)
levels(growth$species) # 4 species

# how many levels of the nutritional treatment?
growth$nutritional.treatment <- as.factor(growth$nutritional.treatment)
levels(growth$nutritional.treatment) # two: high and low quality

str(growth)
summary(growth)

# for the purposes of this SLR example, we will compare adult weight as a function of 
# larval weight (third instar) of dung beetles fed a high-quality nutritional diet
# is adult weight predicted by larval weight?
# SO, we need to subset the data

library(tidyverse)

# pull out data from the dung beetle species Liatongus militaris because it has the
# most observations in the data set (i.e., 50)
beetle <- growth %>% filter(species == "L. militaris") %>% droplevels()
levels(beetle$species)

# now let's subset the data again to pull out data associated with the high-quality
# nutritional treatment
beetle_high <- beetle %>% filter(nutritional.treatment == "high-quality") %>% droplevels()
levels(beetle_high$nutritional.treatment)

str(beetle_high)
summary(beetle_high)

# Always graph the data!
plot(weight.adult ~ weight.L3, data = beetle_high, pch = 19)
# What are some things we can observe about the data (in the figure)?
# (1) Slope is positive, generally adult weight increases with larval weight
# (2) Larvae weigh more than adults (both measured in grams)

# run the model
beetle_mod <- lm(weight.adult ~ weight.L3, data = beetle_high)

summary(beetle_mod)
# (1) summary of residuals; can also be used to assess homogeneity of variances
# Median around zero, absolute values of max and min should be similar
# (2) intercept differs from zero; line intersects the y axis at 0.068
# (3) slope of line is positive
# (4) model does not explain much variation in the data (low R2 values)

# Now we need to check model assumptions
par(mfrow = c(2, 2))
plot(beetle_mod, pch = 19)
plot(beetle_mod, which = 1:4, pch = 19)


# Conclusion: Larval third instar weight positively influences the weight of the 
# adult, such that a 1 gram increase in larval weight was associated with a 
# 0.15 g increase in adult weight when fed a high nutritional diet (t = 2.6, p = 0.015).

par(mfrow = c(1, 1))
plot(weight.adult ~ weight.L3, data = beetle_high, pch = 19, cex = 1.3,
     xlab = "Weight of Third Larval Instar (g)",
     ylab = "Weight of Adult (g)")
