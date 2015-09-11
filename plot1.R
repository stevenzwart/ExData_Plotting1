hh <- read.table("household_power_consumption.txt", sep = ";", head = TRUE)

hh[hh=="?"] <- NA

hh$Global_active_power <- as.numeric(as.character(hh$Global_active_power))
hh$Global_reactive_power <- as.numeric(as.character(hh$Global_reactive_power))
hh$Voltage <- as.numeric(as.character(hh$Voltage))
hh$Global_intensity <- as.numeric(as.character(hh$Global_intensity))
hh$Sub_metering_1 <- as.numeric(as.character(hh$Sub_metering_1))
hh$Sub_metering_2 <- as.numeric(as.character(hh$Sub_metering_2))
hh$Sub_metering_3 <- as.numeric(as.character(hh$Sub_metering_3))
hh$Date <- as.character(hh$Date)

hhsub <- hh[which(hh$Date == "1/2/2007"|hh$Date == "2/2/2007"),]

png ("plot1.png", width = 480, height =480)
hist(hhsub$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main = "Global Active Power")
dev.off()