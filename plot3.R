
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
hpc$Date2 <- as.Date(hpc$Date, format = "%d/%m/%Y")
mydata <- subset(hpc, Date2 == "2007-02-02" | Date2 == "2007-02-01")

mydata$dateTime2 <- paste(mydata$Date,mydata$Time)
mydata$dateTime <- strptime(mydata$dateTime2, format="%d/%m/%Y %H:%M:%S")


png(filename = "plot3.png", width = 480, height = 480)

plot(mydata$dateTime, mydata$Sub_metering_1, type="n", xlab=" ", ylab="Energy sub metering")

lines(mydata$dateTime, mydata$Sub_metering_1)
lines(mydata$dateTime, mydata$Sub_metering_2, col = "red")
lines(mydata$dateTime, mydata$Sub_metering_3, col= "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


