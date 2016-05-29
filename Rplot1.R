

# Read The file first set the location where you have downloaded the data 
X<-"~/household_power_consumption.txt"
t<-read.csv(X,sep = ";",na.strings="?")
# Create a Subset
F_t<-t[t$Date %in% c("1/2/2007","2/2/2007"),]


# Convert it to Numeric and Plot a Histogram
F_t$Global_active_power<- as.numeric(F_t$Global_active_power)

#Convert to png
png(filename="Plot1.png",width = 480,height = 480)

par(mfrow=c(1,1))
hist(F_t$Global_active_power,col="RED",xlab = "Global Active Power(Kilowatts)",
     main="Global Active Power")

dev.off()

