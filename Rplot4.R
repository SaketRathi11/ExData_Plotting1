# Read The file first set the location where you have downloaded the data 
X<-"~/household_power_consumption.txt"
t<-read.csv(X,sep = ";",na.strings="?")
# Create a Subset
F_t<-t[t$Date %in% c("1/2/2007","2/2/2007"),]
F_t$datetime <- strptime(paste(F_t$Date, F_t$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Setting the Playarena and plotting 4 Graphs in png format
png(filename="Plot4.png",width = 480,height = 480)

par(mar(5,2,3,2))
par(mfrow=c(2,2))
plot(F_t$datetime,F_t$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power(Kilowatts)")
plot(F_t$datetime,F_t$Voltage,type="l",xlab = "datetime ",ylab = "Volatge")
plot(F_t$datetime,F_t$Sub_metering_1,type="l",xlab = " ",ylab = "Energy Sub Metering")
lines(F_t$datetime,F_t$Sub_metering_2, type="l", col="red")
lines(F_t$datetime,F_t$Sub_metering_3, type="l", col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=1 ,col=c("black","red","blue"))
plot(F_t$datetime,F_t$Global_reactive_power,type="l",xlab = "datetime ",ylab = "Global Reactive Power(Kilowatts)")

dev.off()