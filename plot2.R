## set working directory
setwd("C:/Users/think/Documents/R/ExData_Plotting1")

##read dataset txt file
DataOfInterest<- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings ="?", stringsAsFactors = FALSE)

#subset data only for Date 1/2/2007 to 2/2/2007
subdata<- subset(DataOfInterest, Date %in% c("1/2/2007", "2/2/2007"))

##combine date and time
subdata$Date<- as.Date(subdata$Date, format= "%d/%m/%Y")
datetime<- paste(as.Date(subdata$Date), subdata$Time)
subdata$DateTime<- as.POSIXct(datetime)

##plot the line graph of Global Active Power (kilowatts) as Y-axis versus "Day" as X-axis
png("plot2.png", width = 480, height = 480)
par(mar= c(5,5,1,1))
with(subdata, {plot(Global_active_power~DateTime, xlab= " ", ylab= "Global Active Power (kilowatts)", type= "l")})

dev.off()
