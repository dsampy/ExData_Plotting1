read.dataset <- function() {
    dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
    datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
    dataset <- cbind(data.frame(DateTime = datetime), dataset)
    dataset <- subset(dataset, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))
    return(dataset)
}

create.plot <- function() {
    dataset <- read.dataset()
    par(pin = c(480, 480))
    par(mar = c(5,5,2,2))
    plot(dataset$DateTime, dataset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    points(dataset$DateTime, dataset$Sub_metering_2, type = "l", col = "red")
    points(dataset$DateTime, dataset$Sub_metering_3, type = "l", col = "blue")
    legend("topright", lwd = "1", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

write.plot <- function() {
    png(filename = "plot3.png")
    create.plot()
    dev.off()
}

write.plot()
