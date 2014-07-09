#setting working directory
#setwd("/Users/myli/Desktop/Data scientist specialization/Propractise/IndividualElectricityPowerConsumption/ExData_Plotting1")

#specify which column to read, columns with type 'NULL' are disregarded
readCol<-c(rep('character',2),'numeric',rep('NULL',6))

#reading the first three columns (Date, Time and Global_active_power) of the whole data set into data
#subsetting data such that it only contains the dates from 1/2/2007 to 2/2/2007 
#Notice that I have try the method of reading line by line and rbind into data, but it is very slow....
data<-read.csv("household_power_consumption.txt", sep=";",na.strings="?",header=TRUE,quote="",colClasses=readCol)
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Open png device; create 'plot1.png' in the working directory
png(file="plot1.png",width = 480, height = 480)
#create plot and send to a file (no plot appears on the screen)
hist(data$Global_active_power,col="red", main="Global active power", xlab ="Global active power (kilowatts)")
#Close the png file device
dev.off()
#Now you can view the file 'plot1.png' on your computer