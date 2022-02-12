#Opening text file as table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subsetting data into desired dates
sub <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

png(file="plot1.png", height=480, width=480)
#Graphing histogram of Global Active Power against frequency
hist(as.numeric(sub$Global_active_power), col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" )

dev.off()
