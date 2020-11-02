## set working directory
setwd("C:/Users/think/Documents/R/ExData_Plotting1")

##load dplyr package
library("dplyr")

##read dataset txt file
DataOfInterest<- read.table("household_power_consumption.txt",header= T, sep= ";", na.strings= "?")

##subset the data only for Date between 1/2/2007- 2/2/2007 
subdata<- subset(DataOfInterest, Date%in% c("1/2/2007", "2/2/2007"))
subdata$Date<- as.Date(subdata$Date, format= "%d/%m/%Y")

##plot histogram of Global Active Power vs. Frequency in red
png("plot1.png", width = 480, height = 480)
par(mar= c(5,5,1,1))
hist(subdata$Global_active_power, main= "Global Active Power", xlab= "Global Active Power(kilowatts)", col="Red")

dev.off()
