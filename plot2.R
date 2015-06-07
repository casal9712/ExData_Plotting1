##Set working directory, data is in the parent of the working directory
##setwd("C:\\Users\\m i n g\\Desktop\\Data Science Signature Track\\Exploratory Data Analysis\\Week 1\\Course Project 1")

##Load require package for handle date/time
library(sqldf)

##Read in data with specifc condition: date is either '1/2/2007' or '2/2/2007'
epwr <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep =";")

##read in date and time are in character, combine and convert to POSIXlt
datetime1<-paste(epwr$Date,epwr$Time)
datetime<-strptime(datetime1, "%d/%m/%Y %H:%M:%S")
epwr1<-cbind(epwr,datetime)

##Plot 2
png(file="plot2.png",width=480, height=480)
par(bg=NA)

plot(datetime,epwr1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=NA)

dev.off()