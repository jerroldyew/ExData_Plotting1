Power.Consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?' )
Power.Consumption$Date <- as.Date (Power.Consumption$Date, '%d/%m/%Y' )
Power.Consumption.Select <- subset( Power.Consumption, Date == '2007-02-01' | Date == '2007-02-02' )
Power.Consumption.Select$Date.Time <- strptime( 
        paste(
                Power.Consumption.Select$Date,
                Power.Consumption.Select$Time
        ),
        format="%Y-%m-%d %H:%M:%S"
)
png('plot3.png', width = 480, height = 480, units = "px")
plot(Power.Consumption.Select$Date.Time,
     Power.Consumption.Select$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering'
)
lines(Power.Consumption.Select$Date.Time,
      Power.Consumption.Select$Sub_metering_2,
      type = 'l',
      col = 'red'
)
lines(Power.Consumption.Select$Date.Time,
      Power.Consumption.Select$Sub_metering_3,
      type = 'l',
      col = 'blue'
)
legend('topright',
       lty = c(1, 1, 1),
       col = c('black', 'blue', 'red'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )
dev.off()