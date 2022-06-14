getwd()
setwd()

#Read NoLostTime dataset
DataNLT<-read.csv("NoLostTime.csv",stringsAsFactors = T, na.strings = "NA", col.names = c("Industry", "Year", "AgeRange", "Gender", "NLTClaims"))
str(DataNLT)
summary(DataNLT)

#Read AllowedLostTime dataset
DataALT<-read.csv("AllowedLostTime.csv",stringsAsFactors = T, na.strings = "NA", col.names = c("Industry", "Year", "AgeRange", "Gender", "ALTClaims"))
str(DataALT)
summary(DataALT)

#Read Fatalities dataset
DataFatalities<-read.csv("Fatalities.csv",stringsAsFactors = T, na.strings = "NA", col.names = c("Industry", "Year", "AgeRange", "Gender", "FatClaims"))
str(DataFatalities)
summary(DataFatalities)


#Combine the datasets
#?merge
df <- merge(DataALT, DataNLT,by=c("Industry", "Year", "AgeRange", "Gender") )
df<- merge(df, DataFatalities, by=c("Industry", "Year", "AgeRange", "Gender"))

str(df)
#Set the Year variable as a factor
df$Year<-as.factor(df$Year)

summary(df)


#Descriptive Stats
#Install the Hmisc package
install.packages("Hmisc")
library(Hmisc)

#remove NA values
df2<-na.omit(df)
describe(df2)

#proportion of claims lost by removing rows containing NAs
(sum(df$ALTClaims)-sum(df2$ALTClaims))/sum(df$ALTClaims)
(sum(df$NLTClaims)-sum(df2$NLTClaims))/sum(df$NLTClaims)
(sum(df$FATClaims)-sum(df2$FATClaims))/sum(df$FATClaims)
sum(df$FATClaims)-sum(df2$FATClaims)
sum(df$ALTClaims)-sum(df2$ALTClaims)
sum(df$NLTClaims)-sum(df2$NLTClaims)


#Distributions of numeric variables
hist(df2$NLTClaims, xlab = "Number of NLT Claims", main = "Frequency of No  Lost Time Claims")
hist(df2$ALTClaims, xlab = "Number of ALT Claims", main = "Frequency of Allowed Lost Time Claims")
hist(df2$FatClaims, xlab = "Number of FAT Claims", main = "Frequency of Fatality Claims")


#NLT, ALT and FAT claims by Age Range
plot(df2$AgeRange, df2$NLTClaims, main = "NLT Claims by Age Range", xlab = "Age Range", ylab = "Number of No Lost Time claims", col = rainbow(11, start = 0.5, end = 1))
plot(df2$AgeRange, df2$ALTClaims, main = "ALT Claims by Age Range",xlab = "Age Range", ylab = "Number of Allowed Lost Time claims", col = rainbow(11, start = 0, end = 0.5))
plot(df2$AgeRange, df2$FatClaims , main = "Fatality claims by Age Range", xlab = "Age Range", ylab = "Number of Fatality claims", col = rainbow(11, start = 0, end = 1))

install.packages("lattice")
library(lattice)

#NLTCLAIMS
#NLTClaims by age including all industries
xyplot(NLTClaims~AgeRange, data = df2, main = "NLTClaims by AgeRange - All Industries")

#NLTClaims by age by industry
xyplot(NLTClaims~AgeRange|Industry, data = df2, main = "NLTClaims vs. AgeRange - by Industry")

#NLTClaims by Age in Service Industry
xyplot(NLTClaims~AgeRange|Gender, data = df2[ which(df2$Industry =="Services"),], main = "NLTClaims by AgeRange in the Service Industry")   


#ATLCLAIMS
#ALTClaims by age including all industries
xyplot(ALTClaims~AgeRange, data = df2, main = "ALTClaims by AgeRange - All Industries")

#ALTClaims by age by industry
xyplot(ALTClaims~AgeRange|Industry, data = df2, main = "ALTClaims vs. AgeRange - by Industry")

#ALTClaims by AGe in Service Industry
xyplot(ALTClaims~AgeRange|Gender, data = df2[ which(df2$Industry =="Services"),], main = "ALTClaims by AgeRange in the Service Industry")  

#Service <-df2[ which(df2$Industry =="Services"),]

#OUTLIERS
outliers<-df2[which(df2$Industry=="Services" & df2$NLTClaims > 2500),]
outliers2<-df2[which(df2$Industry=="Services" & df2$NLTClaims > 1500 & df2$NLTClaims < 2500),]
summary(outliers2)

plot(outliers$AgeRange, outliers$NLTClaims)

plot(outliers2$AgeRange, outliers2$NLTClaims)

length(unique(df2$AgeRange))
  
#NLT, ALT and FAT claims by Industry
plot(df2$Industry, df2$NLTClaims, main = "NLT Claims by Industry", xlab = "Industry", ylab = "Number of No Lost Time claims", col = rainbow(17, start = 0.3, end = 0.6))
plot(df2$Industry, df2$ALTClaims, main = "ALT Claims by Industry",xlab = "Industry", ylab = "Number of Allowed Lost Time claims", col = rainbow(17, start = 0, end = 0.25))
plot(df2$Industry, df2$FatClaims , main = "Fatality claims by Industry", xlab = "Industry", ylab = "Number of Fatality claims", col = rainbow(17, start = 0.75, end = 1))


#Correlations
plot(df2$ALTClaims, df2$NLTClaims, main = "Relation of NLT and ALT Claims", xlab = "ALT Claims", ylab = "NLT claims", col = "blue")
cor(df2$ALTClaims,df2$NLTClaims, method = "spearman")

plot(df2$ALTClaims, df2$FATClaims, main = "Relation of FAT and ALT Claims", xlab = "ALT Claims", ylab = "FAT claims", col = "red")
cor(df2$ALTClaims,df2$FatClaims, method = "spearman")

plot(df2$NLTClaims, df2$FATClaims, main = "Relation of FAT and NLT Claims", xlab = "NLT Claims", ylab = "FAT claims", col = "orange")
cor(df2$NLTClaims,df2$FatClaims, method = "spearman")
  
