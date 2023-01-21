#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate Tables
echo $($PSQL "TRUNCATE teams CASCADE")
# READ and Iterate over csv
cat games.csv | while IFS=, read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip first row
  if [[ $YEAR != 'year' ]]
  then
    # Get winner team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # If not found Insert it
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERT_WINNER_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams from winner, $WINNER
      fi
      # Get newly inserted team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
    # Get opponent team ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # If not found Insert it
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ INSERT_OPPONENT_NAME == 'INSERT 0 1' ]]
      then
        echo Inserted into teams from opponent, $OPPONENT
      fi
      # Get newly inserted team id 
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    # Insert datas in games
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into goals, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
    fi
  fi
done
# dump database
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql