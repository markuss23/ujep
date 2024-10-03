library(RCzechia)
library(ggplot2)
library(sf)

borders <- RCzechia::republika("low")

rivers <- subset(RCzechia::reky(), Major == T)

mista <- data.frame(misto =  c("Kramářova vila",
                               "Arcibiskupské zahrady v Kroměříži",
                               "Hrad Bečov nad Teplou"),
                    adresa = c("Gogolova 212, Praha 1",
                               "Sněmovní náměstí 1, Kroměříž",
                               "nám. 5. května 1, Bečov nad Teplou"))

# from a string vector to sf spatial points object
POI <- RCzechia::geocode(mista$adresa)

class(POI) # in {sf} package format = spatial and data frame
## [1] "sf"         "data.frame"

# report results
ggplot() +
  geom_sf(data = POI, color = "red", shape = 4, size = 2) +
  geom_sf(data = rivers, color = "steelblue", alpha = 0.5) +
  geom_sf(data = borders, color = "grey30", fill = NA) +
  labs(title = "Very Special Places") +
  theme_bw()