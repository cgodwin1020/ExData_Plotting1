

hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
hpc$Date2 <- as.Date(hpc$Date, format = "%d/%m/%Y")
mydata <- subset(hpc, Date2 == "2007-02-02" | Date2 == "2007-02-01")




png(filename = "plot1.png", width = 480, height = 480)

hist(mydata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",  yaxt="n")

axis(side=2, at=seq(0,1200, 200), labels=TRUE,  xpd = TRUE)

dev.off()