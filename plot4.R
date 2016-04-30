data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$Global_active_power[data$Global_active_power == "?"] <- NA
data$Global_reactive_power[data$Global_reactive_power == "?"] <- NA
data$Voltage[data$Voltage == "?"] <- NA
data$Global_intensity[data$Global_intensity == "?"] <- NA
data$Sub_metering_1[data$Sub_metering_1 == "?"] <- NA
data$Sub_metering_2[data$Sub_metering_2 == "?"] <- NA
data$Sub_metering_3[data$Sub_metering_3 == "?"] <- NA
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$Date_time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$Date_time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data$Date_time, data$Sub_metering_2, type="l", col="red")
points(data$Date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
plot(data$Date_time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()