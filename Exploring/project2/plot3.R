setwd('~/Coursera/Exploring/project2')

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/exdata-data-NEI_data/Source_Classification_Code.rds")

# subset Baltimore, Maryland '24510
baltimore <- NEI[NEI$fips == 24510,]

#
library(plyr)
# .fun is not a function
# for the sum() we need to define an anomynomous function
typeEmissionsBaltimore <- ddply(baltimore, c("year", "type"),
                                function(baltimore) sum(baltimore$Emissions))


library(ggplot2)
png("plot3.png")
p <- qplot(year, V1, 
    data = typeEmissionsBaltimore, color = type, geom = "line") + 
    ggtitle("Baltimore City PM_2.5 Emmission by source, type and year") + 
    xlab("Year") + 
    ylab("Total PM_2.5 Emissions (tons)")
dev.off()