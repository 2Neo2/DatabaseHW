CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Publisher(
    publisher_id serial primary key,
    name varchar NOT NULL ,
    address varchar NOT NULL
);

CREATE TABLE library.Category(
    title varchar primary key,
    subcategory_id varchar,

    FOREIGN KEY (subcategory_id)
        REFERENCES library.Category(title)
);

CREATE TABLE library.Book(
    isbn serial primary key,
    author varchar,
    page_count int,
    title varchar,
    year date,
    publisher_id serial,

    FOREIGN KEY (publisher_id)
        REFERENCES library.Publisher(publisher_id)
);

CREATE TABLE library.Book_Category(
    title text REFERENCES library.Category(title),
    isbn int REFERENCES library.Book(isbn),
    PRIMARY KEY (title, isbn)
);

CREATE TABLE library.Copy(
    copy_number serial primary key,
    place int,
    book_id int,

    FOREIGN KEY (book_id)
        REFERENCES library.Book(isbn)
);

CREATE TABLE library.Reader(
    reader_id serial primary key,
    name varchar,
    birthday date,
    address varchar
);

CREATE TABLE library.Library(
    copy_number int REFERENCES library.Copy(copy_number),
    reader_id int REFERENCES library.Reader(reader_id),
    end_date date,
    PRIMARY KEY (copy_number, reader_id)
);
