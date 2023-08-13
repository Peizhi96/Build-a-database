CREATE TABLE agency (
    name text PRIMARY KEY,
    address text
);

CERATE TABLE agent (
    name text PRIMARY KEY,
    agency_name text REFERENCES agency(name)
);

CREATE TABLE author (
    name text PRIMARY KEY,
    bio text,
    agent_name text REFERENCES agent(name)
);

CREATE TABLE publisher (
    name text PRIMARY Key
);

CREATE TABLE imprint (
    name text PRIMARY KEY,
    genre text,
    age_range text,
    publisher_name text REFERENCES publisher(name)
);

CERATE TABLE editor (
    name text PRIMARY KEY,
    imprint_name text REFERENCES imprint(name)
);

CERATE TABLE book (
    isbn bigint PRIMARY KEY,
    title text,
    publisher_name text REFERENCES publisher(name),
    price money
);

CREATE TABLE authors_books (
    author_name text REFERENCES author(name),
    book_isbn text REFERENCES book(isbn),
    PRIMARY KEY (author_name, book_isbn)
);

INSERT INTO agency VALUES('Writers Home', '123 Fake St.');
INSERT INTO agent VALUES('Frodo Baggins', 'Writers Home');
INSERT INTO agent VALUES('Bilbo Baggins', 'Writers Home');
INSERT INTO publisher VALUES('Simon and Schuster');

ALTER TABLE imprint DROP COLUMN age_range;
ALTER TABLE imprint ADD COLUMN age_min int;
ALTER TABLE imprint ADD COLUMN age_max int;

INSERT INTO imprint VALUES ('Pocket Books', 'paperback', 'Simon and Schuster', 7, 80);
INSERT INTO imprint VALUES ('Stormy Castle', 'fantasy', 'Simon and Schuster', 16, 30);
INSERT INTO editor VALUES ('Jennifer Editor', 'Stormy Castle');

ALTER TABLE book ADD COLUMN editor_name text REFERENCES editor(name);

INSERT INTO book VALUES (1234, 'The Great Adventure', 'Simon and Schuster', 12.99, 'Jennifer Editor');
INSERT INTO book VALUES (5249, 'The Return of the Queen', 'Simon and Schuster', 15.99, 'Jennifer Editor');

INSERT INTO author VALUES ('J.T.T Rolkin', 'This author is a prolific fantasy author', 'Frodo Baggins');

INSERT INTO authors_books VALUES ('J.T.T Rolkin', 5249);
INSERT INTO authors_books VALUES ('J.T.T Rolkin', 1234);

ALTER TABLE book DROP COLUMN publisher_name;