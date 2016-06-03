
###Radars in Spain 120 km/h and Black Points on roads
Data source:
**[fuente](http://www.todo-poi.es/)**
KML (Keyhole Markup Language) is an XML based file format used to display geographic data in an Earth browser such as Google Earth, 
Google Maps, and Google Maps for mobile.
```r
install.packages("kml")
library(kml)
library(rgdal)
library(maptools)
library(plyr)
library(dplyr)
library(ggmap)
library(ggplot2)
```
**Get the KML coordinates**
```r
coords = getKMLcoordinates('R_BBS_fijos_120.kml')
puntosn=getKMLcoordinates('R_BBS_puntos_negros.kml')
```
```r
radaresfijos120 <- ldply (coords, data.frame)#pass to Data Frame
puntosnegros <- ldply(puntosn,data.frame)
head(radaresfijos120)
head(puntosnegros)
radaresfijos120$X3 <- NULL
puntosnegros$X3 <- NULL
```
**Spain Map Radars 120 km/h**
```r
mapa <- get_map("Madrid", source = "stamen", maptype = "toner", zoom = 6)
png(file="Radar120.png")
ggmap(mapa) + geom_point(aes(x = X1 , y = X2,alpha=0.5),colour = "red", size = 2, data = radaresfijos120)
dev.off()
```
![MapRadars](https://github.com/MontseFigueiro/Radares/blob/master/Radar120.png)

**Spain Map Black Point Roads**
```r
png(file="PuntosNegros.png")
ggmap(mapa)+geom_point(aes(x = X1 , y = X2,alpha=0.5),colour = "black", size = 2, data = puntosnegros)
dev.off()
```
![Mapblackpoints](https://github.com/MontseFigueiro/Radares/blob/master/PuntosNegros.png)

