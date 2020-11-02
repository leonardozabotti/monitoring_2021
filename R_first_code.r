# We're making an example about primates abundance evaluation

#gonna write down the numbers of primates we see in every plot while on the field and put them into brackets

primates <- c(3, 5, 9, 15, 40)        #this is an array so we put a 'c' before the array and we put an arrow to give it a name
primates

#we now imagine that primates eat crabs (pure speculation) and we create a crab population

crabs <- c(100, 70, 30, 10, 5)
crabs

#first plot in R using the plot function
plot(primates, crabs)

#let's now play with the plot, for example, changing colours (see how colours are named in R searching in Google)

plot(primates, crabs, col="red")   #the argument to change the colour is col="name of the colour"

plot(primates, crabs, col="red", pch=19)   #we now change the point symbols in the plot using \pch=number\ that means "point change" and the character code is in Goole
                                           #if you put pch='number' the points become the number given
plot(primates, crabs, col="red", pch=19, cex=2)   #now we change the size of the points using the argument \cex=number\ which means "character exageration", the numner means "X times the original size"

plot(primates, crabs, col="red", pch=19, cex=2, main='My first ecological graph in R!')  #we now put the title using \main='text'\


#  we will now use a pre-installes dataset and packages to deal with them and also the data.frame function

#create a dataframe and give it a name
ecoset <- data.frame(primates, crabs)      #every argument of \data.frame\ is a variable and so a column in the frame
ecoset         #every line is called "sight" and every row is called "variable"

#what is the average number of primates? let's look for some ecological numbers

(3+5+9+15+40)/5    #the result is the average number of primates per site

#another simple manner is by using the \summary\ function that gives back all the summary statistics of a dataframe

summary(ecoset)  #automatically displays all the useful statistics



