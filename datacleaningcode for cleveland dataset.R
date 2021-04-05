library(rpart)
d <- read.table('processed.cleveland.data', sep = ',')
head(d)
summary(d)

V2,v3,v6,v7,v9,v12, v13
d$V14 <- NULL
d$V2 <- as.factor(d$V2)
d$V3 <- as.factor(d$V3)
d$V6 <- as.factor(d$V6)
d$V7 <- as.factor(d$V7)
d$V9 <- as.factor(d$V9)
d$V12 <- as.factor(d$V12)
d$V13 <- as.factor(d$V13)

table(d$V13)
d$V12 <- as.numeric(as.character(d$V12))
d$V12 <- d$V12[!is.na(d$V13)]

d$V13 <- as.numeric(as.character(d$V13))
d$V13 <- d$V13[!is.na(d$V13)]

names(d) <- c('age', 'sex', 'type.douleur', 'pression','cholestrol', 'sucre','electro' ,'taux.max',
              'engine','depression','pic','vaisseau','coeur')

head(d)
str(d)
d$depression <- d$depression*10
table(d$depression)
as.factor(d$depression)
d$vaisseau <- as.factor(d$vaisseau)
table(d$coeur)
d$coeur <- as.factor(d$coeur)
a <- d$coeur
a <- replace(a, a==6, 7)
d$coeur <- a
rm(a)
table(d$sex)
levels(d$sex) <- c('female','male')

table(d$type.douleur)
levels(d$type.douleur) <- c('A','B','C','D')

table(d$sucre)
levels(d$sucre) <- c('A','B')

table(d$engine)
levels(d$engine) <- c('non', 'oui')

table(d$vaisseau)
levels(d$vaisseau) <- c('A','B','C','D')

table(d$coeur)
levels(d$coeur) <- c('absense','presence')

table(d$electro)
levels(d$electro) <- c('A','B','C')
str(d)


summary(d)

write.csv(d,"C:\\Users\\sheharyar.akhtar\\Desktop\\RML\\cleandataset.csv", row.names = FALSE)
