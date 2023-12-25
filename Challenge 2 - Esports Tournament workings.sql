-- to refer to the tables you can come back to this 
SELECT *
FROM sql_challenges.teams;

SELECT *
FROM sql_challenges.players;

SELECT *
FROM sql_challenges.matches;

-- 1. What are the names of the players whose salary is greater than 100,000?
SELECT 
	player_name, 
    salary
FROM sql_challenges.players
WHERE salary > 100000
ORDER BY salary DESC; 

-- 2. What is the team name of the player with player_id = 3?
SELECT 	
	team_name, 
    player_id
FROM teams
	INNER JOIN players
    ON teams.team_id = players.team_id
WHERE player_id = 3; 

-- 3. What is the total number of players in each team?
SELECT 
	team_name, 
    COUNT(player_name) AS no_of_players
FROM teams
	INNER JOIN players
    ON teams.team_id = players.team_id
GROUP BY team_name;

-- 4. What is the team name and captain name of the team with team_id = 2?
-- Requires using the teams table only 
SELECT 
	team_name, 
    captain_id
FROM teams
WHERE team_id = 2;

-- 5. What are the player names and their roles in the team with team_id = 1?
SELECT 
	player_name, 
    role 
FROM players
WHERE team_id = 1;

-- 6. What are the team names and the number of matches they have won?
SELECT 	
	team_name, 
    COUNT(winner_id) AS no_of_matches_won
FROM teams 
	INNER JOIN matches 
    ON teams.team_id = matches.winner_id
GROUP BY team_name
ORDER BY no_of_matches_won DESC;

-- 7. What is the average salary of players in the teams with country 'USA'?
SELECT 
	AVG(salary)AS avg_salary, 
    country, 
    team_name
FROM teams
	INNER JOIN players
    ON teams.team_id = players.team_id
WHERE country = "USA"
GROUP BY 
	country, 
    team_name;

-- 8. Which team won the most matches?
SELECT 
	team_name, 
    COUNT(winner_id) AS no_of_matches_won
FROM teams 
	INNER JOIN matches 
    ON teams.team_id = matches.winner_id
GROUP BY team_name
ORDER BY no_of_matches_won DESC
LIMIT 1; 

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?
SELECT 
	team_name, 
    COUNT(player_id) AS no_of_players
FROM teams
	INNER JOIN players
    ON teams.team_id = players.team_id
WHERE salary > 100000
GROUP BY team_name
ORDER BY no_of_players DESC; 

-- 10. What is the date and the score of the match with match_id = 3?
SELECT 
	match_id, 
	match_date, 
	score_team1, 
	score_team2
FROM matches 
WHERE match_id = 3; 