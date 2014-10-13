


epc<-read.csv('household_power_consumption.txt', sep=';')

wd<-as.Date(epc$Date, "%d/%m/%Y")
epc$Date<-wd


myData<-epc[(epc$Date=='2007-02-01' | epc$Date=='2007-02-02'),]
myData<-data.frame(DateTime =strptime(paste(as.character(myData$Date), myData$Time), format = "%Y-%m-%d %H:%M:%S"), myData)

png(file="RPlot2.png")
plot(myData$DateTime, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
