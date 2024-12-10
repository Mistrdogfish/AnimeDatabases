use AnimeDatabase;

DELIMITER $$
CREATE PROCEDURE AddNewAnime(
    IN p_AnimeID INT,
    IN p_Title VARCHAR(100),
    IN p_AnimeType VARCHAR(10),
    IN p_Seasons INT,
    IN p_Episodes INT,
    IN p_Genre VARCHAR(20),
    IN p_AnimeDescription VARCHAR(500),
    IN p_ReleaseDate DATE,
    IN p_Studio VARCHAR(30),
    IN p_Actors VARCHAR(100)
)

BEGIN
    -- Insert the new anime into the Anime table
    INSERT INTO Anime (AnimeID, Title, AnimeType, Seasons, Episodes, Genre, AnimeDescription, ReleaseDate, Studio, Actors)
    VALUES (p_AnimeID, p_Title, p_AnimeType, p_Seasons, p_Episodes, p_Genre, p_AnimeDescription, p_ReleaseDate, p_Studio, p_Actors);
END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteAnime(
    IN p_AnimeID INT
)
BEGIN
    -- Delete the anime with the specified AnimeID from the Anime table
    DELETE FROM Anime
    WHERE AnimeID = p_AnimeID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AddNewManga(
    IN p_MangaID INT,
    IN p_Title VARCHAR(100),
    IN p_BookType VARCHAR(20),
    IN p_Volumes INT,
    IN p_Chapters INT,
    IN p_Genre VARCHAR(20),
    IN p_BookDescription VARCHAR(500),
    IN p_ReleaseDate DATE,
    IN p_Publisher VARCHAR(30),
    IN p_Author VARCHAR(50)
)
BEGIN
    -- Insert the new manga into the Manga table
    INSERT INTO Manga (MangaID, Title, BookType, Volumes, Chapters, Genre, BookDescription, ReleaseDate, Publisher, Author)
    VALUES (p_MangaID, p_Title, p_BookType, p_Volumes, p_Chapters, p_Genre, p_BookDescription, p_ReleaseDate, p_Publisher, p_Author);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteManga(
    IN p_MangaID INT
)
BEGIN
    -- Delete the manga with the specified MangaID from the Manga table
    DELETE FROM Manga
    WHERE MangaID = p_MangaID;
END$$

DELIMITER ;


