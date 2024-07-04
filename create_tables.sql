CREATE TABLE IF NOT EXISTS Artists (
    ArtistID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
    ArtistID INT,
    GenreID INT,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE IF NOT EXISTS Albums (
    AlbumID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Release_Date DATE
);

CREATE TABLE IF NOT EXISTS ArtistAlbums (
    ArtistID INT,
    AlbumID INT,
    PRIMARY KEY (ArtistID, AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE IF NOT EXISTS Tracks (
    TrackID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Duration TIME,
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE IF NOT EXISTS Collections (
    CollectionID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    release_date INT
);

CREATE TABLE IF NOT EXISTS CollectionTracks (
    CollectionID INT,
    TrackID INT,
    PRIMARY KEY (CollectionID, TrackID),
    FOREIGN KEY (CollectionID) REFERENCES Collections(CollectionID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);