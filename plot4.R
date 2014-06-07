library(data.table)

data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

data.filter <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
date <- strptime(as.Date(data.filter$Date, "%d/%m/%Y"), "%Y-%m-%d")
datetime <- as.POSIXlt(paste(date, data.filter$Time, sep=" "))

png(file = "plot4.png")

par(mfrow = c(2, 2))

plot(datetime, data.filter$Global_active_power, 
     xlab="",
     ylab="Global Active Power",
     type="l")

plot(datetime, data.filter$Voltage, 
     ylab="Voltage",
     type="l")

plot(datetime, data.filter$Sub_metering_1, 
     xlab="",
     ylab="Energy sub metering",
     type="l")
points(datetime, data.filter$Sub_metering_2, col="red", type="l")
points(datetime, data.filter$Sub_metering_3, col="blue", type="l")
legend("topright", 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),   
       lwd=c(1, 1, 1),
       bty = "n")

plot(datetime, data.filter$Global_reactive_power,
     ylab="Global_reactive_power",
     type="l")

#dev.copy(png, file = "plot4.png")
dev.off()