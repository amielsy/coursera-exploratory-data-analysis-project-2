## Motivation
Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

##Data
The data is available here: https://d396qusza40orc.cloudfront.net/exdata%252Fdata%252FNEI_data.zip

The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 

fips: A five-digit number (represented as a string) indicating the U.S. county  
SCC: The name of the source as indicated by a digit string (see source code classification table)  
Pollutant: A string indicating the pollutant  
Emissions: Amount of PM2.5 emitted, in tons  
type: The type of source (point, non-point, on-road, or non-road)  
year: The year of emissions recorded  
Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.
##Goal

The overall goal is to explore the National Emissions Inventory database and see
what it say about fine particulate matter pollution in the United states over
the 10-year period 1999-2008.

##Questions

  Have total emissions from PM2.5 decreased in the United States from 1999 to
  2008?

  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
  from 1999 to 2008?

  Of the four types of sources indicated by the type (point, nonpoint, onroad,
  nonroad) variable, which of these four sources have seen decreases in
  emissions from 1999-2008 for Baltimore City? Which have seen increases in
  emissions from 1999-2008? 

  Across the United States, how have emissions from coal combustion-related
  sources changed from 1999-2008?

  How have emissions from motor vehicle sources changed from 1999-2008 in
  Baltimore City?

  Compare emissions from motor vehicle sources in Baltimore City with emissions
  from motor vehicle sources in Los Angeles County, California. Which city has
  seen greater changes over time in motor vehicle emissions?
