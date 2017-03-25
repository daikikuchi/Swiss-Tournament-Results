-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

--Drop previous new tournament database if exists
DROP DATABASE IF EXISTS tournament;
--Create tournament database;
CREATE DATABASE tournament;
--Connect to the database.
\c tournament;


-- Create table players. This is composed of pid (player id generated by the db and name of players

CREATE TABLE players (
                     pid serial PRIMARY KEY,
                     name text
                     );


-- Create table matches.This is composed of mid (match id generated by the db) and winner, loser as pid(player id) referenced from players

CREATE TABLE matches (
  mid serial PRIMARY KEY,
  winner integer references players (pid) NOT NULL,
  loser integer references players (pid) NOT NULL
);


-- Create view playerstandings since this result is called many times.


CREATE VIEW playerstandings AS
SELECT players.pid, players.name,
    (SELECT count(matches.winner)
         FROM matches
         WHERE players.pid = matches.winner)
         AS no_of_wins,
     (SELECT count(matches.mid)
         FROM matches
         WHERE players.pid = matches.winner
         OR players.pid = matches.loser)
         AS no_of_matches
FROM players
ORDER BY no_of_wins DESC, no_of_matches DESC;