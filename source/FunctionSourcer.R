#Set working directory, import packages, source functions, 
setwd(paste(directory,"/source/", sep = ''))    # set temp working directory 

#import packages
#library()

#source functions
source(paste(getwd(), "/LandscapeInit.R", sep = ''))
source(paste(getwd(), "/NewPop.R", sep = ''))
source(paste(getwd(), "/fly.R", sep = ''))
source(paste(getwd(), "/run_model.R", sep = ''))