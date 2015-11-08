setwd("~/Desktop/COURSERA/MODULO4/proyecto1")

#Leo el archivo
base<-read.table("household_power_consumption.txt",sep=";",header=T,
                 colClasses=c("character","character","double","double",
                              "double","double","double","double","numeric"),
                 na.strings="?")

#Creo una variable "DateTime y cambio formato
base$DateTime <- strptime(paste(base$Date, base$Time), "%d/%m/%Y %H:%M:%S")

#Obtengo el subconjunto de datos
baseFinal <- subset(base, as.Date(DateTime) >= as.Date("2007-02-01") & 
                      as.Date(DateTime) <= as.Date("2007-02-02"))

#Obtengo el histograma
png("plot1.png",width=480,height=480)

hist(baseFinal$Global_active_power,col="red",main="Global Active Power",
            xlab="Global Active Power (kilowatts)")

dev.off()