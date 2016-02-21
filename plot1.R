#Load data
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dat <- read.csv("household_power_consumption.txt", header = FALSE,col.names = colNames,skip = 66637, nrows= 69517-66637, sep = ";" , na.strings = "?") 

#Plot1
png("plot1.png", width = 480, height = 480, units = "px")

hist(dat$Global_active_power, col = "red", xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")

dev.off()