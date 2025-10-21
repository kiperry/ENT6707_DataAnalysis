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
# 21 October 2025
#
############################################################################

# Load the data
library(readxl)
growth <- read_excel(path = "week8/SLR_example/data_for_dryad_larval_growth.xlsx",
                     sheet = "weight and age by stage",
                     range = "A1:T176")

str(growth)
summary(growth)

growth$species <- as.factor(growth$species)
levels(growth$species) # 4 species

growth$nutritional.treatment <- as.factor(growth$nutritional.treatment)
levels(growth$nutritional.treatment) # two treatments: high and low quality

str(growth)
summary(growth)

library(tidyverse)

# subset the data to focus on the dung beetle species Liatongus militaris because it has the
# most observations in the data set (i.e., 50)
beetle <- growth %>% filter(species == "L. militaris") %>% droplevels()
levels(beetle$species)

summary(beetle)

# Question: is adult weight predicted by larval weight and diet?

hist(beetle$weight.adult)
plot(weight.adult ~ weight.L3, data = beetle, pch = 19)
boxplot(beetle$weight.adult ~ beetle$nutritional.treatment)
dotchart(beetle$weight.adult, groups = beetle$nutritional.treatment, pch = 19)

# check for collinearity
plot(beetle[,3:8], pch = 19)
cor(beetle[,4:8], method = c("pearson"), use = "complete.obs")
# would not want to build a model that includes weight.L3 and weight.pupa

library(car)
library(sjPlot)
library(sjmisc)
library(emmeans)

##
# model without interaction
beetle_mod <- lm(weight.adult ~ weight.L3 + nutritional.treatment, data = beetle)
summary(beetle_mod)
Anova(beetle_mod, type = "III")

# Anova table indicates there is an effect of larval weight and diet on adult weight of dung beetles

# check model assumptions
par(mfrow = c(2, 2))
plot(beetle_mod, pch = 19)
plot(beetle_mod, which = 1:4, pch = 19)

plot_model(beetle_mod, type = "pred", terms = c("weight.L3", "nutritional.treatment")) + theme_classic()
emmeans(beetle_mod, pairwise ~ nutritional.treatment)
# While adult weight increases with larval weight, individuals fed a low-quality diet weighed more as adults

##
# model with interaction
beetle_mod_interaction <- lm(weight.adult ~ weight.L3 + nutritional.treatment + weight.L3 * nutritional.treatment, data = beetle)
summary(beetle_mod_interaction)
Anova(beetle_mod_interaction, type = "III")

# Anova table indicates there is no interactions among larval weight and diet
# After including the interaction term, the results changed.
# Anova table provides the effects of our two predictors after accounting for the effect of the interaction.
# In this case, diet is no longer an important predictor, while larval weight remains important.

# Wait, what? This is why your research question and biological relevance are important for informing model design.

# check assumptions
par(mfrow = c(2, 2))
plot(beetle_mod_interaction, pch = 19)
plot(beetle_mod_interaction, which = 1:4, pch = 19)

plot_model(beetle_mod_interaction, type = "pred", terms = c("weight.L3", "nutritional.treatment")) + theme_classic()
pairs(emtrends(beetle_mod_interaction, "nutritional.treatment", var = "weight.L3"))
