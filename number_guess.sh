#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess  --no-align --tuples-only -c"

PLAYER_PROCESSING() {
echo -e "Enter your username:"
read USER_NAME

USER_DETAILS=$($PSQL "SELECT games_played, best_game FROM players WHERE username = '$USER_NAME'")

if [[ -z $USER_DETAILS ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  INSERT_NEW_PLAYER=$($PSQL "INSERT INTO players (username) VALUES ('$USER_NAME');")
else
  echo "$USER_DETAILS" | while IFS='|' read -r GAMES_PLAYED BEST_GAME
  do
    echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

echo "Guess the secret number between 1 and 1000:"
read GUESS

GUESS_HANDLER $GUESS $RANDOM_NUMBER 1
}

GUESS_HANDLER () {
  GUESS=$1
  RANDOM_NUMBER=$2
  GUESS_COUNT=$3

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:" 
      read GUESS
      GUESS_HANDLER $GUESS $RANDOM_NUMBER $GUESS_COUNT
  else
    if [ "$GUESS" -gt "$RANDOM_NUMBER" ]; then
      GUESS_COUNT=$((GUESS_COUNT + 1))
      echo "It's lower than that, guess again:"
      read GUESS
      GUESS_HANDLER $GUESS $RANDOM_NUMBER $GUESS_COUNT
    elif [ "$GUESS" -lt "$RANDOM_NUMBER" ]; then
      GUESS_COUNT=$((GUESS_COUNT + 1))
      echo "It's higher than that, guess again:"
      read GUESS
      GUESS_HANDLER $GUESS $RANDOM_NUMBER $GUESS_COUNT
    else
      echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
      UPDATE_STATS 
    fi
  fi
}

UPDATE_STATS() {
  GAMES_PLAYED=$($PSQL "UPDATE players SET games_played=games_played+1 WHERE username = '$USER_NAME'")
  BEST_GAME=$($PSQL "UPDATE players SET best_game=$GUESS_COUNT WHERE username = '$USER_NAME' and best_game>$GUESS_COUNT")
}

PLAYER_PROCESSING