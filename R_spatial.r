# LESSON  - SPATIAL R

library(sp)
data(meuse)
head(meuse)

coordinates(meuse) = ~x+y    #we're telling R that the two columns x and y are our coordinates and this will allow us to see this data in space and the (meuse) will see in space
plot(meuse)    #to see the data in space 

#    we can use now some functions to see the spread of some of the other elements in space. The function is \spplot\ already inside sp package

spplot(meuse, "zinc")        #plot elements (variables in a space dataset) in space. In this function the variable is in brackets "" !!

#    we can even put a main title adding the \main\ argument
spplot(meuse, "zinc", main = "Concentration of Zinc")

#   let's try to plot all other elements
spplot(meuse, "copper", main = "Concentration of Copper")
spplot(meuse, "cadmium", main = "Concentration of Cadmium")
spplot(meuse, "lead", main = "Concentration of Lead")

#EXERCISE --- see copper and zinc in two different panels but with the same function

spplot(meuse, c("zinc", "copper"), main = "Concentration of Zinc and copper")   #REMEMBER THE ARRAY CONCEPT!! using \c( , )\ you create and array by putting elements together


#instead of colours and points we could even use bubbles. This can be done with the \bubble()\ function

bubble(meuse, "zinc")
bubble(meuse, "lead")

#   we can even change colour of bubbles with the \col\ argument

bubble(meuse, "zinc", col='red')

#-----PART 2

#let's install the ggplot2 package 

install.packages("ggplot2")       #remember to put "" because ggplot2 is not in R yet. The other 2 situations are for text or colors that need ""
library(ggplot2)        #no brackets needed becasue the package is already in R


#ecological dataframe
#biofuels
biofuels <- c(120, 200, 350, 570, 750)  #array of values of biofuels made using c()

#oxydative enzimes 
oxydative <- c(1200, 1300, 21000, 34000, 50000)

#function used to buil dataframes is \data.frame(list of variable as columns separated by comma)\
d <- data.frame(biofuels , oxydative)         #remember that R software doesn't care about spaces and they're just to make the code easily readable
d         #displays the table

#now let's build our graph with ggplot2
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()  #ggplot( name of dataset where we take data, using \aes\ we specify x and y variable taken inside the dataset, \+ geom_point()\ only specify that we want points

ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col="red")    #we just changed the size and colour of the points

#we can even create a line instead of points 
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line()

#ggplot works with LAYERS so we can have line and points at the same time
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() + geom_point()

ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() + geom_polygon()      #\geom_polygon() creates polygons about differences with the mean line

#### SETTING A WOTKING DIRECTORY \setwd("path between brackets")\: is fundamental to import data and datasets that must be saved in that directory

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")






                                                                   




