## retrieve data
data <- read.table("household_power_consumption.txt", sep = ";", as.is = TRUE, skip=1)
dataDateFormatted <- subset(data, as.Date(data$V1, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$V1, "%d/%m/%Y") <= as.Date("2007-02-02"))

png("plot4.png", 480, 480)

par(mfrow=c(2,2))
plot(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")),
     dataDateFormatted$V3, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), 
     dataDateFormatted$V5, type = "l", xlab = "", ylab = "Voltage")
plot(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), 
     c(dataDateFormatted$V7), type = "l", xlab = "", ylab = "Energy sub metering")
lines(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), 
      dataDateFormatted$V8, col="red")
lines(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), 
      dataDateFormatted$V9, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1),lwd=c(2,2),col=c("black","red","blue"))
plot(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), dataDateFormatted$V4, type = "l", xlab = "", ylab = "Global_reactive_power")

dev.off()
