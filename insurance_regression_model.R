insurance <- read.csv('insurance.csv', stringsAsFactors = T)
str(insurance)

summary(insurance$charges)
#Histogram to visualise the dsitribution of ccst
hist(insurance$charges, xlab = 'Charges $')

##Corelation between the independent variables
cor(insurance[c('age','bmi','children','charges')])

install.packages('psych')

library(psych)
pairs(insurance[c('age','bmi','children','charges')])

#Oval shape is the corelation ellipse. The more stretched out
#the greater the correlation
#the ref line indicates the order of the regression line
#age and charges has a polynomial relation as seen
pairs.panels(insurance[c('age','bmi','children','charges')])

library(stats)
#m <- lm(dv ~ iv, data = mydata)
##dv =  dependent variabe, iv = independent variable, data is the dataframe 
##where the variablea are presnet

ins_model <- lm(charges ~ ., data = insurance)
ins_model

#R squared values tells reliability of the regression
#stars tell how significant the relation is
#residuals show how much error is in the prediction
summary(ins_model)

#since age and charges are not normally related,
#we add another parameter to account for the polynmial
#regression model

insurance$age2 <- insurance$age^2
str(insurance)
ins_model2 <- lm(charges ~ ., data = insurance)
ins_model2
#R squared value has increased 
summary(ins_model2)

##Tranformation - converting a numeric variable ti
#a binary indicator

#suppose bmi only becomes relevant once it crosses the threshold into obesity
#so we turn it into a categorical variable with 2 levels
#1 for 30+ and 0 otherwise
insurance$bmi30 <- ifelse(insurance$bmi > 30, 1, 0)
pairs.panels(insurance[c('age','bmi','children','charges', 'bmi30')])
#BMI has now become highly relevant due to as noted by the corr factor

#some variables have an added effect known as interaction
#Being a smoker AND having a BMI>30 will yield a greater expence
ins_model2 <- lm(charges ~ . + bmi30*smoker, data = insurance)
summary(ins_model2)


#we train the whole new model now based on all these corrections

ins_model2 <- lm(charges ~ . + bmi30*smoker, data = insurance)
summary(ins_model2)

#Rsquared increased by 10% and more features in the model are now 
#highly significant. Also, the residuals now are much less than they
#in the earlier model, and they mostly overestimate, so the corp
#doesnt lose money