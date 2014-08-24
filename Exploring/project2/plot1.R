setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# we dont exactly have a clean time series, so we sum the emissions data
# in each year using tapply
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

#png("plot1.png")
plot(unique(NEI$year), totalEmissions, type="l",
     xlab="Year", ylab="Total PM_2.5 Emissions (tons)",
     main="Total US Emissions of PM_2.5 (Yearly)", lwd=2)
#dev.off()