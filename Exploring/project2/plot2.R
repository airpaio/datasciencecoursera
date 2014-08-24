setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# subset Baltimore, Maryland '24510
baltimore <- NEI[NEI$fips == "24510",]

# sum the emissions by year just as we did in plot1.R
totalEmissionsBaltimore <- tapply(baltimore$Emissions, baltimore$year, sum)

#png("plot2.png")
plot(unique(NEI$year), totalEmissionsBaltimore, type="l",
     xlab="Year", ylab="Total PM_2.5 Emissions (tons)",
     main="Total Baltimore Emissions of PM_2.5 (Yearly)", lwd=2)
#dev.off()     