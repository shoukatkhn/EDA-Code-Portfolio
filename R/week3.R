# Exploratory Data Analysis Checklist - Chapter 4
# Ozone data of United States for 2014 
# The elements(10) of the checklist are

# 1. Formulate your question
print("which are the top 3 states in United States that have the highest levels of Ozone pollution?")

# 2. Read in your data
#readr used to read flat files faster than R builtin functions
library(readr)

#data is downloaded from https://aqs.epa.gov/aqsweb/airdata/download_files.html#Raw
oz <- read.csv("data/hourly_44201_2019.csv") 

#rename columns to remove any spaces
names(oz) <- make.names(names(oz))

# 3. Check the packaging
# To understand what we are working on its better to have a data distribution stats to have a better knowledge.
print("count of Ozone data is")
nrow(oz)
print("Columns in Ozone data is")
ncol(oz)

# 4. Run Str()
# Running different commands to collect stats can be time consuming and easily avoided by using Str
str(oz)

# 5. Look at the top and bottom of your data
# return top 6 rows of dataset
head(oz)

#returns bottom 6 rows of dataset
tail(oz)

# 6. Check your n's
# Checking landmarks (hourly attribute) to ensure that we are dealing with correct amount of data
table(oz$Time.Local) # data is properly distributed by hours of day

# Another landmark is to check states
library(tidyverse)
select(oz, State.Name) %>% unique %>% nrow

# There are 50 states and only 47 are present, we can check which of them are missing
unique(oz$State.Name)

# 7. Validate with atleast one external data source
# Hourly measurements of Ozone
summary(oz)

# Distribution by deciles of data
quantile(oz$Sample.Measurement, seq(0,1,0.1))

# 8. Try the easy solution first 
# To identify the top 3 states with highest level of ozone population we will use state name
top3 <- group_by(oz, State.Name) %>%
  summarize(ozone = mean(Sample.Measurement)) %>%
  as.data.frame %>%
  arrange(desc(ozone))

# The top3 states in United States with highest ozone pollution are
head(top3, 3)

# The states with least ozone population in United States are
tail(top3, 3)

# Lets check how many observation we have for the least polluted state and highest polluted state
filter(oz, State.Name == "Wyoming") %>% nrow
filter(oz, State.Name == "Missouri") %>% nrow

#Certainly, Wyoming has more observation than Missouri to state that Wyoming is have higher levels of Ozone.
#We can also find out for Wyoming and missouri by monthly averages

oz <- mutate(oz, Date.Local=as.Date(Date.Local))

filter(oz, State.Name == "Wyoming") %>%
  mutate(month=factor(months(Date.Local), levels = month.name)) %>%
  group_by(month) %>%
  summarize(ozone= mean(Sample.Measurement))

#wyoming has only 3 months of data for 2019
filter(oz, State.Name == "Missouri") %>%
  mutate(month=factor(months(Date.Local), levels =  month.name)) %>%
  group_by(month) %>%
  summarize(ozone = mean(Sample.Measurement))

# 9 Challenge your solution
# In above checkpoint we observe that data differs by month for different states and not all the states have 
# same number of observations

# This is not an ideal solution but we can shuffle the data to recheck the highest and lowest ozone polluting states in US
set.seed(10234)
cnt <- nrow(oz)
samOz <- sample(cnt, cnt, replace = TRUE)
oz2 <- oz[samOz, ]

shuffleTop3 <- group_by(oz2, State.Name) %>%
  summarize(ozone = mean(Sample.Measurement)) %>%
  as.data.frame %>%
  arrange(desc(ozone))

cbind(head(top3, 3), head(shuffleTop3, 3))

cbind(tail(top3, 3), tail(shuffleTop3, 3))
  
# States remained the same after dataset shuffle

# 10. Follow up questions
# We try to cover some of the basic questions to explore dataset and find out what we are working on
# But there can be other questions that can be answered for example
# Whether the ratings were too low to be caputred?
# Does seasons in a year might have tamper the ratings?
