CREATE TABLE Movies
(
    mid        INT NOT NULL,
    title      VARCHAR(45),
    year       INT,
    rating     REAL,
    num_rating INT,
    PRIMARY KEY (mid)
);

CREATE TABLE Actors
(
    mid           INT         NOT NULL,
    name          VARCHAR(45) NOT NULL,
    cast_position INT,
    CONSTRAINT movies_fk
        FOREIGN KEY (mid)
            REFERENCES Movies (mid)
            ON DELETE CASCADE,
    PRIMARY KEY (mid, name)
);

CREATE TABLE Genres
(
    mid   INT         NOT NULL,
    genre VARCHAR(45) NOT NULL,
    CONSTRAINT movies_fk
        FOREIGN KEY (mid)
            REFERENCES Movies (mid)
            ON DELETE CASCADE,
    PRIMARY KEY (mid, genre)
);

CREATE TABLE Tag_names
(
    tid INT NOT NULL,
    tag VARCHAR(45),
    PRIMARY KEY (tid)
);

CREATE TABLE Tags
(
    mid INT NOT NULL,
    tid INT NOT NULL,
    CONSTRAINT movies_fk
        FOREIGN KEY (mid)
            REFERENCES Movies (mid)
            ON DELETE CASCADE,
    CONSTRAINT tag_names_fk
        FOREIGN KEY (tid)
            REFERENCES Tag_names (tid)
            ON DELETE CASCADE,
    PRIMARY KEY (mid, tid)
);
