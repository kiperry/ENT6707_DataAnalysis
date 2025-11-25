############################################################################
# ENT6707 Entomological Techniques and Data Analysis
#
# Diversity metrics: Beetle Activity
#
# National Science Foundation (NSF)
# Long-term Ecological Research (LTER)
# Harvard Forest
#
# Beetle communities
#
############################################################################

# Harvard Forest LTER centers on deciduous forest ecosystem and was established in 1988,
# although this site has been used for research and educational purposes since 1907
# Research focuses on ecological dynamics from natural disturbances, environmental change, and
# human impacts
# https://lternet.edu/site/harvard-forest-lter/ for more information

# For the in class activity, we will use a data set of beetle communities collected in the hemlock removal experiment
# Metadata descriptions here: https://harvardforest1.fas.harvard.edu/exist/apps/datasets/showData.html?id=HF118

#LTER Package ID: knb-lter-hfr.177.10

# data are available online, so we can pull from the website
beetles <- read.csv(file="https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/177/10/e04143ae8031669375eef1012c2ff155", 
                    header=T, na.strings=c("",".","NA"))

str(beetles)

beetles$family <- as.factor(beetles$family)
levels(beetles$family) # 26 beetle families

str(beetles)
ptilidae <- beetles[which(beetles$family == "Ptilidae"),]
colSums(ptilidae[10]) # wow, so many feather winged beetles!

library(reshape2) # can also use functions in the tidyr package

beetle.matrix <- dcast(beetles, block + plot + treatment + sampling.method ~ family, sum, value.var = "count")
str(beetle.matrix)

# change variables to factors
beetle.matrix$block <- as.factor(beetle.matrix$block)
beetle.matrix$plot <- as.factor(beetle.matrix$plot)
beetle.matrix$treatment <- as.factor(beetle.matrix$treatment)
beetle.matrix$sampling.method <- as.factor(beetle.matrix$sampling.method)

# view abundance of beetles by family
par(mar=c(8,4,2,2))
barplot(sort(colSums(beetle.matrix[,5:30]),decreasing=T), col="seagreen",
        xlab="", ylab="Abundance", las = 2,
        ylim = c(0, 1000))

# calculate family diversity using hill numbers
library(hillR)
# Hill number, q = 0 (default) to get species richness, q = 1 to get shannon entropy,
# q = 2 will give inverse Simpson.
beetle.matrix$sp.div <- hill_taxa(beetle.matrix[,5:30], q = 2, MARGIN = 1)
str(beetle.matrix)

boxplot(sp.div ~ treatment, data = beetle.matrix,
        xlab = "", ylab = "Beetle family diversity")
stripchart(sp.div ~ treatment, data = beetle.matrix, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2)

boxplot(sp.div ~ sampling.method, data = beetle.matrix,
        xlab = "", ylab = "Beetle family diversity")
stripchart(sp.div ~ sampling.method, data = beetle.matrix, pch = 19, add = TRUE,
           vertical = TRUE, method = "jitter", jitter = 0.2)

library(lme4)
library(lmerTest)
library(sjPlot)
library(sjmisc)
library(emmeans)
library(car)

mod2 <- lmer(sp.div ~ treatment + sampling.method + (1|plot), data = beetle.matrix)
summary(mod2)
Anova(mod2, type = "III")
plot(mod2, pch = 19)
qqnorm(residuals(mod2))
