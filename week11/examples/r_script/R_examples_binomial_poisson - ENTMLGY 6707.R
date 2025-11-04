

# Logistic regression -----------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# load data
tree_data <- read.csv("completely_fabricated_data/tree_data.csv")
summary(tree_data)

# plot data (always!)
plot(pecked~emerald_ash_borer, data=tree_data, ylab="Attacked (presence/absence)", xlab="Beetles (per square meter of phloem)")

# fit model
fit1 <- glm(pecked~emerald_ash_borer,data=tree_data,family=binomial(link=logit))
summary(fit1)

# assess fit
plot(pecked~jitter(emerald_ash_borer,2), data=tree_data, ylab="Attacked (presence/absence)", xlab="Beetles (per square meter of phloem)")
new_data <- as.data.frame(seq(0,11,0.1))
colnames(new_data) <- "emerald_ash_borer"
lines(new_data$emerald_ash_borer,predict(fit1,newdata=new_data,type="response"))

# interpretation
# When using the logit link: 
# "The odds of finding woodpecking on a tree increase by 2.28 [=exp(0.8252)]
# with an increase in 1 insect per square meter of phloem.“

# additional interpretations
library(MASS)
dose.p(fit1, p=c(0.5,0.9))


# Poisson regression -----------------------------------------------
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# load data
beetles <- read.csv("completely_fabricated_data/beetles.csv")
summary(beetles)


# plot data (always!)
plot(ELB~temperature, data=beetles, ylab="Beetles per trap",xlab=expression(paste("Temperature (",degree,"C)")))

# fit model
fit2 <- glm(ELB~temperature,data=beetles,family=poisson(link=log))
summary(fit2)

# assess fit
plot(ELB~temperature, data=beetles, ylab="Beetles per trap",xlab=expression(paste("Temperature (",degree,"C)")))
summary(beetles)
new_data <- as.data.frame(seq(4,43,1))
colnames(new_data) <- "temperature"
lines(new_data$temperature,predict(fit2,newdata=new_data,type="response"))


# interpretation
# note that exp(0.039070)=1.039843)

#When using the log link… 
#"An increase in one degree Celsius is associated with a 3.98% [(1.039843-1) *100] increase in the number of beetles caught per trap.“
#OR
#"An increase in one degree Celsius is associated with a 1.039843 times increase in the number of beetles caught per trap.“


