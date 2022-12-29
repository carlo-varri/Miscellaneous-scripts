
# to help with the micro quiz... turned out I read the q wrong so this 
# was useless
quants <- c(100,80,20,10)

for (q in quants){
  R <- q * (100-q)
  C <- 60 * q
  print(paste("for q=", q, "profit =",R - C))
}
#deciding whethere to keep money in chase round_up, earning 5% interest on a 
#very small principle, or move to the savings account and make 2.7%, but adding 
#to a much larger principle 

round_up <- 46.46
savings <- 16099.44

round_up_total_1y = round_up *1.05
savings_total_1y = savings * 1.027
savings_plus_round_up_1y = (savings + round_up)* 1.027
interest_from_moving_to_savings = savings_plus_round_up_1y - savings_total_1y
interest_from_keeping_in_round_up = round_up_total_1y - round_up

#If I leave in round up, I'll be this much richer:
print(paste(interest_from_keeping_in_round_up, "richer next year due to interest"))

#if I move into savings now:
print(paste(interest_from_moving_to_savings, "richer next year due to interest"))

if (interest_from_moving_to_savings > interest_from_keeping_in_round_up){
  print("Move the money you fool!")
} else if ( interest_from_keeping_in_round_up == interest_from_moving_to_savings) {
  print("Doesn't make a difference")
} else {
  print ("keep it in there")
}

#an aside into playing with conditionals in a loop 
payoffs_1 <- c(1,2,3,5,6)
payoffs_2 <- c(6,7,2,5,2)

for (i in 1:length(payoffs_1)) {
  print(paste0("In year ", i, " option 1 yields £", payoffs_1[i],
               " and option 2 yields £", payoffs_2[i]))
  if(payoffs_1[i] > payoffs_2[i]){
    print(paste0("so put the money into option 1, and you'll make an additional £",
                 payoffs_1[i] - payoffs_2[i]))
  }
  else if (payoffs_1[i]< payoffs_2[i]){
    print(paste0("so put the money into option 2, and you'll make an additional £",
                 payoffs_2[i] - payoffs_1[i]))
  } else {
    print("The payoffs are the same, so invest in either this year")
  }
}


