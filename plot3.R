# Read the table
hh <- read.table("household_power_consumption.txt", sep = ";", head = TRUE)

# Set ? to NA
hh[hh=="?"] <- NA

# Change factors to numeric/character
hh$Global_active_power <- as.numeric(as.character(hh$Global_active_power))
hh$Global_reactive_power <- as.numeric(as.character(hh$Global_reactive_power))
hh$Voltage <- as.numeric(as.character(hh$Voltage))
hh$Global_intensity <- as.numeric(as.character(hh$Global_intensity))
hh$Sub_metering_1 <- as.numeric(as.character(hh$Sub_metering_1))
hh$Sub_metering_2 <- as.numeric(as.character(hh$Sub_metering_2))
hh$Sub_metering_3 <- as.numeric(as.character(hh$Sub_metering_3))
hh$Date <- as.character(hh$Date)

# Select first and second of February
hhsub <- hh[which(hh$Date == "1/2/2007"|hh$Date == "2/2/2007"),]

# Set language to English (Windows)
Sys.setlocale("LC_TIME","C")
# Create png file
png("plot3.png", width = 480, height = 480)
# Create the plot


plot(strptime(paste(hhsub[,1], hhsub[,2]), "%d/%m/%Y %H:%M:%S"), hhsub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(paste(hhsub[,1], hhsub[,2]), "%d/%m/%Y %H:%M:%S"),hhsub$Sub_metering_2, col="red")
lines(strptime(paste(hhsub[,1], hhsub[,2]), "%d/%m/%Y %H:%M:%S"),hhsub$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),  lty=1)
dev.off()