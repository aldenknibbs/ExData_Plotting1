##plot2


dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, 
                   header = TRUE, 
                   sep=";", 
                   stringsAsFactors = FALSE, 
                   dec = "."
                   )

subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#cast power
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

#add datetime
datetime <- strptime(
              paste(subSetData$Date, 
                    subSetData$Time, 
                    sep=" "
                    ), 
              "%d/%m/%Y %H:%M:%S"
              ) 


#open device and set resolution
png("plot2.png", width = 480, height = 480, units = "px")

#create line graph
plot(datetime, 
     globalActivePower, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)"
     )

#save
dev.off()