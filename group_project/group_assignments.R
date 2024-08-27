
# Group assignments ---------------------------------------------
#
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# load roster
ent6707 <- read.table("group_project/class_roster.csv", sep=",", header=T)
head(ent6707)
nrow(ent6707) # five groups of 3-4 (hard to assign to a matrix...see below)
ent6707[20,"Student"] <- NA # five groups of four

# shuffle the class
set.seed(1223) # make random sampling reproducible 
class_shuffled <- sample(x=ent6707$Student, size=nrow(ent6707), replace=F)

# assign to groups
grps_fin <- data.frame(matrix(data=class_shuffled, nrow=4, ncol=5))
colnames(grps_fin) <- paste("Group",1:5, sep="_")
grps_fin
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



