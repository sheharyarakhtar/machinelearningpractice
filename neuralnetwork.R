concrete <- read.csv('concrete.csv')

head(concrete)
str(concrete)
names(concrete) <- c('cement','slag','ash','water','superplastic',
                     'coarseagg','fineagg','age','strength')

normalize <- function(x){
  return ((x - min(x))/(max(x)-min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))
summary(concrete_norm)

train <- concrete_norm[1:773,]
test <- concrete_norm[774:1030,]

library(neuralnet)
concrete_model <- neuralnet(strength ~ cement + slag + 
                              ash + water + superplastic + 
                              coarseagg + fineagg + age, data = train)
plot(concrete_model)


model_result <- compute(concrete_model, test[1:8])
predicted_strength <- model_result$net.result

cor(predicted_strength, test$strength)

#Try model training with 5 hidden nodes

start.time <- Sys.time()
concrete_model2 <- neuralnet(strength ~ cement + slag +
                               ash + water + superplastic +
                               coarseagg + fineagg + age,
                             data = train,
                             startweights = runif(8),
                             hidden = 5)
total.time <- Sys.time() - start.time
total.time

plot(concrete_model2)


model_result2 <- compute(concrete_model2, test[1:8])
predicted_strength2 <- model_result2$net.result
cor(predicted_strength2, test$strength)

