# Read in table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2881, na.strings="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Initialize graphics device
png(filename="plot4.png", width=480, height=480)

# Combine date/time columns & format correctly
dates <- paste(data[, "Date"], data[, "Time"])
dates <- strptime(dates, format="%d/%m/%Y %T", usetz=FALSE)
dates <- as.POSIXlt(dates, format="%d/%m/%Y %T")

# Generate line plots (2x2)
par(mfrow=c(2, 2))

plot(dates, data[, "Global_active_power"], xlab="", ylab="Global Active Power", type="l")

plot(dates, data[, "Voltage"], xlab="datetime", ylab="Voltage", type="l")

plot(dates, data[, "Sub_metering_1"], xlab="", ylab="Energy sub metering", type="l", col="black")
lines(dates, data[, "Sub_metering_2"], type="l", col="red")
lines(dates, data[, "Sub_metering_3"], type="l", col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(dates, data[, "Global_reactive_power"], xlab="datetime", ylab="Global_reactive_power", type="l")

# Close graphics device
dev.off()