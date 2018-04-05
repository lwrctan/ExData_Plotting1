setwd("C:/Users/lwrctan/Desktop/Coursera/Month4Week1")
par(bg = "white")

# read table from working directory 

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")

# subset dataset to two dates 1/2/2007 and 2/2/2007 for analysis

dates <- c("1/2/2007", "2/2/2007")
data2 <- subset(data1, Date %in% dates)

# convert first two columns to date and time format

data2$Time <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")
data2$Date <- as.Date(data2$Date, "%d/%m/%Y")

# plot line chart (3)

plot(data2$Time, data2$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data2$Time, data2$Sub_metering_2, col = "red", type = "l")
lines(data2$Time, data2$Sub_metering_3, col = "blue", type = "l")

# add legend

legend("topright", col = c("red", "black", "blue"), c("Sub_metering1", "Sub_metering2", "Sub_metering3"), lty = 1)  

# save plot3 into PNG file

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

# end