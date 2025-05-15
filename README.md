# NBA Winners and Losers– Oracle SQL Developer Edition

A mini‑project that answers three classic basketball questions using pure SQL and an open Kaggle dataset.

| Question                                                                 | Answer                               |
| ------------------------------------------------------------------------ | ----------------------------------------------------------------- |
|  1. Which franchise has won the most games all-time?                     | Boston Celtics                                                    |
|  2. Which franchise had the best single-season record?                   | The 2015 Golden State Warriors |
|  3. Whihc franchise had the worst single-season record?                  | The 2011 Charlotte Bobcats                                       |

---

## Dataset

* **Source**: [Kaggle – NBA Database](https://www.kaggle.com/datasets/wyattowalsh/basketball/data)
* **Original form**: \~20 CSV files (games, teams, players, etc.)
* **Table used here**: **`GAME`** – one row per game with results for both teams.

| Column           | Example            | Notes                |
| ---------------- | ------------------ | -------------------- |
| `GAME_DATE`      | 1949‑11‑02         | DATE                 |
| `TEAM_NAME_HOME` | "Detroit Pistons"  |                      |
| `TEAM_NAME_AWAY` | "Boston Celtics"   |                      |
| `WL_HOME`        | `"W"` / `"L"`      | Result for home team |
| `WL_AWAY`        | `"L"` / `"W"`      | Result for away team |
| `SEASON_ID`      | `"S2019"`          | Kaggle’s season code |
| `SEASON_TYPE`    | `"Regular Season"` | filters out playoffs |

## Import workflow

1. **Download CSVs** from Kaggle.
2. **Oracle SQL Developer ▶ Tools ▶ Import Data** → target table `GAME`.
3. Repeat for each CSV or use the wizard’s batch mode.

*(On a fresh Oracle 21c XE install the whole import fits comfortably in the default USERS tablespace.)*


## Question 1 Result
![Alt text for screen readers](/images/Question1Result.png)

## Question 2 Result
![Alt text for screen readers](/images/Question2Answer.png)

## Question 3 Result
![Alt text for screen readers](/images/Question3Answer.png)