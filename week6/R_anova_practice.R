#install.packages("palmerpenguins")
library(palmerpenguins) # penguin data
library(ggplot2) # graphing
library(emmeans) # multiple comparisons
library(car) # Anova()
head(penguins)
table(penguins$island,penguins$species )

ggplot(penguins, aes(x=island, y=body_mass_g, fill=species)) + 
  geom_boxplot()+theme_classic()


