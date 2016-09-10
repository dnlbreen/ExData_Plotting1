#plot 2

library(data.table)
library(dplyr)

#read in data and format

power_data <- tbl_df(fread("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?"))

power_data <- power_data %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
power_data <- power_data %>% mutate(date_time = as.POSIXct(strptime(paste(power_data$Date, power_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")))

with(power_data,{

png("plot2.png", width = 450, height = 450, units = "px")

plot(date_time, Global_active_power, type = "l", col = "black", main = "Global Active Power", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
})




