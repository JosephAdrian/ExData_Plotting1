#Reading the data into R
setwd('H:/coursera stuff/data science specialization/04 exploratory data analysis/Course Projects/Project 1/Input Data')
household_power_consumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#Subsetting the data for the required dates
household_power_consumption_req = household_power_consumption[which(household_power_consumption$Date == '1/2/2007'|
                                                                      household_power_consumption$Date == '2/2/2007'),]
#Getting date and time into one column
household_power_consumption_req$Req_Time = paste(household_power_consumption_req$Date,household_power_consumption_req$Time, sep=" ")

household_power_consumption_req$Req_Time = strptime(household_power_consumption_req$Req_Time, "%d/%m/%Y %H:%M:%S")

#Converting columns into numeric
household_power_consumption_req$Global_active_power_num <- as.numeric(household_power_consumption_req$Global_active_power)
household_power_consumption_req$Sub_metering_1_num = as.numeric(household_power_consumption_req$Sub_metering_1) 
household_power_consumption_req$Sub_metering_2_num = as.numeric(household_power_consumption_req$Sub_metering_2) 
household_power_consumption_req$Sub_metering_3_num = as.numeric(household_power_consumption_req$Sub_metering_3) 
household_power_consumption_req$Voltage_num = as.numeric(household_power_consumption_req$Voltage)
household_power_consumption_req$Global_reactive_power_num <- as.numeric(household_power_consumption_req$Global_reactive_power)

#Building Plots one by one
par(mfrow = c(2, 2))
plot(household_power_consumption_req$Req_Time, household_power_consumption_req$Global_active_power_num, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

plot(household_power_consumption_req$Req_Time, household_power_consumption_req$Voltage_num,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(household_power_consumption_req$Req_Time, household_power_consumption_req$Sub_metering_1_num, type="l", ylab="Energy sub metering", xlab="")
lines(household_power_consumption_req$Req_Time, household_power_consumption_req$Sub_metering_2_num, type="l", col="red")
lines(household_power_consumption_req$Req_Time, household_power_consumption_req$Sub_metering_3_num, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(household_power_consumption_req$Req_Time, household_power_consumption_req$Global_reactive_power_num, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(household_power_consumption_req)[4])

#Sending the plot to a PNG file
dev.copy(png,file="plot4.png")
dev.off()