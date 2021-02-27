CREATE TABLE Movies(
    mid INTEGER,
    title VARCHAR,
    year DATE,
    rating REAL,
    num_ratings INTEGER,

    PRIMARY KEY (mid)
);

CREATE TABLE Actors(
    mid INTEGER,
    name VARCHAR,
    cast_portion INTEGER,

    PRIMARY KEY (mid, name),
    FOREIGN KEY (mid)
        REFERENCES Movies
);

CREATE TABLE Genres(
    mid INTEGER,
    genre VARCHAR,

    PRIMARY KEY (mid, genre),
    FOREIGN KEY (mid)
        REFERENCES Movies
);

CREATE TABLE Tag_Names(
    tid INTEGER,
    tag VARCHAR,

    PRIMARY KEY (tid)
);


CREATE TABLE Tags(
    mid INTEGER,
    tid INTEGER,

    PRIMARY KEY (mid, tid),
    FOREIGN KEY (mid)
                 REFERENCES Movies,
    FOREIGN KEY (tid)
        REFERENCES Tag_Names
);


