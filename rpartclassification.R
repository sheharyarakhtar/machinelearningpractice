wine <- read.csv('whitewines.csv', stringsAsFactors = T)

str(wine)
head(wine)

hist(wine$quality)
summary(wine)

##divide the data into test and training sets
wine_train <- wine[1:3750,]
wine_test <- wine[3751:4898,]

library(rpart)
m.rpart <- rpart(quality ~ ., data = wine_train)
m.rpart
summary(m.rpart)

library(rpart.plot)

rpart.plot(m.rpart, digits = 3, fallen.leaves = F, type = 5, extra = 1)

p.rpart <- predict(m.rpart, wine_test)
summary(p.rpart)

cor(p.rpart, wine_test$quality)
