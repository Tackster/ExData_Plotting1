### Add correct wd here
setwd("d:/Documents/Dropbox/Courses/Coursera/exdata_plotting/")

### Import Data Set
df_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

### Format and filter Data Set
df_clean <- df_all
df_clean$Date <- strptime(df_all$Date,format = "%d/%m/%Y")
df_clean$Time <- as.POSIXct(paste(df_clean$Date, df_all$Time), format="%Y-%m-%d %H:%M:%S")
df_sub <- df_clean[as.Date(df_clean$Date) >= "2007-02-01" & as.Date(df_clean$Date) <= "2007-02-02",]

### 4 plots
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfcol = c(2,2), mar= c(4, 4, 2, 1))
plot(df_sub$Time, df_sub$Global_active_power, type = "n", main = "", ylab = "Global Active Power (kilowats)", xlab = "")
lines(df_sub$Time, df_sub$Global_active_power, type = "l")
plot(df_sub$Time, df_sub$Sub_metering_1, type = "n", main = "", ylab = "Energy sub metering", xlab = "")
lines(df_sub$Time, df_sub$Sub_metering_1, type = "l", col = "black")
lines(df_sub$Time, df_sub$Sub_metering_2, type = "l", col = "red")
lines(df_sub$Time, df_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lwd = 1, col = c("black","red","blue"))
plot(df_sub$Time, df_sub$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")
lines(df_sub$Time, df_sub$Voltage, type = "l")
plot(df_sub$Time, df_sub$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n")
lines(df_sub$Time, df_sub$Global_reactive_power, type = "l")
dev.off()