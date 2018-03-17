setwd("/Users/spandana/Desktop")
powerdata <- read.csv("/Users/spandana/Desktop/household_power_consumption.txt",header=T,sep=";",na.strings="?")
twodays <- subset(powerdata,Date %in% c("1/2/2007", "2/2/2007"))
twodays$Date <- as.Date(twodays$Date,format="%d/%m/%Y")
hist(twodays$Global_active_power,main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png,file="/Users/spandana/Desktop/plot1.png",height=480, width=480)
dev.off()
