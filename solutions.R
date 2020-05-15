getwd()
setwd("D:/R/Project/getting and cleaning data1")
##1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "./housing.csv")
file <- read.csv("./housing.csv")
sum(file$VAL >= 24,na.rm=TRUE)


##2
file$FES


##3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile = "./gas.xlsx")
##Use mode= "wd" if some error occurs
library(openxlsx)
file2 <- read.xlsx("./gas.xlsx")
rown <- 18:23
coln <- 7:15
dat <- read.xlsx("./gas.xlsx",rows=rown,cols=coln)
sum(dat$Zip*dat$Ext,na.rm=T)


##4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",destfile="./rest.xml")
library(XML)
file3 <- xmlTreeParse("./rest.xml",useInternal = TRUE )
root <- xmlRoot(file3)
xmlName(root)
sum(xpathSApply(root,"//zipcode",xmlValue)==21231)

##5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile = "./ldaho.csv")
file4 <- read.csv("ldaho.csv")
library(data.table)
DT <- fread("./ldaho.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
