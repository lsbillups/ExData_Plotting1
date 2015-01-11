rm(list=ls())
projdata1<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=FALSE)
projuse<-projdata1[projdata1$Date=="1/2/2007"|projdata1$Date=="2/2/2007",]

projuse$Global_active_power<-as.numeric(projuse$Global_active_power)
projuse$Newdate<-paste(projuse$Date,projuse$Time)
projuse$Newdate<-strptime(projuse$Newdate,"%d/%m/%Y %H:%M:%S")
png(filename="plot2.png",width=480,height=480,units="px")
plot(projuse$Newdate,projuse$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
