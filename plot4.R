#Opening text file as table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subsetting data into desired dates
sub <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2))

#Plotting Global Active Power values as a line
plot(as.numeric(sub$Global_active_power), type = "l", ylab = "Global Active Power",xlab="", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))

#Plotting Voltage values as a line
plot(as.numeric(sub$Voltage), type = "l", ylab = "Voltage",xlab="datetime", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))

#Assigning Sub metering values to variables
sb1 <- as.numeric(sub$Sub_metering_1)
sb2 <- as.numeric(sub$Sub_metering_2)
sb3 <- as.numeric(sub$Sub_metering_3)

#Plotting Sub metering values together
plot(sb1, type = "l", ylab = "Energy sub metering", xlab="", xaxt="n")
lines(sb2, col = "red")
lines(sb3, col = "blue")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))
legend("topright" ,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), box.lty = 0, cex = 0.7, inset=0.04)

#Plotting Global Reactive Power values as a line
plot(as.numeric(sub$Global_reactive_power), type = "l", ylab = "Global_reactive_power",xlab="datetime", xaxt="n")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))

dev.off()
