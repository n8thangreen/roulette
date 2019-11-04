
library(purrr)

disease <- list()

# disease$names <- c("Ascaris", "Chagas", "Cholera", "Dengue", "Ebola", "Elephantiasis", "Guinea Worm", "HIV",
#                    "Hookworm", "Influenza", "Malaria", "Measles", "MERS-CoV", "Onchocerciasis", "Plague",
#                    "Polio", "Rabies", "Scabies", "Smallpox", "Tubeculosis", "Zika")
# disease$pandemic_potential <- c(1, 1, 4, 3, 4, 1, 1, 8, 1, 10, 5, 7, 1, 1, 4, 4, 1, 2, 2, 10, 3)

disease$names <- c("Cholera", "Dengue", "Ebola", "HIV",
                   "Influenza", "Malaria", "Measles", "Plague",
                   "Polio", "Scabies", "Smallpox", "Tubeculosis", "Zika")

disease$pandemic_potential <- c(4, 3, 4, 8, 10, 5, 7, 4, 4, 2, 2, 10, 3)
disease$scaled_pp <- disease$pandemic_potential/sum(disease$pandemic_potential)

# bet <- "Tubeculosis"
bet <- "Smallpox"
wallet <- 10

out <- map(rep(bet, 500), .f = function(x) table_visit(x, disease, wallet))

# final wallet
hist(map_dbl(out, 2), breaks = 50, #ylim = c(0,100),
     main = "final wallet", freq = FALSE)

# number of turns (before bankrupt)
hist(map_dbl(map(out, 1), length), breaks = 10, #xlim = c(0, 200),
     main = "number of turns (before bankrupt)", freq = FALSE)
