########################plot3.R##########################

##open plot3.png file for first plot##
png(file="plot3.png")

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

##plot of Energy sub metering ##
with(newdata,plot(newdata$DateTime,newdata$ Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(newdata$DateTime, newdata$Sub_metering_2,col="red")
lines(newdata$DateTime, newdata$Sub_metering_3,col="blue")
legend("topright",lty= 1,col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

