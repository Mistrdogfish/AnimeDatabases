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

DROP PROCEDURE IF EXISTS AddToWatchList;
DELIMITER $$
CREATE PROCEDURE AddToWatchList(
	In anime_id Int,
  user_id Int
)


BEGIN
	  INSERT INTO UserWatchList (UserID, AnimeID) VALUES (user_id, anime_id);
END

DROP PROCEDURE IF EXISTS AddToReadList;
CREATE PROCEDURE AddToReadList(
	In manga_id Int,
  user_id Int
)


BEGIN
	  INSERT INTO UserWatchList (UserID, MangaID) VALUES (user_id, manga_id);
END
	
DROP PROCEDURE IF EXISTS DeleteFromWatchList;
CREATE PROCEDURE DeleteFromWatchList(
	In anime_id Int,
  user_id Int
)

BEGIN
	  DELETE FROM UserWatchList 
    WHERE AnimeID = anime_id AND UserID = user_id;
END

DROP PROCEDURE IF EXISTS DeleteFromReadList;
CREATE PROCEDURE DeleteFromWatchList(
	In manga_id Int,
  user_id Int
)

BEGIN
	  DELETE FROM UserReadhList 
    WHERE MangaID = manga_id AND UserID = user_id;
END

DROP PROCEDURE IF EXISTS  ViewFriendsLists;
CREATE PROCEDURE ViewFriendsLists(In friend_id Int)

BEGIN
	  SELECT * FROM UserWatchList JOIN UserReadList ON USerWatchList.UserID = UserReadList.UserID WHERE UserID = friend_id;
END
DELIMITER ;

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
