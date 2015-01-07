#reading in data
all_data<-read.table('household_power_consumption.txt',header=TRUE,sep=";")

#subsetting the data to only include the desired dates
subsetdata<-all_data[all_data$Date=="1/2/2007"|all_data$Date=="2/2/2007",]

#generating the first plot
png(file = "plot1.png")
hist(as.numeric(subsetdata$Global_active_power),col=130,xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()