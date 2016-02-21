library(dplyr)

#Load data
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dat <- read.csv("household_power_consumption.txt", header = FALSE,col.names = colNames,skip = 66637, nrows= 69517-66637, sep = ";" , na.strings = "?") 

dat <- mutate(dat, DT = "")

dat$DT <- strptime(paste(dat$Date, " ", dat$Time), format="%d/%m/%Y %T")

#Plot3
png("plot3.png", width = 480, height = 480, units = "px")

plot(dat$DT,dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(dat$DT,dat$Sub_metering_2,col = "red")

lines(dat$DT,dat$Sub_metering_3,col = "blue")

legend("topright",col = c("black","red","blue"),legend =c("Sub metering 1","Sub metering 2","Sub metering 3") , lty = c(1:1))

dev.off()