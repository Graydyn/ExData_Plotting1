data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFiltered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dataFiltered$DateTime <- paste(dataFiltered$Date, dataFiltered$Time, sep=":")
dataFiltered$DateTime <- strptime(dataFiltered$DateTime, format="%Y-%m-%d:%H:%M:%S")

png("plot2.png", width = 501, height = 501)

plot(dataFiltered$DateTime,dataFiltered$Global_active_power, main = "", xlab = "", ylab = "Global Active Power (kilowats)", type = "n")
lines(dataFiltered$DateTime, dataFiltered$Global_active_power)
dev.off()
