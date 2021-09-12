fly <- function(x,pop,land){
  move1 = matrix(NA,nsteps,2)
  move1[1,]=pop[x,]
  switch=NA
  for(i in 2:nsteps){
    switch[i] = rbinom(1,1,starts$move)
    neighbors = land[ifelse((move1[i-1,1])==1,1,(move1[i-1,1]-1)):ifelse((move1[i-1,1])==starts$land,starts$land,(move1[i-1,1]+1)),
                     ifelse((move1[i-1,2])==1,1,(move1[i-1,2]-1)):ifelse((move1[i-1,2])==starts$land,starts$land,(move1[i-1,2]+1))]
    shift = max(which(neighbors==max(neighbors)))
    move1[i,2] = if (switch[i] == 1) { ifelse(shift %in% c(1,2,3), move1[(i-1),2]-1,
                                              ifelse(shift %in% c(7,8,9), move1[(i-1),2]+1,
                                                     move1[(i-1),2]))
    } else move1[(i-1),2]+sample(c(1,0,-1),1)
    move1[i,1] = if (switch[i] == 1) { ifelse(shift %in% c(1,4,7), move1[(i-1),1]-1,
                                              ifelse(shift %in% c(3,6,9), move1[(i-1),1]+1,
                                                     move1[(i-1),1]))
    } else move1[(i-1),1]+sample(c(1,0,-1),1)
    
  }   
  return(move1/starts$land)
}