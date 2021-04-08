letters <- read.csv('letter-recognition.csv')
str(letters)

letters$letter <- as.factor(letters$letter)

train <- letters[1:16000,]
test <- letters[16000:20000,]
 
library(kernlab)

letter_classifier <- ksvm(letter ~ ., data = train, kernel = 'vanilladot')

letter_classifier
letter_predictions <- predict(letter_classifier, test)
head(letter_predictions)
table(letter_predictions, test$letter)

agreement <- letter_predictions == test$letter

prop.table(table(agreement))



letter_classifier_rbf <- ksvm(letter ~ ., data = train, kernel = 'rbfdot')

letter_classifier
letter_predictions_rbf <- predict(letter_classifier_rbf, test)
table(letter_predictions_rbf, test$letter)
agreement <- letter_predictions_rbf == test$letter
prop.table(table(agreement))
