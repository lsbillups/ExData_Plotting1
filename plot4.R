rm(list=ls())
projdata1<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=FALSE)
projuse<-projdata1[projdata1$Date=="1/2/2007"|projdata1$Date=="2/2/2007",]

png(filename="plot4.png",width=480,height=480,units="px")

par(mfcol=c(2,2))

projuse$Global_active_power<-as.numeric(projuse$Global_active_power)
projuse$Newdate<-paste(projuse$Date,projuse$Time)
projuse$Newdate<-strptime(projuse$Newdate,"%d/%m/%Y %H:%M:%S")
plot(projuse$Newdate,projuse$Global_active_power,type="l",xlab="",ylab="Global Active Power")

projuse$Sub_metering_1<-as.numeric(projuse$Sub_metering_1)
projuse$Sub_metering_2<-as.numeric(projuse$Sub_metering_2)
with(projuse,plot(Newdate,Sub_metering_1,xlab="",type="n",
                  ylab="Energy sub metering",))
axis(side=2,at=c(0,10,20,30))
legend("topright",lty=c(1,1,1),bty="n",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(projuse,lines(Newdate,Sub_metering_1))
with(projuse,lines(Newdate,Sub_metering_2,col="red"))
with(projuse,lines(Newdate,Sub_metering_3,col="blue"))

projuse$Voltage<-as.numeric(projuse$Voltage)
with(projuse,plot(Newdate,Voltage,type="l",xlab="datetime",ylab="Voltage"))
axis(side=2,at=c(234,238,242,246))

projuse$Global_reactive_power<-as.numeric(projuse$Global_reactive_power)
with(projuse,plot(Newdate,Global_reactive_power,xlab="datetime",type="l"))

dev.off()
