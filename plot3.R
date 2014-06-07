library(data.table)

data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

data.filter <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
date <- strptime(as.Date(data.filter$Date, "%d/%m/%Y"), "%Y-%m-%d")
datetime <- as.POSIXlt(paste(date, data.filter$Time, sep=" "))

png(file = "plot3.png")

plot(datetime,  
     data.filter$Sub_metering_1, 
     main="",
     xlab="",
     ylab="Energy sub metering",
     type="l")
points(datetime, data.filter$Sub_metering_2, col="red", type="l")
points(datetime, data.filter$Sub_metering_3, col="blue", type="l")

legend("topright", 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),   
       lwd=c(1, 1, 1))

#dev.copy(png, file = "plot3.png")
dev.off()