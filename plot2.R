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


## Create Plot 2: Plot of Date vs Global Active Power
powerconsump$datetime <- paste(powerconsump$Date, powerconsump$Time)

with(powerconsump, plot(strptime(datetime, "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab =""))

dev.copy(png, file = "plot2.png", width = 480, height = 480) ## Copy my plot2 to a PNG file
dev.off() # close the PNG device
