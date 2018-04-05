setwd("C:/Users/lwrctan/Desktop/Coursera/Month4Week1")
par(bg = "white")

# read table from working directory 

data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na = "?")

# subset dataset to two dates 1/2/2007 and 2/2/2007 for analysis

dates <- c("1/2/2007", "2/2/2007")
data2 <- subset(data1, Date %in% dates)

# plot histogram 1

hist(data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# save plot1 into PNG file

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

# end