# read data file into R
datafile<-read.csv("./data/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

library(lubridate)
library(dplyr)

# convert data field into data format
datafile$Date<-dmy(datafile$Date)

# selection of the dates
selection<-datafile[grep("^2007-02-01|^2007-02-02",datafile$Date),]


# select the data 
metering_1<-selection$Sub_metering_1
metering_2<-selection$Sub_metering_2
metering_3<-selection$Sub_metering_3


# Print the plot to a png file
png(file= "./data/plot3.png", width = 480, height = 480)
plot(metering_1, type= "l", xaxt="n", xlab="", ylab = "Energy sub metering")
ticks<-c(1,length(metering_1)/2, length(metering_1))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))
lines(metering_2, col="red")
lines(metering_3, col="blue")
legend("topright", lty=1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()