```
library(readr)
library(ggplot2)    
library(tidyverse)  
library(maps)

#Starter med å lese dataene fra github
union<- read_csv("https://uit-sok-2008-h22.github.io/Assets/union_unempl.csv") #This loads the data with information about the variables of interest
View(union) 

union$country <- gsub("United Kingdom", "UK", union$country)
View(union) 

names(union)[names(union) == "country"] <- "region"
View(union) 

#Lager videre variabelen "Excess_coverage"
mapdata1$excess_coverage<-mapdata1$coverage - mapdata1$density

#Laster så inn map_data
mapdata <- map_data("world")

mapdata <- left_join(mapdata, union, by= "region")

mapdata1 <- mapdata %>% filter(!is.na(mapdata$unempl))


#Så lager jeg et plot for arbeidsledighet ved bruk av ggplot, map1.1
map1 <- ggplot(mapdata1, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = unempl), col = "black")
map1

map1.1 <- map1 + scale_fill_gradient(name = "Prosent arbeidsledighet", low = "green", high = "red", na.value = "grey50") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        rect = element_blank())
map1.1

#Som vi ser på plottet er arbeidsledigheten i Nord-Europa relativt lav i forhold til Sør-Europa. En av grunnene til dette er at de nordiske landene og Tyskland gjorde det økonomsik bra etter finanskrisen i 2007-2008.

#Lager plot for Fagforeningsdensitet
map2 <- ggplot(mapdata1, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = density), col = "black")
map2

map2.1 <- map2 + scale_fill_gradient(name = "Fagforeningsdensitet i Prosent", low = "red", high = "green", na.value = "grey50") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        rect = element_blank())
map2.1

#I norden er det mye høyere prosentandel som er medlem i fagforening. Dette er på grunn av 

#Lager videre plot for "Excess_coverage"
map3 <- ggplot(mapdata1, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = excess_coverage), col = "black")
map3

map3.1 <- map3 + scale_fill_gradient(name = "Excess Coverage", low = "red", high = "green", na.value = "grey50") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        rect = element_blank())
map3.1

#Dette plottet viser "Excess Coverage" som er andelen av abeidsstyrken som er dekkes av lønnsforhandlingene gjort av en fagforening men som ikke er medlem av en fagforening.

#Lager plot for "Koordinering av lønnfastsettelse"
map4 <- ggplot(mapdata1, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = coord), col = "black")
map4

map4.1 <- map4 + scale_fill_brewer(name= "Koordinering av lønnfastsettelse", palette = "Set1") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        rect = element_blank())
map4.1

#Plottet viser oss hvilken koordinering det er av lønnfastsettelse i Europa.
```

