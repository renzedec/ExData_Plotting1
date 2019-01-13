# Get Data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data2 <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time variables
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
data2$Time <- strptime(data2$Time, format="%H:%M:%S")
data2[1:1440,"Time"] <- format(data2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data2[1441:2880,"Time"] <- format(data2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot to PNG File
png("plot2.png", width=480, height=480)
plot(data2$Time,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()