data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', col.names = strsplit('Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3', ';')[[1]], na.string = '?', colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), nrows = 69516 - 66636, skip = 66636)
data$DateTime <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data$Time <- strptime(data$Time, '%H:%M:%S')

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
  plot(DateTime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
  plot(DateTime, Voltage, type = 'l', xlab = 'datetime')
  
  plot(DateTime, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
  lines(DateTime, Sub_metering_1, type = 'l', col = 'black')
  lines(DateTime, Sub_metering_2, type = 'l', col = 'red')
  lines(DateTime, Sub_metering_3, type = 'l', col = 'blue')
  legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, box.lwd = 0)
  
  plot(DateTime, Global_reactive_power, type = 'l', xlab = 'datetime')
})

dev.off()