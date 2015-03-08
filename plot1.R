powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,
                             sep = ";", na.strings = "?")
head(powerConsumption)

powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

aux <- powerConsumption$Date == "2007-02-01"  |
       powerConsumption$Date == "2007-02-02"

data <- powerConsumption[aux,]

png(file = "plot1.png", width = 480, heigh = 480)

hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()