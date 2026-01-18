-- Query 1: Display all records from the Premier League players table (Season 2023–2024)
-- Purpose: Understand the table structure and available columns before analysis
select * from [premier-player-23-24] ; 

-- Query 2: Data Cleaning 
-- Purpose: Identify missing or empty values in key columns
-- Columns checked: Player, Nation, Position, Age, Team
select 
SUM (case when player is null or player = ' ' then 1 else 0 end ) as player_null , 
SUM(case when Nation is null or Nation = '' then 1 else 0 end ) as nation_null , 
sum(case when Pos is null or Pos = '' then 1 else 0 end ) as pos_null , 
sum (case when age is null or Age = '' then 1 else 0 end ) as age_null , 
SUM (case when Team is null or Team = '' then 1 else 0 end) as team_null 
from 
[premier-player-23-24]  ; 

-- Query 4: Team-level analysis
-- Purpose:
-- 1. Calculate the average age of players per team
-- 2. Compute total goals scored by each team
-- 3. Analyze average expected goals (xG)
select 
Player , Age , Team 
from [premier-player-23-24] 
group by Player , age , Team
having COUNT(*) > 1 ; 

-- Query 5: Player attacking contribution ranking
-- Purpose:
-- Rank players based on their attacking contribution (Goals + Assists)
-- Include estimated matches played (90 minutes ? 1 match)

select 
Team , 
round (AVG (Age),0)  as AVG_AGE , 
sum (Gls) as TATAL_GOALS , 
round ( AVG (xG) ,0)  as XG 
from 
[premier-player-23-24] 
group by team  

select 
Player , 
ROUND (_90s,0) as Matches_Played , 
G_A , 
xg , 
xAG
from 
[premier-player-23-24]
order by g_a desc ; 


