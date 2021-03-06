#Plot2

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
png("Plot2.png", width=480, height=480)


#construct plot
plot(x=power_data$datetime, y=power_data$Global_active_power, type = "l",
                              xlab = "",
                              ylab = "Global Active Power (kilowatts)")


dev.off()