getwd()
setwd("/Users/MeghaPatel/Desktop/datasciencecoursera")
unzip("rprog%2Fdata%2Fspecdata.zip")
dir("specdata")
specdata <- setwd("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata")

onefile <- read.csv("331.csv")
head(onefile)


##part one 

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


##part two

complete <- function(directory, id = 1:332){
     files <- list.files(path=directory, pattern=".csv", full.names=FALSE)
     values <- numeric()
     
     for(i in id){
          data <- read.csv(files[i])
          nobs <- sum(complete.cases(data))
          tmp <- data.frame(i,nobs)
          values <- rbind(values,tmp)
     }
     colnames(values) <- c("id", "nobs")
     values
}


complete("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata/", 30:25)


##part three

corr <- function(directory, threshold=0){
     files <- list.files(path=directory, pattern=".csv", full.names=FALSE)
     values <- numeric()
     
     for(i in 1:length(files)){
          data <- read.csv(files[i])
          csum <- sum((!is.na(data$sulfate)) & (!is.na(data$nitrate)))
          if(csum > threshold) {
               tmp <- data[which(!is.na(data$sulfate)), ]
               tmp2 <- tmp[which(!is.na(tmp$nitrate)), ]
               values <- c(values, cor(tmp2$sulfate, tmp2$nitrate))
               
          }
 }
     values
}


head(corr("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata/", 400))

head(corr("/Users/MeghaPatel/Desktop/datasciencecoursera/specdata/", 400))

