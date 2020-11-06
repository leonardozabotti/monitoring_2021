# R CODE TO PLOT RELATIONSHIPS AMONG ECOLOGICAL VARIABLES

      # Remember that there are many packages to make everything you need and if there are no packages you can still create one

      # we will use the   \sp\ package whose details are here: https://cran.r-project.org/web/packages/sp/index.html
      # inside the CRAN page there is the REFERENCE MANUAL in PDF and the VIGNETTE which explains what to do with the code and its outputs

#---- HOW TO INSTALL PACKAGES: using the function \install.packages(ARGUMENT)\ 

install.packages("sp")      # always put brackets "" when you recall something outside R to bring it inside
library(sp)                 # we need to use this function to activate the package and actually use it. No brackets needed "" becasue it's already in R

data(meuse)     # we now need to bring a dataset in R called "meuse" and we can use the \data\ function
meuse           # to display dataset in the console in a bad way (not very clear)

View(meuse)     # R is sensitive to capital letters so remember to write View() and not view(). The \View\ function displays the table 
head(meuse)     # to display in the console just the first part of the table using \head\ function. To see the last lines use \tail()\ function

#---EXERCISE: calculate the mean of all the variables
# we can do it adding all the data in a column and divide 
# or we can simply use the \summary\ function

summary(meuse)      # display the main statistics

#---EXERCISE: plot zinc(y) against cadmium(x)
# we first need to extract the zinc and cadmium data and put them into objects otherwise \plot(cadmium, zinc)\ will lead to error

# we can use $ to tell R that those data are inside a dataset

plot(meuse$cadmium, meuse$zinc)     
 
# rather than $ we could have used the function \attach()\ to tell R that all the variables we'll call are inside a particular dataset
attach(meuse)           #to detach we can just use the \detach()\ function
plot(cadmium, zinc)

plot(cadmium, lead)

#---HOW TO SEE ALL THE POSSIBLE RELATIONS BETWEEN VARIABLES
# First manner is the trivial one: going to Excel and plot all the data 
# Second and easiest/fastest one is using the \pairs()\ function and producing a scatterplot matrix

pairs(meuse)    #shows all the possible graphics 

#---QUESTION: can you pair just the elements part of the dataset? like just pair cadmium, copper, lead and zinc












