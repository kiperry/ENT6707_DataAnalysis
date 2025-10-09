# Description ------------------------------------------------------------
#_______________________________________________________________________________
# ENTMLGY 6707 Entomological Techniques and Data Analysis
# Practice analyzing and interpreting data from a randomized complete block design
# Compare sequential vs. marginal fitting (Type I vs. Type II/III sums of squares)





# Organize the data ------------------------------------------------------------
#_______________________________________________________________________________
# install.packages("MASS") # only run if you don't have the MASS package installed
library(MASS) # immer data are available from the MASS package
df1 <- immer[,c("Loc", "Var", "Y1")]
colnames(df1) <- c("Block", "Variety", "Yield")
df1$Year <- 1931
df2 <- immer[,c("Loc", "Var", "Y2")]
colnames(df2) <- c("Block", "Variety", "Yield")
df2$Year <- 1932
barley <- rbind.data.frame(df1,df2)

set.seed(123)
barley <- barley[-runif(20,1,60),]


# Sums of squares --------------------------------------------------------------
#_______________________________________________________________________________
library(car) # capital A Anova()
# anova(<model goes here>) # Type I sums of squares
# Anova(<model goes here>, Type="II") # Type II sums of squares
# Anova(<model goes here>, Type="III") # Type III sums of squares
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





# fit linear model -------------------------------------------------------------
#_______________________________________________________________________________
fit1 <- lm(Yield ~ Block + Variety, data = barley)
summary(fit1)
anova(fit1)
Anova(fit1, Type="II")

fit2 <- lm(Yield ~ Variety + Block, data = barley)
summary(fit2)
anova(fit2)
Anova(fit2, Type="II")
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





# Multiple comparisons ---------------------------------------------------------
#_______________________________________________________________________________
library(emmeans)
emmeans(fit1, pairwise ~ Variety)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

