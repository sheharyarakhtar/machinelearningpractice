launch <- read.csv('challenger.csv')
head(launch)
str(launch)

b <- cov(launch$temperature, launch$distress_ct)/var(launch$temperature)
a <- mean(launch$distress_ct) - b*mean(launch$temperature)

library(ggplot2)

ggplot(launch, aes(x =temperature, y= distress_ct))+ geom_point()+
  geom_abline(intercept = 4.30158730, slope = -0.05746032)
r <- cov(launch$distress_ct,launch$temperature)/(sd(launch$distress_ct)*sd(launch$temperature))
r

##OR

r <- cor(launch$distress_ct, launch$temperature)


reg <- function(y,x){
  x <- as.matrix(x)
  x <- cbind(Intercept = 1, x)
  solve(t(x) %*% x) %*% t(x) %*% y
}

str(launch)

a <- reg(y = launch$distress_ct, x= launch[3])
a <- reg(y = launch$distress_ct, x= launch[3:5])
a
