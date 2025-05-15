SELECT
    team_name,
    SUM(wins)   AS wins,
    SUM(losses) AS losses
FROM (
    
    SELECT
        team_name_home AS team_name,
        SUM(CASE WHEN wl_home = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_home = 'L' THEN 1 ELSE 0 END) AS losses
    FROM   game
    GROUP BY team_name_home

    UNION ALL

   
    SELECT
        team_name_away AS team_name,
        SUM(CASE WHEN wl_away = 'W' THEN 1 ELSE 0 END) AS wins,
        SUM(CASE WHEN wl_away = 'L' THEN 1 ELSE 0 END) AS losses
    FROM   game
    GROUP BY team_name_away
)
GROUP BY team_name
ORDER BY wins ASC;
