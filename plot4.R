setwd("~/Desktop/COURSERA/MODULO4/proyecto1")

#Read the data
base<-read.table("household_power_consumption.txt",sep=";",header=T,
                 colClasses=c("character","character","double","double",
                              "double","double","double","double","numeric"),
                 na.strings="?")

#
base$DateTime <- strptime(paste(base$Date, base$Time), "%d/%m/%Y %H:%M:%S")
baseFinal <- subset(base, as.Date(DateTime) >= as.Date("2007-02-01") & 
                      as.Date(DateTime) <= as.Date("2007-02-02"))


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#Global Active Power
plot(baseFinal$DateTime, baseFinal$Global_active_power, xlab = "", 
     ylab = "Global Active Power",type="n")
lines(baseFinal$DateTime, baseFinal$Global_active_power)

#Voltage
plot(baseFinal$DateTime, baseFinal$Voltage, xlab = "datetime", 
     ylab = "Voltage",type="n")
lines(baseFinal$DateTime, baseFinal$Voltage)

#Energy sub metering
plot(baseFinal$DateTime, baseFinal$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub metering")
lines(baseFinal$DateTime, baseFinal$Sub_metering_1)
lines(baseFinal$DateTime, baseFinal$Sub_metering_2, col="red")
lines(baseFinal$DateTime, baseFinal$Sub_metering_3, col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

#Global reactive power
plot(baseFinal$DateTime, baseFinal$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power",type="n")
lines(baseFinal$DateTime, baseFinal$Global_reactive_power)

dev.off()