##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008?

library(ggplot2)


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

png('plot3.png')

ggplot(baltimoremission,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") + guides(fill=FALSE)+
  facet_grid(.~type) + labs(x="year", y="Emission (tons)", 
  title="Total PM2.5 Emissions from 1999-2008 in Baltimore City by Source Type")

dev.off()