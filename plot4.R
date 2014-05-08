#
# plot the 4th figure for the class project 1
#

# load necessary libraries
library(data.table)

# flag to enable debug
debug <- FALSE

####################################
# load the data
#

# get the column names
colnames <- fread("household_power_consumption.txt", sep=";", nrows=0)
# read in only the rows corresponding to 2007-02-01 and 2007-02-02
data <- fread("household_power_consumption.txt", sep=";", na.string="?", skip=66637, nrows=2880)
# update the column names of data
setnames(data, names(data), names(colnames))

if(!debug) {
	####################################
	# Prepare the graph device
	#
	png(file="plot4.png", width=480, height=480)
}

####################################
# Plot the values of Global Active power 
#

# extract the time information from the Date and Time columns 
time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# set to plot to be 2X2
par(mfrow = c(2, 2))

# plot the first global active power
plot(time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot the 2nd voltage
plot(time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot the 3rd engery sub metering
plot(time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
# plot the 2nd metering, red line
lines(time, data$Sub_metering_2, type="l", col="red")
# plot the 3rd metering, blue line
lines(time, data$Sub_metering_3, type="l", col="blue")
# plot the legend
legend("topright", lty=1, col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# plot the 4th global reactive power
plot(time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

if(!debug) {
	####################################
	# Close the graph device
	#
	dev.off()
}
