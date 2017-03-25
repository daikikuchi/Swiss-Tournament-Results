# Swiss Tournament Results

Requirements 
- Python 2.7
- PostgreSQL
 
To run it locally:
- Clone or download this repository 
- Install and run psql
- In psql, run below command to import the file for database and table creation. 
    ```
        \i tournament.sql
    ```
- To test, run 
    ```
        python tournament_test.py
    ```
## Project description
- This is a project to create a Swiss tournament system with PostgreSQL.
- A Swiss-system tournament is a non-eliminating tournament format which features a set number of rounds of competition, but considerably fewer than in a round-robin tournament. In a Swiss tournament, each competitor (team or individual) does not play every other. Competitors meet one-to-one in each round and are paired using a set of rules designed to ensure that each competitor plays opponents with a similar running score, but not the same opponent more than once. The winner is the competitor with the highest aggregate points earned in all rounds. All competitors play in each round unless there is an odd number of them.
- Database description:
    ```
    table_name=players
     column_name | data_type 
    -------------+-----------
     pid         | integer
     name        | text
     
    table_name=matches
      column_name | data_type 
    -------------+-----------
     mid         | integer
     winner      | integer
     loser       | integer
     
     View_name = playerstandings
       column_name  | data_type 
    ---------------+-----------
     pid           | integer
     name          | text
     no_of_wins    | bigint
     no_of_matches | bigint
    ```
- The matches can be evaluated and new pairs of players are automatically generated for the next round of matches.
