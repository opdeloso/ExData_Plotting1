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

png(file = "plot4.png", width = 480, heigh = 480)

par(mfrow = c(2, 2))

# plot 1

plot(x, data$Global_active_power, type = "l",
     ylab = "Global Active Power",
     xlab = "")

# plot 2

plot(x, data$Voltage, type = "l",
     ylab = "Voltage",
     xlab = "datetime")


# plot 3

plot(x, data$Sub_metering_1,
     type = "l",
     col  = "black",
     ylim = c(0,  max(data$Sub_metering_1)),
     ylab = "",
     xlab = "")

par(new = TRUE)

plot(x, data$Sub_metering_2,
     type = "l",
     col  = "red",
     ylim = c(0,  max(data$Sub_metering_1)),
     ylab = "",
     xlab = "")

par(new = TRUE)

plot(x, data$Sub_metering_3,
     type = "l",
     col  = "blue",
     ylim = c(0,  max(data$Sub_metering_1)),
     ylab = "Energy sub metering",
     xlab = "")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red", "blue"), lty=c(1,1,1), bty ="n")

# plot 4
plot(x, data$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()

Sys.setlocale("LC_TIME", old)