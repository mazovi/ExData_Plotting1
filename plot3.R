data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$Sub_metering_1[data$Sub_metering_1 == "?"] <- NA
data$Sub_metering_2[data$Sub_metering_2 == "?"] <- NA
data$Sub_metering_3[data$Sub_metering_3 == "?"] <- NA
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


png(filename="plot3.png", width=480, height=480)
plot(data$Date_time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data$Date_time, data$Sub_metering_2, type="l", col="red")
points(data$Date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()