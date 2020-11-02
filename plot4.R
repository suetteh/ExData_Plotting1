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

##set the plotting area into a 2*2 array
png("plot4.png", width = 600, height= 600)
par(mfrow= c(2,2), mar= c(4,4,2,1), oma= c(0,0,2,0))

## plot graph Global Active Power vs. DateTime
with(subdata, {plot(Global_active_power~ DateTime, type= "l", ylab= "Global Active Power", xlab= " ")})

## plot graph Voltage vs. DateTime
with(subdata, {plot(Voltage~ DateTime, type= "l", ylab= "Voltage", xlab= "datetime")})

## plot graph Energy sub metering vs. DateTime and add legend on topright of the graph
with(subdata, {plot(Sub_metering_1~ DateTime, type= "l", col= "black", ylab= "Energy sub metering", xlab= " " )
lines(Sub_metering_2~DateTime, col= "red")
lines(Sub_metering_3~DateTime, col= "blue")})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c ("black", "red", "blue"), lty= 1, lwd= 2, bty= "n", y.intersp= 1)

## plot Global reactive power vs. DateTime
with(subdata, {plot(Global_reactive_power~DateTime, type= "l", ylab= "Global_reactive_power", xlab= "datetime")})
  
dev.off()
                            
