#reading in data
all_data<-read.table('household_power_consumption.txt',header=TRUE,sep=";")

#subsetting the data to only include the desired dates
subsetdata<-all_data[all_data$Date=="1/2/2007"|all_data$Date=="2/2/2007",]

#alter the format of the Date column and adds a new POSIXlt column called 'Date_and_time'
subsetdata$Date<-as.Date(subsetdata$Date,format="%d/%m/%Y")
subsetdata$Date_and_time<-do.call(paste, subsetdata[c(1, 2)],)
subsetdata$Date_and_time<-strptime(subsetdata$Date_and_time, "%Y-%m-%d %H:%M:%S")

#generate plot 3
png(file = "plot3.png")
plot(subsetdata$Date_and_time,subsetdata$Sub_metering_1,type='l',col='black', xlab="",ylab="Energy sub metering")
lines(subsetdata$Date_and_time,subsetdata$Sub_metering_2,col='red')
lines(subsetdata$Date_and_time,subsetdata$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
dev.off()
