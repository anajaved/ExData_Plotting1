#Individual household electric power consumption Data Set -- UC Irvine
#Examine how household energy usage varies over a 2-day period in February, 2007

setwd("~/Desktop/Coursera-datascience/ExData_Plotting1")
data <- read.table("household_power_consumption.txt",sep=";", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

feb <- data[(data$Date == "2007-02-01" | data$Date=="2007-02-02"),]

#Global Active Power Plot
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
hist(feb$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)"
)

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
