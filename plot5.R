##How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

zipfile <- "emissiondata.zip"

if (!file.exists(zipfile))
{
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl, zipfile)
}

if (!file.exists("summarySCC_PM25.rds"))
  unzip(zipfile)

emissionsdata<-readRDS("summarySCC_PM25.rds")
## Only get on-road types since looking for motor vehicles
motorBaltimoreEmission<-subset(emissionsdata, emissionsdata$fips=="24510" & 
                                 emissionsdata$type=="ON-ROAD")
totalemission <- aggregate(Emissions ~ year, motorBaltimoreEmission, sum)

png('plot5.png', height = 480, width = 600)
barplot(totalemission$Emissions, names.arg = totalemission$year, 
        xlab="Year", ylab="Emission (tons)", col="light blue",
        main= "PM2.5 Emissions in Baltimore City from Motor Vehicles, 1999-2008")
dev.off()