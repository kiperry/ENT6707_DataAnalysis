#____________________________________________________________________________
# 
# ENT6707 Entomological Techniques and Data Analysis
#
# Diversity metrics: In Class Activity
#
# National Science Foundation (NSF)
# Long-term Ecological Research (LTER)
# Harvard Forest
#
# Beetle communities
#
#____________________________________________________________________________

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

# I also provided the data as an excel file in case the link above doesn't work.