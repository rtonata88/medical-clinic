CREATE DATABASE medical_clinic
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


CREATE TABLE IF NOT EXISTS patients (
	id bigint GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    date_of_birth date,
    CONSTRAINT patient_id_primary_key PRIMARY KEY (id)
);