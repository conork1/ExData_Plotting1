# 1 Prepare the data
power <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_sub$DateTime <- strptime(paste(power_sub$Date,power_sub$Time), "%e/%m/%Y %H:%M:%S")
power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
power_sub$Sub_metering_1 <- as.numeric(as.character(power_sub$Sub_metering_1))
power_sub$Sub_metering_2 <- as.numeric(as.character(power_sub$Sub_metering_2))
power_sub$Sub_metering_3 <- as.numeric(as.character(power_sub$Sub_metering_3))

# 2 Create the PNG file
png("plot3.png",width=480, height = 480)

# 3 Generate the Plot by first initializing it without genreating the data points and then show the data points as lines
plot(power_sub$DateTime,power_sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(power_sub$DateTime,power_sub$Sub_metering_1)
lines(power_sub$DateTime,power_sub$Sub_metering_2, col="red")
lines(power_sub$DateTime,power_sub$Sub_metering_3, col="blue")

# 4 Add the Legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

#5 Finally close the device
dev.off()