rm(list=ls())
#install.packages(tidystringdist)
library(readr)
library(tidystringdist)
#> Warning: package 'tidystringdist' was built under R version 3.5.1
library(readr)
library(stringdist)
adre = read.delim("Desktop/adre.csv", header = TRUE,sep=",")
dict <- list(N = "North",
             S = "South",
             E = "East",
             W= "West",
             St = "Street",
             Ct = "Court",
             Rd = "Road",
             Dr = "Drive",
             Ln = "Lane",
             Pl = "Place",
             Ste = "#",
             Apt = "#",
             Ave = "Avenue",
             Bl = "Blvd",
             Fl = "Floor",
             Flr = "Floor")

for(i in 1:length(dict)){
  adre$Street.Address <- gsub(paste0("\\b", names(dict)[i], "\\b"), dict[[i]], adre$Street.Address)
}
for(i in 1:length(dict)){
  adre$address1 <- gsub(paste0("\\b", names(dict)[i], "\\b"), dict[[i]], adre$address1)
}

adre$address1 = gsub("#", "A", adre$address1)
adre$Street.Address = gsub("#", "A", adre$Street.Address)
adre$address1 = gsub("Street", "St", adre$address1)
adre$Street.Address = gsub("Street", "St", adre$Street.Address)
adre$address1 = gsub("[^0-9A-Za-z///' ]", "", adre$address1)
adre$Street.Address= gsub("[^0-9A-Za-z///' ]", "", adre$Street.Address)

adre$value = 0
adre$closest = NaN

for(i in 1:719){ 
  ##make sure you start from 1 to size of list 
  ##or break it into chuncks and run repeately
  val=0
  outie =NaN
  for(k in adre$Street.Address){
    if(val < stringsim(adre$address1[i],k)){
      val = stringsim(adre$address1[i],k)
      outie = k
    }
  }
  adre$value[i] = val
  adre$closest[i] = outie
}

write.csv(adre, file = 'halfway-cleaned.csv')