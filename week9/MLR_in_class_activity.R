############################################################################
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# Key: Multiple linear regression in class activity
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
# 30 October 2025
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

# Question: Is adult weight predicted by larval weight and beetle species?

hist(growth$weight.adult)
plot(weight.adult ~ weight.L3, data = growth, pch = 19)
boxplot(growth$weight.adult ~ growth$species)
dotchart(growth$weight.adult, groups = growth$species, pch = 19)

library(car)
library(sjPlot)
library(sjmisc)
library(emmeans)

##
# model without interaction
mod_no_interaction <- lm(weight.adult ~ weight.L3 + species, data = growth)
summary(mod_no_interaction)

# check model assumptions
par(mfrow = c(2, 2))
plot(mod_no_interaction, pch = 19) # not that bad, perhaps some issues with heterogeneity assumption
# Figure top left: we see that the points are more clustered on the right and more spread out on the left
plot(mod_no_interaction, which = 1:4, pch = 19)
par(mfrow = c(1, 1))

# Type II and Type III = Marginal fits
# Using marginal fitting, the effects of each predictor on the response variable will be returned
# after the model accounts for the effects of all other predictors.
# The sums of squares reflect the variation solely explained by each predictor.

Anova(mod_no_interaction, type = "II") # no interaction so type II and III should be the same
Anova(mod_no_interaction, type = "III")
# Type III tests assess the importance of each predictor in the model after accounting for the variation
# explained by all other predictions, including any interactions.
# The intercept represents the expected value of the response variable when all predictors are at their reference
# level (categorical) or zero (continuous). For Type III tests, the intercept becomes important when interactions
# are included in the model

# What if we used a Type I test = Sequential fits
# Let's run another model where we switch the predictors

mod_no_interaction_switch <- lm(weight.adult ~ species + weight.L3, data = growth)

summary(mod_no_interaction_switch)

# lower case anova function runs a Type I test only
anova(mod_no_interaction)
anova(mod_no_interaction_switch)
# when we have two or more predictors in the model, the output changes based on the order of the
# predictors when using Type I. You can see the sums of squares values differ between the two outputs,
# but all we changed between the two models is the order of `weight.L3` and `species`.
# Using sequential fitting, the order of predictors in the model determines which predictor will claim the 
# redundant explained variation. So, in mod_no_interaction, the predictor `weight.L3` is listed first, and it claimed 
# the redundant explained variation such that the variation explained by species is returned after accounting for weight.L3
# The opposite is true for mod_no_interaction_switch. You can see this in the outputs based on the sums of squares values


# Anova table (Type II or III tests) indicates there is an effect of larval weight and species on adult weight of dung beetles
# Is there an interaction between larval weight and species?
Anova(mod_no_interaction, type = "III")
plot_model(mod_no_interaction, type = "pred", terms = c("weight.L3")) + theme_classic()
plot_model(mod_no_interaction, type = "pred", terms = c("weight.L3", "species")) + theme_classic()
emmeans(mod_no_interaction, pairwise ~ species)

# Overall, adult weight increased with larval weight, such that heavier larvae resulted in
# heavier adults (F = 26.1, p < 0.001). D. gazella and O. binodis adults weighed more than adults
# of L. militaris and O. taurus (F = 4.8, p = 0.002).


##
# model with interaction
mod_interaction <- lm(weight.adult ~ weight.L3 + species + weight.L3 * species, data = growth)

# check model assumptions
par(mfrow = c(2, 2))
plot(mod_interaction, pch = 19) # not that bad, perhaps some issues with heterogeneity assumption
# Figure top left: we see that the points are more clustered on the right and more spread out on the left
# Figure bottom right: looks like we do have one data point determined to be influential.
plot(mod_interaction, which = 1:4, pch = 19)
par(mfrow = c(1, 1))

summary(mod_interaction)
Anova(mod_interaction, type = "III")

# Anova table indicates there is an interaction among larval weight and species

plot_model(mod_interaction, type = "pred", terms = c("weight.L3", "species")) + theme_classic()
pairs(emtrends(mod_interaction, "species", var = "weight.L3"))
emtrends(mod_interaction, specs = ~ species, var = "weight.L3") # estimated slopes

# While adult weight generally increased with larval weight, this relationship was strongest
# for O. taurus and O. binodis (F = 2.9, p = 0.034).