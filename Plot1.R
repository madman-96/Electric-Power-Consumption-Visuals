#Plot1

library(data.table)
power <- fread("household_power_consumption.txt", na.strings = "?")
colnames(power)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#get rid of V1, V2,.....
power <- power[-c(1),]

#format date and time
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- format(power$Time, format="%H:%M:%S")

#filter to only use data from the dates 2007-02-01 and 2007-02-02
power_data <- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#save the plot in a png file adhering to the pixel limits
png("Plot1.png", width=480, height=480)

#construct plot
hist(power_data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")



dev.off()
