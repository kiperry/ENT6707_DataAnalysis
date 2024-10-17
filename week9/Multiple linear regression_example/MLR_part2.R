############################################################################
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# Multiple linear regression example: Part 2
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
str(growth)

# how many species are in the data set?
growth$species <- as.factor(growth$species)
levels(growth$species) # 4 species

# let's assess the effects of third instar larval weight and nutritional diet
# on adult weight
library(car)
library(sjPlot)
library(sjmisc)
library(emmeans)
library(ggplot2)

boxplot(weight.adult ~ species, data = growth)
stripchart(weight.adult ~ species, data = growth, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2)
dotchart(growth$weight.adult, groups = growth$species, pch = 19)

plot(weight.adult ~ weight.L3, data = growth, pch = 19)

##
# model without interaction
mod1 <- lm(weight.adult ~ weight.L3 + species, data = growth)
summary(mod1)
Anova(mod1, type = "III")

par(mfrow = c(1, 2))
plot(mod1, which = 1:2, pch = 19)

plot_model(mod1, type = "pred", terms = c("weight.L3", "species")) + theme_classic()
emmeans(mod1, pairwise ~ species)

##
# model with interaction
mod2 <- lm(weight.adult ~ weight.L3 + species + weight.L3 * species, data = growth)
summary(mod2)
Anova(mod2, type = "III")

par(mfrow = c(1, 2))
plot(mod2, which = 1:2, pch = 19)

plot_model(mod2, type = "pred", terms = c("weight.L3", "species")) + theme_classic()
inter.means <- emtrends(mod2, "species", var = "weight.L3")
pairs(inter.means)
