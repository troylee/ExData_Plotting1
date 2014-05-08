#
# plot the 2nd figure for the class project 1
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
	png(file="plot2.png", width=480, height=480)
}

####################################
# Plot the values of Global Active power 
#

# extract the time information from the Date and Time columns 
time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# plot the line of global active power
plot(time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

if(!debug) {
	####################################
	# Close the graph device
	#
	dev.off()
}
