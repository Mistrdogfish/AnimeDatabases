SELECT * FROM UserWatchList
JOIN Users
JOIN Anime
ON UserWatchList.AnimeID = Anime.AnimeID AND UserWatchList.UserID = Users.UserID;


SELECT * FROM UserReadList
JOIN Users
JOIN Manga
ON UserReadList.MangaID = Manga.MangaID AND UserReadList.UserID = Users.UserID;