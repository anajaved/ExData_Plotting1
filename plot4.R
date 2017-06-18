#Individual household electric power consumption Data Set -- UC Irvine

setwd("~/Desktop/Coursera-datascience/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",sep=";", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

feb <- data[(data$Date == "2007-02-01" | data$Date=="2007-02-02"),]

feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
feb$day <- paste(feb$Date, feb$Time)
feb$day <-  as.POSIXct(feb$day, "%d/%m/%Y %H:%M:%S", tz=UTZ)

#Global Active Power v. Weekdays
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
feb$Voltage <- as.numeric(as.character(feb$Voltage))
feb$Global_reactive_power <- as.numeric(as.character(feb$Global_reactive_power))


par(mfrow=c(2,2))

with(feb, {
    plot(feb$day, feb$Global_active_power, col="black", type="l",
         ylab="Global Active Power", xlab="" ) 
    
    plot(feb$day, feb$Voltage, col="black", type="l",
         ylab="Voltage", xlab="datetime" ) 
    
    (plot (feb$day, feb$Sub_metering_1, ylab = "Energy sub metering", 
          xlab="", col="black", type="l") +
    with(feb, lines(day, Sub_metering_2, col="red", type="l")) +
    with (feb, lines(day, Sub_metering_3, col="blue", type="l")) + 
            legend("topright", col=c("black", "red", "blue"), cex=.35, pch="-", lwd=1,
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))) 
    
    plot(feb$day, feb$Global_reactive_power, col="black", type="l", xlab="datetime")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
