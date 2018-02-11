#read the file using read.table

file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", dec=".")

#subset the table for the required dates

subSet <- file[file$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot the graph

plot(datetime,as.numeric(subSet$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)")

#copy the histogram to png file

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()