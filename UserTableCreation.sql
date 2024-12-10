USE AnimeDatabase;

DROP TABLE IF EXISTS Users; 
CREATE TABLE Users
(
FirstName varchar(20), 
LastName varchar(20),
UserID int, 
FriendID int,
AnimeReviewerID int,
MangaReviewerID int,
PRIMARY KEY (UserID)
);

DROP TABLE IF EXISTS Friends; 
CREATE TABLE Friends
(
FirstName varchar(20), 
LastName varchar(20), 
FriendID int,
UserID int,
AnimeReviewerID int,
MangaReviewerID int,
PRIMARY KEY (UserID)
);

Insert INTO Users (FirstName, LastName, UserID, FriendID, AnimeReviewerID, MangaReviewerID) VALUES
('Ben', 'DeZutti', 1, 1, 1, 1), 
('Cole', 'Mac', 2, 2, 2, 2), 
('Alyssa', 'Cilvey', 3, 3, 3, 3), 
('Nick', 'Wano', 4, 4, 4, 4), 
('Greg', 'West', 5, 5, 5, 5);


INSERT INTO Friends (FirstName, LastName, UserID, FriendID, AnimeReviewerID, MangaReviewerID) VALUES 
('Ben', 'DeZutti', 1, 1, 1, 1), 
('Cole', 'Mac', 2, 1, 2, 2), 
('Alyssa', 'Cilvey', 3, 2, 3, 3), 
('Nick', 'Wano', 4, 1, 4, 4), 
('Greg', 'West', 5, 2, 5, 5);

Select * from Users;

