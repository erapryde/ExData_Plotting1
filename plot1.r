plot1 <-function(){
  
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
    
  #Plot 1
  png(file = "plot1.png", bg = "white",width = 480, height = 480, units = "px", pointsize = 12,  res = NA)
  hist(x$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  rect(1, 5, 3, 7, col = "white")
  dev.off()
}
