
epc<-read.csv('household_power_consumption.txt', sep=';')

wd<-as.Date(epc$Date, "%d/%m/%Y")
epc$Date<-wd


myData<-epc[(epc$Date=='2007-02-01' | epc$Date=='2007-02-02'),]
myData<-data.frame(DateTime=strptime(paste(as.character(myData$Date), myData$Time), format = "%Y-%m-%d %H:%M:%S"), myData)

myData$Sub_metering_1<-as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2<-as.numeric(myData$Sub_metering_2)
myData$Sub_metering_3<-as.numeric(myData$Sub_metering_3)

png(file="RPlot3.png")
with (myData, {
  plot (DateTime, Sub_metering_1, type="l", col="black", xlab="", ylim=c(0,34), ylab="Energy sub metering")
  lines (DateTime, Sub_metering_2, type="l", col="red")
  lines (DateTime,Sub_metering_3, type="l", col="blue" )
})
dev.off()



#png(file="RPlot2.png")
#plot(myData$DateTime, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#dev.off()
