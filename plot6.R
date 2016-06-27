##Compare emissions from motor vehicle sources in Baltimore City with emissions 
##from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?

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
aggrBaltimoreEmission <- aggregate(Emissions ~ year, motorBaltimoreEmission, sum)

motorLosAngelesEmission<-subset(emissionsdata, emissionsdata$fips=="06037" & 
                                 emissionsdata$type=="ON-ROAD")
aggrLosAngelesEmission <- aggregate(Emissions ~ year, motorLosAngelesEmission, sum)

allEmissions<-merge(aggrBaltimoreEmission,aggrLosAngelesEmission, by="year")
png('plot6.png', height = 480, width = 600)
barplot(t(as.matrix(allEmissions[,2:3])), names.arg = allEmissions$year, 
        xlab="Year", ylab="Emission (tons)", col=c("red", "orange"),beside=TRUE,
        main= "PM2.5 Emissions in Baltimore and LA from Motor Vehicles, 1999-2008",
        ylim=c(0,5500))
legend("topleft", c("Baltimore","LA"), bty="n", fill=c("red", "orange"))
dev.off()