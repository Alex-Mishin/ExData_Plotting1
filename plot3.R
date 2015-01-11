data <- read.table("household_power_consumption.txt",
                   sep=";", skip=66637, nrows=2880, na.strings="?")
names(data) <- read.table("household_power_consumption.txt",
                          sep=";", nrows=1, as.is= TRUE)
data$DateTime = strptime(paste(data$Date,data$Time), format= "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

plot(data$DateTime, data$Sub_metering_1, type="n",
     ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()