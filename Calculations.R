# Data set ----

hr_data <- read.csv("Employee-Attriction-Dataset.csv")


# Basic data exploration ----

dim(hr_data)
str(hr_data)
summary(hr_data)
colSums(is.na(hr_data))


# Frequency of attrition ----

table(hr_data$Attrition)
prop.table(table(hr_data$Attrition))


# Data Preparation for Regression ----

## New columns ====

hr_data$Career_Progress <- round((hr_data$YearsInCurrentRole/hr_data$YearsAtCompany), digits=2)
#--- Refactor for NaN and inf

#-- ToDo -> tenure group

## Categorical -> factor ====
hr_data <- hr_data %>%
  mutate(across(c(Attrition, OverTime, BusinessTravel, Gender, Department, MaritalStatus), factor))


## Remove unnecessary columns ====
hr_data$EmployeeCount <- NULL
hr_data$EmployeeNumber <- NULL


# Predictive ----

set.seed(123)
trainIndex <- createDataPartition(hr_data$Attrition, p=0.7, list=FALSE)
train <- hr_data[trainIndex, ]
test <- hr_data[-trainIndex, ]


model <- glm(Attrition ~ Age + MonthlyIncome + OverTime + JobRole + YearsAtCompany,
             data=train, family="binomial")
summary(model)


predictions <- predict(model, test, type="response")
predicted_class <- ifelse(predictions > 0.5, "Yes", "No")
confusionMatrix(as.factor(predicted_class), test$Attrition)





