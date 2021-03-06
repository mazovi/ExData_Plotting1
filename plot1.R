data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$Global_active_power[data$Global_active_power == "?"] <- NA
data$Global_active_power <- as.numeric(data$Global_active_power)

png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()