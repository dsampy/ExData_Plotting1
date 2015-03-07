read.dataset <- function() {
    dataset <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
    datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
    dataset <- cbind(data.frame(DateTime = datetime), dataset)
    dataset <- subset(dataset, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))
    return(dataset)
}

create.plot.topleft <- function(dataset) {
    plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
}

create.plot.topright <- function(dataset) {
    plot(dataset$DateTime, dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
}

create.plot.bottomleft <- function(dataset) {
    plot(dataset$DateTime, dataset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    points(dataset$DateTime, dataset$Sub_metering_2, type = "l", col = "red")
    points(dataset$DateTime, dataset$Sub_metering_3, type = "l", col = "blue")
    legend("topright", bty = "n", cex = 0.9, pt.cex = 0.9, lwd = "1", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}

create.plot.bottomright <- function(dataset) {
    plot(dataset$DateTime, dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
}

create.plot <- function() {
    dataset <- read.dataset()
    par(pin = c(480, 480))
    par(mar = c(5,5,2,2))
    par(mfrow = c(2, 2))
    create.plot.topleft(dataset)
    create.plot.topright(dataset)
    create.plot.bottomleft(dataset)
    create.plot.bottomright(dataset)
}

write.plot <- function() {
    png(filename = "plot4.png")
    create.plot()
    dev.off()
}

write.plot()
