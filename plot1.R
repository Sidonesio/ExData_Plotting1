
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

# constructing the graphic plot 1 and the file png
windows()
hist(subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
