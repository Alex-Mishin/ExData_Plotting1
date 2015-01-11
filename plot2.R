data <- read.table("household_power_consumption.txt",
                   sep=";", skip=66637, nrows=2880, na.strings="?")
names(data) <- read.table("household_power_consumption.txt",
                     sep=";", nrows=1, as.is= TRUE)
data$DateTime = strptime(paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(data$DateTime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()