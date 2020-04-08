library(tidyverse)

listino <- read_csv2(file = "listino-comini.csv", quote  = ";")

listino2 <- listino %>%
  select(Codice, Descrizione, `Cod. Fornitore`, U.M., Listino, SC1, SC2, SC3, SC4, Netto) %>%
  mutate_all(replace_na, replace = 0) %>%
  mutate_all(funs(str_replace(., "Cod. ", "")))

write_csv(listino2, "listino-converted.csv", append =FALSE)