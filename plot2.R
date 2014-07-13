hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
hpc$Date2 <- as.Date(hpc$Date, format = "%d/%m/%Y")
mydata <- subset(hpc, Date2 == "2007-02-02" | Date2 == "2007-02-01")


mydata$dateTime2 <- paste(mydata$Date,mydata$Time)
mydata$dateTime <- strptime(mydata$dateTime2, format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)


plot(mydata$dateTime, mydata$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab = " ")

dev.off()