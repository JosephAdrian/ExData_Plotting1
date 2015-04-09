#Reading the data into R
setwd('H:/coursera stuff/data science specialization/04 exploratory data analysis/Course Projects/Project 1/Input Data')
household_power_consumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#Subsetting the data for the required dates
household_power_consumption_req = household_power_consumption[which(household_power_consumption$Date == '1/2/2007'|
                                                                      household_power_consumption$Date == '2/2/2007'),]

#Converting the column into numeric
household_power_consumption_req$Global_active_power_num <- as.numeric(household_power_consumption_req$Global_active_power)

#Getting date and time into one column
household_power_consumption_req$Req_Time = paste(household_power_consumption_req$Date,household_power_consumption_req$Time, sep=" ")

household_power_consumption_req$Req_Time = strptime(household_power_consumption_req$Req_Time, "%d/%m/%Y %H:%M:%S")

#Plotting the file
plot(household_power_consumption_req$Req_Time, 
     household_power_consumption_req$Global_active_power_num, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Sending the plot to a PNG file
dev.copy(png,file="plot2.png")
dev.off()


