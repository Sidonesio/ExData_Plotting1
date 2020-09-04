
# setting the work directory
setwd("C:/Users/usuario/OneDrive/Capacitação/Data Science/4. Exploratory Data Analysis/6. Working Directory")

# confirming the work directory
getwd()

# importing data frame
library(readr)
powerconsumption <- read_delim("C:/Users/usuario/OneDrive/Capacitação/Data Science/4. Exploratory Data Analysis/6. Working Directory/powerconsumption.txt", 
                               ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                               trim_ws = TRUE)
View(powerconsumption)

# selecting data
subset <- subset(powerconsumption, powerconsumption$Date=="2007-02-01" | 
                   powerconsumption$Date=="2007-02-02")

# creating variables
Time <- subset$Time
sub1 <- subset$Sub_metering_1
sub2 <- subset$Sub_metering_2
sub3 <- subset$Sub_metering_3
voltage <- subset$Voltage
Global <- subset$Global_active_power
reactive <- subset$Global_reactive_power

# letting 2 plots created without drawing on canvas
plot(Time, sub2, type = "n")
plot(Time, sub3, type = "n")

# setting canvas
par(mfrow = c(2, 2))

# creating plot 1
plot(Time, Global, type = "n", xlab = "", ylab = "Global Active Power")
lines(Time, Global)

# creating plot 2
plot(Time, voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(Time, voltage)

# creating plot 3
plot(Time, sub1, type = "n", ylab = "Energy sub metering")
lines(Time, sub1)
lines(Time, sub3, col = "blue")
lines(Time, sub2, col = "red")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# creating plot 4
plot(Time, reactive, type ="n", xlab = "datetime", ylab = "Global Reactive Power")
lines(Time, reactive)

# creating png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()



