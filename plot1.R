plot1 <- function() {
    # read the original file
    df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") 
    # create a smaller dataset with the interesting data - work dataset
    workds <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
    
    # png(filename='plot1.png', bg = 'transparent')
    hist(workds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200))
    dev.copy(png, file="plot1.png") # copy my plot to a PNG file
    dev.off() # close the PNG device!
    
}
