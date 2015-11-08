#PLOT 3

setwd("~/Desktop/COURSERA/MODULO4/proyecto1")

base<-read.table("household_power_consumption.txt",sep=";",header=T,
                 colClasses=c("character","character","double","double",
                              "double","double","double","double","numeric"),
                 na.strings="?")


base$DateTime <- strptime(paste(base$Date, base$Time), "%d/%m/%Y %H:%M:%S")
baseFinal <- subset(base, as.Date(DateTime) >= as.Date("2007-02-01") & 
                      as.Date(DateTime) <= as.Date("2007-02-02"))


png("plot3.png", width = 480, height = 480)

plot(baseFinal$DateTime, baseFinal$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub metering")
lines(baseFinal$DateTime, baseFinal$Sub_metering_1)
lines(baseFinal$DateTime, baseFinal$Sub_metering_2, col="red")
lines(baseFinal$DateTime, baseFinal$Sub_metering_3, col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c("black", "red", "blue"))

dev.off ()
