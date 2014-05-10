# Read in table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", skip=66636, nrows=2880, na.strings="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Initialize graphics device
png(filename="plot1.png", width=480, height=480)

# Generate histogram
hist(data[, "Global_active_power"], xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red", main="Global Active Power")

# Close graphics device
dev.off()