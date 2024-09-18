ReadMe for “The evolution of a functional mismatch in a pollination mutualism under climate change”

Authors: Nicole E. Miller-Struttmann, Jennifer C. Geib, James D. Franklin, Peter G. Keva3, Ricardo M. Holdo, Diane Ebert-May, Jessica A. Kettenbach, Elizabeth Hedrick and Candace Galen

June-2-2015

This readme file describes the data and R files accompanying the above publication. For further queries, please contact nmillstrutt@gmail.com

The following files are included:

**** The following files are associated with tongue length density function parameter estimation
1)  “Tongue length density function parameter estimation.r”
This is R script when run on the following five files [“Bumble bee community workers past - Front Range.csv”, “Bumble bee community workers past - Pennsylvania Mountain.csv”, “Bumble bee community workers present - Front Range.csv”, “Bumble bee community workers present - Pennsylvania Mountain.csv”, “Bumble bee tongue length - Macior 1974.csv”] will produce the parameter estimates for the multi-modal tongue length density function of 1000 simulated bumble bee communities. 
Two example outputs from this R script (those analyzed statistically for the above manuscript) are included in these data files [i.e., “Data from 'Tongue length density function parameters estimation' - Front Range.csv” and “Data from 'Tongue length density function parameters estimation' - Pennsylvania Mountain.csv”]

2)  “Bumble bee community workers past - Front Range.csv”
This is the list of bumble bees (Bombus workers) as collected by L. W. Macior (1974) at Niwot Ridge Long Term Ecological Research Site and Mount Evans Wilderness Area in Colorado. Data from Mt. Evans and Niwot Ridge combined as in Macior 1974. Used in “Tongue length density function parameter estimation.r”. 

3)  “Bumble bee community workers past - Pennsylvania Mountain.csv”
This is the list of bumble bees (Bombus workers) as collected by P. A. Byron (1980) at Pennsylvania Mountain, CO. Used in “Tongue length density function parameter estimation.r”

4)  “Bumble bee community workers present - Front Range.csv”
This is the list of bumble bees (Bombus workers) as collected by Nicole Miller-Struttmann and colleagues between 2012 and 2014 at Niwot Ridge Long Term Ecological Research site and Mount Evans Wilderness Area in Colorado. Data from Mt. Evans and Niwot Ridge combined as in Macior 1974. Used in “Tongue length density function parameter estimation.r”

5)  “Bumble bee community workers present - Pennsylvania Mountain.csv”
This is the list of bumble bees (Bombus workers) as collected by Jenni Geib and colleagues in 2008, 2011 and 2013 at Pennsylvania Mountain, CO. Used in “Tongue length density function parameter estimation.r”

6)  “Bumble bee tongue length - Macior 1974.csv”
Tongue length measurements from Macior 1974. Used in “Tongue length density function parameter estimation.r”

COLUMN DETAILS:
BB.SPECIES - bumble bee species name 
MEAN - mean tongue length (mm)
STANDARD.DEVIATION - standard deviation in tongue length (mm)

7)  “Data from 'Tongue length density function parameters estimation' - Front Range.csv”
Sample output (used in the above manuscript) from the R script “Tongue length density function parameter estimation.r”. Provides the proportion of individual bumble bees in each subpopulation (short and long-tongued) and mean and standard deviation of tongue length in each subpopulation of bumble bees in the Front Range in the past and present. Bumble bee community data from Mt. Evans Wilderness Area and Niwot Ridge Long Term Ecological Research site combined as in Macior 1974.

COLUMN DETAILS:
REPLICATE - iteration from the resampling code (ranges from 1-1000)
lambda1 - proportion of individuals in the short-tongued subpopulation of bumble bees 
mu1 - mean tongue length of the individuals in the short-tongued subpopulation of bumble bees 
sigma1 - standard deviation of tongue length for individuals in the short-tongued subpopulation of bumble bees
lambda2 - proportion of individuals in the long-tongued subpopulation of bumble bees 
mu2 - mean tongue length of the individuals in the long-tongued subpopulation of bumble bees 
sigma2 - standard deviation of tongue length for individuals in the long-tongued subpopulation of bumble bees
TIME – the timeframe during which the bees were originally collected in the Front Range (Mt. Evans and Niwot Ridge combined) and Pennsylvania Mountain (1966-1969 and 1977-1980, respectively)

8)  “Data from 'Tongue length density function parameters estimation' - Pennsylvania Mountain.csv”
Sample output (used in the above manuscript) from the R script “Tongue length density function parameter estimation.r”. Provides the proportion of individual bumble bees in each subpopulation (short and long-tongued) and mean and standard deviation of tongue length in each subpopulation of bumble bees at Pennsylvania Mountain Wilderness Area in the past and present.

COLUMN DETAILS:
REPLICATE - iteration from the resampling code (ranges from 1-1000)
lambda1 - proportion of individuals in the short-tongued subpopulation of bumble bees 
mu1 - mean tongue length of the individuals in the short-tongued subpopulation of bumble bees 
sigma1 - standard deviation of tongue length for individuals in the short-tongued subpopulation of bumble bees
lambda2 - proportion of individuals in the long-tongued subpopulation of bumble bees 
mu2 - mean tongue length of the individuals in the long-tongued subpopulation of bumble bees 
sigma2 - standard deviation of tongue length for individuals in the long-tongued subpopulation of bumble bees
TIME – the timeframe during which the bees were originally collected in the Front Range (Mt. Evans and Niwot Ridge combined) and Pennsylvania Mountain (1966-1969 and 1977-1980, respectively)

**** The following files are associated with flower tube depth density function parameter estimation 
9)  “Tube depth density function parameter estimation.r”
This is R script when run with the following two files [“Bumble bee visits - Front Range.csv”, ”Flower tube depth mean and standard deviation.csv”] will produce the parameter estimates for the uni-modal tongue length density function of 1000 simulated bumble bee visitation bouts. 
One example output from this R script (which was analyzed statistically for the above manuscript) is included in this set of datafiles [i.e., “Data from 'Tube depth density function parameter estimation'.csv”]

10) “Bumble bee visits - Front Range.csv”
This is the number of individuals of each bumble bee visiting each plant species as collected by Macior (1974) and Miller-Struttmann in the past (1966-1969) and present (2012-2014 visitation data from Mt. Evans Wilderness Area and Niwot Ridge Long Term Ecological Research combined as in Macior 1974. Used in “Tube depth density function parameter estimation.r”

11) ”Flower tube depth mean and standard deviation.csv”
Mean and standard deviation of flower tube depth for plant species visited by resident alpine bumble bees (Bombus balteatus and B. sylvicola). Plant species determined according to Webber and Wittmann 2012. Used in “Tube depth density function parameter estimation.r”

COLUMN DETAILS:
PLANT.SPECIES - plant species name 
MEAN - mean flower tube depth (mm)
STANDARD.DEVIATION - standard deviation of flower tube depth (mm).

12) “Data from 'Tube depth density function parameter estimation'.csv”
Sample output (used in the above manuscript) from the R script “Tube depth density function parameter estimation.r”. Provides the mean and standard deviation of flowers visited by bumble bees in the past (1966-1969) and present (2012-2014) in the Front Range (visitation data from Mt. Evans Wilderness Area and Niwot Ridge Long Term Ecological Research site combined as in Macior 1974).

COLUMN DETAILS:
REPLICATE - iteration from the resampling code (ranges from 1-1000)
mean - mean tube depth (mm) of flowers visited by resident alpine bumble bees during each of 1000 resampled visitation iterations
st.dev - standard deviation in tube depth (mm) of flowers visited by resident alpine bumble bees during each of 1000 resampled visitation iterations
variance - variance in tube depth (mm) of flowers visited by resident alpine bumble bees during each of 1000 resampled visitation iterations
TIME – the timeframe of the original visitation data used to simulate the tube depth density function

**** The following are datasets or R scripts used in the above manuscript
13) “Bumble bee foraging data – Lubinski.csv”
Foraging behavior of bumble bees (B. balteatus) followed while foraging in the field on Pennsylvania Mountain, CO. 

COLUMN DETAILS:
SEQUENCE - the order in which a given flower was visited by a bee
SPECIES FROM - the plant from which a bee departs
SPECIES TO -  the plant which the bee visits next
SWITCH - describes whether a bee chose to switch to a different plant species (1) or remained consistent (0) between SPECIES FROM and SPECIES TO visits
FLOWER DENSITY - density of flowers (flowers per m2) in the original foraging patch
FLIGHT DISTANCE - distance flown between SPECIES FROM and SPECIES TO (m)
FROM TUBE - tube depth (mm) of species the bee departs 
TO TUBE - tube depth (mm) of plant species the individual bee visits next

14) “Bumble bee morphology data.csv”
Morphological measurements of bumble bee specimens collected by various individuals at Mt. Evans Wilderness Area, Niwot Ridge Long Term Ecological Research site, and Pennsylvania Mountain.

COLUMN DETAILS:
GLOSSA LENGTH ANALYSIS - a bivariate operator indicating if a specimen was (1) or was not (0) used in the analyses of tongue length presenting in the above article
INTERTEGULAR SPACE ANALYSIS - a bivariate operator indicating if a specimen was (1) or was not (0) used in the analyses of intertegular space presenting in the above article
PLANT.SPECIES - the plant species on which the bee was visiting when collected

15) “Niwot change in vegetative cover.csv”
Proportional change in vegetative cover and flower depth for eleven historic bumble bee host plant species as measured on Niwot Ridge Long Term Ecological Research site (Johnson et al. 2011). Vegetative cover in each year (1971 and 2011) was summed across all plots, and proportional change in vegetative cover for each species was calculated as the difference between vegetative cover in 2011 and 1971 weighted by cover in 1971. 

16) “Penn flower density.csv”
Peak flower density (flowers per m2) for six plant species surveyed across five habitats [krummholz (KRUM); south and south-east facing slopes (SLOPE); wet tundra (SWALE), false summit (FSUMMIT); and true summit (SUMMIT)] on Pennsylvania Mountain in the past (1977-1980) and present (2012-2013).  

17) “Plant specimens with flower measurements.csv”
Flower tube depth measurements of plant specimens collected by various individuals collected at or with 15km of at Mt. Evans Wilderness Area, Niwot Ridge Long Term Ecological Research site.

18) “Bumble bee foraging model.r”
R script for a simple mathematical model modified from Essenberg 2012 to predict foraging efficiency of generalist and specialist bees given variation in flight speed, flower density, handling time, and the proportion of shallow vs. deep flowers in the community. The output of the model describes the relative advantage of being a generalist. The generalist is favored when its relative advantage is greater than 1. 


REFERENCES
P. A. Byron, On the ecology and systematics of Coloradan bumblebees. Ph. D. Thesis, University of Colorado, Boulder (1980).

C. J. Essenberg, Explaining variation in the effect of floral density on pollinator visitation. American Naturalist. 180, 153–166 (2012).

D. R. Johnson, D. Ebert-May, P. J. Webber, C. E. Tweedie, Forecasting alpine vegetation change using repeat sampling and a novel modeling approach. Ambio. 40, 693–704 (2011).

L. W. Macior. Pollination ecology of the front range of the Colorado Rocky Mountains. Melanderia. 15, 1–59 (1974).

W. A. Webber and R. C. Wittmann, Colorado Flora: Eastern Slope, Fourth Edition, A Field Guide to the Vascular Plants. University Press of Colorado, Boulder, CO (2012). 
