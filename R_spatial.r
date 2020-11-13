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
