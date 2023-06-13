#Library
library(ggplot2)
library(openair)
library(lubridate)  
library(dplyr)
library(tidyverse)
library(ggpubr)


#Import Network Data
Data <- read.csv("All_Sensors_CO_60.csv")
Data$Date_EST <- as_datetime(Data$Date_EST, format =  "%Y-%m-%d %H:%M:%S")
View(Data)


Data_New <- cbind.data.frame(Data$Date_EST, Data$Sensor, Data$co_wrk_aux, Data$temp, Data$rh, Data$pressure)
colnames(Data_New) <- c("Date_EST", "Sensor", "co_wrk_aux", "temp", "rh", "pressure") 
View(Data_New)



#Plot Network Data
co_wrk_aux_raw <- ggplot(data=Data_New)+geom_line(aes(x=Date_EST, y=co_wrk_aux, color=Sensor))+theme_bw()+theme(legend.position = "right")
co_wrk_aux_raw


#Reference co_wrk_aux Data:

##Reference-Sensor01
Sensor01 <- filter(Data_New, Sensor == "Sensor01")
Sensor01$co_wrk_aux_ref <- Sensor01$co_wrk_aux
Sensor01$lat <- "41.841831"
Sensor01$lon <- "-71.360649"

##Reference-Sensor02
Sensor02 <- filter(Data_New, Sensor == "Sensor02")
Sensor02$co_wrk_aux_ref <- Sensor02$co_wrk_aux*0.963031+-0.01148
Sensor02$lat <- "41.81052"
Sensor02$lon <- "-71.44752"

##Reference-Sensor03
Sensor03 <- filter(Data_New, Sensor == "Sensor03")
Sensor03$co_wrk_aux_ref <- Sensor03$co_wrk_aux*0.994761+0.020827
Sensor03$lat <- "41.79157"
Sensor03$lon <- "-71.42788"

##Reference-Sensor04
Sensor04 <- filter(Data_New, Sensor == "Sensor04")
Sensor04$co_wrk_aux_ref <- Sensor04$co_wrk_aux*0.942156+0.010108
Sensor04$lat <- "41.81678"
Sensor04$lon <- "-71.46458"

##Reference-Sensor05
Sensor05 <- filter(Data_New, Sensor == "Sensor05")
Sensor05$co_wrk_aux_ref <- Sensor05$co_wrk_aux*0.936169+-0.00366
Sensor05$lat <- "41.85417"
Sensor05$lon <- "-71.43444"

##Reference-Sensor06
Sensor06 <- filter(Data_New, Sensor == "Sensor06")
Sensor06$co_wrk_aux_ref <- Sensor06$co_wrk_aux*0.899201+-0.008414
Sensor06$lat <- "41.84621"
Sensor06$lon <- "-71.39663"

##Reference-Sensor07
Sensor07 <- filter(Data_New, Sensor == "Sensor07")
Sensor07$co_wrk_aux_ref <- Sensor07$co_wrk_aux*0.876983+0.002774
Sensor07$lat <- "41.83549"
Sensor07$lon <- "-71.42217"

##Reference-Sensor08
Sensor08 <- filter(Data_New, Sensor == "Sensor08")
Sensor08$co_wrk_aux_ref <- Sensor08$co_wrk_aux*0.864249+0.003524
Sensor08$lat <- "41.818826079245"
Sensor08$lon <- "-71.408"

##Reference-Sensor09
Sensor09 <- filter(Data_New, Sensor == "Sensor09")
Sensor09$co_wrk_aux_ref <- Sensor09$co_wrk_aux*0.81435+0.006231
Sensor09$lat <- "41.7951"
Sensor09$lon <- "-71.3978"

##Reference-Sensor10
Sensor10 <- filter(Data_New, Sensor == "Sensor10")
Sensor10$co_wrk_aux_ref <- Sensor10$co_wrk_aux*0.942156+0.010108
Sensor10$lat <- "41.82287"
Sensor10$lon <- "-71.43067"

##Reference-Sensor11
Sensor11 <- filter(Data_New, Sensor == "Sensor11")
Sensor11$co_wrk_aux_ref <- Sensor11$co_wrk_aux*0.825473+-0.00518
Sensor11$lat <- "41.80439"
Sensor11$lon <- "-71.42825"

##Reference-Sensor12
Sensor12 <- filter(Data_New, Sensor == "Sensor12")
Sensor12$co_wrk_aux_ref <- Sensor12$co_wrk_aux*1.04145+-0.01095
Sensor12$lat <- "41.81803"
Sensor12$lon <- "-71.44121"

##Reference-Sensor13
Sensor13 <- filter(Data_New, Sensor == "Sensor13")
Sensor13$co_wrk_aux_ref <- Sensor13$co_wrk_aux*0.783855+0.011936
Sensor13$lat <- "41.816830"
Sensor13$lon <- "-71.455330"

##Reference-Sensor16
Sensor16 <- filter(Data_New, Sensor == "Sensor16")
Sensor16$co_wrk_aux_ref <- Sensor16$co_wrk_aux*0.90322+0.008135
Sensor16$lat <- "41.80205"
Sensor16$lon <- "-71.41378"

data_ref <- rbind.data.frame(Sensor01, Sensor02, Sensor03, Sensor04,Sensor05,Sensor06,Sensor07,Sensor08,Sensor09,Sensor10,Sensor11,Sensor12,Sensor13,Sensor16)

View(data_ref)

ggplot(data=data_ref)+geom_line(aes(x=Date_EST,y=co_wrk_aux_ref,color=Sensor))




# #Import RIDEM Data
# EP_Data <- read.csv("Compiled_RIDEM_Data.csv")
# colnames(EP_Data)[2] <- "Date_EST"
# EP_Data$Date_EST <- as_datetime(EP_Data$Date_EST, format =  "%Y-%m-%d %H:%M:%S")
# 
# EP_Data_CO <- cbind.data.frame(EP_Data$Date_EST, EP_Data$CO)
# colnames(EP_Data_CO) <- c("Date_EST", "CO_RIDEM")
# View(EP_Data_CO)
# 
# ##Plot EP Data:
# CO_EP <- ggplot(data=EP_Data_CO)+geom_line(aes(x=Date_EST, y=CO_RIDEM))+theme_bw()+theme(legend.position = "none")
# CO_EP
# 
# ##Merge Datasets
# Data_New_Merge <- merge(EP_Data_CO, Sensor01, by = "Date_EST")
# View(Data_New_Merge)
# 
# ##MLR
# model <- lm(Data_New_Merge$CO_RIDEM ~ Data_New_Merge$temp +  Data_New_Merge$co_wrk_aux + Data_New_Merge$co_wrk_aux*Data_New_Merge$temp)
# summary(model)
# 
# 
# Bo <-  0.0355374
# A1 <- 0.0019875
# A2 <- 2.5575529
# A3 <- -0.0542801
# 
# 
# Data_New_Merge$co_Cal <- Bo + A1*Data_New_Merge$temp + A2*Data_New_Merge$co_wrk_aux + A3*Data_New_Merge$co_wrk_aux*Data_New_Merge$temp
# 
# View(Data_New_Merge)
# 
# ##Plot Calibrated Data:
# ggplot(data=Data_New_Merge,aes(x=CO_RIDEM, y=co_Cal)) + geom_point()+
#   geom_smooth(method="lm")+ stat_regline_equation(label.x=0.75, label.y=0.5) +
#   stat_cor(aes(label=..rr.label..), label.x=0.75, label.y=.4) 
# 
# CO_Cal <- ggplot(data=Data_New_Merge)+geom_line(aes(x=Date_EST, y=CO_RIDEM), color="black")+geom_line(aes(x=Date_EST, y=co_Cal),color="red")+theme_bw()
# CO_Cal
# 
# 
# 
# 
# 
# #Calibrate Field co_wrk_aux_ref Data:
# data_ref$co_Cal <- Bo + A1*data_ref$temp + A2*data_ref$co_wrk_aux_ref + A3*data_ref$co_wrk_aux_ref*data_ref$temp
# 
# View(data_ref)
# 
# CO_Ref <- ggplot(data=data_ref)+geom_line(aes(x=Date_EST, y=co_Cal, color=Sensor))+theme_bw()
# CO_Ref
# 
# #write csv
# data_cal <- cbind.data.frame(data_ref$Date_EST,data_ref$co_Cal,data_ref$Sensor,data_ref$lat,data_ref$lon)
# colnames(data_cal) <- c("date", "co_cal", "sensor", "lat", "lon")
# View(data_cal)
# 
# write.csv(data_cal, "data_co_cal.csv")
# 
# #Open Air Analysis
# #Open Air Analysis:
# ##Open Air Analysis
# library(openair)
# library(worldmet)
# 
# #Find Met Data
# getMeta(lat = 41.8, lon = -71.4, returnMap = TRUE)
# 
# pvd_met_1 <- importNOAA(code = "997278-99999", year = 2022)
# pvd_met_2 <- importNOAA(code = "997278-99999", year = 2023)
# pvd_met <- rbind.data.frame(pvd_met_1,pvd_met_2)
# #View(pvd_met)
# 
# windRose(pvd_met)
# 
# #Import the CO_Cal Data
# CO_PVD <- read.csv("data_co_cal.csv")
# CO_PVD <- CO_PVD[-1]
# View(CO_PVD)
# 
# colnames(CO_PVD) <- c("date", "co_cal", "sensor", "lat", "lon")
# CO_PVD$date <- as_datetime(CO_PVD$date, format =  "%Y-%m-%d %H:%M:%S")
# View(CO_PVD)
# 
# #Merge CO and Met Data
# CO_met <- merge(CO_PVD, select(pvd_met, -latitude, -longitude),  by = "date")
# View(CO_met)
# 
# 
# 
# #CO Plot by Site
# timePlot(CO_met, pollutant = "co_cal", 
#          type = "sensor", 
#          avg.time = "hour")
# 
# 
# 
# #Make Box Plot of CO Data
# p <- ggplot(CO_met, aes(x=sensor, y=co_cal)) + 
#   geom_boxplot()
# p
# 
# View(CO_met)
# 
# #Make TimeVariation of CO Data:
# timeVariation(CO_met, 
#               pollutant = c("co_cal"), 
#               normalise = TRUE)
# 
# #Make TimeVariation of all sensors
# timeVariation(CO_met, 
#               pollutant = c("co_cal"),
#               group = "sensor",
#               normalise = TRUE, par.settings=list(fontsize=list(text=3)))
# 
# ggplot(data=CO_met) + geom_line(aes(x=date, y=co_cal, color=sensor))
# 
# 
# #PolarPlots
# library(openairmaps)
# polarMap(
#   CO_met,
#   latitude = "lat",
#   longitude = "lon",
#   pollutant = "co_cal"
# )
# 
# 


