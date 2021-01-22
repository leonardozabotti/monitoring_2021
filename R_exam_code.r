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



#### TRYING THE SAME THING WITH IMAGES WITH LOWER RESOLUTION (1 km)
aug18.1 <- raster("c_gls_NDVI_201808010000_GLOBE_PROBAV_V2.2.1.nc")
aug19.1 <- raster("c_gls_NDVI_201908010000_GLOBE_PROBAV_V2.2.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images 
ext <- c(10,15,45,48)
aug19_NEita.1 <- crop(aug19.1, ext)
aug18_NEita.1 <- crop(aug18.1, ext)

#First plotting
plot(aug19_NEita.1)
plot(aug19_NEita.1)

#Checking for differences in NDVI
dif.1 <- aug19_NEita.1 - aug18_NEita.1

#Creating a colour palette that highlights negative differences (biomass losses)
cl <- colorRampPalette(c('red','white','grey'))(100)

#Plotting the differences
plot(dif.1, col= cl)

# Checking if lower resolution is stil valid 
par(mfrow=c(1,2))
plot(dif, col= cl, main="300m Resol.")
plot(dif.1, col= cl, main= "1km Resol.")

dev.off()

### CONSIDERATION: 300m is better so we'll keep working with this resol. 

###----------------- 

# Let's now check for differences between the week before and after the storm (26-30 Oct. 2018)



