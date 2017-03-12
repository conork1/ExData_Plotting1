# 1 Prepare the data
power <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_sub$DateTime <- strptime(paste(power_sub$Date,power_sub$Time), "%e/%m/%Y %H:%M:%S")
power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
power_sub$Global_reactive_power <- as.numeric(as.character(power_sub$Global_reactive_power))
power_sub$Voltage <- as.numeric(as.character(power_sub$Voltage))
power_sub$Sub_metering_1 <- as.numeric(as.character(power_sub$Sub_metering_1))
power_sub$Sub_metering_2 <- as.numeric(as.character(power_sub$Sub_metering_2))
power_sub$Sub_metering_3 <- as.numeric(as.character(power_sub$Sub_metering_3))

# 2 Create the PNG file
png("plot4.png",width=480, height = 480)

# 3 Generate the 4 plots in a 2 x 2 layout
par(mfrow= c(2, 2))

# 3.1 Generate the Global Active Power chart
plot(power_sub$DateTime,power_sub$Global_active_power, ylab="Global Active Power", xlab="", type="n")
lines(power_sub$DateTime,power_sub$Global_active_power)
# 3.2 Generate the Voltage Chart
plot(power_sub$DateTime,power_sub$Voltage, ylab="Voltage", xlab="datetime", type="n")
lines(power_sub$DateTime,power_sub$Voltage)
# 3.3 Generate the Submetering chart
plot(power_sub$DateTime,power_sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(power_sub$DateTime,power_sub$Sub_metering_1)
lines(power_sub$DateTime,power_sub$Sub_metering_2, col="red")
lines(power_sub$DateTime,power_sub$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty=c(1,1,1), bty="n")
# 3.4 Generate the Reactive chart
plot(power_sub$DateTime,power_sub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="n")
lines(power_sub$DateTime,power_sub$Global_reactive_power)

#5 Finally close the device
dev.off()