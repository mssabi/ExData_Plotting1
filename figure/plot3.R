## read the input text file and load into data_entire 
data_entire<-read.csv("household_power_consumption.txt",header=T, sep=';',na.strings="?",nrows=2075259, check.names=F,stringsAsFactors=F,comment.char="", quote='\"')

## converting the date format 
data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")

## subsetting the data to select only feb 1st and feb 2nd dates
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## creating the plot
with(data, {plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
	lines(Sub_metering_2~Datetime,col='Red')
	lines(Sub_metering_3~Datetime,col='Blue')})

## saving to file
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
