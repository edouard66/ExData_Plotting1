##Coursera Project : 
##Plotting the Individual household electric power consumption Data Set 

## First, let's download and sort the dataset

library(lubridate)

if(!dir.exists("./Ex Data Plotting1")) {dir.create("./Ex Data Plotting1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
print("Initiating download")
download.file(fileUrl, destfile = "./Ex Data Plotting1.zip", method ="curl")
print("Download succeeded")
unzip("./Ex Data Plotting1.zip")
print("Data unzipped")

energy <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";")

## We change the classes of the variables using the following commands :
energy$Date <- dmy(as.character(energy$Date))
energy$Time <- hms(as.character(energy$Time))
energy$Global_active_power <- as.numeric(as.character(energy$Global_active_power))
energy$Global_reactive_power <- as.numeric(as.character(energy$Global_reactive_power))
energy$Sub_metering_1 <- as.numeric(as.character(energy$Sub_metering_1))
energy$Sub_metering_2 <- as.numeric(as.character(energy$Sub_metering_2))
energy$Sub_metering_3 <- as.numeric(as.character(energy$Sub_metering_3))
energy$Voltage <- as.numeric(as.character(energy$Voltage))

## Let's subset the two days that we want to analyze
energy <- subset(energy, energy$Date >= "2007-02-01" & energy$Date < "2007-02-03")

## We add a column datetime to merge Date and Time
datetime <- energy$Date + energy$Time
energy <- cbind(energy, datetime)

## 2nd step : let's create our plot
hist(energy$Global_active_power, main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)")

## print to png
dev.copy(png, file = "plot1.png")
dev.off()