dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
dataset <- transform(dataset, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(Time, format = "%Y-%m-%d %H:%M:%S"))
dataset <- subset(dataset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename = "plot2.png")
par(pin = c(480, 480))
par(mar=c(5,5,2,2))
plot(dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
