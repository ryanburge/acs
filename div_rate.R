library(tidyverse)
library(extrafont)
library(labelled)
library(haven)


usa <- read_dta("D://acs/usa_00001.dta")

us1 <- usa %>% group_by(occ) %>% filter(marst != 6) %>% count(marst) %>% mutate(pct = prop.table(n)) %>% filter(marst ==4) %>% ungroup(occ)

occ <- read_csv("D://acs/occ.csv")

occ <- occ %>% mutate(occ = as.numeric(code))

divrate <- left_join(us1, occ) %>% select(occupation, pct)


