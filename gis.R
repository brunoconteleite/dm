
#install.packages('rgdal')   # do this only once
library(rgdal)
crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")

# load the data:
load('data/citydata.rdata')

# Creating point data:
spdf.points <- SpatialPoints(coords = as.matrix(df[,c('longitude', 'latitude')]), proj4string = crs.geo)

# Creating line data:
spdf.line <- SpatialLines(list(Lines(Line(as.matrix(df[1:3,c('longitude', 'latitude')])), ID = 'id')), proj4string = crs.geo)
