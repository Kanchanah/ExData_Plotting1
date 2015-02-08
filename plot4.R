########################plot4.R##########################
##open plot4.png file for first plot##
png(file="plot4.png")

##read the dataset##
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

##look at the first few rows##
head(data)

##create a new variable based on Date and Time##
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##Format the date##
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##Create a new data with only the required Dates mentioned##
newdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##4 plots##
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,1,0))                
with(newdata,{
plot(newdata$DateTime,newdata$Global_active_power,type="l",xlab="",ylab="Global Active Power ")
plot(newdata$DateTime,newdata$Voltage,type="l",xlab="datetime",ylab="Voltage ")
plot(newdata$DateTime,newdata$ Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(newdata$DateTime, newdata$Sub_metering_2,col="red")
lines(newdata$DateTime, newdata$Sub_metering_3,col="blue")
plot(newdata$DateTime,newdata$ Global_reactive_power,type="l",xlab="datetime",ylab=" Global_reactive_power")})
dev.off()

