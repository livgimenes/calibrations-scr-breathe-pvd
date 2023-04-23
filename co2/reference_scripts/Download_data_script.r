#Script for Pulling Sensor Data
Start_Date <- "2022-09-05" #Format:  YYYY-MM-DD
Start_Time <- "00:00:00"   #Format:  hh:mm:ss I think this time is PST

End_Date <- "2022-10-20"  #Format: YYYY-MM_DD
End_Time <- "00:00:00"    #Format: hh:mm:ss I think this time is PST

Start_Date_2 <- "202200905" #Format: YYYYMMDD
Start_Time_2 <- "000000"   #Format: hhmmdd I think this time is PST
End_Date_2 <- "20221020"   #Format: YYYYMMDD
End_Time_2 <- "000000"     #Format: hhmmdd I think this time is PST



#Sensors
Sensor01 <- "Bs12022" 
#Sensor02 <- "Bs22022"
#Sensor03 <- "Bs32022"
#Sensor04 <- "Bs42022"
#Sensor05 <- "Bs52022"
Sensor06 <- "Bs62022"
Sensor07 <- "Bs72022"
Sensor08 <- "Bs82022"
Sensor09 <- "Bs92022"
Sensor10 <- "Bs102022"
Sensor11 <- "Bs112022"
#Sensor12 <- "Bs122022"
Sensor13 <- "Bs132022"
#Sensor14 <- "Bs142022"
#Sensor15 <- "Bs152022"
Sensor16 <- "Bs162022"
#Sensor17 <- "Bs172022"
#Sensor18 <- "Bs182022"
#Sensor19 <- "Bs192022"
#Sensor20 <- "Bs202022"
#Sensor21 <- "Bs212022"
#Sensor22 <- "Bs222022"
#Sensor23 <- "Bs232022"
#Sensor24 <- "Bs242022"
#Sensor25 <- "Bs252022"

#Nodes
Sensor01_Node <- 250
#Sensor02_Node <- 254
#Sensor03_Node <- 258
#Sensor04_Node <- 261
#Sensor05_Node <- 264
Sensor06_Node <- 267
Sensor07_Node <- 270
Sensor08_Node <- 274
Sensor09_Node <- 276
Sensor10_Node <- 261
Sensor11_Node <- 252
#Sensor12_Node <- 255
Sensor13_Node <- 257
#Sensor14_Node <- 259
#Sensor15_Node <- 262
Sensor16_Node <- 263
#Sensor17_Node <- 266
#Sensor18_Node <- 269
#Sensor19_Node <- 272
#Sensor20_Node <- 253
#Sensor21_Node <- 256
#Sensor22_Node <- 260
#Sensor23_Node <- 265
#Sensor24_Node <- 268
#Sensor25_Node <- 271


#Url of Data links
Sensor01_URL <- paste("http://","128.32.208.8/node/",Sensor01_Node,"/measurements_all/csv?name=",noquote(Sensor01),"&interval=1&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor02_URL <- paste("http://","128.32.208.8/node/",Sensor02_Node,"/measurements_all/csv?name=",noquote(Sensor02),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor03_URL <- paste("http://","128.32.208.8/node/",Sensor03_Node,"/measurements_all/csv?name=",noquote(Sensor03),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor04_URL <- paste("http://","128.32.208.8/node/",Sensor04_Node,"/measurements_all/csv?name=",noquote(Sensor04),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
##Sensor05_URL <- paste("http://","128.32.208.8/node/",Sensor05_Node,"/measurements_all/csv?name=",noquote(Sensor05),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor06_URL <- paste("http://","128.32.208.8/node/",Sensor06_Node,"/measurements_all/csv?name=",noquote(Sensor06),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor07_URL <- paste("http://","128.32.208.8/node/",Sensor07_Node,"/measurements_all/csv?name=",noquote(Sensor07),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor08_URL <- paste("http://","128.32.208.8/node/",Sensor08_Node,"/measurements_all/csv?name=",noquote(Sensor08),"&interval=1&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor09_URL <- paste("http://","128.32.208.8/node/",Sensor09_Node,"/measurements_all/csv?name=",noquote(Sensor09),"&interval=1&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor10_URL <- paste("http://","128.32.208.8/node/",Sensor10_Node,"/measurements_all/csv?name=",noquote(Sensor10),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor11_URL <- paste("http://","128.32.208.8/node/",Sensor11_Node,"/measurements_all/csv?name=",noquote(Sensor11),"&interval=1&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor12_URL <- paste("http://","128.32.208.8/node/",Sensor12_Node,"/measurements_all/csv?name=",noquote(Sensor12),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor13_URL <- paste("http://","128.32.208.8/node/",Sensor13_Node,"/measurements_all/csv?name=",noquote(Sensor13),"&interval=1&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor14_URL <- paste("http://","128.32.208.8/node/",Sensor14_Node,"/measurements_all/csv?name=",noquote(Sensor14),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor15_URL <- paste("http://","128.32.208.8/node/",Sensor15_Node,"/measurements_all/csv?name=",noquote(Sensor15),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
Sensor16_URL <- paste("http://","128.32.208.8/node/",Sensor16_Node,"/measurements_all/csv?name=",noquote(Sensor16),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor17_URL <- paste("http://","128.32.208.8/node/",Sensor17_Node,"/measurements_all/csv?name=",noquote(Sensor17),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor18_URL <- paste("http://","128.32.208.8/node/",Sensor18_Node,"/measurements_all/csv?name=",noquote(Sensor18),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor19_URL <- paste("http://","128.32.208.8/node/",Sensor19_Node,"/measurements_all/csv?name=",noquote(Sensor19),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor20_URL <- paste("http://","128.32.208.8/node/",Sensor20_Node,"/measurements_all/csv?name=",noquote(Sensor20),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor21_URL <- paste("http://","128.32.208.8/node/",Sensor21_Node,"/measurements_all/csv?name=",noquote(Sensor21),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor22_URL <- paste("http://","128.32.208.8/node/",Sensor22_Node,"/measurements_all/csv?name=",noquote(Sensor22),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor23_URL <- paste("http://","128.32.208.8/node/",Sensor23_Node,"/measurements_all/csv?name=",noquote(Sensor23),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor24_URL <- paste("http://","128.32.208.8/node/",Sensor24_Node,"/measurements_all/csv?name=",noquote(Sensor24),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")
#Sensor25_URL <- paste("http://","128.32.208.8/node/",Sensor25_Node,"/measurements_all/csv?name=",noquote(Sensor25),"&interval=60&variables=co2_corrected_avg,co2_raw,co_wrk_aux,dew_pt,no2_wrk_aux,no_wrk_aux,o3_wrk_aux,pm1,pm10,pm2_5,pressure,rh,temp,vaisala_temp","&start=",noquote(Start_Date),"%20",noquote(Start_Time),"&end=",noquote(End_Date),"%20",noquote(End_Time),"&chart_type=measurement)",sep="")

#Data File Names
Sensor01_File <- paste("Sensor01","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor02_File <- paste("Sensor02","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor03_File <- paste("Sensor03","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor03_File <- paste("Sensor03","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor04_File <- paste("Sensor04","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor05_File <- paste("Sensor05","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor06_File <- paste("Sensor06","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor07_File <- paste("Sensor07","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor08_File <- paste("Sensor08","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor09_File <- paste("Sensor09","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor10_File <- paste("Sensor10","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor11_File <- paste("Sensor11","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor12_File <- paste("Sensor12","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor13_File <- paste("Sensor13","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor14_File <- paste("Sensor14","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor15_File <- paste("Sensor15","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
Sensor16_File <- paste("Sensor16","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor17_File <- paste("Sensor17","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor18_File <- paste("Sensor18","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor19_File <- paste("Sensor19","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor20_File <- paste("Sensor20","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor21_File <- paste("Sensor21","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor22_File <- paste("Sensor22","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor23_File <- paste("Sensor23","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor24_File <- paste("Sensor24","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")
#Sensor25_File <- paste("Sensor25","_",noquote(Start_Date_2),"_",noquote(Start_Time_2),"_",noquote(End_Date_2),"_",noquote(End_Time_2),".csv",sep="")


#Download Sensor Data to Working Directory
download.file(Sensor01_URL, Sensor01_File)
#download.file(Sensor02_URL, Sensor02_File)
#download.file(Sensor03_URL, Sensor03_File)
#download.file(Sensor04_URL, Sensor04_File)
#download.file(Sensor05_URL, Sensor05_File)
download.file(Sensor06_URL, Sensor06_File)
download.file(Sensor07_URL, Sensor07_File)
download.file(Sensor08_URL, Sensor08_File)
download.file(Sensor09_URL, Sensor09_File)
download.file(Sensor10_URL, Sensor10_File)
download.file(Sensor11_URL, Sensor11_File)
#download.file(Sensor12_URL, Sensor12_File)
download.file(Sensor13_URL, Sensor13_File)
#download.file(Sensor14_URL, Sensor14_File)
#download.file(Sensor15_URL, Sensor15_File)
download.file(Sensor16_URL, Sensor16_File)
#download.file(Sensor17_URL, Sensor17_File)
#download.file(Sensor18_URL, Sensor18_File)
#download.file(Sensor19_URL, Sensor19_File)
#download.file(Sensor20_URL, Sensor20_File)
#download.file(Sensor21_URL, Sensor21_File)
#download.file(Sensor22_URL, Sensor22_File)
#download.file(Sensor23_URL, Sensor23_File)
#download.file(Sensor24_URL, Sensor24_File)
#download.file(Sensor25_URL, Sensor25_File)

#Load Sensor Data to R
Sensor01_Data <- read.csv(Sensor01_File)
#Sensor02_Data <- read.csv(Sensor02_File)
#Sensor03_Data <- read.csv(Sensor03_File)
#Sensor04_Data <- read.csv(Sensor04_File)
#Sensor05_Data <- read.csv(Sensor05_File)
Sensor06_Data <- read.csv(Sensor06_File)
Sensor07_Data <- read.csv(Sensor07_File)
Sensor08_Data <- read.csv(Sensor08_File)
Sensor09_Data <- read.csv(Sensor09_File)
Sensor10_Data <- read.csv(Sensor10_File)
Sensor11_Data <- read.csv(Sensor11_File)
#Sensor12_Data <- read.csv(Sensor12_File)
Sensor13_Data <- read.csv(Sensor13_File)
#Sensor14_Data <- read.csv(Sensor14_File)
#Sensor15_Data <- read.csv(Sensor15_File)
Sensor16_Data <- read.csv(Sensor16_File)
#Sensor17_Data <- read.csv(Sensor17_File)
#Sensor18_Data <- read.csv(Sensor18_File)
##Sensor19_Data <- read.csv(Sensor19_File)
#Sensor20_Data <- read.csv(Sensor20_File)
#Sensor21_Data <- read.csv(Sensor21_File)
#Sensor22_Data <- read.csv(Sensor22_File)
#Sensor23_Data <- read.csv(Sensor23_File)
#Sensor24_Data <- read.csv(Sensor24_File)
#Sensor25_Data <- read.csv(Sensor25_File)






#Remove Missing Data
Sensor01_Data[Sensor01_Data == -999] <- NA
#Sensor02_Data[Sensor02_Data == -999] <- NA
#Sensor03_Data[Sensor03_Data == -999] <- NA
#Sensor04_Data[Sensor04_Data == -999] <- NA
##Sensor05_Data[Sensor05_Data == -999] <- NA
Sensor06_Data[Sensor06_Data == -999] <- NA
Sensor07_Data[Sensor07_Data == -999] <- NA
Sensor08_Data[Sensor08_Data == -999] <- NA
Sensor09_Data[Sensor09_Data == -999] <- NA
Sensor10_Data[Sensor10_Data == -999] <- NA
Sensor11_Data[Sensor11_Data == -999] <- NA
#Sensor12_Data[Sensor12_Data == -999] <- NA
Sensor13_Data[Sensor13_Data == -999] <- NA
#Sensor14_Data[Sensor14_Data == -999] <- NA
#Sensor15_Data[Sensor15_Data == -999] <- NA
Sensor16_Data[Sensor16_Data == -999] <- NA
#Sensor17_Data[Sensor17_Data == -999] <- NA
#Sensor18_Data[Sensor18_Data == -999] <- NA
#Sensor19_Data[Sensor19_Data == -999] <- NA
#Sensor20_Data[Sensor20_Data == -999] <- NA
#Sensor21_Data[Sensor21_Data == -999] <- NA
#Sensor22_Data[Sensor22_Data == -999] <- NA
#Sensor23_Data[Sensor23_Data == -999] <- NA
#Sensor24_Data[Sensor24_Data == -999] <- NA
#Sensor25_Data[Sensor25_Data == -999] <- NA


#Convert Date to Useable Format
library(lubridate)  
library(dplyr)
colnames(Sensor01_Data)[3] <- "Date"
Sensor01_Data$Date <- as_datetime(Sensor01_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor01_Data$Sensor <- Sensor01  #This creates a new column with the sensor name

#colnames(Sensor02_Data)[3] <- "Date"
#Sensor02_Data$Date <- as_datetime(Sensor02_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor02_Data$Sensor <- Sensor02  #This creates a new column with the sensor name


#colnames(Sensor03_Data)[3] <- "Date"
#Sensor03_Data$Date <- as_datetime(Sensor03_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor03_Data$Sensor <- Sensor03  #This creates a new column with the sensor name


#colnames(Sensor04_Data)[3] <- "Date"
#Sensor04_Data$Date <- as_datetime(Sensor04_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor04_Data$Sensor <- Sensor04  #This creates a new column with the sensor name

#colnames(Sensor05_Data)[3] <- "Date"
#Sensor05_Data$Date <- as_datetime(Sensor05_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor05_Data$Sensor <- Sensor05  #This creates a new column with the sensor name

colnames(Sensor06_Data)[3] <- "Date"
Sensor06_Data$Date <- as_datetime(Sensor06_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor06_Data$Sensor <- Sensor06  #This creates a new column with the sensor name

colnames(Sensor07_Data)[3] <- "Date"
Sensor07_Data$Date <- as_datetime(Sensor07_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor07_Data$Sensor <- Sensor07  #This creates a new column with the sensor name

colnames(Sensor08_Data)[3] <- "Date"
Sensor08_Data$Date <- as_datetime(Sensor08_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor08_Data$Sensor <- Sensor08  #This creates a new column with the sensor name

colnames(Sensor09_Data)[3] <- "Date"
Sensor09_Data$Date <- as_datetime(Sensor09_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor09_Data$Sensor <- Sensor09  #This creates a new column with the sensor name

colnames(Sensor10_Data)[3] <- "Date"
Sensor10_Data$Date <- as_datetime(Sensor10_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor10_Data$Sensor <- Sensor10  #This creates a new column with the sensor name


colnames(Sensor11_Data)[3] <- "Date"
Sensor11_Data$Date <- as_datetime(Sensor11_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor11_Data$Sensor <- Sensor11  #This creates a new column with the sensor name

#colnames(Sensor12_Data)[3] <- "Date"
#Sensor12_Data$Date <- as_datetime(Sensor12_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor12_Data$Sensor <- Sensor12  #This creates a new column with the sensor name


colnames(Sensor13_Data)[3] <- "Date"
Sensor13_Data$Date <- as_datetime(Sensor13_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor13_Data$Sensor <- Sensor13  #This creates a new column with the sensor name


#colnames(Sensor14_Data)[3] <- "Date"
#Sensor14_Data$Date <- as_datetime(Sensor14_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor14_Data$Sensor <- Sensor14  #This creates a new column with the sensor name


#colnames(Sensor15_Data)[3] <- "Date"
#Sensor15_Data$Date <- as_datetime(Sensor15_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor15_Data$Sensor <- Sensor15  #This creates a new column with the sensor name


colnames(Sensor16_Data)[3] <- "Date"
Sensor16_Data$Date <- as_datetime(Sensor16_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
Sensor16_Data$Sensor <- Sensor16  #This creates a new column with the sensor name


#colnames(Sensor17_Data)[3] <- "Date"
#Sensor17_Data$Date <- as_datetime(Sensor17_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor17_Data$Sensor <- Sensor17  #This creates a new column with the sensor name


#colnames(Sensor18_Data)[3] <- "Date"
#Sensor18_Data$Date <- as_datetime(Sensor18_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor18_Data$Sensor <- Sensor18  #This creates a new column with the sensor name


#colnames(Sensor19_Data)[3] <- "Date"
#Sensor19_Data$Date <- as_datetime(Sensor19_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor19_Data$Sensor <- Sensor19  #This creates a new column with the sensor name


#colnames(Sensor20_Data)[3] <- "Date"
#Sensor20_Data$Date <- as_datetime(Sensor20_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor20_Data$Sensor <- Sensor20  #This creates a new column with the sensor name


#colnames(Sensor21_Data)[3] <- "Date"
#Sensor21_Data$Date <- as_datetime(Sensor21_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor21_Data$Sensor <- Sensor21  #This creates a new column with the sensor name


#colnames(Sensor22_Data)[3] <- "Date"
#Sensor22_Data$Date <- as_datetime(Sensor22_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor22_Data$Sensor <- Sensor22  #This creates a new column with the sensor name


#colnames(Sensor23_Data)[3] <- "Date"
#Sensor23_Data$Date <- as_datetime(Sensor23_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor23_Data$Sensor <- Sensor23  #This creates a new column with the sensor name


#colnames(Sensor24_Data)[3] <- "Date"
#Sensor24_Data$Date <- as_datetime(Sensor24_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor24_Data$Sensor <- Sensor24  #This creates a new column with the sensor name


#colnames(Sensor25_Data)[3] <- "Date"
#Sensor25_Data$Date <- as_datetime(Sensor25_Data$Date, format =  "%Y-%m-%d %H:%M:%S")
#Sensor25_Data$Sensor <- Sensor25  #This creates a new column with the sensor name


#Combine Data for Plotting
#All_Sensors <- bind_rows(Sensor01_Data,Sensor02_Data,Sensor03_Data,Sensor04_Data,Sensor05_Data,Sensor06_Data,Sensor07_Data,Sensor08_Data,Sensor09_Data,Sensor10_Data,Sensor11_Data,Sensor12_Data,Sensor13_Data,Sensor14_Data,Sensor15_Data,Sensor16_Data,Sensor17_Data,Sensor18_Data,Sensor19_Data,Sensor20_Data,Sensor21_Data,Sensor22_Data,Sensor23_Data,Sensor24_Data,Sensor25_Data)

All_Sensors <- bind_rows(Sensor01_Data,Sensor06_Data,Sensor07_Data,Sensor08_Data,Sensor09_Data,Sensor10_Data,Sensor11_Data,Sensor13_Data,Sensor16_Data)


View(All_Sensors)


#Plot Raw Data
library(ggplot2)
co2_corrected_avg_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=co2_corrected_avg, color=Sensor))+theme_bw()+theme(legend.position = "none")
#co2_raw_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=co2_raw, color=Sensor))+theme_bw()+theme(legend.position = "none")
#co_wrk_aux_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=co_wrk_aux, color=Sensor))+theme_bw()+theme(legend.position = "none")
#dew_pt_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=dew_pt, color=Sensor))+theme_bw()+theme(legend.position = "none")
#no2_wrk_aux_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=no2_wrk_aux, color=Sensor))+theme_bw()+theme(legend.position = "none")
#no_wrk_aux_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=no_wrk_aux, color=Sensor))+theme_bw()+theme(legend.position = "none")
#o3_wrk_aux_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=o3_wrk_aux, color=Sensor))+theme_bw()+theme(legend.position = "none")
#pm1_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=pm1, color=Sensor))+theme_bw()+theme(legend.position = "none")
#pm10_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=pm10, color=Sensor))+theme_bw()+theme(legend.position = "none")
#pm2_5_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=pm2_5, color=Sensor))+theme_bw()+theme(legend.position = "none")
#rh_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=rh, color=Sensor))+theme_bw()+theme(legend.position = "none")
#temp_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=temp, color=Sensor))+theme_bw()+theme(legend.position = "none")
#vaisala_temp_plot_raw <- ggplot(data=All_Sensors)+geom_line(aes(x=Date, y=vaisala_temp, color=Sensor))+theme_bw()+theme(legend.position = "none")



#Make into Interactive Plot
library(plotly)
ggplotly(co2_corrected_avg_plot_raw)
#ggplotly(co2_raw_plot_raw)
#ggplotly(co_wrk_aux_plot_raw)
#ggplotly(dew_pt_plot_raw)
#ggplotly(no2_wrk_aux_plot_raw)
#ggplotly(no_wrk_aux_plot_raw)
#ggplotly(o3_wrk_aux_plot_raw)
#ggplotly(pm1_plot_raw)
#ggplotly(pm10_plot_raw)
#ggplotly(pm2_5_plot_raw)
#ggplotly(rh_plot_raw)
#ggplotly(temp_plot_raw)
#ggplotly(vaisala_temp_plot_raw)



