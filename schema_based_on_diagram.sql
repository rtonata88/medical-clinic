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

CREATE TABLE IF NOT EXISTS treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(100),
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id),
    CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    CONSTRAINT treatment_id_fk FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE IF NOT EXISTS medical_treatments(
    medical_history_id INT,
    treatment_id INT,
    CONSTRAINT medical_history_id_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT treatment_id_fk FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
