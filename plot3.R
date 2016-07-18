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
## Convert Global Active Power column from factor to numeric
powerconsump$Global_active_power <- as.numeric(as.character(powerconsump$Global_active_power))
class(powerconsump$Global_active_power)
## Convert Sub_metering 1 column from factor to numeric
powerconsump$Sub_metering_1 <- as.numeric(as.character(powerconsump$Sub_metering_1))
class(powerconsump$Sub_metering_1)
## Convert Sub_metering 2 column from factor to numeric
powerconsump$Sub_metering_2 <- as.numeric(as.character(powerconsump$Sub_metering_2))
class(powerconsump$Sub_metering_2)
## Convert Sub_metering 3 column from factor to numeric
powerconsump$Sub_metering_3 <- as.numeric(as.character(powerconsump$Sub_metering_3))
class(powerconsump$Sub_metering_3)

## Create Plot 3: Plot of Date vs each Sub_metering
powerconsump$datetime <- paste(powerconsump$Date, powerconsump$Time)

with(powerconsump, plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =""))
lines(strptime(powerconsump$datetime, "%d/%m/%Y %H:%M:%S"), powerconsump$Sub_metering_2, type = "l", col = "red")
lines(strptime(powerconsump$datetime, "%d/%m/%Y %H:%M:%S"), powerconsump$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png", width = 480, height = 480) ## Copy my plot3 to a PNG file
dev.off() # close the PNG device
