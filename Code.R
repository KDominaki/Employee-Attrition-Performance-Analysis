# Data set

hr_data <- read.csv("Employee-Attriction-Dataset.csv")


# Packages 

install.packages("ggplot2")
library(ggplot2)


# Basic data exploration

dim(hr_data)
str(hr_data)
summary(hr_data)
colSums(is.na(hr_data))


# Frequency of attrition

table(hr_data$Attrition)
prop.table(table(hr_data$Attrition))



# Plots 

#Gender/Attrition
ggplot(hr_data, aes(x=Attrition, fill=Gender)) + geom_bar()

#Overtime/Attrition
ggplot(hr_data, aes(x=Attrition, fill=OverTime)) + geom_bar()

#Age/Attrition
ggplot(hr_data, aes(x=Age, fill=Attrition)) + geom_histogram(bins=20, position="dodge")

#Salary/Attrition
ggplot(hr_data, aes(x=Attrition, y=MonthlyIncome, fill=Attrition)) + geom_boxplot()






