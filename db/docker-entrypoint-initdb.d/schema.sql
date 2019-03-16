DROP TABLE IF EXISTS match;
DROP TABLE IF EXISTS player_hobby;
DROP TABLE IF EXISTS hobby;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS data_type;

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  country_name text NOT NULL
);

CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  country_id bigint REFERENCES country (id),
  team_name text
);

CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  team_id bigint REFERENCES team (id),
  player_name text,
  age integer
);

CREATE TABLE match (
  home_id bigint REFERENCES team (id),
  away_id bigint REFERENCES team (id)
);

CREATE TABLE hobby (
  id SERIAL PRIMARY KEY,
  hobby_name text
);

CREATE TABLE player_hobby (
  player_id bigint REFERENCES player (id),
  hobby_id bigint REFERENCES hobby (id)
);

CREATE TYPE fruit AS ENUM ('apple', 'orange', 'banana');

CREATE TABLE data_type (
  --real_type real,
  double_type double precision,
  bool_type boolean,
  date_type date,
  time_type time with time zone,
  timestamp_type timestamp with time zone,
  enum_type fruit,
  json_type jsonb,
  array_type integer[]
);

INSERT INTO
  country (country_name)
VALUES
  ('Japan'),
  ('China'),
  ('Australia'),
  ('Russia');
