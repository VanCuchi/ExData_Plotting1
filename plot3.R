#Opening text file as table
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subsetting data into desired dates
sub <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

#Assigning Sub metering values to variables
sb1 <- as.numeric(sub$Sub_metering_1)
sb2 <- as.numeric(sub$Sub_metering_2)
sb3 <- as.numeric(sub$Sub_metering_3)
 
png(file="plot3.png", height=480, width=480)
#Plotting Sub metering values together
plot(sb1, type = "l", ylab = "Energy sub metering", xlab="", xaxt="n")
lines(sb2, col = "red")
lines(sb3, col = "blue")
axis(1, labels=c("Thu", "Fri", "Sat"), at=c(1, 1440, 2880))
legend("topright" ,c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()
