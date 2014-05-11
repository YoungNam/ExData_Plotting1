# Global Active Power - making plot with line , x Lable as time

# Reading data, with proper arguments
data <- read.table("household_power_consumption.txt", sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric', 
                                  'numeric', 'numeric', 'numeric', 'numeric', 
                                  'numeric', 'numeric'), na.strings='?')

# Adding DateTime and converting dates  with strptime()
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Subseting data with DateTime
small.data <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01") & 
                             as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot2.png with a fixed size
png("plot2.png", height=480, width=480)

# Cooking a plot with no point
plot(small.data$DateTime, small.data$Global_active_power,pch=NA, xlab="", 
     ylab="Global Active Power (kilowatts)")

# adding lines time ~ active power
lines(small.data$DateTime, small.data$Global_active_power)

# Closing PNG file
dev.off()