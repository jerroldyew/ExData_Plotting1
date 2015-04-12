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
png('plot2.png', width = 480, height = 480, units = "px")
plot(Power.Consumption.Select$Date.Time,
     Power.Consumption.Select$Global_active_power,
     type='l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)'
)
dev.off()