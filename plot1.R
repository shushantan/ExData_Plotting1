## retrieve data
data <- read.table("household_power_consumption.txt", sep = ";", as.is = TRUE, skip=1)
dataDateFormatted <- subset(data, as.Date(data$V1, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$V1, "%d/%m/%Y") <= as.Date("2007-02-02"))

png("plot1.png", 480, 480)
hist(as.numeric(dataDateFormatted$V3), xlab = "Global Acitve Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()