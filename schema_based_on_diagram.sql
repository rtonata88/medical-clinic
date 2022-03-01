CREATE DATABASE medical_clinic
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


CREATE TABLE IF NOT EXISTS patients (
	id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    date_of_birth date,
    CONSTRAINT patient_id_primary_key PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS medical_histories(
	id INT GENERATED ALWAYS AS IDENTITY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(100),
	CONSTRAINT medical_history_id PRIMARY KEY(id),
	CONSTRAINT patient_fk FOREIGN KEY (patient_id) REFERENCES patients(id)
);
CREATE TABLE IF NOT EXISTS invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
	medical_history_id INT,
    PRIMARY KEY(id),
	CONSTRAINT medical_histories_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);