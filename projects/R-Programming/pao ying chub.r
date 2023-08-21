# R-Programming : pao ying chub project

win <- 0
lose <- 0
tie <- 0
hand_game <- c("Rock", "Scissors", "Paper")

writeLines("Let's play rock-scissors-paper games!\n")
writeLines("Type 'Rock' / 'Scissors' / 'Paper' during the game.\n")
writeLines("Type 'quit' when you want to leave the game.\n")
writeLines("Do you understand? Let's start the game!\n")

paoyingchub_game <- 1
while (TRUE) {
  print(paste0("Battle ", as.character(paoyingchub_game)))
  writeLines("Your turn: ")
  player_game <- tolower(readLines("stdin", n = 1))
  
  if (tolower(player_game) %in% hand_game) {
    writeLines("Enemy: ")
    sample_game <- sample(hand_game, 1)
    print(sample_game)
    writeLines("\n")
    
    if (player_game == sample_game) {
      tie <- tie + 1
      writeLines("It's a tie!\n")
    } else if ((player_game == "Rock" && sample_game == "Scissors") ||
               (player_game == "Scissors" && sample_game == "Paper") ||
               (player_game == "Paper" && sample_game == "Rock")) {
      win <- win + 1
      writeLines("You win!\n")
    } else {
      lose <- lose + 1
      writeLines("You lose!\n")
    }
    
    paoyingchub_game <- paoyingchub_game + 1
    
  } else if (tolower(player_game) == "quit") {
    break
  } else {
    writeLines("Let's try again!\n")
    next
  }
  
  writeLines("\n")
}

writeLines("\n")
writeLines("Yeah! This is your game record\n")
writeLines("\n")
print(paste("in the middle of a competition", as.character(paoyingchub_game - 1), "round(s)"))
print(paste("win  :", as.character(win), "round(s)"))
print(paste("tie  :", as.character(tie), "round(s)"))
print(paste("lose :", as.character(lose), "round(s)"))
