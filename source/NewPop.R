NewPop = function(nindvs,landscape,originwidth){
  pop = matrix(nrow=starts$nindvs,ncol=2)
  xstart <- round(runif(1,1,starts$landscape-starts$originwidth))
  ystart <- round(runif(1,1,starts$landscape-starts$originwidth))
  pop[,1] = sample(xstart:(xstart+starts$originwidth),starts$nindvs,replace=T)
  pop[,2] = sample(ystart:(ystart+starts$originwidth),starts$nindvs,replace=T)
  return(pop)
}
