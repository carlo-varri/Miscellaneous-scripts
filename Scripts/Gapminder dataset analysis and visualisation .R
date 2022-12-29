library(gapminder)
library(dplyr)
library(tidyverse)
gapminder
view(gapminder)
library(ggplot2)
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() + scale_x_log10()
# splitting out by year 
ggplot(gapminder,aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) + 
  scale_x_log10() + 
  geom_point() + 
  facet_wrap(~year)

gapminder %>% filter(year== 1967) %>% arrange(desc(gdpPercap))

#random divergence into matrix
a <- c(2,3,4,56)
matrix(a,2,2, byrow = TRUE)

gapminder %>% group_by(continent) %>% 
  filter (year == 2007) %>% 
  summarise(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

gapminder %>% group_by(continent) %>% 
  filter (year == 2007) %>% 
  summarise(medianLifeExp = median(lifeExp), MaxgdpPercap = max(gdpPercap)) 

gapminder %>% group_by(continent) %>% 
  filter (year == 2007) %>% 
  summarise(medianLifeExp = median(lifeExp), MaxgdpPercap = max(gdpPercap)) %>% 
  arrange(desc(MaxgdpPercap)) 
#trying to see the country with lowest GDP per capita in each year 

gapminder %>% 
  group_by(year) %>% 
  summarise (lowestGDPpercap = min(gdpPercap)) %>% 
  arrange(desc(lowestGDPpercap))

gapminder %>% 
  group_by(year) %>% 
  mutate (gdpPercap = min(gdpPercap)) 

gapminder %>% 
  group_by(year) %>% arrange(gdpPercap)
gapminder %>% arrange(gdpPercap) 

#giving up on that - cant get it to match country names to gdp per cap col.   

#nice visual 
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

#next session 
by_year_continent <- gapminder %>% 
  group_by(year,continent) %>% 
  summarise (medianGdpPercap = median(gdpPercap))
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + 
  geom_line() + 
  expand_limits(y=0)
view(by_year_continent)

#now doing bars 
by_continent <- gapminder %>% 
  filter(year==1952) %>% 
  group_by(continent) %>% 
  summarise(medianGdpPercap = median(gdpPercap))

ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) +
  geom_col() 

#trying something out 
testing_facet <- gapminder %>% 
  group_by(continent,year) %>% 
  summarise(medianGdpPercap = median(gdpPercap))

view(testing_facet)
ggplot(testing_facet, aes(x=continent, y=medianGdpPercap)) +
  geom_col() + facet_wrap(~year)

#wow it worked!! (after a few iterations)

#coming back to this after some time to try some other stuff
minGDP <- gapminder %>% 
  group_by(year) %>% 
  slice_min(gdpPercap)
minGDP %>% 
  group_by(continent) %>% 
  count()
ggplot(minGDP, aes(x= year, y= gdpPercap, colour= country)) +
  geom_point() 
ggplot(minGDP, aes(x= year, y= gdpPercap)) +
  geom_line(colour= "Red") 
#Also, see I figured out thing I gave up on above 


#playing with Iris. Looking to plot some nice stuff

library(datasets)
data(iris)
?iris
View(iris)
library(tidyverse)
setosa <- iris %>% filter(Species == "setosa") 
versicolor <- iris %>% filter(Species == "versicolor") 
virginica <- iris %>% filter(Species == "virginica") 

ggplot(setosa, aes(x= Sepal.Length, y=Petal.Length)) + geom_line()

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, colour= Species)) + geom_point()

averages <- iris %>%  group_by(Species) %>% 
  summarise(average.Sepal.Length = mean(Sepal.Length), average.Sepal.Width = mean(Sepal.Width))

View(averages)
?transmute

ggplot(averages, aes(x=average.Sepal.Length, y=average.Sepal.Width, colour= Species)) + geom_point()
ggplot() + geom_point(data =setosa, aes(x=Sepal.Length, y=Petal.Length, size= Petal.Width), colour= "red") +
  geom_point(data =versicolor, aes(x=Sepal.Length, y=Petal.Length, size= Petal.Width), colour="blue") +
  geom_point(data =virginica, aes(x=Sepal.Length, y=Petal.Length, size= Petal.Width), colour="yellow")

#A good plot but want a key with the colour matching species. Unsure how to do this. Wasnt a prob with the gapminder ones as was all within one plot

#Trying to play around with it below. No luck.
ggplot() + geom_point(data =setosa, aes(x=Sepal.Length, y=Petal.Length, colour= Species) +
                        geom_point(data =versicolor, aes(x=Sepal.Length, y=Petal.Length, colour= Species) +
                                     geom_point(data =virginica, aes(x=Sepal.Length, y=Petal.Length, colour= Species))                         
                                   
                                   
                                   
                                   