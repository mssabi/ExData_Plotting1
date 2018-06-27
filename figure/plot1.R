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
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
