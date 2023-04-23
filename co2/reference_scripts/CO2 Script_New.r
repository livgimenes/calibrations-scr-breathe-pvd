#Load Data into R
Sensor01_Data <- read.csv("Sensor01_20220711_050000_20220715_050000.csv")
Sensor08_Data <- read.csv("Sensor08_20220711_050000_20220715_050000.csv")
Sensor09_Data <- read.csv("Sensor09_20220711_050000_20220715_050000.csv")
Sensor11_Data <- read.csv("Sensor11_20220711_050000_20220715_050000.csv")
Sensor13_Data <- read.csv("Sensor13_20220711_050000_20220715_050000.csv")

#Remove Missing Data
Sensor01_Data[Sensor01_Data == -999] <- NA
Sensor08_Data[Sensor08_Data == -999] <- NA
Sensor09_Data[Sensor09_Data == -999] <- NA
Sensor11_Data[Sensor11_Data == -999] <- NA
Sensor13_Data[Sensor13_Data == -999] <- NA

#Convert Date to Useable Format
library(lubridate)  
library(dplyr)
colnames(Sensor01_Data)[3] <- "Date"
Sensor01_Data$Date <- as_datetime(Sensor01_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor01_Data$Sensor <- "Sensor01"  
Sensor01_Data$Date_EST <- Sensor01_Data$Date - hms("05:00:00")
View(Sensor01_Data)



colnames(Sensor08_Data)[3] <- "Date"
Sensor08_Data$Date <- as_datetime(Sensor08_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor08_Data$Sensor <- "Sensor08"  
Sensor08_Data$Date_EST <- Sensor08_Data$Date - hms("05:00:00")
View(Sensor08_Data)


colnames(Sensor09_Data)[3] <- "Date"
Sensor09_Data$Date <- as_datetime(Sensor09_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor09_Data$Sensor <- "Sensor09"  
Sensor09_Data$Date_EST <- Sensor09_Data$Date - hms("05:00:00")
View(Sensor09_Data)


colnames(Sensor11_Data)[3] <- "Date"
Sensor11_Data$Date <- as_datetime(Sensor11_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor11_Data$Sensor <- "Sensor11"  
Sensor11_Data$Date_EST <- Sensor11_Data$Date - hms("05:00:00")
View(Sensor11_Data)


colnames(Sensor13_Data)[3] <- "Date"
Sensor13_Data$Date <- as_datetime(Sensor13_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor13_Data$Sensor <- "Sensor13"  
Sensor13_Data$Date_EST <- Sensor13_Data$Date - hms("05:00:00")
View(Sensor13_Data)




#Combine Data for Plotting
All_Sensors <- bind_rows(Sensor01_Data,Sensor08_Data,Sensor09_Data,Sensor11_Data,Sensor13_Data)



#Extract 10 percentile
Sensor01_CO2_STP_10_percentile <- quantile(Sensor01_Data$co2_corrected_avg, probs = c(.1), na.rm = TRUE)
Sensor08_CO2_STP_10_percentile <- quantile(Sensor08_Data$co2_corrected_avg, probs = c(.1), na.rm = TRUE)
Sensor09_CO2_STP_10_percentile <- quantile(Sensor09_Data$co2_corrected_avg, probs = c(.1), na.rm = TRUE)
Sensor11_CO2_STP_10_percentile <- quantile(Sensor11_Data$co2_corrected_avg, probs = c(.1), na.rm = TRUE)
Sensor13_CO2_STP_10_percentile <- quantile(Sensor13_Data$co2_corrected_avg, probs = c(.1), na.rm = TRUE)

a <- c(Sensor01_CO2_STP_10_percentile, Sensor08_CO2_STP_10_percentile, Sensor09_CO2_STP_10_percentile, Sensor11_CO2_STP_10_percentile, Sensor13_CO2_STP_10_percentile)

CO2_median_10 <- median(a)



#Correct for the offset to median
co2_corrected_avg_Sensor01_offset <- Sensor01_CO2_STP_10_percentile - CO2_median_10
co2_corrected_avg_Sensor08_offset <- Sensor08_CO2_STP_10_percentile - CO2_median_10
co2_corrected_avg_Sensor09_offset <- Sensor09_CO2_STP_10_percentile - CO2_median_10
co2_corrected_avg_Sensor11_offset <- Sensor11_CO2_STP_10_percentile - CO2_median_10
co2_corrected_avg_Sensor13_offset <- Sensor13_CO2_STP_10_percentile - CO2_median_10




Sensor01_Data$co2_corrected_avg_offset <- Sensor01_Data$co2_corrected_avg - co2_corrected_avg_Sensor01_offset
Sensor08_Data$co2_corrected_avg_offset <- Sensor08_Data$co2_corrected_avg - co2_corrected_avg_Sensor08_offset
Sensor09_Data$co2_corrected_avg_offset <- Sensor09_Data$co2_corrected_avg - co2_corrected_avg_Sensor09_offset
Sensor11_Data$co2_corrected_avg_offset <- Sensor11_Data$co2_corrected_avg - co2_corrected_avg_Sensor11_offset
Sensor13_Data$co2_corrected_avg_offset <- Sensor13_Data$co2_corrected_avg - co2_corrected_avg_Sensor13_offset

View(Sensor01_Data)

#Combine Data for Plotting
All_Sensors <- bind_rows(Sensor01_Data,Sensor08_Data,Sensor09_Data,Sensor11_Data,Sensor13_Data)


#Plot Raw Data
library(ggplot2)
co2_corrected_avg_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date_EST, y=co2_corrected_avg, color=Sensor))+theme_bw()+theme(legend.position = "none")
co2_corrected_avg_offset_plot <- ggplot(data=All_Sensors)+geom_line(aes(x=Date_EST, y=co2_corrected_avg_offset, color=Sensor))+theme_bw()+theme(legend.position = "none")

co2_corrected_avg_plot_raw
co2_corrected_avg_offset_plot



#Define CO2_corrected_avg
co2_STP_offset_Sensor01 <- Sensor01_Data$co2_corrected_avg_offset
co2_STP_offset_Sensor08 <- Sensor08_Data$co2_corrected_avg_offset
co2_STP_offset_Sensor09 <- Sensor09_Data$co2_corrected_avg_offset
co2_STP_offset_Sensor11 <- Sensor11_Data$co2_corrected_avg_offset
co2_STP_offset_Sensor13 <- Sensor13_Data$co2_corrected_avg_offset

CO2_offset_data <- cbind.data.frame(Sensor01_Data$Date_EST,Sensor01_Data$co2_corrected_avg_offset,Sensor08_Data$co2_corrected_avg_offset,Sensor09_Data$co2_corrected_avg_offset,Sensor11_Data$co2_corrected_avg_offset,Sensor13_Data$co2_corrected_avg_offset)
View(CO2_offset_data)

CO2_offset_data$CO2_means <-apply(CO2_offset_data[,2:6],1,mean)
View(CO2_offset_data)


##Calculate the standard error of CO2_offset

co2_ofset_error_Sensor01 <- CO2_offset_data$`Sensor01_Data$co2_corrected_avg_offset`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor08 <- CO2_offset_data$`Sensor08_Data$co2_corrected_avg_offset`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor09 <- CO2_offset_data$`Sensor09_Data$co2_corrected_avg_offset`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor11 <- CO2_offset_data$`Sensor11_Data$co2_corrected_avg_offset`     - CO2_offset_data$CO2_means
co2_ofset_error_Sensor13 <- CO2_offset_data$`Sensor13_Data$co2_corrected_avg_offset`     - CO2_offset_data$CO2_means 


mean(co2_ofset_error_Sensor01, na.rm = TRUE)
mean(co2_ofset_error_Sensor08, na.rm = TRUE)
mean(co2_ofset_error_Sensor09, na.rm = TRUE)
mean(co2_ofset_error_Sensor11, na.rm = TRUE)
mean(co2_ofset_error_Sensor13, na.rm = TRUE)




##T-dependent CO2 offset correction:
co2_T_DEP_offset_error_Sensor01 <- Sensor01_Data$vaisala_temp*(-0.10272) + 54.0054
co2_T_DEP_offset_error_Sensor08 <- Sensor08_Data$vaisala_temp*(-0.33973) + 6.000481
co2_T_DEP_offset_error_Sensor09 <-  Sensor09_Data$vaisala_temp*(-0.1881) + 8.246302
co2_T_DEP_offset_error_Sensor11 <- Sensor11_Data$vaisala_temp*(-0.59187) + 13.7505
co2_T_DEP_offset_error_Sensor13 <- 0

##Apply T-dependent CO2 Correction
Sensor01_Data$co2_corrected_avg_offset_T_DEP <- Sensor01_Data$co2_corrected_avg - co2_T_DEP_offset_error_Sensor01
Sensor08_Data$co2_corrected_avg_offset_T_DEP <- Sensor08_Data$co2_corrected_avg - co2_T_DEP_offset_error_Sensor08
Sensor09_Data$co2_corrected_avg_offset_T_DEP <- Sensor09_Data$co2_corrected_avg - co2_T_DEP_offset_error_Sensor09
Sensor11_Data$co2_corrected_avg_offset_T_DEP <- Sensor11_Data$co2_corrected_avg - co2_T_DEP_offset_error_Sensor11
Sensor13_Data$co2_corrected_avg_offset_T_DEP <- Sensor13_Data$co2_corrected_avg - co2_T_DEP_offset_error_Sensor13

CO2_offset_data <- cbind.data.frame(Sensor01_Data$Date_EST,Sensor01_Data$co2_corrected_avg_offset_T_DEP,Sensor08_Data$co2_corrected_avg_offset_T_DEP,Sensor09_Data$co2_corrected_avg_offset_T_DEP,Sensor11_Data$co2_corrected_avg_offset_T_DEP,Sensor13_Data$co2_corrected_avg_offset_T_DEP)
View(CO2_offset_data)

CO2_offset_data$CO2_means <-apply(CO2_offset_data[,2:6],1,mean)
View(CO2_offset_data)




##Calculate the standard error of CO2_offset

co2_ofset_error_Sensor01 <- CO2_offset_data$`Sensor01_Data$co2_corrected_avg_offset_T_DEP`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor08 <- CO2_offset_data$`Sensor08_Data$co2_corrected_avg_offset_T_DEP`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor09 <- CO2_offset_data$`Sensor09_Data$co2_corrected_avg_offset_T_DEP`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor11 <- CO2_offset_data$`Sensor11_Data$co2_corrected_avg_offset_T_DEP`     - CO2_offset_data$CO2_means 
co2_ofset_error_Sensor13 <- CO2_offset_data$`Sensor13_Data$co2_corrected_avg_offset_T_DEP`     - CO2_offset_data$CO2_means 


mean(co2_ofset_error_Sensor01, na.rm = TRUE)
mean(co2_ofset_error_Sensor08, na.rm = TRUE)
mean(co2_ofset_error_Sensor09, na.rm = TRUE)
mean(co2_ofset_error_Sensor11, na.rm = TRUE)
mean(co2_ofset_error_Sensor13, na.rm = TRUE)


All_Sensors <- bind_rows(Sensor01_Data,Sensor08_Data,Sensor09_Data,Sensor11_Data,Sensor13_Data)
View(All_Sensors)
co2_corrected_avg_offset_plot_T_DEP <- ggplot(data=All_Sensors)+geom_line(aes(x=Date_EST, y=co2_corrected_avg_offset_T_DEP, color=Sensor))+theme_bw()+theme(legend.position = "none")

co2_corrected_avg_offset_plot_T_DEP
