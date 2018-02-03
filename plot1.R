# Read in data and subset applicable dates. This code assumes that the data is stored in a subfolder 'data' in the working directory and was unzipped in that folder.
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create plot1, convert Global Active Power variable to numeric or will get error when create histogram
globalactivepower <- as.numeric(subdata$Global_active_power)
png(filename="plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



