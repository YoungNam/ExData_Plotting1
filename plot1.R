# Global Active Power - making Histogram with PNG format
        
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

# Open plot1.png with a fixed size
png("plot1.png", height=480, width=480)

# Cooking histogram with given arguments
hist(small.data$Global_active_power, col='red', 
        xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

# Closing PNG file
dev.off()