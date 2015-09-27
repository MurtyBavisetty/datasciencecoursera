# Exploratory Analysis - Project 2

# Read the data from both files and save them in to different data frames
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Convert the type and year variables in the data set to type factor
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

# Address the following questions
#
# Q1: Have total emissions from PM2.5 decreased in the United States from 
#     1999 to 2008? Using the base plotting system, make a plot showing the 
#     total PM2.5 emission from all sources for each of the years 
#     1999, 2002, 2005, and 2008.
#
total_PM25_emmission_year <- tapply(NEI$Emissions, NEI$year, sum)
barplot(total_PM25_emmission_year)
title(main= "Total PM2.5 Emission", ylab="PM2.5 emission (tons)", xlab="Year")

## Note: The PM2.5 emissions in US is steadily decresing during 1999-2008

# ============================================================================




# Q2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
#
baltimore_data <- subset(NEI, NEI$fips =="24510")

baltimore_emissions <- tapply(baltimore_data$Emissions, baltimore_data$year, sum)
# Capture the data for Baltimore city (fips =="24510") as a subset
barplot(baltimore_emissions)
title(main= "Baltimore Emissions", ylab="PM2.5 emission (tons)", xlab="Year")


# Q3:Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#    nonroad) variable, which of these four sources have seen decreases in emissions
#    from 1999???2008 for Baltimore City? Which have seen increases in emissions 
#    from 1999???2008? Use the ggplot2 plotting system to make a plot answer this question.
#
library(ggplot2)
str(baltimore_data)
qplot(year, Emissions, data= baltimore_data, facets= .~type , col = type)


#Q4: Across the United States, how have emissions from coal combustion-related 
#    sources changed from 1999???2008?
#




#Q5: How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?
#
#


#Q6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#    vehicle sources in Los Angeles County, California (fips == "06037"). 
#    Which city has seen greater changes over time in motor vehicle emissions?
#

