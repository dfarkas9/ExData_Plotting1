#loading data and setting up data
classes <- c("character", "character", rep("numeric",7))
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075260, stringsAsFactors=FALSE, na.strings="?", colClasses=classes)
dat[,1] <- as.Date(dat[, 1], "%d/%m/%Y")
dat <- subset(dat, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
Sys.setlocale("LC_TIME", "C")

#plotting
hist(dat$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.copy(png,"plot1.png", width = 480, height = 480, units = "px")
dev.off()
