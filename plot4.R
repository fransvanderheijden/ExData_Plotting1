# read data file into R
datafile<-read.csv("./data/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

library(lubridate)
library(dplyr)

# convert data field into data format
datafile$Date<-dmy(datafile$Date)

# selection of the dates
selection<-datafile[grep("^2007-02-01|^2007-02-02",datafile$Date),]


# select the data to plot
## plot 1
GAP<-selection$Global_active_power
## plot 2
metering_1<-selection$Sub_metering_1
metering_2<-selection$Sub_metering_2
metering_3<-selection$Sub_metering_3
## plot 3
voltage<-selection$Voltage
## plot 4
GRP<-selection$Global_reactive_power

# Print the plots to a png file
png(file= "./data/plot4.png", width = 480, height = 480)

## initialise the plotting format of a 2 by 2 plot 
par(mfcol=c(2,2))

## plot 1
plot(GAP, type= "l", xaxt="n", xlab="", ylab = "Global Active Power")
ticks<-c(1,length(GAP)/2, length(GAP))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))

## plot 2
plot(metering_1, type= "l", xaxt="n", xlab="", ylab = "Energy sub metering")
ticks<-c(1,length(metering_1)/2, length(metering_1))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))
lines(metering_2, col="red")
lines(metering_3, col="blue")
legend("topright", bty="n", lty=1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## plot 3
plot(voltage, type= "l", xaxt="n", xlab="datetime", ylab = "Voltage")
ticks<-c(1,length(voltage)/2, length(voltage))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))

## plot 4
plot(GRP, type= "l", xaxt="n", xlab="datetime", ylab = "Global_reactive_power")
ticks<-c(1,length(GRP)/2, length(GRP))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))

dev.off()