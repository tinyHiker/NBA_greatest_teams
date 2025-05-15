WITH season_record AS (
    SELECT
        SUBSTR(season_id, 2, 4)        AS season,   
        team_name_home                 AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM   game
    WHERE  season_type = 'Regular Season'
    GROUP BY season_id, team_name_home

    UNION ALL
    SELECT
        SUBSTR(season_id, 2, 4)        AS season,
        team_name_away                 AS team_name,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM   game
    WHERE  season_type = 'Regular Season'
    GROUP BY season_id, team_name_away
)
SELECT
    season,
    team_name,
    SUM(wins)   AS wins,
    SUM(losses) AS losses,
    ROUND( SUM(wins) / NULLIF(SUM(wins)+SUM(losses),0), 3 ) AS win_pct
FROM   season_record
GROUP BY season, team_name
ORDER BY win_pct ASC;  
