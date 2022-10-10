CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TABLE hospital.Station(
    statNr serial primary key,
    name varchar
);

CREATE TABLE hospital.Room(
    roomNr serial primary key,
    beds int,
    has_station_id int,

    FOREIGN KEY (has_station_id)
        REFERENCES hospital.Station(statNr)
);

CREATE TABLE hospital.StationPersonell(
    persNr serial primary key,
    name varchar,
    works_station_id int,

    FOREIGN KEY (works_station_id)
        REFERENCES hospital.Station(statNr)
);

CREATE TABLE hospital.Caregiver(
    caregiver_id serial primary key,
    qualification varchar
);

CREATE TABLE hospital.Doctor(
    doctor_id serial primary key,
    rank varchar,
    area varchar
);

CREATE TABLE hospital.Patient(
    patientNr serial primary key,
    name varchar,
    disease varchar,
    treats int,

    FOREIGN KEY (treats)
        REFERENCES hospital.Doctor(doctor_id)
);

CREATE TABLE hospital.Admission(
    admission_from date,
    admission_to date,
    roomNr int,
    patientNr int,

    FOREIGN KEY (roomNr)
        REFERENCES hospital.Room(roomNr),

    FOREIGN KEY (patientNr)
        REFERENCES hospital.Patient(patientNr)
);
