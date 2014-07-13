#loading data and setting up data
classes <- c("character", "character", rep("numeric",7))
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075260, stringsAsFactors=FALSE, na.strings="?", colClasses=classes)
dat[,1] <- as.Date(dat[, 1], "%d/%m/%Y")
dat <- subset(dat, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
Sys.setlocale("LC_TIME", "C")
dateTime <- strptime(paste(dat[,1], dat[,2]), format="%Y-%m-%d %H:%M:%S")
dat <- cbind(dateTime, dat[,3:9])

#plotting
plot(dat$dateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(dat$dateTime,dat$Sub_metering_2,col="red",type="l")
points(dat$dateTime,dat$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,col=c("black","red","blue"),legend=colnames(dat[,6:8]))
dev.copy(png,"plot3.png", width = 480, height = 480, units = "px")
dev.off()
