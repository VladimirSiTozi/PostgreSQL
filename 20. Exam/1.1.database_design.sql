CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL CHECK ( gender IN ('M', 'F') ),
    age INTEGER NOT NULL,
    job_title VARCHAR(40) NOT NULL,
    ip VARCHAR(30) NOT NULL
 );

CREATE TABLE addresses  (
    id SERIAL PRIMARY KEY,
    street VARCHAR(30) NOT NULL,
    town VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    account_id INTEGER NOT NULL --CONST
);

CREATE TABLE photos  (
    id SERIAL PRIMARY KEY,
    description TEXT,
    capture_date TIMESTAMP NOT NULL,
    views INTEGER NOT NULL DEFAULT 0 CHECK ( views >= 0 )
);

CREATE TABLE comments  (
    id SERIAL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    published_on TIMESTAMP NOT NULL,
    photo_id INTEGER NOT NULL -- CONST
);

CREATE TABLE accounts_photos  (
    account_id INTEGER NOT NULL, -- CONST
    photo_id INTEGER NOT NULL -- CONST
    -- CONST
);

CREATE TABLE likes  (
    id SERIAL PRIMARY KEY,
    photo_id INTEGER NOT NULL, -- CONST
    account_id INTEGER NOT NULL --CONST
);

ALTER TABLE addresses
ADD CONSTRAINT fk_addresses_accounts
    FOREIGN KEY (account_id)
    REFERENCES accounts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE comments
ADD CONSTRAINT fk_comments_photos
    FOREIGN KEY (photo_id)
    REFERENCES photos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE accounts_photos
ADD CONSTRAINT fk_accounts_photos_accounts
    FOREIGN KEY (account_id)
    REFERENCES accounts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE ,
ADD CONSTRAINT fk_accounts_photos_photos
    FOREIGN KEY (photo_id)
    REFERENCES photos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE ,
ADD CONSTRAINT pk_accounts_photos
    PRIMARY KEY (account_id, photo_id)
;

ALTER TABLE likes
ADD CONSTRAINT fk_likes_photos
    FOREIGN KEY (photo_id)
    REFERENCES photos(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
ADD CONSTRAINT fk_likes_accounts
    FOREIGN KEY (account_id)
    REFERENCES accounts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
