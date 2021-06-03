SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS children;
DROP TABLE IF EXISTS vaccin;
DROP TABLE IF EXISTS doctors_schools;
DROP TABLE IF EXISTS vaccins_children;
DROP TABLE IF EXISTS doctor_areas_of_expertise;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS area_of_expertise;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS medical_center;
DROP TABLE IF EXISTS districts;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE children(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   age INT,
   height INT,
   sex VARCHAR(1),
   weight INT
);

CREATE TABLE school(
   address VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   number_of_students INT NOT NULL,
   PRIMARY KEY(address)
);

CREATE TABLE area_of_expertise(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   name VARCHAR(50) NOT NULL
);

CREATE TABLE category(
   code VARCHAR(50),
   name VARCHAR(50) NOT NULL,
   PRIMARY KEY(code)
);

CREATE TABLE districts(
   code INT,
   PRIMARY KEY(code)
);

CREATE TABLE medical_center(
   address VARCHAR(100),
   name VARCHAR(50) NOT NULL,
   code INT NOT NULL,
   PRIMARY KEY(address),
   FOREIGN KEY(code) REFERENCES districts(code)
);

CREATE TABLE doctor(
   id INT check (id between 0 and 99999),
   last_name VARCHAR(50),
   first_name VARCHAR(50) NOT NULL,
   address VARCHAR(100),
   PRIMARY KEY(id),
   FOREIGN KEY(address) REFERENCES medical_center(address)
);

CREATE TABLE vaccin(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   name VARCHAR(50),
   code VARCHAR(50) NOT NULL,
   FOREIGN KEY(code) REFERENCES category(code),
   FOREIGN KEY(id) REFERENCES doctor(id)
);

CREATE TABLE doctors_schools(
   id INT,
   address VARCHAR(50),
   PRIMARY KEY(id, address),
   FOREIGN KEY(id) REFERENCES doctor(id),
   FOREIGN KEY(address) REFERENCES school(address)
);

CREATE TABLE doctor_areas_of_expertise(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES doctor(id),
   FOREIGN KEY(id_1) REFERENCES area_of_expertise(id)
);

CREATE TABLE vaccins_children(
   children_id INT,
   vaccin_id INT,
   vaccination_date DATE NOT NULL,
   PRIMARY KEY(children_id, vaccin_id),
   FOREIGN KEY(children_id) REFERENCES children(id),
   FOREIGN KEY(vaccin_id) REFERENCES vaccin(id)
);