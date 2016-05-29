# Read The file first set the location where you have downloaded the data 
X<-"~/household_power_consumption.txt"
t<-read.csv(X,sep = ";",na.strings="?")
# Create a Subset
F_t<-t[t$Date %in% c("1/2/2007","2/2/2007"),]

#Copnveting and combining Date and time to appropriate format into a new column datetime

png(filename="Plot2.png",width = 480,height = 480)

F_t$datetime <- strptime(paste(F_t$Date, F_t$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(F_t$datetime,F_t$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power(Kilowatts)")

dev.off()