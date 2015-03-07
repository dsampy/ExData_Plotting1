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
    hist(dataset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
}

write.plot <- function() {
    png(filename = "plot1.png")
    create.plot()
    dev.off()
}

write.plot()
