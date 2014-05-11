# Global Active Power by submeter - making plot with line , x Lable as time

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

# Open plot3.png with a fixed size
png("plot3.png", height=480, width=480)

# Cooking a plot with no point
plot(small.data$DateTime, small.data$Sub_metering_1,pch=NA,xlab="",ylab="Energy sub metering")

# adding lines time ~ submeter1,2,3 with different colors
lines(small.data$DateTime, small.data$Sub_metering_1)
lines(small.data$DateTime, small.data$Sub_metering_2, col='red')
lines(small.data$DateTime, small.data$Sub_metering_3, col='blue')

# giving legend on top right
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),col = c('black', 'red', 'blue'))

# Closing PNG file
dev.off()