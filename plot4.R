library(dplyr)

# Loading the data
power_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Assigning class to Time and Date
power_consumption$Time <- strptime(paste(power_consumption$Date,power_consumption$Time), "%d/%m/%Y%H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

# Selecting only the days of interest
consumption_01 <- filter(power_consumption, Date == "2007-02-01")
consumption_02 <- filter(power_consumption, Date == "2007-02-02")

# and combibing them in a single 
consumption <- rbind(consumption_01,consumption_02)

# Remove the whole list from the environment
rm(power_consumption)

# Generating xy plots and saving them in png format

# Open png device and create file
png(file="plot4.png", width = 480, height = 480, units="px")

# Create plots

# Canvas

par(mfcol= c(2,2),mar=c(5, 4, 2, 2))

# Plot1
plot(consumption$Time,consumption$Global_active_power,type="l",
     ylab="Global Active Power", xlab="")

# Plot2
plot(consumption$Time,consumption$Sub_metering_1,type="l",
     ylab="Energy sub metering", xlab="")
lines(consumption$Time,consumption$Sub_metering_2, col="red")
lines(consumption$Time,consumption$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot3
plot(consumption$Time,consumption$Voltage,type="l",
     ylab="Voltage", xlab="datetime")

# Plot4
plot(consumption$Time,consumption$Global_reactive_power,type="l",
     ylab="Global_reactive_power", xlab="datetime")

# Close png device
dev.off()


