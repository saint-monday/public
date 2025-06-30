#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

> all_teams.txt

# Extract team names from CSV (skipping header)
tail -n +2 games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WG OG; do
  echo "$WINNER" >> all_teams.txt
  echo "$OPPONENT" >> all_teams.txt
done

# Sort and get unique team names
sort all_teams.txt | uniq > unique_teams.txt

# Insert teams into database
while IFS= read -r TEAM; do
  # insert into teams
    INSERT_TEAMS_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$TEAM') ON CONFLICT DO NOTHING;")
    if [[ $INSERT_TEAMS_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $TEAM
    fi
  
done < unique_teams.txt


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # insert into games
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR ,'$ROUND' ,$WINNER_ID ,$OPPONENT_ID ,$WINNER_GOALS ,$OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR ,$ROUND ,$WINNER_ID ,$OPPONENT_ID ,$WINNER_GOALS ,$OPPONENT_GOALS
    fi
  fi
done