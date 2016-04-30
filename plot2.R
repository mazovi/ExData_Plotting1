data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$Global_active_power[data$Global_active_power == "?"] <- NA
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()