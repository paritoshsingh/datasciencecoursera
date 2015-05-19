pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  listOfFiles<-list.files(directory)
  allReadingsDf<-data.frame()
  for(i in seq_along(listOfFiles)){
      allReadingsDf<-rbind(allReadingsDf,read.csv(listOfFiles[i]))
  }
  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  selectedReadings<-subset(allReadingsDf,ID %in% id,select=pollutant)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  mean(selectedReadings[,pollutant],na.rm=TRUE)
}