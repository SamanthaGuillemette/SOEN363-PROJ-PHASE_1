DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS tag_names CASCADE;
DROP TABLE IF EXISTS tags;


CREATE TABLE Movies
(
    mid        INT NOT NULL,
    title      VARCHAR(256),
    year       INT,
    rating     REAL,
    num_rating INT,
    PRIMARY KEY (mid)
);

CREATE TABLE Actors
(
    mid           INT          NOT NULL,
    name          VARCHAR(256) NOT NULL,
    cast_position INT,
    FOREIGN KEY (mid)
        REFERENCES Movies (mid)
        ON DELETE CASCADE,
    PRIMARY KEY (mid, name)
);

CREATE TABLE Genres
(
    mid   INT          NOT NULL,
    genre VARCHAR(256) NOT NULL,
    FOREIGN KEY (mid)
        REFERENCES Movies (mid)
        ON DELETE CASCADE,
    PRIMARY KEY (mid, genre)
);

CREATE TABLE Tag_names
(
    tid INT NOT NULL,
    tag VARCHAR(256),
    PRIMARY KEY (tid)
);

CREATE TABLE Tags
(
    mid INT NOT NULL,
    tid INT NOT NULL,
    FOREIGN KEY (mid)
        REFERENCES Movies (mid)
        ON DELETE CASCADE,
    FOREIGN KEY (tid)
        REFERENCES Tag_names (tid)
        ON DELETE CASCADE,
    PRIMARY KEY (mid, tid)
);
