
roulette <- function(disease,
                     bet){
  max_num <- 37

  #map diseases to wheel numbers
  which_num <- round(disease$scaled_pp*max_num)
  wheel_names <- rep(disease$names, which_num)

  # in case rounding down
  wheel_names[37] <- tail(disease$names, 1)
  spin <- sample(x = wheel_names, size = 1)

  # cat(crayon::green(paste("bet:", bet)), "\n")
  # cat(crayon::blue(paste("spin:", spin, "\n")))

  if (bet == spin){
    winnings <- 1/disease$scaled_pp[which(disease$names == spin)]
  }else{
    winnings <- 0
  }

  return(winnings)
}

table_visit <- function(bet, disease, wallet){
  res <- NULL
  # single £1 bets on zika
  for(i in 1:20){
    res[i] <- roulette(disease, bet)
    wallet <- wallet - 1 + res[i]
    if(wallet <= 0) break
  }
  list(res, wallet)
}

