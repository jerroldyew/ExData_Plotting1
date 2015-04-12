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

png('plot1.png', width = 480, height = 480, units = "px")
hist(Power.Consumption.Select$Global_active_power, 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col="Red")
dev.off()
