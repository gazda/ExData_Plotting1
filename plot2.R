data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', col.names = strsplit('Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3', ';')[[1]], na.string = '?', colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), nrows = 69516 - 66636, skip = 66636)
data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(data$Time, '%H:%M:%S')

png('plot2.png', width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()