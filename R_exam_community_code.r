# CODE FOR THE EXAM - WORKING ON COMMUNITY DATASET

## 1- Looking at abundances througout the year for 3 "Community Interest" species in the Venice Lagoon

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")

rm(list=ls())

lagoon <- read.csv("data_lagoon.csv", sep=";", dec=",")
head(lagoon)

lag_mar <- lagoon[lagoon$ï..PERIODO=="MARZO",]
lag_lug <- lagoon[lagoon$ï..PERIODO=="LUGLIO",]
lag_set <- lagoon[lagoon$ï..PERIODO=="SETTEMBRE",]
lag_ott <- lagoon[lagoon$ï..PERIODO=="OTTOBRE",]
lag_nov <- lagoon[lagoon$ï..PERIODO=="NOVEMBRE",]

##    We want to make the PPP in order to build the density map

library(spatstat)
attach(lag_mar)
lag_mar_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))      

dens_lag_mar <- density(lag_mar_ppp)      #to build the density object and then plot it
plot(dens_lag_mar)
points(lag_mar_ppp)

##   We now want to interpolate missing data

marks(lag_mar_ppp) <- ABO       
abo_map_mar <- Smooth(lag_mar_ppp)

cl <- colorRampPalette(c('black','blue','yellow'))(100) 
plot(abo_map_mar, col=cl, main= "A. boyeri abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

##    Let's do the same for all other months
attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- ABO
abo_map_lug <- Smooth(lag_lug_ppp)
plot(abo_map_lug, col=cl, main= "A. boyeri abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- ABO
abo_map_set <- Smooth(lag_set_ppp)
plot(abo_map_set, col=cl, main= "A. boyeri abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- ABO
abo_map_ott <- Smooth(lag_ott_ppp)
plot(abo_map_ott, col=cl, main= "A. boyeri abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- ABO
abo_map_nov <- Smooth(lag_nov_ppp)
plot(abo_map_nov, col=cl, main= "A. boyeri abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

# Let's build a multi-frame
par(mfrow=c(2,3))
plot(abo_map_mar, col=cl, main= "A. boyeri abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )
plot(abo_map_lug, col=cl, main= "A. boyeri abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )
plot(abo_map_set, col=cl, main= "A. boyeri abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )
plot(abo_map_ott, col=cl, main= "A. boyeri abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )
plot(abo_map_nov, col=cl, main= "A. boyeri abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )
par(mfrow=c(1,1))

#-------------------------------------------------------------------------------------------------------

##   We now want to try different species 

#APFA = Aphanius fasciatus

par(mfrow=c(2,3))

attach(lag_mar)
marks(lag_mar_ppp) <- APFA       
apfa_map_mar <- Smooth(lag_mar_ppp)
plot(apfa_map_mar, col=cl, main= "A. fasciatus abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- APFA
apfa_map_lug <- Smooth(lag_lug_ppp)
plot(apfa_map_lug, col=cl, main= "A. fasciatus abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- APFA
apfa_map_set <- Smooth(lag_set_ppp)
plot(apfa_map_set, col=cl, main= "A. fasciatus abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- APFA
apfa_map_ott <- Smooth(lag_ott_ppp)
plot(apfa_map_ott, col=cl, main= "A. fasciatus abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- APFA
apfa_map_nov <- Smooth(lag_nov_ppp)
plot(apfa_map_nov, col=cl, main= "A. fasciatus abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

par(mfrow=c(1,1))

#KPA = Knipowitschia panizzae

par(mfrow=c(2,3))

attach(lag_mar)
marks(lag_mar_ppp) <- KPA      
apfa_map_mar <- Smooth(lag_mar_ppp)
plot(apfa_map_mar, col=cl, main= "K. panizzae abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- KPA
kpa_map_lug <- Smooth(lag_lug_ppp)
plot(kpa_map_lug, col=cl, main= "K. panizzae abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- KPA
kpa_map_set <- Smooth(lag_set_ppp)
plot(kpa_map_set, col=cl, main= "K. panizzae abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- KPA
kpa_map_ott <- Smooth(lag_ott_ppp)
plot(kpa_map_ott, col=cl, main= "K. panizzae abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- KPA
kpa_map_nov <- Smooth(lag_nov_ppp)
plot(kpa_map_nov, col=cl, main= "K. panizzae abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

par(mfrow=c(1,1))


#PCA= Ninnigobius canestrinii alsa called Pomatoschistus canestrinii

par(mfrow=c(2,3))

attach(lag_mar)
marks(lag_mar_ppp) <- PCA        
pca_map_mar <- Smooth(lag_mar_ppp)
plot(pca_map_mar, col=cl, main= "P. canestrinii abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- PCA
pca_map_lug <- Smooth(lag_lug_ppp)
plot(pca_map_lug, col=cl, main= "P. canestrinii abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- PCA
pca_map_set <- Smooth(lag_set_ppp)
plot(pca_map_set, col=cl, main= "P. canestrinii abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- PCA
pca_map_ott <- Smooth(lag_ott_ppp)
plot(pca_map_ott, col=cl, main= "P. canestrinii abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- PCA
pca_map_nov <- Smooth(lag_nov_ppp)
plot(pca_map_nov, col=cl, main= "P. canestrinii abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

par(mfrow=c(1,1))


### EVOLUTION OF KPA AND APFA IN THE LAGOON 

par(mfrow=c(3,5))
attach(lag_mar)
marks(lag_mar_ppp) <- APFA       
apfa_map_mar <- Smooth(lag_mar_ppp)
plot(apfa_map_mar, col=cl, main= "A. fasciatus abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- APFA
apfa_map_lug <- Smooth(lag_lug_ppp)
plot(apfa_map_lug, col=cl, main= "A. fasciatus abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- APFA
apfa_map_set <- Smooth(lag_set_ppp)
plot(apfa_map_set, col=cl, main= "A. fasciatus abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- APFA
apfa_map_ott <- Smooth(lag_ott_ppp)
plot(apfa_map_ott, col=cl, main= "A. fasciatus abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- APFA
apfa_map_nov <- Smooth(lag_nov_ppp)
plot(apfa_map_nov, col=cl, main= "A. fasciatus abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

attach(lag_mar)
marks(lag_mar_ppp) <- KPA       
apfa_map_mar <- Smooth(lag_mar_ppp)
plot(apfa_map_mar, col=cl, main= "K. panizzae abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- KPA
kpa_map_lug <- Smooth(lag_lug_ppp)
plot(kpa_map_lug, col=cl, main= "K. panizzae abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- KPA
kpa_map_set <- Smooth(lag_set_ppp)
plot(kpa_map_set, col=cl, main= "K. panizzae abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- KPA
kpa_map_ott <- Smooth(lag_ott_ppp)
plot(kpa_map_ott, col=cl, main= "K. panizzae abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- KPA
kpa_map_nov <- Smooth(lag_nov_ppp)
plot(kpa_map_nov, col=cl, main= "K. panizzae abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

attach(lag_mar)
marks(lag_mar_ppp) <- PCA       
pca_map_mar <- Smooth(lag_mar_ppp)
plot(pca_map_mar, col=cl, main= "P. canestrinii abundance 03/19")
points(lag_mar_ppp, pch=20 , col='white', )

attach(lag_lug)
lag_lug_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_lug_ppp) <- PCA
pca_map_lug <- Smooth(lag_lug_ppp)
plot(pca_map_lug, col=cl, main= "P. canestrinii abundance 07/19")
points(lag_lug_ppp, pch=20 , col='white', )

attach(lag_set)
lag_set_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_set_ppp) <- PCA
pca_map_set <- Smooth(lag_set_ppp)
plot(pca_map_set, col=cl, main= "P. canestrinii abundance 09/19")
points(lag_set_ppp, pch=20 , col='white', )

attach(lag_ott)
lag_ott_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_ott_ppp) <- PCA
pca_map_ott <- Smooth(lag_ott_ppp)
plot(pca_map_ott, col=cl, main= "P. canestrinii abundance 10/19")
points(lag_ott_ppp, pch=20 , col='white', )

attach(lag_nov)
lag_nov_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))   
marks(lag_nov_ppp) <- PCA
pca_map_nov <- Smooth(lag_nov_ppp)
plot(pca_map_nov, col=cl, main= "P. canestrinii abundance 11/19")
points(lag_nov_ppp, pch=20 , col='white', )

par(mfrow=c(1,1))




# -------------------------------------------------------------------------


# DECORANA ON COMMUNITY DATASET

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")
library(vegan)

# import csv file from working directory
lagoon <- read.csv2("lagoon.csv")

# Divide into two different objects data of abundance and habitat type
lag_n <- lagoon [ , 5:53]
lag_h <- lagoon [ , 1:4]

#Decorana on the species abundance
decor_lag <- decorana (lag_n)

plot(decor_lag, display="species", cex = 0.5)
ordiellipse(multivar_lag, HABITAT, col=c("black","red","green","blue"), kind = "ehull", lwd=3) 
ordispider(multivar_lag, HABITAT, col=c("black","red","green","blue"), label = T) 
