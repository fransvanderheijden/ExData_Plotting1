# read data file into R
datafile<-read.csv("./data/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

library(lubridate)
library(dplyr)

# convert data field into data format
datafile$Date<-dmy(datafile$Date)

# selection of the dates
selection<-datafile[grep("^2007-02-01|^2007-02-02",datafile$Date),]

# plot the graph to the screen device
GAP<-selection$Global_active_power

plot(GAP, type= "l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
ticks<-c(1,length(GAP)/2, length(GAP))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))

# Print the plot to a png file
png(file= "./data/plot2.png", width = 480, height = 480)
plot(GAP, type= "l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
ticks<-c(1,length(GAP)/2, length(GAP))
axis(1, at=ticks, labels = c("Thu", "Fri", "Sat"))
dev.off()