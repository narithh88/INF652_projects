#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#For emptying databases for testing each time 
echo "$($PSQL "TRUNCATE TABLE games, teams")"

tail -n +2 games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Insert both teams
  $PSQL "INSERT INTO teams(name) VALUES('$WINNER'), ('$OPPONENT') ON CONFLICT(name) DO NOTHING"

  #ROUND IS not a number, so we need the ''
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
         VALUES($YEAR, '$ROUND', 
                (SELECT team_id FROM teams WHERE name='$WINNER'),
                (SELECT team_id FROM teams WHERE name='$OPPONENT'),
                $WINNER_GOALS, $OPPONENT_GOALS)"
done
