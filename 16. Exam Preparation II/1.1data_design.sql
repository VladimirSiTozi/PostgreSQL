DROP TABLE IF EXISTS addresses CASCADE;
CREATE TABLE addresses(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS clients CASCADE;
CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS drivers CASCADE;
CREATE TABLE drivers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INTEGER NOT NULL CHECK (age > 0),
    rating NUMERIC(2) DEFAULT 5.5
);

DROP TABLE IF EXISTS cars CASCADE;
CREATE TABLE cars(
    id SERIAL PRIMARY KEY,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20),
    year INTEGER DEFAULT 0 NOT NULL CHECK (year > 0),
    mileage INTEGER DEFAULT 0 CHECK (mileage > 0),
    condition CHAR(1) NOT NULL ,
    category_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    from_address_id INTEGER NOT NULL,
    start TIMESTAMP NOT NULL,
    bill NUMERIC(10, 2) DEFAULT 10 CHECK (bill > 0),
    car_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS cars_drivers CASCADE;
CREATE TABLE cars_drivers(
    car_id INTEGER NOT NULL,
    driver_id INTEGER NOT NULL
);

ALTER TABLE cars
ADD CONSTRAINT fk_cars_categories
    FOREIGN KEY (category_id)
        REFERENCES categories(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
;

ALTER TABLE courses
ADD CONSTRAINT fk_courses_addresses
    FOREIGN KEY (from_address_id)
        REFERENCES addresses(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
ADD CONSTRAINT fk_courses_cars
    FOREIGN KEY (car_id)
        REFERENCES cars(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
ADD CONSTRAINT fk_courses_clients
    FOREIGN KEY (client_id)
        REFERENCES clients(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
;

ALTER TABLE cars_drivers
ADD CONSTRAINT fk_cars_drivers_cars
    FOREIGN KEY (car_id)
        REFERENCES cars(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
ADD CONSTRAINT fk_cars_drivers_drivers
    FOREIGN KEY (driver_id)
        REFERENCES drivers(id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
;