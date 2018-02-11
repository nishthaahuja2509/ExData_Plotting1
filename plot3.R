#read the file using read.table

file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", dec=".")

#subset the table for the required dates

subSet <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot the graphs

plot(datetime,as.numeric(subSet$Sub_metering_1), type = "l",xlab ="", ylab = "Global Active Power (kilowatts)")
lines(datetime,as.numeric(subSet$Sub_metering_2), col = "red")
lines(datetime,as.numeric(subSet$Sub_metering_3), col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#copy the histogram to png file

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()