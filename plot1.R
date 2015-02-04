data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFiltered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

png("plot1.png", width = 501, height = 501)

#considered making the background to all these plots transparent like the examples, but since the examples
#are displayed on a white backgrounded page, I decided it was more prudent to have a white background
#par(bg = NA)
hist(dataFiltered$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "red")
dev.off()