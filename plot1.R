########################plot1.R##########################

##### Exploratory Data Analysis project 1#####

##open plo1.png file for first plot##
png(file="plot1.png")

##unzip the file##
unzip(zipfile="household_power_consumption.zip")
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

##Histogram of Global_active_power##
hist(newdata$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
