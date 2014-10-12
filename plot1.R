setwd("C:\\Users\\lnitu\\Documents\\COURSES\\COURSERA\\ExploratoryDataAnalysis\\exdata_data_household_power_consumption")
epc<-read.csv('household_power_consumption.txt', sep=';')

wd<-as.Date(epc$Date, "%d/%m/%Y")
epc$Date<-wd


myData<-epc[(epc$Date=='2007-02-01' | epc$Date=='2007-02-02'),]

png(file="RPlot1.png")
hist(as.numeric(myData$Global_active_power), col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
