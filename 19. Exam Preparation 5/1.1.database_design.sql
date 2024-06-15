CREATE TABLE IF NOT EXISTS countries(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS  customers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK ( gender IN ('F', 'M') ),
    age INTEGER NOT NULL CHECK ( age > 0 ),
    phone_number CHAR(10) NOT NULL,
    country_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS  products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(250),
    recipe TEXT,
    price NUMERIC(10, 2) NOT NULL CHECK ( price > 0 )
);

CREATE TABLE IF NOT EXISTS  feedbacks(
    id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    rate NUMERIC(4, 2) CHECK ( rate BETWEEN 0 AND 10),
    product_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS  distributors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    address VARCHAR(30) NOT NULL,
    summary VARCHAR(200) NOT NULL,
    country_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS  ingredients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    country_id INTEGER NOT NULL,
    distributor_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS products_ingredients(
    product_id INTEGER,
    ingredient_id INTEGER
);

ALTER TABLE customers
ADD CONSTRAINT fk_customers_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE feedbacks
ADD CONSTRAINT fk_feedbacks_products
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_feedbacks_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE distributors
ADD CONSTRAINT fk_distributors_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE ingredients
ADD CONSTRAINT fk_ingredients_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_ingredients_distributors
    FOREIGN KEY (distributor_id)
    REFERENCES distributors(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE products_ingredients
ADD CONSTRAINT fk_products_ingredients_products
    FOREIGN KEY (product_id)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_products_ingredients_ingredients
    FOREIGN KEY (ingredient_id)
    REFERENCES ingredients(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;