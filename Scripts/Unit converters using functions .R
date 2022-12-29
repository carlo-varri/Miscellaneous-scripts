#converting from cm values to feet and inches 
cm_to_feet <- function(x){
  whole_feet <- floor(x/30.48)
  inches <- (x/30.48 - whole_feet)*12
  print(paste(format(whole_feet,digits = 1), "feet and",
              round(inches, digits =0), "inches"))
}
cm_to_feet(180)

#converting from lbs to kgs 
lbs_to_kgs <- function(x){
  print(paste(format(x*0.45359237, digits =4),"kgs"))
}
lbs_to_kgs(350)

#converting from stone to kgs 
stone_to_kgs <- function(x){
  print(paste(format(x*6.35029, digits =4),"kgs"))
}
stone_to_kgs(11.5)
