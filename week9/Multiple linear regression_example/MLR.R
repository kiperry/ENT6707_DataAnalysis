############################################################################
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# Multiple linear regression example
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
# 15 October 2024
#
############################################################################

# Load the data
growth <- read.csv("./week9/Multiple linear regression_example/data_larval_growth.csv")

nrow(growth)
str(growth)
head(growth)  
tail(growth)

summary(growth)

# how many species are in the data set?
growth$species <- as.factor(growth$species)
levels(growth$species) # 4 species

# how many levels of the nutritional treatment?
growth$nutritional.treatment <- as.factor(growth$nutritional.treatment)
levels(growth$nutritional.treatment) # two: high and low quality

str(growth)
summary(growth)

# for the purposes of this example, we will compare adult weight as a function of 
# larval weight of dung beetles
# SO, we need to subset the data

library(tidyverse)

# pull out data from the dung beetle species Liatongus militaris because it has the
# most observations in the dataset (i.e., 50)
beetle <- growth %>% filter(species == "L. militaris") %>% droplevels()
levels(beetle$species)

summary(beetle)

str(beetle)

plot(weight.adult ~ weight.L3, data = beetle, pch = 19)

plot(beetle[3:8], pch = 19)
cor(beetle[4:8], method = c("pearson"), use = "complete.obs")


# let's assess the effects of third instar larval weight and nutritional diet
# on adult weight
library(car)
library(sjPlot)
library(sjmisc)
library(emmeans)

str(beetle)

##
# model without interaction
beetle_mod <- lm(weight.adult ~ weight.L3 + nutritional.treatment, data = beetle)
summary(beetle_mod)
Anova(beetle_mod, type = "III")

par(mfrow = c(2, 2))
plot(beetle_mod, pch = 19)
plot(beetle_mod, which = 1:4, pch = 19)

plot_model(beetle_mod, type = "pred", terms = c("weight.L3", "nutritional.treatment")) + theme_classic()
emmeans(beetle_mod, pairwise ~ nutritional.treatment)

##
# model with interaction
beetle_mod_interaction <- lm(weight.adult ~ weight.L3 + nutritional.treatment + weight.L3 * nutritional.treatment, data = beetle)
summary(beetle_mod_interaction)
Anova(beetle_mod_interaction, type = "III")
Anova(beetle_mod_interaction, type = "II") # notice that this output is the same as for the model without the interaction

par(mfrow = c(2, 2))
plot(beetle_mod_interaction, pch = 19)
plot(beetle_mod_interaction, which = 1:4, pch = 19)

plot_model(beetle_mod_interaction, type = "pred", terms = c("weight.L3", "nutritional.treatment")) + theme_classic()
inter.means <- emtrends(beetle_mod_interaction, "nutritional.treatment", var = "weight.L3")
pairs(inter.means)
