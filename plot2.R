#Opening text file as table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subsetting data into desired dates
sub <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

png(file="plot2.png", height=480, width=480)
#Plotting values of Global aActive Power as a line
plot(as.numeric(sub$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)",xlab="", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))

dev.off()
