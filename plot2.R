library(data.table)

data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

data.filter <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
date <- strptime(as.Date(data.filter$Date, "%d/%m/%Y"), "%Y-%m-%d")
datetime <- as.POSIXlt(paste(date, data.filter$Time, sep=" "))

png(file = "plot2.png")
plot(datetime, data.filter$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     main="")

#dev.copy(png, file = "plot2.png")
dev.off()