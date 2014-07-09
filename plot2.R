#setting working directory
#setwd("/Users/myli/Desktop/Data scientist specialization/Propractise/IndividualElectricityPowerConsumption/ExData_Plotting1")

#specify which column to read, columns with type 'NULL' are disregarded
readCol<-c(rep('character',2),'numeric',rep('NULL',6))

#reading the first three columns (Date, Time and Global_active_power) of the whole data set into data
#subsetting data such that it only contains the dates from 1/2/2007 to 2/2/2007 
#Notice that I have try the method of reading line by line and rbind into data, but it is very slow....
data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE,quote="",colClasses=readCol)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#creating a new column 'dt' to combine the Date and Time
dt<-paste(data$Date,data$Time)
#convert the string to date and time
dt<-strptime(dt,"%d/%m/%Y %H:%M:%S")
#column bind to the data set 
data<-cbind(dt,data)


#Open png device; create 'plot2.png' in the working directory
png(file="plot2.png",width = 480, height = 480)
#create plot and send to a file (no plot appears on the screen)
plot(data$dt,data$Global_active_power,xlab="", ylab ="Global active power (kilowatts)",type="l")
#Close the png file device
dev.off()
#Now you can view the file 'plot2.png' on your computer