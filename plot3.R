data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFiltered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dataFiltered$DateTime <- paste(dataFiltered$Date, dataFiltered$Time, sep=":")
dataFiltered$DateTime <- strptime(dataFiltered$DateTime, format="%Y-%m-%d:%H:%M:%S")

png("plot3.png", width = 501, height = 501)

plot(dataFiltered$DateTime,dataFiltered$Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_1, col = "black")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_2, col = "red")
lines(dataFiltered$DateTime, dataFiltered$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()
