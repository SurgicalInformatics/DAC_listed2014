library(tidyr)
library(readxl)
library(magrittr)
library(ggplot2)

# this Excel is a copy paste + hand edits from the PDF (also in the repo)
wide_data = read_excel("DAC_listed_countries.xlsx")

long_data = wide_data %>% 
  gather("DAC_listing", "country") %>% 
  na.omit()

#alphabetical order happens to be the correct order
long_data$DAC_listing %<>% factor()

long_data %>% 
  ggplot(aes(DAC_listing)) + 
    geom_bar()

DAC_listed = long_data
save(DAC_listed, file = "DAC_listed_countries.rda")
write.csv(DAC_listed, file = "DAC_listed_countries_tidy.csv", row.names = FALSE)