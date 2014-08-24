setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# selecting rows for vehicle stuff from SCC EI.Sector
motorSCC <- grep("[Vv]ehicles", SCC$EI.Sector)
motorSCC <- SCC[motorSCC, ]
motorNEI <- NEI[NEI$SCC %in% motorSCC$SCC, ]
motorNEIBaltimore <- motorNEI[(motorNEI$fips == "24510"), ]

# aggregating the motor vehicle emissions by year
motorTotals <- with(motorNEIBaltimore, 
                    aggregate(Emissions, by = list(year), sum))
names(motorTotals) <- c("year", "Emissions")

library(ggplot2)
png("plot5.png")
p <- qplot(year, Emissions, data = motorTotals, geom="line") + 
    ggtitle("Baltimore Motor Vehicle PM_2.5 Emissions (tons)") + 
    xlab("Year") + 
    ylab("Total PM_2.5 Emissions (tons)")
dev.off