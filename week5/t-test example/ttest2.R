############################################################################
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# t-test: example 2
#
# Miller-Struttmann, Nicole E.; Geib, Jennifer C.; Franklin,
# James D. et al. (2016). Data from: Functional mismatch in a bumble bee
# pollination mutualism under climate change [Dataset].
# Dryad. https://doi.org/10.5061/dryad.10278
#
# Miller-Struttmann NE, Geib JC, Franklin JD, Kevan PG, Holdo RM,
# Ebert-May D, Lynn AM, Kettenbach JA, Hedrick E, Galen C. Functional
# mismatch in a bumble bee pollination mutualism under climate change.
# Science. 2015 Sep 25;349(6255):1541-4. doi: 10.1126/science.aab0868.
#
# 18 September 2024
#
############################################################################


# Load the data
bee <- read.csv("./week5/t-test example/Bumble bee morphology data.csv")

nrow(bee)
str(bee)
head(bee)  
tail(bee)  

summary(bee)

# how many bumble bee species are included in the data set?
bee$SPECIES <- as.factor(bee$SPECIES)
levels(bee$SPECIES)

# are the data just from workers?
bee$CASTE <- as.factor(bee$CASTE)
levels(bee$CASTE)

# What are the different years and time intervals?
bee$TIME <- as.factor(bee$TIME)
levels(bee$TIME)

bee$YEAR <- as.factor(bee$YEAR)
levels(bee$YEAR)

str(bee)
summary(bee)

# for this example, let's focus on one bumble bee species
# and compare body size (intertegular space), wing length, and tongue length (glossa)
# individuals collected in the past (1960-1980) and present (2012-2014)

# SO, we need to subset the data

library(tidyverse)

# pull out data for Bombus balteatus
bal <- bee %>% filter(SPECIES == "balteatus") %>% droplevels()
summary(bal)

# I want to change the column names for body size and wing length

names(bal)[9] <- "wingL"
names(bal)[10] <- "bodyS"
names(bal)[11] <- "tongueL"

summary(bal)

# wing length
boxplot(wingL ~ TIME, data = bal)

# body size
boxplot(bodyS ~ TIME, data = bal)

# tongue length
boxplot(bal$tongueL ~ TIME, data = bal)

#### Checking assumptions: 1. Response is continuous
plot(bal$wingL)
plot(bal$bodyS)
plot(bal$tongueL)


#### Checking assumptions: 2. Data are independent
# Since we did not collect these data, we will have to assume this is true.
# We can review the methods of the article to support our assumption.


#### Checking assumptions: 3. Normality
hist(bal$wingL)
qqnorm(bal$wingL)
qqline(bal$wingL)

hist(bal$bodyS)
bal$bodyS_Log <- log(bal$bodyS)
hist(log(bal$bodyS))
qqnorm(bal$bodyS)
qqline(bal$bodyS)
qqnorm(log(bal$bodyS))
qqline(log(bal$bodyS))

hist(bal$tongueL)
qqnorm(bal$tongueL)
qqline(bal$tongueL)


#### Checking assumptions: 4. Homogeneity of variances
dotchart(bal$wingL, groups = bal$TIME, pch = 19)
dotchart(bal$bodyS, groups = bal$TIME, pch = 19)
dotchart(bal$tongueL, groups = bal$TIME, pch = 19)


####
# What do you think? Do the data meet the assumptions of a t-test?
####

## wing length t-test
t.test(wingL ~ TIME, data = bal, alternative = "two.sided",
       paired = FALSE, var.equal = FALSE)

boxplot(wingL ~ TIME, data = bal, col = c("seagreen2", "steelblue2"),
        ylab = "Wing Length (mm)", xlab = "", main = "Bombus balteatus")
stripchart(wingL ~ TIME, data = bal, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2,
           col = c("seagreen4", "steelblue4"))


# body size t-test
wilcox.test(bodyS ~ TIME, data = bal, alternative = "two.sided",
            pairied = FALSE)

boxplot(bodyS ~ TIME, data = bal, col = c("seagreen2", "steelblue2"),
        ylab = "Intertegular Distance (mm)", xlab = "", main = "Bombus balteatus")
stripchart(bodyS ~ TIME, data = bal, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2,
           col = c("seagreen4", "steelblue4"))


# tongue length t-test
t.test(tongueL ~ TIME, data = bal, alternative = "two.sided",
       paired = FALSE, var.equal = TRUE)

boxplot(tongueL ~ TIME, data = bal, col = c("seagreen2", "steelblue2"),
        ylab = "Glossa Length (mm)", xlab = "", main = "Bombus balteatus",
        ylim = c(2, 12))
stripchart(tongueL ~ TIME, data = bal, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2,
           col = c("seagreen4", "steelblue4"))
text(1, 12, "a", pos = 1, font = 1, cex = 1.2)
text(2, 11, "b", pos = 1, font = 1, cex = 1.2)
