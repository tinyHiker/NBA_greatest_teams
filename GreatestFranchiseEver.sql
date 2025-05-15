---------------------------------------------------------------
-- 1. List every game with result flags, latest first
---------------------------------------------------------------
SELECT
    game_date,
    team_name_home,
    team_name_away,
    wl_home,
    wl_away
FROM   game
ORDER BY game_date DESC;


---------------------------------------------------------------
-- 2. Home‑team wins by team
---------------------------------------------------------------
SELECT
    team_name_home AS team_name,
    COUNT(*)       AS wins
FROM   game
WHERE  wl_home = 'W'
GROUP BY team_name_home
ORDER BY team_name;


---------------------------------------------------------------
-- 3. Total wins (home + away) by team
---------------------------------------------------------------
SELECT
    team_name,
    SUM(wins) AS wins
FROM (
    -- home wins
    SELECT
        team_name_home AS team_name,
        COUNT(*)       AS wins
    FROM   game
    WHERE  wl_home = 'W'
    GROUP BY team_name_home

    UNION ALL

    -- away wins
    SELECT
        team_name_away AS team_name,
        COUNT(*)       AS wins
    FROM   game
    WHERE  wl_away = 'W'
    GROUP BY team_name_away
)
GROUP BY team_name
ORDER BY wins DESC;  


---------------------------------------------------------------
-- 4. Wins & losses (home + away) by team
---------------------------------------------------------------
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
