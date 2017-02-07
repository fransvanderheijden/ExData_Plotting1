# read data file into R
datafile<-read.csv("./data/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?")

library(lubridate)

# convert data field into data format
datafile$Date<-dmy(datafile$Date)

# selection of the dates
selection<-datafile[grep("^2007-02-01|^2007-02-02",datafile$Date),]

# print the histogram to the screen device
GAP<-selection$Global_active_power
hist(GAP, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col = "red")

# Print the histogram to a png file
png(file= "./data/plot1.png", width = 480, height = 480)
hist(GAP, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col = "red")
dev.off()