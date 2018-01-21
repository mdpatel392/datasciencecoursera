getwd()
setwd("/Users/MeghaPatel/Desktop/datasciencecoursera")
unzip("rprog%2Fdata%2Fspecdata.zip")
dir("specdata")
specdata <- setwd("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata")

onefile <- read.csv("331.csv")
head(onefile)

pollutantmean <- function(directory, pollutant, id = 1:332){
     files <- list.files(path = directory,  pattern = ".csv", full.names=TRUE)
     values <- numeric() 
     
     for(i in id){
          data <- read.csv(files[i])
          values <- c(values, data[[pollutant]])
     }
     mean(values, na.rm = TRUE)
}


pollutantmean("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata/", "sulfate")
pollutantmean("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata/", "nitrate", 70:72)
