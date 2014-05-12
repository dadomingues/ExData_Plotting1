plot4 <- function() {
    # read the original file
    df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") 
    # create a smaller dataset with the interesting data - work dataset
    workds <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
    # date & time to be X
    datetime <- strptime(paste(workds$Date, workds$Time, sep=" "), format = '%d/%m/%Y %H:%M:%S')
    
    ## Build a new data frame with only the required data for plot 2
    subds <- data.frame(datetime, workds[,c(3:5,7:9)])
    
    # column names of the new subset
    colnames(subds) <- c('datetime','gap','grp','volt','s1','s2','s3')
    
    par(mfrow=c(2,2))
    
    # i dont get change the labels from portuguese to english
    
    with(subds,{
        # 1
        plot(gap ~ datetime, type="l", xlab="", ylab="Global Active Power")
        
        # 2
        plot(volt ~ datetime, type="l")
        
        # 3
        plot(s1 ~ datetime, col = c('black', 'red', 'blue'), type = 'l', xlab = '', ylab = 'Energy sub metering')
        lines(s2 ~ datetime, col = 'red')
        lines(s3 ~ datetime, col = 'blue')
        legend("topright", bty = "n", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, lwd = 1, cex=0.95)
        
        # 4
        plot(grp ~ datetime, type="l")
    })
    
    dev.copy(png, file="plot4.png") # copy my plot to a PNG file
    dev.off() # close the PNG device!
    
}