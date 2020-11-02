## set working directory
setwd("C:/Users/think/Documents/R/ExData_Plotting1")

##read dataset txt file
DataOfInterest<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings ="?", stringsAsFactors = FALSE)

##subset data only for Date 1/2/2007 to 2/2/2007
subdata<- subset(DataOfInterest, Date %in% c("1/2/2007", "2/2/2007"))

##combine Date and Time
subdata$Date<- as.Date(subdata$Date, format= "%d/%m/%Y")
DateTime<- paste(as.Date(subdata$Date), subdata$Time)
subdata$DateTime<- as.POSIXct(DateTime)

##plot sub_metering_1 versus DateTime
png("plot3.png", width= 480, height= 480)
with(subdata, {plot(Sub_metering_1~DateTime, type= "l", col= "black", ylab= "Energy sub metering",xlab= " ")
##add sub_metering_2 and sub_metering_3 versus DateTime
lines(Sub_metering_2~DateTime, col= "red")
lines(Sub_metering_3~DateTime, col= "blue")})

##add legend on topright of the graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty= 1, lwd= 2.5)

dev.off()
