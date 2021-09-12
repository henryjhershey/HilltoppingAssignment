setwd("/Users/HenryHershey/Desktop/hilltopping/")
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))

#parameters
elevation = c(0, 400)           #peak elevation min and max
landscape = 150                 #number of patches on each side, total patch number = landscape*landscape

nindvs    = 50                  #number of individuals to simulate
nsteps    = 500                 #number of steps an individual can take
move      = 0.8                 #decimal likelihood of individual moving to highest neighbor patch (R&G call this q)
originwidth = 15                #width of a square patch on which to originate the population
starts=list(elevation=c(0, 400), landscape =150, nindvs=50, nsteps=500, move=0.8)

#run one simulation
pop= NewPop(starts$nindvs, starts$landscape, originwidth=15)
land= LandscapeInit(starts$elevation, starts$landscape)
movements <- lapply(1:nindvs,fly,pop=pop,
                    land=land)
#plot output of one iteration
plot(NULL,xlim=c(1,150),ylim=c(1,150))
image(land)
points(pop/150) #this scales the points to be overlaid on the landscape properly
lapply(movements,lines)


#run the model for a specified number of randomly generated populations on a single landscape
out <- run_model(starts,iter=5) 

#plot the landscape, and overlay tracks with low opacity. 
#  "corridors" appear as darkest blue on landscape.

#install.packages("scales")
pdf(paste(outdir,"corridors.pdf",sep=""))
image(out$land)
lapply(out$pop,points,pch=16)
points(out$movements,col=scales::alpha("blue",.1),pch=16)
dev.off()






