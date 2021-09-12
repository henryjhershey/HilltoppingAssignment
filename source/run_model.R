run_model  = function(starts,iter){
  movements=list(NA)
  pop=list(NA)
  land = LandscapeInit(starts$elevation,starts$landscape)
  for(i in 1:iter){
      pop[[i]] = NewPop(starts$nindvs, starts$landscape, originwidth=15)
      movements[[i]] = Reduce(rbind,lapply(1:starts$nindvs,fly,land=land,pop=pop[[i]]))
    }
    return(list(movements = Reduce(rbind,movements),land=land,pop=lapply(pop,function(x)x/starts$land)))
}
