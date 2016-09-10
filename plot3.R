#plot 3

library(data.table)
library(dplyr)

#read in data and format

power_data <- tbl_df(fread("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?"))

power_data <- power_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
power_data <- power_data %>% mutate(date_time = as.POSIXct(strptime(paste(power_data$Date, power_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")))


with(power_data, {
png("plot3.png", width = 450, height = 450, units = "px")
plot(date_time, Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type = "l")
lines(date_time, Sub_metering_2, col="red")
lines(date_time, Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()
})


