library(readr)
library(ggplot2)
library(dplyr)
library(patchwork)
climate_change <- read_csv("Documents/rdata/climate_change.csv")


p1 <- ggplot(data = climate_change)+
  geom_smooth(mapping = aes(y = climate_change$Temp, x = climate_change$Year))+
  labs(y = "Temperature", x = "Year" )

p2 <- ggplot(data = climate_change)+
  geom_smooth(mapping = aes(y = climate_change$Aerosols, x = climate_change$Year))+
#, color = climate_change$Year))+
  labs(color = "Year", y = "aerosol", x = "Years" )

p3 <- ggplot(data = climate_change)+
  geom_point(mapping = aes(y = climate_change$N2O, x = climate_change$Temp, color = climate_change$Year))+
  labs(color = "Year", y = "N2O", x = "Temperature" )

p1 + p2 + p3 





