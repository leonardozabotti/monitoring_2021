# CODE FOR THE EXAM



# ANALYSIS OF THE NDVI BEFORE AND AFTER VAIA STORM IN NORTHERN EAST ITALY

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")
library(ncdf4)
library(raster)

# upload in R of two images (with 300m resolution): one from August 2018 and the other from August 2019 (Vaia was in October 2018)

aug18 <- raster("c_gls_NDVI300_201808010000_GLOBE_PROBAV_V1.0.1.nc")
aug19 <- raster("c_gls_NDVI300_201908010000_GLOBE_PROBAV_V1.0.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images 
ext <- c(10,15,45,48)
aug19_NEita <- crop(aug19, ext)
aug18_NEita <- crop(aug18, ext)

#First plotting
plot(aug19_NEita)
plot(aug19_NEita)

#Checking for differences in NDVI
dif <- aug19_italy - aug18_italy

#Creating a colour palette that highlights negative differences (biomass losses)
cl <- colorRampPalette(c('red','white','grey'))(100)

#Plotting the differences
plot(dif, col= cl)
