library(lubridate)


file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

head(data)
dim(data)
str(data)

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

data_1 <- data |> mutate(Date = dmy(data$Date))

str(data_1)
head(data_1)

# plot 1
hist(data_1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# plot 2
data_2 <- data |> mutate(date_time = paste(Date, Time)) |> 
  mutate(date_time = dmy_hms(date_time))
str(data_2)

plot(data_2$date_time, data_2$Global_active_power, ylab = "Global Active Power (kilowatts)",
     xlab = "", type = "l")

# plot 3

plot(data_2$date_time, data_2$Sub_metering_1, ylab = "Energy Sub Metering",
     xlab = "", type = "l", col = "black")
lines(data_2$date_time, data_2$Sub_metering_2, col = "red")
lines(data_2$date_time, data_2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# plot 4
par(mfrow = c(2,2))

plot(data_2$date_time, data_2$Global_active_power, ylab = "Global Active Power (kilowatts)",
     xlab = "", type = "l")

plot(data_2$date_time, data_2$Voltage, ylab = "Voltage",
     xlab = "datetime", type = "l")

plot(data_2$date_time, data_2$Sub_metering_1, ylab = "Energy Sub Metering",
     xlab = "", type = "l", col = "black")
lines(data_2$date_time, data_2$Sub_metering_2, col = "red")
lines(data_2$date_time, data_2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(data_2$date_time, data_2$Global_reactive_power, ylab = "Global Reactive Power",
     xlab = "datetime", type = "l")





