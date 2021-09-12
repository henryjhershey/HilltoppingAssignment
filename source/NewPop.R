NewPop = function(nindvs,landscape,originwidth){
  pop = matrix(nrow=nindvs,ncol=2)
  xstart <- round(runif(1,1,landscape-originwidth))
  ystart <- round(runif(1,1,landscape-originwidth))
  pop[,1] = sample(xstart:(xstart+originwidth),nindvs,replace=T)
  pop[,2] = sample(ystart:(ystart+originwidth),nindvs,replace=T)
  return(pop)
}
