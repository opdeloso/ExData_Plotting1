powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,
                             sep = ";", na.strings = "?")
head(powerConsumption)

powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

aux <- powerConsumption$Date == "2007-02-01"  |
        powerConsumption$Date == "2007-02-02"

data <- powerConsumption[aux,]


old <- Sys.getlocale("LC_TIME");
Sys.setlocale("LC_TIME", "English")

x <- paste(data$Date, data$Time)
x <- strptime(x, "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, heigh = 480)

plot(x, data$Global_active_power, type = "l",
     main = "Global Active Power",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()

Sys.setlocale("LC_TIME", old)