filename<-"./household_power_consumption.txt"
###  read data
data<-read.table(text=grep("^[1,2]/2/2007",readLines(filename),value=TRUE),sep=';', 
                 col.names=c("Date", "Time","Global_active_power", "Global_reactive_power","Voltage",
                             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings="?")



##plot3
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Weekday <-as.POSIXct(paste(data$Date, data$Time))
if(!file.exists("Figures")) dir.create("Figures")
png(filename="plot3.png",width=480,height=480,units="px")
Sys.setlocale(category="LC_ALL",locale="english")
plot(data$Weekday, data$Sub_metering_1, xlab="", ylab="Global Active Powr(kilowatt)", type = "l")
lines(data$Weekday, data$Sub_metering_2,col="red")
lines(data$Weekday, data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3"), lwd=1, bty="o")

dev.off()