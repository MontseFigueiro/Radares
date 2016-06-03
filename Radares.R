http://www.todo-poi.es/

install.packages("kml")

library(kml)
library(rgdal)
library(maptools)
library(plyr)
library(dplyr)
library(ggmap)
library(ggplot2)
# Load KML coordinates
coords = getKMLcoordinates('R_BBS_fijos_120.kml')
puntosn=getKMLcoordinates('R_BBS_puntos_negros.kml')

radaresfijos120 <- ldply (coords, data.frame)#pasamos a Data Frame
puntosnegros <- ldply(puntosn,data.frame)
head(radaresfijos120)
head(puntosnegros)
radaresfijos120$X3 <- NULL
puntosnegros$X3 <- NULL
radaresfijos120

#Mapa España con radares fijos 120 km/h
mapa <- get_map("Madrid", source = "stamen", maptype = "toner", zoom = 6)
png(file="Radar120.png")
ggmap(mapa) + geom_point(aes(x = X1 , y = X2,alpha=0.5),colour = "red", size = 2, data = radaresfijos120)
dev.off()

#mapa puntos negros carreteras España
png(file="PuntosNegros.png")
ggmap(mapa)+geom_point(aes(x = X1 , y = X2,alpha=0.5),colour = "black", size = 2, data = puntosnegros)
dev.off()


