dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
dataset <- transform(dataset, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(Time, format = "%H:%M:%S"))
dataset <- subset(dataset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename = "plot1.png")
par(pin = c(480, 480))
par(mar=c(5,5,2,2))
hist(dataset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()