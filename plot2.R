plot2 <- function() {
    # read the original file
    df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") 
    # create a smaller dataset with the interesting data - work dataset
    workds <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
    # date & time to be X
    datetime <- strptime(paste(workds$Date, workds$Time, sep=" "), format = '%d/%m/%Y %H:%M:%S')

    ## Build a new data frame with only the required data for plot 2
    subds <- data.frame(datetime, workds[,3:3])
    
    # column names of the new subset
    colnames(subds) <- c('datetime', 'globalap')
    
    # i dont get change the labels from portuguese to english
    with(subds,
         plot(datetime, globalap, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    )
    dev.copy(png, file="plot2.png") # copy my plot to a PNG file
    dev.off() # close the PNG device!
    
}