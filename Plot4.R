#Plot4

library(data.table)
power <- fread("household_power_consumption.txt", na.strings = "?")
colnames(power)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#get rid of V1, V2,.....
power <- power[-c(1),]

#format date and time
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

#filter to only use data from the dates 2007-02-01 and 2007-02-02
power_data <- power[(datetime >= "2007-02-01") & (datetime <= "2007-02-03")]

#save the plot in a png file adhering to the pixel limits
png("Plot4.png", width=480, height=480)

#construct plot
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(x=power_data$datetime, y=power_data$Global_active_power, type = "l",
                             xlab = "",
                             ylab = "Global Active Power (kilowatts)")

plot(x=power_data$datetime, y= power_data$Voltage, type = "l",
                             xlab = "datetime",
                             ylab = "Voltage")

plot(x=power_data$datetime, y=power_data$Sub_metering_1, type = "l",
                             xlab = "",
                             ylab = "Energy sub metering",
                             col = "black")
lines(x=power_data$datetime, y=power_data$Sub_metering_2, type = "l", col = "red")
lines(x=power_data$datetime, y=power_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

plot(x=power_data$datetime, y= power_data$Global_reactive_power, type = "l",
                             xlab = "datetime",
                             ylab = "Global Reactive Power")
                        
dev.off()






