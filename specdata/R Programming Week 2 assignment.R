getwd()
setwd("/Users/MeghaPatel/Desktop/datasciencecoursera")
unzip("rprog%2Fdata%2Fspecdata.zip")
dir("specdata")
setwd("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata")

onefile <- read.csv("331.csv")
head(onefile)

pollutantmean <- function(directory, pollutant, id = 1:332){
     files <- list.files = directory, pattern = ".csv"
     values <- numeric() 
     
     for(i in id){
          data <- read.csv(files[i])
          values <- c(values, data[["pollutant"]]))
     }
     mean(values, na.rm = TRUE)
}

