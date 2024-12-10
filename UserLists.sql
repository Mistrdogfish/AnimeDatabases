USE AnimeDatabase;

DROP TABLE IF EXISTS UserWatchList;
CREATE TABLE UserWatchList 
( 
UserID int NOT NULL,
AnimeID int NOT NULL,
PRIMARY KEY (AnimeID)
); 

DROP TABLE IF EXISTS UserReadList;
CREATE TABLE UserReadList
(
UserID int NOT NULL,
MangaID int NOT NULL,
PRIMARY KEY (MangaID)
);

INSERT INTO UserWatchList (UserID, AnimeID) VALUES 
(1, 2),
(2,10);

INSERT INTO UserReadList (UserID, MangaID) VALUES 
(1, 1), 
(4, 17); 

SELECT * FROM UserWatchList
JOIN Users
JOIN Anime
ON UserWatchList.AnimeID = Anime.AnimeID AND UserWatchList.UserID = Users.UserID;


SELECT * FROM UserReadList
JOIN Users
JOIN Manga
ON UserReadList.MangaID = Manga.MangaID AND UserReadList.UserID = Users.UserID;