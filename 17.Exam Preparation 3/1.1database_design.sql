CREATE TABLE IF NOT EXISTS towns (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(45) NOT NULL
);


CREATE TABLE IF NOT EXISTS stadiums (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(45) NOT NULL,
  capacity INT NOT NULL,
  town_id INT NOT NULL
);


CREATE TABLE IF NOT EXISTS teams (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(45) NOT NULL,
  established DATE NOT NULL,
  fan_base INT DEFAULT 0 NOT NULL,
  stadium_id INT NOT NULL
);


CREATE TABLE IF NOT EXISTS coaches (
  "id" SERIAL PRIMARY KEY,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
  coach_level INT DEFAULT 0 NOT NULL
);


CREATE TABLE IF NOT EXISTS skills_data (
  "id" SERIAL PRIMARY KEY,
  dribbling INT DEFAULT 0,
  pace INT DEFAULT 0,
  "passing" INT DEFAULT 0,
  shooting INT DEFAULT 0,
  speed INT DEFAULT 0,
  strength INT DEFAULT 0
);


CREATE TABLE IF NOT EXISTS players (
  "id" SERIAL PRIMARY KEY,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  age INT DEFAULT 0 NOT NULL,
  "position" CHAR(1) NOT NULL,
  salary NUMERIC(10, 2) DEFAULT 0 NOT NULL,
  hire_date TIMESTAMP,
  skills_data_id INT NOT NULL,
  team_id INT
);


CREATE TABLE IF NOT EXISTS players_coaches (
  player_id INT,
  coach_id INT
);

ALTER TABLE stadiums
ADD CONSTRAINT stadiums_capacity_check
    CHECK (capacity > 0),
ADD CONSTRAINT fk_stadiums_towns
    FOREIGN KEY (town_id)
    REFERENCES towns("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE teams
ADD CONSTRAINT teams_fan_base_check
    CHECK (fan_base >= 0),
ADD CONSTRAINT fk_teams_stadiums
    FOREIGN KEY (stadium_id)
    REFERENCES stadiums("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE coaches
ADD CONSTRAINT coaches_salary_check
    CHECK (salary >= 0),
ADD CONSTRAINT coaches_coach_level_check
    CHECK (coach_level >= 0)
;

ALTER TABLE skills_data
ADD CONSTRAINT skills_data_dribbling_check
    CHECK (dribbling >= 0),
ADD CONSTRAINT skills_data_pace_check
    CHECK (pace >= 0),
ADD CONSTRAINT skills_data_passing_check
    CHECK ("passing" >= 0),
ADD CONSTRAINT skills_data_shooting_check
    CHECK (shooting >= 0),
ADD CONSTRAINT skills_data_speed_check
    CHECK (speed >= 0),
ADD CONSTRAINT skills_data_strength_check
    CHECK (strength >= 0)
;

ALTER TABLE players
ADD CONSTRAINT players_age_check
    CHECK (age >= 0),
ADD CONSTRAINT players_salary_check
    CHECK (salary >= 0),
ADD CONSTRAINT fk_players_skills_data
	FOREIGN KEY (skills_data_id)
	REFERENCES skills_data("id")
	ON DELETE CASCADE
	ON UPDATE CASCADE,
ADD CONSTRAINT fk_players_teams
	FOREIGN KEY (team_id)
	REFERENCES teams("id")
	ON DELETE CASCADE
	ON UPDATE CASCADE
;

ALTER TABLE players_coaches
ADD CONSTRAINT fk_players_coaches_players
	FOREIGN KEY (player_id)
	REFERENCES players("id")
	ON DELETE CASCADE
	ON UPDATE CASCADE,
ADD CONSTRAINT fk_players_coaches_coaches
	FOREIGN KEY (coach_id)
	REFERENCES coaches("id")
	ON DELETE CASCADE
	ON UPDATE CASCADE
;