#loading data and setting up data
classes <- c("character", "character", rep("numeric",7))
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075260, stringsAsFactors=FALSE, na.strings="?", colClasses=classes)
dat[,1] <- as.Date(dat[, 1], "%d/%m/%Y")
dat <- subset(dat, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
Sys.setlocale("LC_TIME", "C")
dateTime <- strptime(paste(dat[,1], dat[,2]), format="%Y-%m-%d %H:%M:%S")
dat <- cbind(dateTime, dat[,3:9])

#plotting
par(mfrow=c(2,2))
# subplot 1
plot(dat$dateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# subplot 2
plot(dat$dateTime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")
# subplot 3
plot(dat$dateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dat$dateTime,dat$Sub_metering_2,col="red",type="l")
points(dat$dateTime,dat$Sub_metering_3,col="blue",type="l")
legend("top",lty=1,col=c("black","red","blue"),legend=colnames(dat[,6:8]),bty="n",cex=.7)
# subplot 4
plot(dat$dateTime, dat$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
# save png
dev.copy(png,"plot4.png", width = 480, height = 480, units = "px")
dev.off()
