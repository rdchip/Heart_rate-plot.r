# Heart Rate: Polar H10vs Garmin
# Author: RDchip 02/18/2020
# Input data: Polar HR *.CSV file and HR garmin *.CSV

library(ggplot2)
library(reshape2)
library(reader)

# HR directory 
setwd("C:/Users/dario/Documents/HR_sensor_data/4575299293")     # set the folder
file="polar.csv"   # set the polar file
file1="garmin.csv"  # set the garmin file

# ploting currents
polar_table <- read.csv(file, skip=2, head=TRUE, sep=",")
time_polar<-as.character(c(substr(x=polar_table$Time, start=1, stop=8)))
# converting date format to minuts units
hh<-as.numeric(substr(x=time_polar, start=1, stop=2))
mm<-as.numeric(substr(x=time_polar, start=4, stop=5))
ss<-as.numeric(substr(x=time_polar, start=7, stop=8))
time_minutes_polar<-(60*hh)+(mm)+(ss/60)

time_minutes_polar <- round(time_minutes_polar, digits = 4) # same number of digits to garmin

data_polar<-data.frame('Time'=c(time_minutes_polar), 'HR-polar'=c(as.numeric(polar_table$HR..bpm.)))
# read the star time polar in line 2
start_time <- n.readLines(file, n=1, skip = 1)
start_time <- c(strsplit(start_time, ","))
star_time = start_time[[1]][4]       # save start time from polar file

hh<-as.numeric(substr(x=star_time, start=1, stop=2))
mm<-as.numeric(substr(x=star_time, start=4, stop=5))
ss<-as.numeric(substr(x=star_time, start=7, stop=8))
star_time_polar<-(60*hh)+(mm)+(ss/60)  # save the first polar time inminutes

# directory loading garmin file
garmin_table <- read.csv(file1, skip=0, head=TRUE, sep=",")
time_garmin<-as.character(c(substr(x=garmin_table$timestamp, start = 12, stop = 19)))
# converting date counter error format to minuts units
hh<-as.numeric(substr(x=time_garmin, start=1, stop=2))
mm<-as.numeric(substr(x=time_garmin, start=4, stop=5))
ss<-as.numeric(substr(x=time_garmin, start=7, stop=8))
time_minutes_garmin<-(60*hh)+(mm)+(ss/60)
difference_in_time = time_minutes_garmin[1] - star_time_polar
time_minutes_garmin <- time_minutes_garmin - time_minutes_garmin[1] + difference_in_time
time_minutes_garmin <- round(time_minutes_garmin, digits = 4) # same number of digits to polar
# dataframe clean for data garmin
data_garmin<-data.frame('Time'=c(time_minutes_garmin), 'HR-garmin'=c(as.numeric(garmin_table$heart_rate)), 'Temperatura'=c(as.numeric(garmin_table$temperature)))

data_merge<-merge(data_polar,data_garmin, by="Time",all=FALSE) # FALSE to avoid the NA values, losing samples
                                                           # TRUE insert NA in empty space, keep the samples        
dataHR <- melt(data_merge[,], "Time")

my_line_types <- c(4,3,1)
names(dataHR)[2] <- "Devices"
graph<-ggplot(dataHR, aes(x=Time, y=value, colour=Devices)) +
       geom_line(size=1) +
       scale_linetype_manual(values=my_line_types)+
       ylim(0,200) +
labs(title = "Polar H10 vs Garmin Fenix 5 Plus", y = "Heart rate [bpm]", x = "Time [minutes]")

plot(graph)

