setwd("/Users/spandana/Desktop")
powerdata <- read.csv("/Users/spandana/Desktop/household_power_consumption.txt",header=T,sep=";",na.strings="?")
twodays <- subset(powerdata,Date %in% c("1/2/2007", "2/2/2007"))
twodays$Date <- as.Date(twodays$Date,format="%d/%m/%Y")
twodaydatetime <- paste(as.Date(twodays$Date),twodays$Time)
twodays$Datetime <- as.POSIXct(twodaydatetime)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(twodays,{
  plot(Global_active_power~Datetime,type="l",
       ylab="Global Active Power(kilowatts)",xlab="")
  plot(Voltage~Datetime,type="l",
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Global Active Power(kilowatts)",xlab="")
  lines(Sub_metering_2~Datetime,col="Red")
  lines(Sub_metering_3~Datetime,col="Blue")
  legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global Reactive Power (kilowatts)", xlab="")
})

dev.copy(png,file="/Users/spandana/Desktop/plot4.png",height=480, width=480)
dev.off()