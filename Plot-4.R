
filename<-"./household_power_consumption.txt"
###  read data
data<-read.table(text=grep("^[1,2]/2/2007",readLines(filename),value=TRUE),sep=';', 
                 col.names=c("Date", "Time","Global_active_power", "Global_reactive_power","Voltage",
                             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings="?")

##plot4

data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Weekday <-as.POSIXct(paste(data$Date, data$Time))
if(!file.exists("Figures")) dir.create("Figures")
png(filename="plot4.png",width=480,height=480,units="px")
Sys.setlocale(category="LC_ALL",locale="english")
par(mfrow=rep(2,2))
plot(data$Weekday, data$Global_active_power, xlab="", ylab="Global Active Powr(kilowatt)", type = "l")
plot(data$Weekday, data$Voltage, xlab="datetime", ylab="Voltage", type = "l")
plot(data$Weekday, data$Sub_metering_1, xlab="", ylab="Global Active Powr(kilowatt)", type = "l")
lines(data$Weekday, data$Sub_metering_2,col="red")
lines(data$Weekday, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, bty="n")
plot(data$Weekday, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_powr", type = "l")
dev.off()