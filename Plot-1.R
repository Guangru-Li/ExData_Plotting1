##my first formal R script, it is to analyse electric power consumption

filename<-"./household_power_consumption.txt"
###  read data
data<-read.table(text=grep("^[1,2]/2/2007",readLines(filename),value=TRUE),sep=';', 
          col.names=c("Date", "Time","Global_active_power", "Global_reactive_power","Voltage",
          "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings="?")

##plot1

if(!file.exists("Figures")) dir.create("Figures")
png(filename="plot1.png",width=480,height=480,units='px')
hist(data$Global_active_power,xlab="Global Active Power(kilowatt)",main="Global Active Power",col="red")
dev.off()





