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

##Plot 3
png(file="plot3.png",width=480, height=480)
par(bg=NA)

plot(datetime,epwr1$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=NA)
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
points(datetime, epwr1$Sub_metering_1, type="l", col="black")
points(datetime, epwr1$Sub_metering_2, type="l", col="red")
points(datetime, epwr1$Sub_metering_3, type="l", col="blue")

dev.off()