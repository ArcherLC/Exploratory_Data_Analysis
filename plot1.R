getwd()
## Set working directory
setwd("/Users/ArcherJime/Downloads/Archer Folder")

## Check files in active working directory
list.files()

## Load Power Energy Consumption table
powerconsump <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
names(powerconsump)
head(powerconsump)
## Subset the Power Energy Consumption dataset for only data with 1/2/2007 or 2/2/2007 dates
powerconsump <- subset(powerconsump, Date == "1/2/2007" | Date == "2/2/2007")
## Convert Date column from factor to date format
powerconsump$Date <- as.Date(as.character(powerconsump$Date), format = "%d/%m/%y")
class(powerconsump$Date)
## Convert Time column from factor to Time format
powerconsump$Time <- strptime(as.character(powerconsump$Time), format = "%H:%M:%S")
class(powerconsump$Time)
## Convert Global Active Power column from factor to numeric
powerconsump$Global_active_power <- as.numeric(as.character(powerconsump$Global_active_power))
class(powerconsump$Global_active_power)

## Create Plot 1: Histogram of Global Active Power (kilowatts)
hist(powerconsump$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png") ## Copy my plot1 to a PNG file
png(filename="plot1.png1", width = 480, height = 480)
dev.off() # close the PNG device
