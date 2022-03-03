#Maria Williams
#March 3, 2022
#This code file is to generate a dataset suitable for use in our project

library(readxl)
library(tidyverse)
library(ggplot2)
library(gridExtra)
library(ggcorrplot)

#########################
#Step 1: COLLECT ALL DATA
#########################

#initiate paths to folders
folders <- list("C:/Users/maria/OneDrive/Documents/BioData/BME580Group/norm", "C:/Users/maria/OneDrive/Documents/BioData/BME580Group/sch")

#initiate a dataframe to store all the data
EEGdata <- data.frame()

#Run through each file and append to create one dataset
for (f in folders){
  #collect the list of files in the folder
  file_list <- list.files(path = f)
  
  for (t in file_list){
    #make full file path
    p <- file.path(f, t)
    #read in file as a one-column table
    hey <- read.delim(p, header=FALSE)
    #transpose to one row
    heythere <- as.data.frame(t(hey))
    #append to end of dataframe
    EEGdata <- rbind(EEGdata, heythere)
  }
}

#Result: dataset has 84 rows (subjects), with 122880 columns (7680 samples from 16 EEG channels).


#######################
#Step 2: RENAME COLUMNS
#######################

#channel names:
titles <- list("F7", "F3", "F4", "F8", "T3", "C3", "Cz", "C4", "T4", "T5", "P3", "Pz", "P4", "T6", "O1", "O2")
#counter to indicate column
counter=1

#rename columns
for (t in titles){
  for (i in 1:7680){
    names(EEGdata)[counter]<- paste(t, i, sep="_")
    counter <- counter+1
  }
}


#####################
#Step 3: ADD Y VALUES
#####################

#make a list of values that indicate control or diagnosed
d <-rep(c(0,1),times=c(39,45))

#add column to indicate control or nah
EEGdata$diagnosis <- d


###############
#Step 4: EXPORT
###############

#export file as csv - this is a massive file
#write.csv(EEGdata,"C:/Users/maria/OneDrive/Documents/BioData/BME580Group/EEGdataFull.csv", row.names = FALSE)

#export file as rda
saveRDS(EEGdata,"C:/Users/maria/OneDrive/Documents/BioData/BME580Group/EEGdataFull.Rda")