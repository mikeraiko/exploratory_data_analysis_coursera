#setwd("Coursera/Exploratory data analysis/")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./powerdata.zip", method="curl")
#unzip ("powerdata.zip")
power<-read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?")


#You may find it useful to convert the Date and Time variables 
#to Date/Time classes in R using the strptime() and as.Date() functions
power$DateTime<-paste(power$Date, power$Time)
power$DateTime<- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

#We will only be using data from the dates 2007-02-01 and 2007-02-02.
power_sub <- subset(power, (Date == "1/2/2007") | (Date == "2/2/2007"))

# Plot 1
png("plot1.png")
hist(power_sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
