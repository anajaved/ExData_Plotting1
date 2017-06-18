#Individual household electric power consumption Data Set -- UC Irvine

setwd("~/Desktop/Coursera-datascience/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",sep=";", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

feb <- data[(data$Date == "2007-02-01" | data$Date=="2007-02-02"),]

feb$Sub_metering_1 <- as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2 <- as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3 <- as.numeric(as.character(feb$Sub_metering_3))


feb$day <- paste(feb$Date, feb$Time)
feb$day <-  as.POSIXct(feb$day, "%d/%m/%Y %H:%M:%S")

with(feb, plot (day, Sub_metering_1, ylab = "Energy sub metering", 
                xlab="", col="black", type="l")) +
    with(feb, lines(day, Sub_metering_2, col="red", type="l")) +
    with (feb, lines(day, Sub_metering_3, col="blue", type="l")) +
    legend("topright",pch="-", lwd=1,  cex=0.65, col=c("black", "red", "blue"), 
           legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
