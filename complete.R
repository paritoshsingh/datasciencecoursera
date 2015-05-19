complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  listOfFiles<-list.files(directory)
  allReadingsDf<-data.frame()
  for(i in seq_along(listOfFiles)){
    allReadingsDf<-rbind(allReadingsDf,read.csv(listOfFiles[i]))
  }
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  selectedReadings<-subset(def,ID %in% id & !is.na(def$sulfate) & !is.na(def$nitrate),select=ID)
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  adf<-as.data.frame(table(selectedReadings))
  names(adf)<-c("ID", "nobs")
  adf
}