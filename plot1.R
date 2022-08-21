library(dplyr)
#library(data.table) # for fread

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

# Generating histogram and saving in png format

# Open png device and create file
png(file="plot1.png")

# Create plot
hist(consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
    main="Global Active Power")

# Close png device
dev.off()


