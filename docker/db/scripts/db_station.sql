CREATE SCHEMA IF NOT EXISTS station;

CREATE TABLE station.City(
    region varchar,
    name varchar,
    primary key (region, name)
);

CREATE TABLE station.Station(
    name varchar primary key,
    tracks int,
    city_region varchar,
    city_name varchar,

    FOREIGN KEY (city_region, city_name)
        REFERENCES station.City(region, name)

);

CREATE TABLE station.Train(
    trainNr serial primary key,
    length int,
    start_point varchar,
    end_point varchar,

    FOREIGN KEY (start_point)
        REFERENCES station.Station(name),

    FOREIGN KEY (end_point)
        REFERENCES station.Station(name)
);

CREATE TABLE station.Connected(
    departure date,
    arrival date,
    start_station varchar,
    end_station varchar,
    trainNr int,
    FOREIGN KEY (trainNr)
        REFERENCES station.Train(trainNr),

    FOREIGN KEY (start_station)
        REFERENCES station.Station(name),

    FOREIGN KEY (end_station)
        REFERENCES station.Station(name)
);
