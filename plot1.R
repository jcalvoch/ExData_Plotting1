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
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")


#Filtering data from 2007-02-01 to 2007-02-02
hpc <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")


# Preparing PNG file
png(filename = "plot1.png", width = 480, height = 480)


#Creating graph
hist(hpc$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")


#Turning off connection with device
dev.off()