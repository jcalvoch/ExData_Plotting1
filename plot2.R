#Plot 1 Graph Script

#Checking if required files exist
if (!file.exists("household_power_consumption.txt"))
{
    if (!file.exists("exdata_data_household_power_consumption.zip"))
    {
        print("Downloading required files...")
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip")
    }
    
    
    unzip("exdata_data_household_power_consumption.zip")
}


#Reading data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


#Filtering data from 2007-02-01 to 2007-02-02
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")


#Combining date and time variables
dateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")


# Preparing PNG file
png(filename = "plot2.png", height = 480, width = 480)


#Creating graph
plot(dateTime, hpc$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = NA, type = "l")


#Turning off connection with device
dev.off()



