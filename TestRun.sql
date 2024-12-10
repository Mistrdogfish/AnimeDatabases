Use AnimeDatabase;

DROP PROCEDURE IF EXISTS DeleteAnimeReview;
DELIMITER $$
CREATE PROCEDURE DeleteAnimeReview(In anime_id Int, In anime_reviewerid INT)
BEGIN
	DELETE FROM AnimeReviews
    WHERE AnimeMatchID = anime_Id AND AnimeReviewerID = anime_reviewerid ;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS updateAnimeSummary;
DELIMITER $$
CREATE TRIGGER updateAnimeSummary
AFTER DELETE ON AnimeReviews
FOR EACH ROW
BEGIN
	UPDATE AnimeReviewSummary 
    SET TotalReviews = TotalReviews - 1,
		AverageReview = IF(TotalReviews > 0, (SELECT SUM(AnimeStarRating) FROM AnimeReviews WHERE AnimeMatchID = OLD.AnimeMatchID) / Total_Reviews, 0)
    WHERE AnimeMatchID = OLD.AnimeMatchID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteMangaReview;
DELIMITER $$
CREATE PROCEDURE DeleteMangaReview(In manga_id Int, In manga_reviewerid INT)
BEGIN
	DELETE FROM MangaReviews
    WHERE MangaMatchID = manga_Id AND MangaReviewerID = manga_reviewerid ;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS updateMangaSummary;
DELIMITER $$
CREATE TRIGGER updateMangaSummary AFTER DELETE ON MangaReviews FOR EACH ROW
BEGIN
	UPDATE MangaReviewSummary 
    SET TotalReviews = TotalReviews - 1,
		AverageReview = IF(TotalReviews > 0, (SELECT SUM(MangaStarRating) FROM MangaReviews WHERE MangaMatchID = OLD.MangaMatchID) / Total_Reviews, 0)
    WHERE MangaMatchID = OLD.MangaMatchID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddNewAnimeReview;
DELIMITER $$
CREATE PROCEDURE AddNewAnimeReview(IN p_AnimeID INT, IN p_AnimeReviewerID INT, IN p_AnimeReviewBody VARCHAR(100), IN p_AnimeStarRating INT, IN p_AnimeReviewLikeCount INT)
BEGIN
    -- Insert the new review into AnimeReviews table
    INSERT INTO AnimeReviews (AnimeMatchID, AnimeReviewerID, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount)
    VALUES (p_AnimeID, p_AnimeReviewerID, p_AnimeReviewBody, p_AnimeStarRating, p_AnimeReviewLikeCount);

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS updateAddAnimeSummary;
DELIMITER $$
CREATE TRIGGER updateAddAnimeSummary AFTER INSERT ON AnimeReviews FOR EACH ROW
BEGIN
    -- Declare variables to hold total reviews and sum of ratings
    DECLARE total_reviews INT;
    DECLARE total_rating INT;
    DECLARE average_rating DECIMAL(3, 2);
    
    -- Get the current total reviews and total ratings for the given AnimeID
    SELECT COUNT(*), SUM(AnimeStarRating) 
    INTO total_reviews, total_rating
    FROM AnimeReviews
    WHERE AnimeMatchID = p_AnimeID;

    -- If there's no entry for this AnimeID, initialize the values
    IF total_reviews IS NULL THEN
        SET total_reviews = 0;
        SET total_rating = 0;
    END IF;

    -- Calculate the average rating
    SET average_rating = IF(total_reviews > 0, total_rating / total_reviews, 0);

    -- Update or insert the summary into the AnimeReviewSummary table
    INSERT INTO AnimeReviewSummary (AnimeID, TotalReviews, AverageReview)
    VALUES (NEW.AnimeMatchID, total_reviews, average_rating)
    ON DUPLICATE KEY UPDATE
        TotalReviews = total_reviews,
        AverageReview = average_rating;
END $$    
DELIMITER ;

DROP PROCEDURE IF EXISTS AddNewMangaReview;
DELIMITER $$
CREATE PROCEDURE AddNewMangaReview(
    IN p_MangaMatchID INT,
    IN p_MangaReviewerID INT,
    IN p_MangaReviewBody VARCHAR(100),
    IN p_MangaReviewLikeCount INT,
    IN p_MangaStarRating INT
)
BEGIN
    -- Step 1: Insert the new review into the MangaReviews table
    INSERT INTO MangaReviews (MangaMatchID, MangaReviewerID, MangaReviewBody, MangaReviewLikeCount, MangaStarRating)
    VALUES (p_MangaMatchID, p_MangaReviewerID, p_MangaReviewBody, p_MangaReviewLikeCount, p_MangaStarRating);

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS updateAddMangaSummary;
DELIMITER $$
CREATE TRIGGER updateAddMangaSummary
AFTER INSERT ON MangaReviews
FOR EACH ROW
BEGIN
    -- Step 2: Calculate the total number of reviews and average rating for the manga
    DECLARE totalReviews INT;
    DECLARE avgRating DECIMAL(3, 2);

    -- Get the total number of reviews for the manga
    SELECT COUNT(*) INTO totalReviews
    FROM MangaReviews
    WHERE MangaMatchID = NEW.MangaMatchID;

    -- Get the average rating for the manga
    SELECT AVG(MangaStarRating) INTO avgRating
    FROM MangaReviews
    WHERE MangaMatchID = NEW.MangaMatchID;

    -- Step 3: Update the MangaReviewStats table with the new values
    UPDATE MangaReviewStats
    SET TotalReviews = totalReviews,
        AverageRating = avgRating
    WHERE MangaID = NEW.MangaMatchID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddNewAnime;
DELIMITER $$
CREATE PROCEDURE AddNewAnime(IN p_AnimeID INT, IN p_Title VARCHAR(100), IN p_AnimeType VARCHAR(10), IN p_Seasons INT, IN p_Episodes INT, IN p_Genre VARCHAR(20), IN p_AnimeDescription VARCHAR(500), IN p_ReleaseDate DATE, IN p_Studio VARCHAR(30), IN p_Actors VARCHAR(100))
BEGIN
    -- Insert the new anime into the Anime table
    INSERT INTO Anime (AnimeID, Title, AnimeType, Seasons, Episodes, Genre, AnimeDescription, ReleaseDate, Studio, Actors)
    VALUES (p_AnimeID, p_Title, p_AnimeType, p_Seasons, p_Episodes, p_Genre, p_AnimeDescription, p_ReleaseDate, p_Studio, p_Actors);
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteAnime;
DELIMITER $$
CREATE PROCEDURE DeleteAnime(IN p_AnimeID INT)
BEGIN
    -- Delete the anime with the specified AnimeID from the Anime table
    DELETE FROM Anime
    WHERE AnimeID = p_AnimeID;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddNewManga;
DELIMITER $$
CREATE PROCEDURE AddNewManga(IN p_MangaID INT, IN p_Title VARCHAR(100), IN p_BookType VARCHAR(20), IN p_Volumes INT, IN p_Chapters INT, IN p_Genre VARCHAR(20), IN p_BookDescription VARCHAR(500), IN p_ReleaseDate DATE, IN p_Publisher VARCHAR(30), IN p_Author VARCHAR(50))
BEGIN
    -- Insert the new manga into the Manga table
    INSERT INTO Manga (MangaID, Title, BookType, Volumes, Chapters, Genre, BookDescription, ReleaseDate, Publisher, Author)
    VALUES (p_MangaID, p_Title, p_BookType, p_Volumes, p_Chapters, p_Genre, p_BookDescription, p_ReleaseDate, p_Publisher, p_Author);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteManga;
DELIMITER $$
CREATE PROCEDURE DeleteManga(IN p_MangaID INT)
BEGIN
    -- Delete the manga with the specified MangaID from the Manga table
    DELETE FROM Manga
    WHERE MangaID = p_MangaID;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS ListUserAnimeReview;
DELIMITER $$
CREATE PROCEDURE ListUserAnimeReview (IN reviewerID INT) 
BEGIN
	Select FirstName AS "First Name", LastName AS "Last Name", AnimeReviewBody AS "Review", AnimeStarRating AS "Anime Star Count", AnimeReviewLikeCount AS "Review Like Count" FROM Users 
	Join AnimeReviews
	On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID 
    WHERE Users.AnimeReviewerID = reviewerID AND AnimeReviews.AnimeReviewerID = reviewerID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS ListUserMangaReview;
DELIMITER $$
CREATE PROCEDURE ListUserMangaReview (IN reviewerID INT) 
BEGIN
	Select FirstName AS "First Name", LastName AS "Last Name", MangaReviewBody AS "Review", MangaStarRating AS "Anime Star Count", MangaReviewLikeCount AS "Review Like Count" FROM Users 
	Join MangaReviews
	On Users.MangaReviewerID = MangaReviews.MangaReviewerID 
    WHERE Users.MangaReviewerID = reviewerID AND MangaReviews.MangaReviewerID = reviewerID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddToWatchList;
DELIMITER $$
CREATE PROCEDURE AddToWatchList(In anime_id Int, user_id Int)
BEGIN
	  INSERT INTO UserWatchList(UserID, AnimeID) VALUES (user_id, anime_id);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS AddToReadList;
DELIMITER $$
CREATE PROCEDURE AddToReadList(In manga_id Int, user_id Int)
BEGIN
	  INSERT INTO UserReadList (UserID, MangaID) VALUES (user_id, manga_id);
END $$
DELIMITER ;
	
DROP PROCEDURE IF EXISTS DeleteFromWatchList;
DELIMITER $$
CREATE PROCEDURE DeleteFromWatchList(In anime_id Int, user_id Int)
BEGIN
	  DELETE FROM UserWatchList 
    WHERE AnimeID = anime_id AND UserID = user_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS DeleteFromReadList;
DELIMITER $$
CREATE PROCEDURE DeleteFromReadList(In manga_id Int, user_id Int)
BEGIN
	  DELETE FROM UserReadList 
    WHERE MangaID = manga_id AND UserID = user_id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS  ViewFriendsLists;
DELIMITER $$
CREATE PROCEDURE ViewFriendsLists(In friend_id Int)
BEGIN
	  SELECT * FROM UserWatchList JOIN UserReadList ON USerWatchList.UserID = UserReadList.UserID WHERE UserID = friend_id;
END $$
DELIMITER ;

#Create user account
DROP PROCEDURE IF EXISTS CreateUser;
DELIMITER $$
CREATE PROCEDURE CreateUser (IN fName VARCHAR(20), IN lName VARCHAR(20), IN userID INT, IN friendID INT, IN animeReviewerID INT, IN mangaReviewerID INT) 
BEGIN
	INSERT INTO Users (FirstName, LastName, UserID, FriendID, AnimeReviewerID, MangaReviewerID)
    VALUES (fName, lName, userID, friendID, animeReviewerID, mangaReviewerID);
END $$
DELIMITER ;

#Delete user account
DROP PROCEDURE IF EXISTS DeleteUser;
DELIMITER $$
CREATE PROCEDURE DeleteUser (IN id int)
BEGIN 
    DELETE FROM Users WHERE Users.UserID = id;
END $$
DELIMITER ;

#Create user account
DROP PROCEDURE IF EXISTS CreateFriend;
DELIMITER $$
CREATE PROCEDURE CreateFriend (IN fName VARCHAR(20), IN lName VARCHAR(20), IN userID INT, IN friendID INT, IN animeReviewerID INT, IN mangaReviewerID INT) 
BEGIN
	INSERT INTO Friends (FirstName, LastName, UserID, FriendID, AnimeReviewerID, MangaReviewerID)
    VALUES (fName, lName, userID, friendID, animeReviewerID, mangaReviewerID);
END $$
DELIMITER ;

#Delete user account
DROP PROCEDURE IF EXISTS DeleteFriend;
DELIMITER $$
CREATE PROCEDURE DeleteFriend (IN id int)
BEGIN 
    DELETE FROM Friends WHERE Friends.UserID = id;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS ListFriends;
DELIMITER $$
CREATE PROCEDURE ListFriends (IN id int)
BEGIN
	SELECT * FROM Friends
	JOIN Users
	WHERE Friends.FriendID = Users.UserID AND Friends.UserID <> Users.UserID AND Friends.FriendID = id;
END $$ 
DELIMITER ;

DROP PROCEDURE IF EXISTS ListAllFriends;
DELIMITER $$
CREATE PROCEDURE ListAllFriends (IN id int)
BEGIN
	SELECT * FROM Friends
	JOIN Users
	WHERE Friends.FriendID = Users.UserID AND Friends.UserID <> Users.UserID;
END $$ 
DELIMITER ;

DROP TABLE IF EXISTS Anime;
CREATE TABLE Anime(AnimeID int NOT NULL, Title varchar(100) NOT NULL, AnimeType varchar(10) NOT NULL, Seasons int, Episodes int, Genre varchar(20) NOT NULL, AnimeDescription varchar(500) NOT NULL, ReleaseDate date NOT NULL, Studio varchar(30) NOT NULL, Actors varchar(100) NOT NULL, PRIMARY KEY (AnimeID));

DROP TABLE IF EXISTS Manga;
CREATE TABLE Manga(MangaID int NOT NULL, Title varchar(100) NOT NULL, BookType varchar(20) NOT NULL, Volumes int, Chapters int, Genre varchar(20) NOT NULL, BookDescription varchar(500) NOT NULL, ReleaseDate date NOT NULL, Publisher varchar(30) NOT NULL, Author varchar(50) NOT NULL, PRIMARY KEY (MangaID));

DROP TABLE IF EXISTS UserWatchList;
CREATE TABLE UserWatchList (UserID int NOT NULL, AnimeID int NOT NULL, PRIMARY KEY (AnimeID)); 

DROP TABLE IF EXISTS UserReadList;
CREATE TABLE UserReadList(UserID int NOT NULL, MangaID int NOT NULL, PRIMARY KEY (MangaID));

DROP TABLE IF EXISTS AnimeReviews;
CREATE TABLE AnimeReviews (AnimeMatchID int, AnimeReviewerID int, AnimeReviewBody VARCHAR(100), AnimeStarRating int, AnimeReviewLikeCount int);

DROP TABLE IF EXISTS MangaReviews;
CREATE TABLE MangaReviews(MangaMatchID int, MangaReviewerID int, MangaReviewBody VARCHAR(100), MangaStarRating int, MangaReviewLikeCount int);

DROP TABLE IF EXISTS AnimeReviewSummary;
CREATE TABLE AnimeReviewSummary(AnimeID int, TotalReviews int, AverageReview int);

DROP TABLE IF EXISTS MangaReviewStats;
CREATE TABLE MangaReviewStats(MangaID int, TotalReviews int, AverageRating int);

DROP TABLE IF EXISTS Users; 
CREATE TABLE Users(FirstName varchar(20), LastName varchar(20),UserID int, FriendID int, AnimeReviewerID int, MangaReviewerID int, PRIMARY KEY (UserID));

DROP TABLE IF EXISTS Friends; 
CREATE TABLE Friends(FirstName varchar(20), LastName varchar(20), FriendID int, UserID int, AnimeReviewerID int, MangaReviewerID int, PRIMARY KEY (UserID));

Call AddNewAnime(1, 'One Piece', 'Show', 1, 1020, 'Action', 'A popular adventure anime about pirates and the quest to find the legendary treasure, the One Piece.', '1999-10-20', 'Toei Animation', 'Mayumi Tanaka, Akemi Okamura, Kazuya Nakai');
Call AddNewAnime(2, 'One Piece: Strong World', 'Movie', 1, 0, 'Action', 'The movie features the Straw Hat Pirates in an epic battle against a powerful new antagonist in a unique island setting.', '2009-12-12', 'Toei Animation', 'Mayumi Tanaka, Akemi Okamura, Kazuya Nakai');
Call AddNewAnime(3, 'Spirited Away', 'Movie', 1, 0, 'Fantasy', 'A young girl is trapped in a magical world and must find a way to save her parents and return to the real world.', '2001-07-20', 'Studio Ghibli', 'Rumi Hiiragi, Miyu Irino, Bunta Sugawara');
Call AddNewAnime(4, 'Your Name', 'Movie', 1, 0, 'Romance', 'Two teenagers from different parts of Japan find themselves mysteriously swapping bodies and try to solve the mystery of their connection.', '2016-08-26', 'Toho', 'Ryunosuke Kamiki, Mone Kamishiraishi');
Call AddNewAnime(5, 'Attack on Titan', 'Show', 4, 87, 'Action', 'Humanity fights for survival against giant humanoid creatures known as Titans.', '2013-04-06', 'WIT Studio', 'Yuki Kaji, Marina Inoue, Josh Grelle');
Call AddNewAnime(6, 'My Hero Academia', 'Show', 6, 113, 'Action', 'In a world where people with superpowers, called "Quirks," are common, a young boy without powers strives to become the greatest hero.', '2016-04-03', 'Bones', 'Daiki Yamashita, Kenta Miyake, Nobuhiko Okamoto');
Call AddNewAnime(7, 'Demon Slayer', 'Show', 2, 26, 'Action', 'A young boy fights demons to protect his family and find a cure for his sister, who was turned into a demon.', '2019-04-06', 'ufotable', 'Natsuki Hanae, Akari Kito, Hiro Shimono');
Call AddNewAnime(8, 'Fullmetal Alchemist: Brotherhood', 'Show', 1, 64, 'Action', 'Two brothers use alchemy to try to fix the mistakes caused by their forbidden attempts to bring their mother back to life.', '2009-04-05', 'Bones', 'Vic Mignogna, Aaron Dismuke, Romi Park');
Call AddNewAnime(9, 'Naruto', 'Show', 9, 220, 'Action', 'A young ninja’s journey to become the strongest ninja and protect his village.', '2002-10-03', 'Pierrot', 'Junko Takeuchi, Noriaki Sugiyama, Chie Nakamura');
Call AddNewAnime(10, 'The Witcher: Nightmare of the Wolf', 'Movie', 1, 0, 'Fantasy', 'The story of Vesemir, Geralt’s mentor, set in the world of The Witcher as he faces a deadly new monster threat.', '2021-08-23', 'Netflix', 'Theo James, Lara Pulver, Graham McTavish');
Call AddNewAnime(11, 'Neon Genesis Evangelion', 'Show', 1, 26, 'Mecha', 'A young boy is recruited to pilot a giant robot to protect Earth from mysterious creatures known as Angels.', '1995-10-05', 'Gainax', 'Megumi Ogata, Kotono Mitsuishi, Yuko Miyamura');
Call AddNewAnime(12, 'Sword Art Online', 'Show', 4, 96, 'Adventure', 'Trapped in a virtual reality MMORPG, players must fight to escape the game, where death in the game means death in real life.', '2012-07-08', 'A-1 Pictures', 'Yoshitsugu Matsuoka, Haruka Tomatsu, Kanae Itou');
Call AddNewAnime(13, 'Tokyo Ghoul', 'Show', 4, 48, 'Horror', 'A college student is transformed into a half-ghoul after a near-fatal accident and must navigate a dangerous world.', '2014-07-03', 'Studio Pierrot', 'Natsuki Hanae, Sora Amamiya, Masumi Asano');
Call AddNewAnime(14, 'Hunter x Hunter', 'Show', 6, 148, 'Adventure', 'A young boy embarks on an adventure to find his missing father and become a Hunter, one of the most elite individuals in the world.', '2011-10-02', 'Madhouse', 'Megumi Han, Cristina Valenzuela, Mariya Ise');
Call AddNewAnime(15, 'One Punch Man', 'Show', 2, 24, 'Action', 'A hero who can defeat any opponent with a single punch struggles with the boredom that comes with overwhelming power.', '2015-10-05', 'Madhouse', 'Makoto Furukawa, Kaito Ishikawa, Yuuki Kaji');
Call AddNewAnime(16, 'JoJo’s Bizarre Adventure', 'Show', 5, 152, 'Action', 'A multi-generational saga of families with supernatural powers, battling evil and confronting bizarre phenomena.', '2012-10-05', 'David Production', 'Kazuyuki Okitsu, Daisuke Ono, Takehito Koyasu');
Call AddNewAnime(17, 'The Seven Deadly Sins', 'Show', 5, 100, 'Action', 'A group of knights known as the Seven Deadly Sins must fight to save their kingdom from evil forces.', '2014-10-05', 'A-1 Pictures', 'Yuuki Kaji, Sora Amamiya, Aoi Koga');
Call AddNewAnime(18, 'Klaus', 'Movie', 1, 0, 'Holiday', 'A Netflix original movie that tells the origin story of Santa Claus, focusing on a postman and a toy maker.', '2019-11-08', 'Netflix', 'Jason Schwartzman, J.K. Simmons, Rashida Jones');
Call AddNewAnime(19, 'Beastars', 'Show', 2, 24, 'Drama', 'A world of anthropomorphic animals is thrown into disarray as a wolf deals with his feelings for a rabbit and the social pressure of their society.', '2019-10-08', 'Orange', 'Chikahiro Kobayashi, Sayaka Senbongi, Junya Enoki');
Call AddNewAnime(20, 'Promare', 'Movie', 1, 0, 'Action', 'In a futuristic world, firefighters known as Burnish fight massive fire-related creatures to save the planet.', '2019-05-24', 'TRIGGER', 'Kazuya Nakai, Kenjirou Tsuda, Ai Kayano');

Call AddNewManga(1, 'One Piece', 'Manga', 102, 1015, 'Action', 'A popular adventure manga about pirates and the quest to find the legendary treasure, the One Piece.', '1997-07-22', 'Shueisha', 'Eiichiro Oda');
Call AddNewManga(2, 'Naruto', 'Manga', 72, 700, 'Action', 'A young ninja’s journey to become the strongest ninja and protect his village.', '1999-09-21', 'Shueisha', 'Masashi Kishimoto');
Call AddNewManga(3, 'Attack on Titan', 'Manga', 34, 139, 'Action', 'Humanity fights for survival against giant humanoid creatures known as Titans.',  '2009-09-09', 'Kodansha', 'Hajime Isayama');
Call AddNewManga(4, 'My Hero Academia', 'Manga', 38, 383, 'Action', 'In a world where people with superpowers, called "Quirks," are common, a young boy without powers strives to become the greatest hero.', '2014-07-07', 'Shueisha', 'Kohei Horikoshi');
Call AddNewManga(5, 'Death Note', 'Manga', 12, 108, 'Mystery', 'A high school student discovers a notebook that allows him to kill anyone whose name he writes in it.', '2003-12-01', 'Shueisha', 'Tsugumi Ohba');
Call AddNewManga(6, 'Dragon Ball', 'Manga', 42, 519, 'Action', 'The story of Goku, a boy with a tail who becomes the strongest fighter in the world.', '1984-12-03', 'Shueisha', 'Akira Toriyama');
Call AddNewManga(7, 'Fullmetal Alchemist', 'Manga', 27, 108, 'Action', 'Two brothers use alchemy to try to fix the mistakes caused by their forbidden attempts to bring their mother back to life.', '2001-07-12', 'Square Enix', 'Hiromu Arakawa');
Call AddNewManga(8, 'Bleach', 'Manga', 74, 686, 'Action', 'A teenager with the ability to see ghosts becomes a Soul Reaper to protect the living world from dark spirits.', '2001-08-07', 'Shueisha', 'Tite Kubo');
Call AddNewManga(9, 'Tokyo Ghoul', 'Manga', 14, 143, 'Horror', 'A college student is transformed into a half-ghoul after a near-fatal accident and must navigate a dangerous world.', '2011-09-08', 'Shueisha', 'Sui Ishida');
Call AddNewManga(10, 'Hunter x Hunter', 'Manga', 36, 390, 'Adventure', 'A young boy embarks on an adventure to find his missing father and become a Hunter, one of the most elite individuals in the world.', '1998-03-03', 'Shueisha', 'Yoshihiro Togashi');
Call AddNewManga(11, 'One Punch Man', 'Manga', 24, 171, 'Action', 'A hero who can defeat any opponent with a single punch struggles with the boredom that comes with overwhelming power.', '2009-06-14', 'Shueisha', 'ONE & Yusuke Murata');
Call AddNewManga(12, 'Demon Slayer', 'Manga', 23, 205, 'Action', 'A young boy fights demons to protect his family and find a cure for his sister, who was turned into a demon.', '2016-02-15', 'Shueisha', 'Koyoharu Gotouge');
Call AddNewManga(13, 'JoJo’s Bizarre Adventure', 'Manga', 131, 1280, 'Action', 'A multi-generational saga of families with supernatural powers, battling evil and confronting bizarre phenomena.','1987-01-01', 'Shueisha', 'Hirohiko Araki');
Call AddNewManga(14, 'Black Clover', 'Manga', 35, 318, 'Action', 'A boy born without magic in a world where everyone has it aspires to become the Wizard King.', '2015-02-16', 'Shueisha', 'Yūki Tabata');
Call AddNewManga(15, 'Fairy Tail', 'Manga', 63, 545, 'Fantasy', 'A young celestial mage joins a guild filled with powerful mages and embarks on exciting adventures with her friends.', '2006-12-02', 'Kodansha', 'Hiro Mashima');
Call AddNewManga(16, 'Overlord', 'Light Novel', 17, 148, 'Fantasy', 'A popular light novel about a player who is transported into the world of his favorite online game, becoming a powerful undead overlord.', '2010-07-30', 'Kadokawa', 'Kugane Maruyama');
Call AddNewManga(17, 'Re:Zero - Starting Life in Another World', 'Light Novel', 28, 212, 'Fantasy', 'A young man is transported to a fantasy world, where he discovers he can return from death by resetting time, but with grave consequences.', '2012-01-23', 'MF Bunko J', 'Tappei Nagatsuki');
Call AddNewManga(18, 'The Rising of the Shield Hero', 'Light Novel', 22, 187, 'Fantasy', 'A young man is summoned to a fantasy world as the Shield Hero and must defend the kingdom from waves of monsters and other threats.', '2012-08-22', 'Kadokawa', 'Aneko Yusagi');
Call AddNewManga(19, 'That Time I Got Reincarnated as a Slime', 'Light Novel', 20, 130, 'Fantasy', 'After being reincarnated in a fantasy world as a slime, a man with unique abilities creates his own kingdom and strives for peace.', '2013-05-29', 'Kodansha', 'Fuse');
Call AddNewManga(20, 'Sword Art Online', 'Light Novel', 26, 255, 'Adventure', 'Trapped in a virtual reality MMORPG, players must fight to escape the game, where death in the game means death in real life.', '2009-04-10', 'Dengeki Bunko', 'Rei Kawahara');

Call AddNewAnimeReview(1, 101, 'An amazing adventure filled with great characters and story arcs!', 5, 120);
Call AddNewAnimeReview(1, 102, 'The long-running saga of pirates with an exciting and emotional journey.', 4, 85);
Call AddNewAnimeReview(1, 103, 'Some episodes feel slow, but the adventure is unforgettable.', 4, 55);
Call AddNewAnimeReview(1, 104, 'Great animation, but the pacing sometimes hurts the overall experience.', 3, 45);
Call AddNewAnimeReview(1, 105, 'One of my all-time favorites. The character growth is fantastic!', 5, 200);
Call AddNewAnimeReview(2, 106, 'A unique movie with strong world-building and an intense plot.', 4, 90);
Call AddNewAnimeReview(2, 107, 'Straw Hat Pirates once again shine in this action-packed film.', 5, 150);
Call AddNewAnimeReview(2, 108, 'The villain is intimidating, but I felt the story was a bit predictable.', 3, 60);
Call AddNewAnimeReview(2, 109, 'Love the animation quality. Toei Animation did a great job!', 4, 80);
Call AddNewAnimeReview(2, 110, 'The movie is good, but it doesn’t offer anything new compared to the show.', 3, 40);
Call AddNewAnimeReview(3, 111, 'A timeless classic with breathtaking animation and a deeply emotional story.', 5, 230);
Call AddNewAnimeReview(3, 112, 'The music and visuals alone make this movie worth watching.', 5, 180);
Call AddNewAnimeReview(3, 113, 'I was captivated by the story and world, but the pacing could be better.', 4, 70);
Call AddNewAnimeReview(3, 114, 'The themes in this movie are deep and meaningful. A must-watch for any anime fan.', 5, 250);
Call AddNewAnimeReview(3, 115, 'Visually stunning, but I felt the plot was a bit too abstract for my taste.', 3, 50);
Call AddNewAnimeReview(4, 116, 'Such a unique concept! The relationship between the characters is so touching.', 5, 300);
Call AddNewAnimeReview(4, 117, 'A beautiful and emotional experience with incredible animation.', 5, 210);
Call AddNewAnimeReview(4, 118, 'The body-swapping was handled so well, and the music is amazing!', 4, 90);
Call AddNewAnimeReview(4, 119, 'This movie will leave you thinking long after it ends. Very well done!', 5, 180);
Call AddNewAnimeReview(4, 120, 'I was a bit confused at times, but it’s still an enjoyable watch overall.', 4, 60);
Call AddNewAnimeReview(5, 121, 'A masterpiece of storytelling with high-stakes action and incredible world-building.', 5, 220);
Call AddNewAnimeReview(5, 122, 'The intensity and drama in this series are top-notch. It kept me on the edge of my seat!', 5, 160);
Call AddNewAnimeReview(5, 123, 'The action is fantastic, but some episodes felt a bit dragged out.', 4, 110);
Call AddNewAnimeReview(5, 124, 'Great characters and solid plot, but it can be a bit too dark at times.', 4, 80);
Call AddNewAnimeReview(5, 125, 'This show had me hooked from the very first episode. Highly recommend!', 5, 250);
Call AddNewAnimeReview(1, 126, 'One Piece has one of the most extensive and engaging stories out there!', 5, 140);
Call AddNewAnimeReview(1, 127, 'The action scenes are awesome, and I love the character interactions.', 4, 90);
Call AddNewAnimeReview(2, 128, 'A solid movie, but I wish it explored more of the characters’ backgrounds.', 4, 50);
Call AddNewAnimeReview(3, 129, 'An incredibly well-crafted story, with visuals that take your breath away.', 5, 220);
Call AddNewAnimeReview(3, 130, 'Spirited Away is a film that every anime lover should experience at least once.', 5, 210);
Call AddNewAnimeReview(4, 131, 'The story of body-switching is both charming and thought-provoking. Beautiful film!', 5, 170);

Call AddNewMangaReview(1, 1, 'A great start to an adventure. Highly recommend!', 5, 10);
Call AddNewMangaReview(1, 2, 'Amazing characters and world-building.', 4, 8);
Call AddNewMangaReview(1, 3, 'The plot is engaging, but the pacing is slow at times.', 3, 7);
Call AddNewMangaReview(1, 4, 'Really love the art style. One of my favorites!', 5, 12);
Call AddNewMangaReview(1, 5, 'An enjoyable read, though some parts felt repetitive.', 3, 5);
Call AddNewMangaReview(1, 6, 'The story has its ups and downs, but it\'s worth the read.', 4, 9);
Call AddNewMangaReview(1, 7, 'Great action scenes, but the character development needs work.', 3, 6);
Call AddNewMangaReview(1, 8, 'Can\'t wait to see where this story goes!', 5, 11);
Call AddNewMangaReview(1, 9, 'The world-building is impressive, but the characters feel flat.', 2, 4);
Call AddNewMangaReview(1, 10, 'Loved the first few chapters, but the story started losing me.', 3, 5);
Call AddNewMangaReview(2, 11, 'One of the best manga series I\'ve ever read!', 5, 15);
Call AddNewMangaReview(2, 12, 'The storyline is fantastic, and the artwork is beautiful!', 5, 14);
Call AddNewMangaReview(2, 13, 'The main character is really relatable. Amazing work!', 4, 10);
Call AddNewMangaReview(2, 14, 'Some parts were slow, but overall a solid read.', 4, 8);
Call AddNewMangaReview(2, 15, 'An emotional roller coaster. Loved it!', 5, 9);
Call AddNewMangaReview(2, 16, 'The world-building and the side characters are great.', 4, 6);
Call AddNewMangaReview(2, 17, 'It has some filler arcs, but the main story is awesome.', 3, 7);
Call AddNewMangaReview(2, 18, 'Great writing, but I wish the pacing was a bit faster.', 3, 6);
Call AddNewMangaReview(2, 19, 'A bit predictable, but still a great series.', 3, 5);
Call AddNewMangaReview(2, 20, 'A must-read for fans of action-packed stories.', 5, 13);
Call AddNewMangaReview(3, 21, 'A truly unique concept. I couldn\'t stop reading.', 4, 10);
Call AddNewMangaReview(3, 22, 'The characters are very interesting, but the ending was rushed.', 3, 8);
Call AddNewMangaReview(3, 23, 'Intense action and a solid plot. A great addition to my collection.', 5, 11);
Call AddNewMangaReview(3, 24, 'A few boring chapters, but the rest was solid.', 4, 6);
Call AddNewMangaReview(3, 25, 'The art is beautiful, and the plot is engaging.', 4, 9);
Call AddNewMangaReview(3, 26, 'Fell in love with the characters. A great story overall.', 5, 7);
Call AddNewMangaReview(3, 27, 'The pacing was slow, but the world-building is amazing.', 4, 8);
Call AddNewMangaReview(3, 28, 'Could have used more character development.', 3, 6);
Call AddNewMangaReview(3, 29, 'The twists in this manga are amazing!', 5, 10);
Call AddNewMangaReview(3, 30, 'An interesting story, but it left a lot of questions unanswered.', 3, 5);
Call AddNewMangaReview(4, 31, 'One of the best action manga out there!', 5, 13);
Call AddNewMangaReview(4, 32, 'The main character is too predictable, but still fun to read.', 3, 7);
Call AddNewMangaReview(4, 33, 'A good read, but it can get repetitive at times.', 4, 6);
Call AddNewMangaReview(4, 34, 'The artwork is gorgeous, and the action scenes are fantastic.', 5, 14);
Call AddNewMangaReview(4, 35, 'I\'ve enjoyed every chapter. Truly epic.', 5, 12);
Call AddNewMangaReview(4, 36, 'Interesting plot, but the characters need more depth.', 3, 9);
Call AddNewMangaReview(4, 37, 'Highly recommend it to anyone who loves action-packed stories.', 4, 10);
Call AddNewMangaReview(4, 38, 'Some characters are a bit one-dimensional, but still a fun read.', 3, 6);
Call AddNewMangaReview(4, 39, 'The action sequences are top-notch, but the story feels a bit generic.', 4, 5);
Call AddNewMangaReview(4, 40, 'I\'m hooked! The latest chapter was a game changer.', 5, 11);

call CreateUser('Ben', 'Brook', 1, 1, 1, 1);
call CreateUser("Jayden", "Vinsmoke", 2, 2, 2, 2);
call CreateUser("Evan", "Flam", 3, 3, 3, 3);
call CreateUser('Cole', 'Luffy', 4, 4, 4, 4); 
call CreateUser('Alyssa', 'Robin', 5, 5, 5, 5); 
call CreateUser('Nick', 'Zoro', 6, 6, 6, 6);
call CreateUser('Greg', 'Tony', 7, 7, 7, 7);

CALL CreateFriend('Ben', 'Brook', 1, 1, 1, 1);
CALL CreateFriend("Jayden", "Vinsmoke", 2, 1, 2, 2);
CALL CreateFriend("Evan", "Flam", 3, 1, 3, 3);
CALL CreateFriend('Cole', 'Luffy', 4, 2, 4, 4); 
CALL CreateFriend('Alyssa', 'Robin', 5, 2, 5, 5); 
CALL CreateFriend('Nick', 'Zoro', 6, 3, 6, 6);
CALL CreateFriend('Greg', 'Tony', 7, 5, 7, 7);

CALL AddToWatchList(1, 2);

SELECT * FROM UserWatchList;




