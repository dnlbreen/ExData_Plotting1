#plot 4

library(data.table)
library(dplyr)

#read in data and format

power_data <- tbl_df(fread("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?"))

power_data <- power_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
power_data <- power_data %>% mutate(date_time = as.POSIXct(strptime(paste(power_data$Date, power_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")))


colors <- c("black", "red", "blue")
meters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

with(power_data, {

png("plot4.png", width = 450, height = 450, units = "px")
par(mfrow=c(2,2))
plot(date_time, Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(date_time, Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, Sub_metering_2, type="l", col="red")
lines(date_time, Sub_metering_3, type="l", col="blue")
legend("topright", col=colors, lty=1, bty="n", legend=meters)
plot(date_time, Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.off()

})
