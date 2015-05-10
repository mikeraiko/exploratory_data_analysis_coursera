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

# Plot 3
png("plot3.png")
plot(power_sub$DateTime, power_sub$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(power_sub$DateTime, power_sub$Sub_metering_2, col="red")
lines(power_sub$DateTime, power_sub$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
