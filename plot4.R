# Read in data and subset applicable dates. This code assumes that the data is stored in a subfolder 'data' in the working directory and was unzipped in that folder.
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert all variables to numeric or will get error when create histogram, convert Date and Time columns to plot in graph
dates <- subdata$Date
times <- subdata$Time
datetime <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subdata$Global_active_power)
voltage <- as.numeric(subdata$Voltage)
submetering1 <- as.numeric(subdata$Sub_metering_1)
submetering2 <- as.numeric(subdata$Sub_metering_2)
submetering3 <- as.numeric(subdata$Sub_metering_3)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)

# Create plot4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, globalactivepower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)") 

plot(datetime, voltage, type="l", ylab = "Voltage") 

plot(datetime, submetering1, type="l", xlab = "", ylab = "Energy sub metering", col = "black") 
lines(datetime, submetering2, col = "red")
lines(datetime, submetering3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)

plot(datetime, globalreactivepower, type="l", ylab = "Global_reactive_power") 

dev.off()

