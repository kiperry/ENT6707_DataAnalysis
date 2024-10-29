
# Load packages ---------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
library(tidyverse)
library(lme4)
library(lmerTest)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



# Read in data ---------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mdf <- read.csv("data/mdf_removeOutliersResiduals_wSeasonalityTrait.csv") %>% 
  dplyr::filter(overwinteringStage != "None")
head(mdf)
mdf$id_cells <- as.factor(mdf$id_cells)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




# Activity ---------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Part I: Make a graph of q50 as a function of annualTemp.
# Color the points by "id_cells", but remove the legend
# q50: the day of year at which 50% of individuals (a moth or butterfly species) were observed
# annualTemp: mean annual temperature for a given cell (I assume standardized?)
ggplot(mdf, aes(x = annualTemp, y = q50, colour = id_cells)) +
  geom_point() + 
  theme_bw()+ theme(legend.position="none")

# units of temperature?
# Answer (?):  ( temp_C - mean(temp_C) ) / sd(temp_c)

# Part II: Fit a mixed-effects model with q50 as the response variable
# and annualTemp as the predictor. Include two random intercepts, one
# for "validName" (indicator for species) and one for "id_cells" (indicator for sampling location)  
off_clim_top <- lmer(q50 ~ annualTemp + (1|validName) + (1|id_cells),
                     data = mdf)
summary(off_clim_top)
plot(off_clim_top)

# Interpretations assuming the temperature was indeed standardized
# Interpretation (1): with a one unit increase in "standardized temperature", there was a
# 10 unit decrease in DOY (= the day of year at which point 50% of moths were trapped)

# Interpretation (2): one standard deviation increase in temperature was associated with a 10 
# standard deviation decrease in DOY

# Biology: in warmer years, the moths fly earlier.

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




# A note on random intercepts ---------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
View(mdf[,c("validName", "id_cells")])

model_option1 <- lmer(q50 ~ annualTemp + (1|validName) + (1|id_cells),
                     data = mdf)
summary(model_option1)


# incorrect specification of random intercepts (species are not nested within cells)
model_option2 <- lmer(q50 ~ annualTemp + (1|id_cells/validName),
                      data = mdf)
summary(model_option2)

# incorrect specification of random intercepts (cells are not nested within species)
model_option3 <- lmer(q50 ~ annualTemp + (1|validName/id_cells),
                      data = mdf)
summary(model_option3)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



