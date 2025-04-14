-- INNER JOIN
SELECT p.player_name, t.Team_name
FROM player p
INNER JOIN team t ON p.team_id = t.t_id;

-- LEFT JOIN
SELECT t.Team_name, c.coach_name
FROM team t
LEFT JOIN coach c ON t.t_id = c.team_id;

-- RIGHT JOIN
SELECT c.coach_name, t.Team_name
FROM coach c
RIGHT JOIN team t ON t.t_id = c.team_id;


-- UNION
SELECT t.Team_name, c.coach_name
FROM team t
LEFT JOIN coach c ON t.t_id = c.team_id

UNION

SELECT t.Team_name, c.coach_name
FROM coach c
RIGHT JOIN team t ON t.t_id = c.team_id;

-- SELF JOIN
SELECT m.m_id, t1.Team_name AS Team1, t2.Team_name AS Team2, m.result
FROM c_match m
JOIN team t1 ON m.team1 = t1.t_id
JOIN team t2 ON m.team2 = t2.t_id;

-- JOIN with Multiple Tables
SELECT 
    m.m_id,
    t1.Team_name AS Team1,
    t2.Team_name AS Team2,
    v.Venue_name AS Venue,
    tw.Team_name AS Toss_Winner
FROM c_match m
JOIN team t1 ON m.team1 = t1.t_id
JOIN team t2 ON m.team2 = t2.t_id
JOIN venue v ON m.v_id = v.v_id
JOIN team tw ON m.toss_won_by = tw.t_id;


