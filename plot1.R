#Reading the data into R
setwd('H:/coursera stuff/data science specialization/04 exploratory data analysis/Course Projects/Project 1/Input Data')
household_power_consumption = read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#Subsetting the data for the required dates
household_power_consumption_req = household_power_consumption[which(household_power_consumption$Date == '1/2/2007'|
                                                                      household_power_consumption$Date == '2/2/2007'),]

#Converting the column into numeric
household_power_consumption_req$Global_active_power_num <- as.numeric(household_power_consumption_req$Global_active_power)

#Setting the option remove scientific notations
getOption("scipen")
opt <- options("scipen" = 20)
getOption("scipen")

#Plotting the histogram for Global Active Power
hist(household_power_consumption_req$Global_active_power_num/1000,col = "red",main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")

#Sending the plot to a PNG file
dev.copy(png,file="plot1.png")
dev.off()


