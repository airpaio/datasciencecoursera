setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# get coal combustion info from SCC
coalSCC <- grep("[Cc]oal", SCC$Short.Name)
coalSCC <- SCC[coalSCC, ]
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC, ]

# now aggregate the coal data by year
coalTotals <- with(coalNEI, 
                   aggregate(Emissions, by = list(year), sum))
names(coalTotals) <- c("year", "Emissions")

library(ggplot2)
png("plot4.png")
p <- qplot(year, Emissions, data = coalTotals, geom="line") + 
    ggtitle("Coal Combustion PM_2.5 Emissions by Source Type and Year") + 
    xlab("Year") + 
    ylab("Total PM_2.5 Emissions (tons)")
dev.off()
