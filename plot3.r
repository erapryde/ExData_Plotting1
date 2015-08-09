plot3 <- function() {
  
  #Figure out where to start and stop reading
  a<-read.csv("household_power_consumption.txt",sep=";",nrows = 1)
  names <-attributes(a)$name
  a<-as.Date(a[1,1], "%d/%m/%Y")
  d <- as.numeric(as.Date("01/02/2007","%d/%m/%Y")-a)
  d = d*24*60-1044
  #a<-read.csv("household_power_consumption.txt", sep=";",nrows = 1)[,2]
  x<-read.csv("household_power_consumption.txt", sep=";", nrows = 2880, skip = d, col.names=names)
  x$Date<-as.Date(x$Date,"%d/%m/%Y")
  x$Time <- paste(x$Date, x$Time)
  x$Time<-strptime(x$Time,format = "%Y-%m-%d %H:%M:%S",tz="")
  x<-x[,2:9]
  head(x)
  rm(a,d,names)  
  
  #Plot 3
  png(file = "plot3.png", bg = "white",width = 480, height = 480, units = "px", pointsize = 12,  res = NA)
  plot(y = x$Sub_metering_1, x = x$Time, type = "l", col = "black" , ylab = "Energy sub metering" , xlab = "")
  lines(x$Sub_metering_2, x = x$Time, type = "l", col = "red", ylab = "Energy sub metering" , xlab = "")
  lines(x$Sub_metering_3, x = x$Time, type = "l", col = "blue", ylab = "Energy sub metering" , xlab = "")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
  rect(1, 5, 3, 7, col = "white")
  dev.off()
}
