USE AnimeDatabase;

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