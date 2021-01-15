# R_code_ecosystem_functions.r

# R code to view biomass over the world and calculate changes in ecosystem functions
# energy
# chemical cycling
# proxies

# install.packages("rasterdiv")
# install.packages("rasterVis")

library(rasterVis)
library(rasterdiv)

data(copNDVI)         # load data already inside the package
plot(copNDVI)

# the values of the map are from 0 to 255 (they are 256 values because it is a 8 bit image so it has 2^8 values)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))      # values 253 254 255 are NOT ASSIGNED values that should be removed or changed with NA. We can so that with the \reclassify function\
plot(copNDVI)           # we obtain a cleaner map that shows us the where primary production is present in the world

# we obtain a map with biomassa so with potential energy over the world (like a biomes map depending on the values of DVI) 
# data that create the image are the mean NDVI value between 1999 and 2017 of June 21st (19 maps and for each pixel the mean value is extracted)

# We can now show, beside the map, a graph that show the NDVI mean level across the wordl. To do that we need the \rasterVis\ package

levelplot(copNDVI)      # each row and column of the map is represented as a mean value in the graph that shows energy peaks arounf the globe


#as always we can play with colours
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

# playing with colours is dangerous because the eye, for example, catch the "yellow" more than other colours so if
# we don't put in the maximum value we can convey an image that "lies" using perceptions
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

#putting yellow in the correct place
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

# let's put the images side by side to see the differences
par(mfrow=c(1,3))
plot(copNDVI, col=clymin)
plot(copNDVI, col=clymed)
plot(copNDVI, col=clymax)       # this is the best image that doesn't lie or play with perceptions

dev.off()

#------ HOW TO ZOOM IN THE IMAGE

# let's decide the extension
ext <- c(0,20,35,55)    #\ext <- c(longtidude min, longitude max, latitude min, latitude max))\  values can be found on the map
italy_copNDVI <- crop(copNDVI, ext)
plot(italy_copNDVI, col=clymax)

# ------------

copNDVI10 <- aggregate(copNDVI, fact=10)
levelplot(copNDVI10)

copNDVI100 <- aggregate(copNDVI, fact=100)
levelplot(copNDVI100)

####################################

# library(ggplot2)

# myPalette <- colorRampPalette(c('white','green','dark green'))
# sc <- scale_colour_gradientn(colours = myPalette(100), limits=c(1, 8))

# ggR(copNDVI, geom_raster = TRUE) +
# scale_fill_gradientn(name = "NDVI", colours = myPalette(100))+
# labs(x="Longitude",y="Latitude", fill="")+
#   theme(legend.position = "bottom") +
#  NULL


setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

library(raster)

defor1 <- brick("defor1_.jpg") 
defor2 <- brick("defor2_.jpg") 

# band1: NIR, defor1_.1
# band2: red, defor1_.2
# band3: green

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

dvi1 <- defor1$defor1_.1 - defor1$defor1_.2 

# defor2
# band1: NIR, defor2_.1
# band2: red, defor2_.2

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2 

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
par(mfrow=c(1,2))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

difdvi <- dvi1 - dvi2

cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)

hist(difdvi)
