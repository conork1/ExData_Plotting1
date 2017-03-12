# 1 Prepare the data
power <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_sub$DateTime <- strptime(paste(power_sub$Date,power_sub$Time), "%e/%m/%Y %H:%M:%S")
power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))

# 2 Create the PNG file
png("plot1.png",width=480, height = 480)

# 3 Generate the Plot
hist(power_sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

#4 Finally close the device
dev.off()