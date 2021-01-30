# ANALYSIS OF THE NDVI-ALBEDO-FCOVER-LST BEFORE AND AFTER VAIA STORM IN NORTHERN EAST ITALY

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")
library(ncdf4)
library(raster)

# upload in R of two images (with 300m resolution): one from August 2018 and the other from August 2019 (Vaia was in October 2018)

aug18 <- raster("c_gls_NDVI300_201808010000_GLOBE_PROBAV_V1.0.1.nc")
aug19 <- raster("c_gls_NDVI300_201908010000_GLOBE_PROBAV_V1.0.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images 
ext <- c(11,13,46,47)
aug19_dol <- crop(aug19, ext)
aug18_dol <- crop(aug18, ext)

#First plotting
plot(aug19_dol)
plot(aug19_dol)

#Checking for differences in NDVI
dif <- aug19_dol - aug18_dol

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

###----------------------------------------------------------------------

# Let's now check for differences between the week before and after the storm (26-30 Oct. 2018)

oct18 <- raster("c_gls_NDVI300_201810110000_GLOBE_PROBAV_V1.0.1.nc")
nov18 <- raster("c_gls_NDVI300_201811010000_GLOBE_PROBAV_V1.0.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images 

ext <- c(11,13,46,47)         # area of the italian Dolomites
oct18_dol <- crop(oct18, ext)
nov18_dol <- crop(nov18, ext)

#Checking for differences in NDVI
dif.2 <- nov18_dol - oct18_dol

#Creating a colour palette that highlights negative differences (biomass losses)
cl <- colorRampPalette(c('red','white','grey'))(100)

#Plotting the differences
plot(dif.2, col= cl)

###----------------------------------------------------------------------

# Let's try using ALBEDO instead of NDVI which could also be affected by lower temperature or higher stress

al_oct18 <- raster("c_gls_ALDH_201810130000_GLOBE_PROBAV_V1.5.1.nc")
al_nov18 <- raster("c_gls_ALDH_201811030000_GLOBE_PROBAV_V1.5.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images 

ext <- c(11,13,46,47)         # area of the italian Dolomites
al_oct18_dol <- crop(al_oct18, ext)
al_nov18_dol <- crop(al_nov18, ext)

#Checking for differences in NDVI
al_dif <- al_nov18_dol - al_oct18_dol

#Creating a colour palette that highlights negative differences (biomass losses)
al_cl <- colorRampPalette(c('grey', 'yellow','black'))(100)

#Plotting the differences
plot(al_dif, col= al_cl)

### CONSIDERATION: 1 km resolution for ALBEDO is too low

###----------------------------------------------------------------------

# Let's try using FCOVER 
setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")
library(ncdf4)
library(raster)

fc_jun18 <- raster("c_gls_FCOVER300_201806100000_GLOBE_PROBAV_V1.0.1.nc")
fc_jun19 <- raster("c_gls_FCOVER300_201906100000_GLOBE_PROBAV_V1.0.1.nc")

# Cropping images before plotting to avoid high time computer elaboration on heavy images (Choose one of the two options)

#ext <- c(11,13,46,47)         # area of the italian Dolomites
#ext <- c(7,13,45,48)    # for wider view over all the Italian Alps

fc_jun18_dol <- crop(fc_jun18, ext)
fc_jun19_dol <- crop(fc_jun19, ext)

#Checking for differences in NDVI
fc_dif <- fc_jun19_dol  - fc_jun18_dol 

#Creating a colour palette that highlights negative differences (biomass losses)
fc_cl <- colorRampPalette(c('black', 'yellow','green'))(100)
 
#Plotting the differences
#plot(fc_dif, col= fc_cl)


### CONSIDERATIONS: way better!!

# Let's look at the difference between Jun2017 and June 2018
fc_jun17 <- raster("c_gls_FCOVER300_201706100000_GLOBE_PROBAV_V1.0.1.nc")
fc_jun17_dol <- crop(fc_jun17, ext)
fc_dif.1 <- fc_jun18_dol  - fc_jun17_dol 
par(mfrow=c(1,2))
plot(fc_dif, col= fc_cl, main="FCOVER JUN19-JUN18")
plot(fc_dif.1, col= fc_cl, main="FCOVER JUN18-JUN17")
par(mfrow=c(1,1))



#--------------------------
## WHAT ABOUT THE RELATION BETWEEN FCOVER AND LAND TEMPERATURE?
lst_jun18 <- raster("c_gls_LST10-DC_201806010000_GLOBE_GEO_V1.2.1.nc")
lst_jun19 <- raster("c_gls_LST10-DC_201906010000_GLOBE_GEO_V1.2.1.nc")

lst_jun18_dol <- crop(lst_jun18, ext)
lst_jun19_dol <- crop(lst_jun19, ext)

lst_dif <- lst_jun19_dol  - lst_jun18_dol
plot(lst_dif, col= fc_cl)

par(mfrow=c(1,3))
plot(fc_dif, col= fc_cl, main="FCOVER JUN19-JUN18")
plot(fc_dif.1, col= fc_cl, main="FCOVER JUN18-JUN17")
plot(lst_dif, col= fc_cl, main="LST JUN19-JUN18")
par(mfrow=c(1,1))
  
### CONSIDERATIONS: Too low resolution to really compare or infere some hypothesys


