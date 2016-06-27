#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

zipfile <- "emissiondata.zip"

if (!file.exists(zipfile))
{
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl, zipfile)
}

if (!file.exists("summarySCC_PM25.rds"))
  unzip(zipfile)

emissionsdata<-readRDS("summarySCC_PM25.rds")
totalemission <- aggregate(Emissions ~ year, emissionsdata, sum)
totalemission$Emissions<-totalemission$Emissions/1000000

png('plot1.png')
barplot(totalemission$Emissions, names.arg = totalemission$year, xlab="Year", 
        ylab="Emission (million tons)", col="blue", pch=19, 
        main= "Total PM2.5 Emissions from 1999-2008")
dev.off()
