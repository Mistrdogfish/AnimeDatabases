use AnimeDatabase;

CALL AddNewAnime(21, 'Jujutsu Kaisen', 'Show', 2, 24, 'Action', 'A high school student gains cursed powers and joins a school for sorcerers to fight powerful curses threatening humanity.', '2020-10-03', 'MAPPA', 'Junya Enoki, Yuuma Uchida, Asami Seto'
);

SELECT * FROM Anime;

CALL DeleteAnime(21);

SELECT * FROM Anime;

CALL AddNewManga(21, 'Jujutsu Kaisen', 'Manga', 22, 194, 'Action', 'A high school student gains cursed powers and joins a school for sorcerers to fight powerful curses threatening humanity.', '2018-03-05', 'Shueisha', 'Gege Akutami');

SELECT * FROM Manga;

CALL DeleteManga(21);

SELECT * FROM Manga;