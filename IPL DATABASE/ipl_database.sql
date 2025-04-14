-- Insert sample data into `owner` table
INSERT INTO `owner` (Owner_name) VALUES
('Shah Rukh Khan'),
('Mukesh Ambani'),
('Vijay Mallya'),
('GMR Co.'),
('India Cement');

-- Create the `team` table
CREATE TABLE `team` (
  `t_id` INT NOT NULL AUTO_INCREMENT,
  `Team_name` VARCHAR(50) NOT NULL,
  `money_spent` DECIMAL(10,2),
  `home_ground` VARCHAR(50) NOT NULL,
  `o_id` INT NOT NULL,
  PRIMARY KEY (`t_id`),
  FOREIGN KEY (`o_id`) REFERENCES `owner` (`o_id`)
);

-- Insert sample data into `team` table
INSERT INTO `team` (Team_name, money_spent, home_ground, o_id) VALUES
('Chennai Super Kings', 38.81, 'M. A. Chidambaram Stadium', 1),
('Delhi Daredevils', 24.29, 'Feroz Shah Kotla', 2),
('Deccan Chargers', 27.94, 'Uppal Stadium', 3),
('Kolkata Knight Riders', 32.53, 'Eden Gardens', 4),
('Mumbai Indians', 34.24, 'Wankhade Stadium', 5);

-- Create the `venue` table
CREATE TABLE `venue` (
  `v_id` INT NOT NULL AUTO_INCREMENT,
  `Venue_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`v_id`)
);

-- Insert sample data into `venue` table
INSERT INTO `venue` (Venue_name) VALUES
('M. A. Chidambaram Stadium'),
('Feroz Shah Kotla'),
('Eden Gardens'),
('Uppal Stadium'),
('Wankhade Stadium');

CREATE TABLE `player` (
    `player_id` INT NOT NULL AUTO_INCREMENT,
    `player_name` VARCHAR(45) NOT NULL,
    `role` VARCHAR(45) NOT NULL,
    `team_id` INT NOT NULL,
    PRIMARY KEY (`player_id`),
    KEY `team_id` (`team_id`),
    CONSTRAINT `player_ibfk_1` 
        FOREIGN KEY (`team_id`) 
        REFERENCES `team` (`team_id`) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
-- Create the `c_match` table
CREATE TABLE `c_match` (
  `m_id` INT NOT NULL AUTO_INCREMENT,
  `stage` VARCHAR(50) NOT NULL,
  `team1` INT NOT NULL,
  `team2` INT NOT NULL,
  `m_date` DATE NOT NULL,
  `toss_won_by` INT NOT NULL,
  `result` VARCHAR(50) NOT NULL,
  `v_id` INT NOT NULL,
  PRIMARY KEY (`m_id`),
  FOREIGN KEY (`team1`) REFERENCES `team` (`t_id`),
  FOREIGN KEY (`team2`) REFERENCES `team` (`t_id`),
  FOREIGN KEY (`toss_won_by`) REFERENCES `team` (`t_id`),
  FOREIGN KEY (`v_id`) REFERENCES `venue` (`v_id`)
);
-- Insert sample data into `c_match` table
INSERT INTO `c_match` (stage, team1, team2, m_date, toss_won_by, result, v_id) VALUES
('Group', 1, 2, '2023-04-01', 1, 'MI', 1),
('Group', 2, 3, '2023-04-02', 2, 'RCB', 2),
('Group', 3, 4, '2023-04-03', 3, 'DD', 3),
('Semi Final', 4, 5, '2023-04-04', 4, 'KKR', 4),
('Final', 5, 1, '2023-04-05', 5, 'CSK', 5);


-- Create the `coach` table
CREATE TABLE `coach` (
  `c_id` INT NOT NULL AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `coach_name` VARCHAR(50) NOT NULL,
  `domain` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`c_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`t_id`)
);

    -- Insert sample data into `coach` table
INSERT INTO `coach` (team_id, coach_name, domain) VALUES
(1, 'Stephen Fleming', 'Head Coach'),
(2, 'Ricky Ponting', 'Batting Coach'),
(3, 'Shane Bond', 'Bowling Coach'),
(4, 'Muttiah Muralidharan', 'Spin Bowling Coach'),
(5, 'Daniel Vettori', 'Fielding Coach');

-- Create the `individual_score` table
CREATE TABLE `individual_score` (
  `player_id` INT NOT NULL,
  `m_id` INT NOT NULL,
  `runs` INT NOT NULL,
  `wickets` INT NOT NULL,
  `catches` INT NOT NULL,
  `sixes` INT NOT NULL,
  `fours` INT NOT NULL,
  `strike_rate` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`player_id`, `m_id`),
  FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  FOREIGN KEY (`m_id`) REFERENCES `c_match` (`m_id`)
);

CREATE TABLE `player` (
    `player_id` INT NOT NULL AUTO_INCREMENT,
    `player_name` VARCHAR(45) NOT NULL,
    `role` VARCHAR(45) NOT NULL,
    `team_id` INT NOT NULL,
    PRIMARY KEY (`player_id`),
    KEY `team_id` (`team_id`),
    CONSTRAINT `player_ibfk_1` 
        FOREIGN KEY (`team_id`) 
        REFERENCES `team` (`team_id`) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

DESCRIBE team;

CREATE TABLE `player` (
    `player_id` INT NOT NULL AUTO_INCREMENT,
    `player_name` VARCHAR(45) NOT NULL,
    `role` VARCHAR(45) NOT NULL,
    `team_id` INT NOT NULL,
    PRIMARY KEY (`player_id`),
    KEY `team_id` (`team_id`),
    CONSTRAINT `player_ibfk_1` 
        FOREIGN KEY (`team_id`) 
        REFERENCES `team` (`t_id`) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Insert sample data into `player` table
INSERT INTO `player` (player_name, role, team_id) VALUES 
('Rohit Sharma', 'Batsman', 5),
('Virat Kohli', 'Batsman', 2),
('David Warner', 'Batsman', 3),
('Rashid Khan', 'Bowler', 4),
('MS Dhoni', 'Wicketkeeper', 1);

-- Create the `individual_score` table
CREATE TABLE `individual_score` (
  `player_id` INT NOT NULL,
  `m_id` INT NOT NULL,
  `runs` INT NOT NULL,
  `wickets` INT NOT NULL,
  `catches` INT NOT NULL,
  `sixes` INT NOT NULL,
  `fours` INT NOT NULL,
  `strike_rate` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`player_id`, `m_id`),
  FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  FOREIGN KEY (`m_id`) REFERENCES `c_match` (`m_id`)
);

-- Insert sample data into individual_score table
INSERT INTO individual_score 
(player_id, m_id, runs, wickets, catches, sixes, fours, strike_rate) 
VALUES 
  (1, 1, 78, 0, 2, 4, 7, 166.00),
  (2, 2, 91, 0, 3, 8, 7, 210.00),
  (3, 3, 108, 0, 1, 9, 8, 199.00),
  (4, 4, 32, 2, 0, 0, 4, 112.00),
  (5, 5, 67, 1, 1, 3, 5, 148.00);
  
  -- Create the `total_score` table
CREATE TABLE total_score (
   score_id INT NOT NULL AUTO_INCREMENT,
   player_id INT NOT NULL,
   match_id INT NOT NULL,
   runs INT NOT NULL,
   wickets INT NOT NULL,
   catches INT NOT NULL,
   sixes INT NOT NULL,
   fours INT NOT NULL,
   strike_rate DECIMAL(10, 2) NOT NULL,
   PRIMARY KEY (score_id),
   FOREIGN KEY (player_id) REFERENCES player(player_id),
   FOREIGN KEY (match_id) REFERENCES c_match(m_id)
);
-- Insert sample data into `total_score` table
INSERT INTO total_score (player_id, match_id, runs, wickets, catches, sixes, fours, strike_rate) 
VALUES 
  (1, 1, 50, 1, 2, 4, 6, 135.0),
  (2, 1, 60, 0, 1, 3, 7, 140.0);
  
  -- Joining of Join total_score with player to get the player's name.
-- Join player with team to get the corresponding team name.
  SELECT 
    ts.score_id, 
    p.player_name, 
    t.team_name, 
    ts.runs, 
    ts.wickets, 
    ts.catches, 
    ts.sixes, 
    ts.fours, 
    ts.strike_rate
FROM 
    total_score ts
JOIN player p ON ts.player_id = p.player_id  -- Join player table to get player name
JOIN team t ON p.team_id = t.t_id  -- Join team table to get team name
LIMIT 5;

-- Match Result
SELECT 
    cm.m_id, 
    t1.Team_name AS team1_name, 
    t2.Team_name AS team2_name, 
    CASE
        -- Calculate total runs for team1
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0)
        THEN t1.Team_name
        
        -- Calculate total runs for team2
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0)
        THEN t2.Team_name
        
        -- If the runs are equal, show "No result"
        ELSE 'No result'
    END AS winner
FROM 
    c_match cm
JOIN 
    team t1 ON cm.team1 = t1.t_id
JOIN 
    team t2 ON cm.team2 = t2.t_id
ORDER BY 
    cm.m_date DESC;


-- Highest Runs 
SELECT p.player_name, MAX(i.runs) AS highest_runs
FROM individual_score i
JOIN player p ON i.player_id = p.player_id
GROUP BY p.player_name
ORDER BY highest_runs DESC
LIMIT 3;

-- Most Wickets
SELECT p.player_name, MAX(i.wickets) AS most_wickets
FROM individual_score i
JOIN player p ON i.player_id = p.player_id
GROUP BY p.player_name
ORDER BY most_wickets DESC
LIMIT 3;

-- Best all-round performance (total runs + wickets across all matches)
SELECT p.player_name, 
       SUM(i.runs + i.wickets) AS best_performance
FROM individual_score i
JOIN player p ON i.player_id = p.player_id
GROUP BY p.player_name
ORDER BY best_performance DESC
LIMIT 3;

-- Find the winner and runner-up team from the most recent match
SELECT 
    CASE
        -- Determine winner based on total runs for team1
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0)
        THEN t1.team_name
        
        -- Determine winner based on total runs for team2
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0)
        THEN t2.team_name
        
        -- If the runs are equal, show "No result"
        ELSE 'No result'
    END AS winner_team,
    
    CASE
        -- Runner-up based on total runs comparison
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0) < 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0)
        THEN t1.team_name
        
        -- Runner-up based on total runs comparison
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0) < 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0)
        THEN t2.team_name
        
        -- If the runs are equal, show "No result"
        ELSE 'No result'
    END AS runner_up_team
FROM 
    c_match cm
JOIN 
    team t1 ON cm.team1 = t1.t_id
JOIN 
    team t2 ON cm.team2 = t2.t_id
ORDER BY 
    cm.m_date DESC
LIMIT 1;

-- Top 3 players by Runs
SELECT 
    p.player_name, 
    i.runs
FROM 
    individual_score i
JOIN 
    player p ON i.player_id = p.player_id
ORDER BY 
    i.runs DESC
LIMIT 3;

-- Total score by players in detail
SELECT 
    p.player_name, 
    SUM(ts.runs) AS total_runs, 
    SUM(ts.wickets) AS total_wickets, 
    SUM(ts.catches) AS total_catches, 
    SUM(ts.sixes) AS total_sixes, 
    SUM(ts.fours) AS total_fours
FROM 
    total_score ts
JOIN 
    player p ON ts.player_id = p.player_id
GROUP BY 
    p.player_name;
    
-- Match Results    
SELECT 
    cm.m_id, 
    t1.Team_name AS team1_name, 
    t2.Team_name AS team2_name, 
    CASE
        -- Calculate total runs for team1
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0)
        THEN t1.Team_name
        
        -- Calculate total runs for team2
        WHEN COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t2.t_id AND i.m_id = cm.m_id), 0) > 
             COALESCE((SELECT SUM(i.runs) 
                       FROM individual_score i 
                       JOIN player p ON i.player_id = p.player_id
                       WHERE p.team_id = t1.t_id AND i.m_id = cm.m_id), 0)
        THEN t2.Team_name
        
        -- If the runs are equal or no data exists, show "No result"
        ELSE 'No result'
    END AS winner
FROM 
    c_match cm
JOIN 
    team t1 ON cm.team1 = t1.t_id
JOIN 
    team t2 ON cm.team2 = t2.t_id
ORDER BY 
    cm.m_date DESC;