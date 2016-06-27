##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.

zipfile <- "emissiondata.zip"

if (!file.exists(zipfile))
{
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl, zipfile)
}

if (!file.exists("summarySCC_PM25.rds"))
  unzip(zipfile)

emissionsdata<-readRDS("summarySCC_PM25.rds")
baltimoremission<-subset(emissionsdata, emissionsdata$fips=="24510")
totalemission <- aggregate(Emissions ~ year, baltimoremission, sum)
totalemission$Emissions<-totalemission$Emissions/1000

png('plot2.png')
barplot(totalemission$Emissions, names.arg = totalemission$year, xlab="Year", 
        ylab="Emission (thousand tons)", main= "Total PM2.5 Emissions from 1999-2008 in Baltimore City")
dev.off()