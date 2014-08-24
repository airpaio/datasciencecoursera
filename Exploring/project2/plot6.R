setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
#NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
#SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

## getting data for Baltimore
motorSCC <- grep("[Vv]ehicles", SCC$EI.Sector)
motorSCC <- SCC[motorSCC, ]
motorNEI <- NEI[NEI$SCC %in% motorSCC$SCC, ]
motorNEI <- motorNEI[(motorNEI$fips == "24510") | (motorNEI$fips == "06037"), ]
motorNEI <- transform(motorNEI, 
                      region = ifelse(fips == "24510", "Baltimore", 
                                      "Los Angeles"))

library(plyr)
motorTotals <- ddply(motorNEI, .(year, region), function(x) sum(x$Emissions))
names(motorTotals)[3] <- "Emissions"


library(ggplot2)
png("plot6a.png")
p <- qplot(year, Emissions, data=motorTotals, color=region, geom="line") +
    ggtitle("Total Vehicle Emissions of PM_2.5 (Yearly)") +
    xlab("Year") +
    ylab("Total PM_2.5 Emissions (tons)")
dev.off