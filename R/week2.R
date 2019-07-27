#The WOrking Directory
getwd()

#change the working directory
setwd(dir = "C:/Users/shoukhan/Documents/Summer Semester/EDA")

#create a object in this file
obj <- data.frame(rollno=1:3, age=c(8,9,8) ,sex = c("male","female","male"))

#print list of objects in R directory
ls()

#saving objects in Rdata
save(obj, file = "data/week2.RData")

#save the image in project
save.image(file = "data/week2_image.RData")

#lading the object from saved file
load(file = "week2.RData")

#removing the saved objects
rm(list=ls())

#creating a new file from R object
write.table(x = obj,
              file = "week2_textFile.txt",
            sep = "\t")

#reading files
myData <- read.table(file = 'week2_textFile.txt',
           sep = '\t',
           header = TRUE,
           stringsAsFactors = FALSE)

#reading file from URL
fromWeb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)

#foriegn package for non-text files in R
install.packages("foreign")

#reading xlsx file in R
install.packages("xlsx")

