Use AnimeDatabase;

DROP TABLE IF EXISTS Anime;
CREATE TABLE Anime
(
AnimeID int NOT NULL,
Title varchar(100) NOT NULL,
AnimeType varchar(10) NOT NULL, -- Movie or Show
Seasons int,
Episodes int,
Genre varchar(20) NOT NULL,
AnimeDescription varchar(500) NOT NULL,
ReleaseDate date NOT NULL,
Studio varchar(30) NOT NULL,
Actors varchar(100) NOT NULL,
PRIMARY KEY (AnimeID)
);

DROP TABLE IF EXISTS Manga;
CREATE TABLE Manga
(
MangaID int NOT NULL,
Title varchar(100) NOT NULL,
BookType varchar(20) NOT NULL, -- Manga or Light Novel
Volumes int,
Chapters int,
Genre varchar(20) NOT NULL,
BookDescription varchar(500) NOT NULL,
ReleaseDate date NOT NULL,
Publisher varchar(30) NOT NULL,
Author varchar(50) NOT NULL,
PRIMARY KEY (MangaID)
);

INSERT INTO Anime (AnimeID, Title, AnimeType, Seasons, Episodes, Genre, AnimeDescription, ReleaseDate, Studio, Actors)
VALUES
(1, 'One Piece', 'Show', 1, 1020, 'Action', 'A popular adventure anime about pirates and the quest to find the legendary treasure, the One Piece.', '1999-10-20', 'Toei Animation', 'Mayumi Tanaka, Akemi Okamura, Kazuya Nakai'),
(2, 'One Piece: Strong World', 'Movie', 1, 0, 'Action', 'The movie features the Straw Hat Pirates in an epic battle against a powerful new antagonist in a unique island setting.', '2009-12-12', 'Toei Animation', 'Mayumi Tanaka, Akemi Okamura, Kazuya Nakai'),
(3, 'Spirited Away', 'Movie', 1, 0, 'Fantasy', 'A young girl is trapped in a magical world and must find a way to save her parents and return to the real world.', '2001-07-20', 'Studio Ghibli', 'Rumi Hiiragi, Miyu Irino, Bunta Sugawara'),
(4, 'Your Name', 'Movie', 1, 0, 'Romance', 'Two teenagers from different parts of Japan find themselves mysteriously swapping bodies and try to solve the mystery of their connection.', '2016-08-26', 'Toho', 'Ryunosuke Kamiki, Mone Kamishiraishi'),
(5, 'Attack on Titan', 'Show', 4, 87, 'Action', 'Humanity fights for survival against giant humanoid creatures known as Titans.', '2013-04-06', 'WIT Studio', 'Yuki Kaji, Marina Inoue, Josh Grelle'),
(6, 'My Hero Academia', 'Show', 6, 113, 'Action', 'In a world where people with superpowers, called "Quirks," are common, a young boy without powers strives to become the greatest hero.', '2016-04-03', 'Bones', 'Daiki Yamashita, Kenta Miyake, Nobuhiko Okamoto'),
(7, 'Demon Slayer', 'Show', 2, 26, 'Action', 'A young boy fights demons to protect his family and find a cure for his sister, who was turned into a demon.', '2019-04-06', 'ufotable', 'Natsuki Hanae, Akari Kito, Hiro Shimono'),
(8, 'Fullmetal Alchemist: Brotherhood', 'Show', 1, 64, 'Action', 'Two brothers use alchemy to try to fix the mistakes caused by their forbidden attempts to bring their mother back to life.', '2009-04-05', 'Bones', 'Vic Mignogna, Aaron Dismuke, Romi Park'),
(9, 'Naruto', 'Show', 9, 220, 'Action', 'A young ninja’s journey to become the strongest ninja and protect his village.', '2002-10-03', 'Pierrot', 'Junko Takeuchi, Noriaki Sugiyama, Chie Nakamura'),
(10, 'The Witcher: Nightmare of the Wolf', 'Movie', 1, 0, 'Fantasy', 'The story of Vesemir, Geralt’s mentor, set in the world of The Witcher as he faces a deadly new monster threat.', '2021-08-23', 'Netflix', 'Theo James, Lara Pulver, Graham McTavish'),
(11, 'Neon Genesis Evangelion', 'Show', 1, 26, 'Mecha', 'A young boy is recruited to pilot a giant robot to protect Earth from mysterious creatures known as Angels.', '1995-10-05', 'Gainax', 'Megumi Ogata, Kotono Mitsuishi, Yuko Miyamura'),
(12, 'Sword Art Online', 'Show', 4, 96, 'Adventure', 'Trapped in a virtual reality MMORPG, players must fight to escape the game, where death in the game means death in real life.', '2012-07-08', 'A-1 Pictures', 'Yoshitsugu Matsuoka, Haruka Tomatsu, Kanae Itou'),
(13, 'Tokyo Ghoul', 'Show', 4, 48, 'Horror', 'A college student is transformed into a half-ghoul after a near-fatal accident and must navigate a dangerous world.', '2014-07-03', 'Studio Pierrot', 'Natsuki Hanae, Sora Amamiya, Masumi Asano'),
(14, 'Hunter x Hunter', 'Show', 6, 148, 'Adventure', 'A young boy embarks on an adventure to find his missing father and become a Hunter, one of the most elite individuals in the world.', '2011-10-02', 'Madhouse', 'Megumi Han, Cristina Valenzuela, Mariya Ise'),
(15, 'One Punch Man', 'Show', 2, 24, 'Action', 'A hero who can defeat any opponent with a single punch struggles with the boredom that comes with overwhelming power.', '2015-10-05', 'Madhouse', 'Makoto Furukawa, Kaito Ishikawa, Yuuki Kaji'),
(16, 'JoJo’s Bizarre Adventure', 'Show', 5, 152, 'Action', 'A multi-generational saga of families with supernatural powers, battling evil and confronting bizarre phenomena.', '2012-10-05', 'David Production', 'Kazuyuki Okitsu, Daisuke Ono, Takehito Koyasu'),
(17, 'The Seven Deadly Sins', 'Show', 5, 100, 'Action', 'A group of knights known as the Seven Deadly Sins must fight to save their kingdom from evil forces.', '2014-10-05', 'A-1 Pictures', 'Yuuki Kaji, Sora Amamiya, Aoi Koga'),
(18, 'Klaus', 'Movie', 1, 0, 'Holiday', 'A Netflix original movie that tells the origin story of Santa Claus, focusing on a postman and a toy maker.', '2019-11-08', 'Netflix', 'Jason Schwartzman, J.K. Simmons, Rashida Jones'),
(19, 'Beastars', 'Show', 2, 24, 'Drama', 'A world of anthropomorphic animals is thrown into disarray as a wolf deals with his feelings for a rabbit and the social pressure of their society.', '2019-10-08', 'Orange', 'Chikahiro Kobayashi, Sayaka Senbongi, Junya Enoki'),
(20, 'Promare', 'Movie', 1, 0, 'Action', 'In a futuristic world, firefighters known as Burnish fight massive fire-related creatures to save the planet.', '2019-05-24', 'TRIGGER', 'Kazuya Nakai, Kenjirou Tsuda, Ai Kayano');

INSERT INTO Manga (MangaID, Title, BookType, Volumes, Chapters, Genre, BookDescription, ReleaseDate, Publisher, Author)
VALUES
(1, 'One Piece', 'Manga', 102, 1015, 'Action', 'A popular adventure manga about pirates and the quest to find the legendary treasure, the One Piece.', '1997-07-22', 'Shueisha', 'Eiichiro Oda'),
(2, 'Naruto', 'Manga', 72, 700, 'Action', 'A young ninja’s journey to become the strongest ninja and protect his village.', '1999-09-21', 'Shueisha', 'Masashi Kishimoto'),
(3, 'Attack on Titan', 'Manga', 34, 139, 'Action', 'Humanity fights for survival against giant humanoid creatures known as Titans.',  '2009-09-09', 'Kodansha', 'Hajime Isayama'),
(4, 'My Hero Academia', 'Manga', 38, 383, 'Action', 'In a world where people with superpowers, called "Quirks," are common, a young boy without powers strives to become the greatest hero.', '2014-07-07', 'Shueisha', 'Kohei Horikoshi'),
(5, 'Death Note', 'Manga', 12, 108, 'Mystery', 'A high school student discovers a notebook that allows him to kill anyone whose name he writes in it.', '2003-12-01', 'Shueisha', 'Tsugumi Ohba'),
(6, 'Dragon Ball', 'Manga', 42, 519, 'Action', 'The story of Goku, a boy with a tail who becomes the strongest fighter in the world.', '1984-12-03', 'Shueisha', 'Akira Toriyama'),
(7, 'Fullmetal Alchemist', 'Manga', 27, 108, 'Action', 'Two brothers use alchemy to try to fix the mistakes caused by their forbidden attempts to bring their mother back to life.', '2001-07-12', 'Square Enix', 'Hiromu Arakawa'),
(8, 'Bleach', 'Manga', 74, 686, 'Action', 'A teenager with the ability to see ghosts becomes a Soul Reaper to protect the living world from dark spirits.', '2001-08-07', 'Shueisha', 'Tite Kubo'),
(9, 'Tokyo Ghoul', 'Manga', 14, 143, 'Horror', 'A college student is transformed into a half-ghoul after a near-fatal accident and must navigate a dangerous world.', '2011-09-08', 'Shueisha', 'Sui Ishida'),
(10, 'Hunter x Hunter', 'Manga', 36, 390, 'Adventure', 'A young boy embarks on an adventure to find his missing father and become a Hunter, one of the most elite individuals in the world.', '1998-03-03', 'Shueisha', 'Yoshihiro Togashi'),
(11, 'One Punch Man', 'Manga', 24, 171, 'Action', 'A hero who can defeat any opponent with a single punch struggles with the boredom that comes with overwhelming power.', '2009-06-14', 'Shueisha', 'ONE & Yusuke Murata'),
(12, 'Demon Slayer', 'Manga', 23, 205, 'Action', 'A young boy fights demons to protect his family and find a cure for his sister, who was turned into a demon.', '2016-02-15', 'Shueisha', 'Koyoharu Gotouge'),
(13, 'JoJo’s Bizarre Adventure', 'Manga', 131, 1280, 'Action', 'A multi-generational saga of families with supernatural powers, battling evil and confronting bizarre phenomena.','1987-01-01', 'Shueisha', 'Hirohiko Araki'),
(14, 'Black Clover', 'Manga', 35, 318, 'Action', 'A boy born without magic in a world where everyone has it aspires to become the Wizard King.', '2015-02-16', 'Shueisha', 'Yūki Tabata'),
(15, 'Fairy Tail', 'Manga', 63, 545, 'Fantasy', 'A young celestial mage joins a guild filled with powerful mages and embarks on exciting adventures with her friends.', '2006-12-02', 'Kodansha', 'Hiro Mashima'),
(16, 'Overlord', 'Light Novel', 17, 148, 'Fantasy', 'A popular light novel about a player who is transported into the world of his favorite online game, becoming a powerful undead overlord.', '2010-07-30', 'Kadokawa', 'Kugane Maruyama'),
(17, 'Re:Zero - Starting Life in Another World', 'Light Novel', 28, 212, 'Fantasy', 'A young man is transported to a fantasy world, where he discovers he can return from death by resetting time, but with grave consequences.', '2012-01-23', 'MF Bunko J', 'Tappei Nagatsuki'),
(18, 'The Rising of the Shield Hero', 'Light Novel', 22, 187, 'Fantasy', 'A young man is summoned to a fantasy world as the Shield Hero and must defend the kingdom from waves of monsters and other threats.', '2012-08-22', 'Kadokawa', 'Aneko Yusagi'),
(19, 'That Time I Got Reincarnated as a Slime', 'Light Novel', 20, 130, 'Fantasy', 'After being reincarnated in a fantasy world as a slime, a man with unique abilities creates his own kingdom and strives for peace.', '2013-05-29', 'Kodansha', 'Fuse'),
(20, 'Sword Art Online', 'Light Novel', 26, 255, 'Adventure', 'Trapped in a virtual reality MMORPG, players must fight to escape the game, where death in the game means death in real life.', '2009-04-10', 'Dengeki Bunko', 'Rei Kawahara');

SELECT * FROM Anime;

SELECT * FROM Manga;