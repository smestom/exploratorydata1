library(datasets)

setwd("C:/Users/smest/Box Sync/Data Science/Exploratory Data Analysis/Projects")
setwd("d:/Box Sync/Data Science/Exploratory Data Analysis/Projects")


t=c("character","character","character","character","character","character","character","character","character")


m<- read.table("household_power_consumption.txt",
               header=TRUE,sep = ";",
               dec = ".", 
               colClasses = t,as.is = FALSE )


df1<- subset(m,as.Date(Date,"%d/%m/%Y")>="2007-02-01")
df2<- subset(df1,as.Date(Date,"%d/%m/%Y")<="2007-02-02")

df3<- data.frame(df2,dtc=paste(df2$Date, df2$Time) )

df<- data.frame(df3,dt=strptime(df3$dtc,"%d/%m/%Y %H:%M:%S") )

par(mfcol = c(1,1))


with(df, plot( dt,Sub_metering_1,type="l",xlab="", ylab = "Enery Sub Metering"))
with(df, lines( dt,Sub_metering_2,col="red"))
with(df, lines( dt,Sub_metering_3,col="blue"))
legend("topright", pch = "_", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
)

dev.copy(png, file = "plot3.png")
dev.off()

