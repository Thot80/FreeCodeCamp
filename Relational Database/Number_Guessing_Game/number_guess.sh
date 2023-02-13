#!/bin/bash

NUMBER_TO_GUESS=$[$RANDOM % 1000 + 1]
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"
GUESSED=false
COUNTER=0
echo "Enter your username:"
read USERNAME
USER_ID=$(echo $($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'") | sed 's/ //')
#echo $NUMBER_TO_GUESS
if [[ $USER_ID =~ ^[0-9]+$ ]]
then
  NUMBER_OF_GAMES=$( echo $($PSQL "SELECT COUNT(1) FROM games WHERE user_id=$USER_ID GROUP BY user_id") | sed 's/ //') 
  BEST_GAME=$( echo $($PSQL "SELECT MIN(score) FROM games WHERE user_id=$USER_ID ") | sed 's/ //')
  echo "Welcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
else
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

 while [[ $GUESSED == false ]]
 do
  if [[ $COUNTER == 0 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
    read USER_GUESS
    COUNTER=$(($COUNTER+1))
    elif [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read USER_GUESS
    else
      if [[ $USER_GUESS > $NUMBER_TO_GUESS ]]
      then
        COUNTER=$(($COUNTER+1))
        echo "It's lower than that, guess again:"
        read USER_GUESS
      elif [[ $USER_GUESS < $NUMBER_TO_GUESS ]]
      then
        COUNTER=$(($COUNTER+1))
        echo "It's higher than that, guess again:"
        read USER_GUESS
      else
        GUESSED=true
        echo "You guessed it in $COUNTER tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
        RESULT_INSERTION=$($PSQL "INSERT INTO games (user_id, score, number_to_guess) VALUES ($USER_ID, $COUNTER, $NUMBER_TO_GUESS)")
      fi
    fi
 done
