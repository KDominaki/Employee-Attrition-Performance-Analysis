# Data set

hr_data <- read.csv("Employee-Attriction-Dataset.csv")


# Packages 


# Basic data exploration

dim(hr_data)
str(hr_data)
summary(hr_data)
colSums(is.na(hr_data))


# Frequency of attrition

table(hr_data$Attrition)
prop.table(table(hr_data$Attrition))