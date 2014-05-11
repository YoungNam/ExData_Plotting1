# Multiple plots of global active power, voltage, submetering and global reactive power

# Reading data, with proper arguments
data <- read.table("household_power_consumption.txt", sep=';', header=T, 
                     colClasses = c('character', 'character', 'numeric', 
                                    'numeric', 'numeric', 'numeric', 'numeric', 
                                    'numeric', 'numeric'), na.strings='?')

# Adding DateTime and converting dates  with strptime()
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

# Subseting data with DateTime
small.data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") 
                     & as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot4.png with a fixed size
png("plot4.png", height=480, width=480)
+
# Cooking multiple plots 2*2
par(mfrow=c(2,2))

# plot of Global Active Power
plot(small.data$DateTime, small.data$Global_active_power,pch=NA,xlab="",ylab="Global Active Power (kilowatts)")
lines(small.data$DateTime, small.data$Global_active_power)

# plot of Voltage xlab : datetime
plot(small.data$DateTime, small.data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(small.data$DateTime, small.data$Voltage)

# plot if Sub_metering
plot(small.data$DateTime, small.data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(small.data$DateTime, small.data$Sub_metering_1)
lines(small.data$DateTime, small.data$Sub_metering_2, col='red')
lines(small.data$DateTime, small.data$Sub_metering_3, col='blue')
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1),
        col = c('black', 'red', 'blue'),bty = 'n')

# plot if Global_reactive_power
plot(small.data$DateTime, small.data$Global_reactive_power,  pch=NA, xlab='datetime',ylab="Global_reactive_power")
lines(small.data$DateTime, small.data$Global_reactive_power)

# Closing PNG file
dev.off()