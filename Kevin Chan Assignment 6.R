library(ggmap)
library(tidyverse)

# Bude, UK
bude <- data.frame('lon' = -4.543678, 'lat' = 50.82664)
# Beaches
summerleaze <- data.frame('lon' = -4.551349, 'lat' = 50.83054)
crooklets <- data.frame('lon' = -4.552731, 'lat' = 50.83626)
# Vacation Spots
cricket <- data.frame('lon' = -4.552814, 'lat' = 50.83347)
pool <- data.frame('lon' = -4.553974, 'lat' = 50.83257)
castle <- data.frame('lon' = -4.548768, 'lat' = 50.82903)
# Pub
barrel <- data.frame('lon' = -4.543023, 'lat' = 50.83007)

## Hotels (Added by Steven)
falcon <- data.frame('lon' = -4.547858, 'lat' = 50.82697)
atlantic <- data.frame('lon' = --4.548378, 'lat' =  50.8314)

# Bude Road Map
budemap_road <- get_map(bude + c(-0.005, 0.005), zoom = 15)
ggmap(budemap_road) + 
  geom_point(aes(x = lon, y = lat), data = bude, color = "black", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = summerleaze, color = "brown", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = crooklets, color = "red", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = cricket, color = "green", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = pool, color = "purple", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = castle, color = "gray", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = barrel, color = "yellow", size = 2)+
  # Hotels added 
  geom_point(aes(x = lon, y = lat), data = falcon, color = "orange", size = 2)+
  geom_point(aes(x = lon, y = lat), data = atlantic, color = "orange", size = 2)

# Bude Watercolor Map
budemap_watercolor <- get_map(bude + c(-0.005, 0.005), zoom = 15, maptype = 'watercolor')
ggmap(budemap_watercolor) + 
  geom_point(aes(x = lon, y = lat), data = bude, color = "black", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = summerleaze, color = "brown", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = crooklets, color = "red", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = cricket, color = "green", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = pool, color = "purple", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = castle, color = "gray", size = 2) + 
  geom_point(aes(x = lon, y = lat), data = barrel, color = "yellow", size = 2)

# Route from cricket grounds to pub
from <- "Bude North Cornwall Cricket Club, Bude, UK"
to <- "The Barrel at Bude, Bude, UK"
cricketpubroute <- route(from, to, structure = "route")
ggmap(budemap_road) + 
  geom_path(aes(x = lon, y = lat), color = "blue", size = 1, data = cricketpubroute, lineend = "round")
