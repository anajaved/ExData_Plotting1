#Individual household electric power consumption Data Set -- UC Irvine

setwd("~/Desktop/Coursera-datascience/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",sep=";", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

feb <- data[(data$Date == "2007-02-01" | data$Date=="2007-02-02"),]

#Global Active Power v. Weekdays
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
feb$day <- paste(feb$Date, feb$Time)
feb$day <-  as.POSIXct(feb$day, "%d/%m/%Y %H:%M:%S")

plot(feb$day, feb$Global_active_power, col="black", type="l",
     ylab="Global Active Power (kilowatts)", xlab="" )


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


