library(data.table)

data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

data.filter <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png")
hist(x = as.numeric(data.filter$Global_active_power), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col="red")

#dev.copy(png, file = "plot1.png")
dev.off()