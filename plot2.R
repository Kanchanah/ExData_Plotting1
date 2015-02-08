########################plot2.R##########################
##### Exploratory Data Analysis project 1#####

##open plot2.png file for first plot##
png(file="plot2.png")

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

##plot of Global_active_power vs DateTime ##

with(newdata,plot(newdata$DateTime,newdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
