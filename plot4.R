data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFiltered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dataFiltered$DateTime <- paste(dataFiltered$Date, dataFiltered$Time, sep=":")
dataFiltered$DateTime <- strptime(dataFiltered$DateTime, format="%Y-%m-%d:%H:%M:%S")

png("plot4.png", width = 501, height = 501)
par(mfrow=c(2,2))

plot(dataFiltered$DateTime,dataFiltered$Global_active_power, main = "", xlab = "", ylab = "Global Active Power", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Global_active_power)

plot(dataFiltered$DateTime,dataFiltered$Voltage, main = "", xlab = "datetime", ylab = "Voltage", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Voltage)

plot(dataFiltered$DateTime,dataFiltered$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_1, col = "black")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_2, col = "red")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

plot(dataFiltered$DateTime,dataFiltered$Global_reactive_power, main = "", xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Global_reactive_power)

dev.off()
