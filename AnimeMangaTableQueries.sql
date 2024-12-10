SELECT * FROM Anime
ORDER BY Title ASC;

SELECT * FROM Anime
ORDER BY Genre ASC;

SELECT * FROM Anime
ORDER BY Studio ASC;

SELECT * FROM Anime
ORDER BY ReleaseDate DESC;

SELECT * FROM Anime
ORDER BY ReleaseDate ASC;

SELECT * FROM Anime
WHERE AnimeType = 'Movie';

SELECT * FROM Anime 
WHERE AnimeType = 'Show';

SELECT * FROM Manga
ORDER BY Title ASC;

SELECT * FROM Manga
ORDER BY Genre ASC;

SELECT * FROM Manga
ORDER BY Publisher ASC;

SELECT * FROM Manga
ORDER BY ReleaseDate DESC;

SELECT * FROM Manga
ORDER BY ReleaseDate ASC;

SELECT * FROM Manga
WHERE BookType = 'Light Novel';

SELECT 
    a.Title, 
    m.Author, 
    a.Studio
FROM Anime a
JOIN Manga m ON a.Title = m.Title;