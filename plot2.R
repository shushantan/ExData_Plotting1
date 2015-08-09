## retrieve data
data <- read.table("household_power_consumption.txt", sep = ";", as.is = TRUE, skip=1)
dataDateFormatted <- subset(data, as.Date(data$V1, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$V1, "%d/%m/%Y") <= as.Date("2007-02-02"))

png("plot2.png", 480, 480)

plot(as.POSIXct(strptime(paste(dataDateFormatted$V1, dataDateFormatted$V2), "%d/%m/%Y %H:%M:%S")), 
     as.numeric(dataDateFormatted$V3), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()