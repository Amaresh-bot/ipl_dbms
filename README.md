# IPL Database Management System (ipl_dbms)

## 📌 Project Overview
This project is a relational database system built to manage and analyze data from the Indian Premier League (IPL). It encompasses comprehensive data handling for teams, players, matches, venues, and performances. The system enables efficient storage, retrieval, and analysis of IPL data, supporting insights like player statistics, match results, and team comparisons.

## 📂 Table of Contents
- Project Overview
- Features
- Database Schema

## ✨ Features
- Manage complete match schedules and results.
- Store and access player performance per match.
- Track venue usage across different matches and stages.
- Maintain team-related information including owners and coaches.
- Aggregate total scores and individual statistics.
- Generate analytical reports through SQL queries.

## 🗃️ Database Schema
The schema consists of the following primary tables:

- `team`: Stores team ID, name, and city.
- `player`: Contains player information along with their team.
- `c_match`: Records match details including stage, teams, venue, and result.
- `venue`: Provides data about match locations.
- `coach`: Contains coaching staff details.
- `owner`: Stores owner information for each team.
- `individual_score`: Player-wise stats for each match (runs, wickets, etc.).
- `total_score`: Aggregated statistics for each player across matches.

