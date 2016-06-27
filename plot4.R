##Across the United States, how have emissions from coal 
##combustion-related sources changed from 1999-2008?

zipfile <- "emissiondata.zip"

if (!file.exists(zipfile))
{
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl, zipfile)
}

if (!(file.exists("summarySCC_PM25.rds")|file.exists("Source_Classification_Code.rds")))
  unzip(zipfile)

emissionsdata<-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")

#ignore.case=FALSE to not include Charcoal sources
scc<-scc[grepl("Coal", scc$Short.Name),]
coalEmission <- merge(emissionsdata, scc, by="SCC")

totalemission <- aggregate(Emissions ~ year, coalEmission, sum)
totalemission$Emissions<-totalemission$Emissions/1000

png('plot4.png')
barplot(totalemission$Emissions, names.arg = totalemission$year, xlab="Year", 
        ylab="Emission (thousand tons)", col="gray", pch=19, 
        main= "Total PM2.5 Emissions from Coal Sources, 1999-2008")
dev.off()
