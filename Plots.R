# Plots 

# Exploratory Plots ----

## Gender/Attrition ====
ggplot(hr_data, aes(x=Attrition, fill=Gender)) + geom_bar()

## Overtime/Attrition ====
ggplot(hr_data, aes(x=Attrition, fill=OverTime)) + geom_bar()

## Age/Attrition ====
ggplot(hr_data, aes(x=Age, fill=Attrition)) + geom_histogram(bins=20, position="dodge")

## Salary/Attrition ====
ggplot(hr_data, aes(x=Attrition, y=MonthlyIncome, fill=Attrition)) + geom_boxplot()
