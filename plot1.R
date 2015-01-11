rm(list=ls())
projdata1<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=FALSE)
projuse<-projdata1[projdata1$Date=="1/2/2007"|projdata1$Date=="2/2/2007",]

projuse$Global_active_power<-as.numeric(projuse$Global_active_power)
png(filename="plot1.png",width=480,height=480,units="px")
hist(projuse$Global_active_power,col="red",breaks=12,xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
