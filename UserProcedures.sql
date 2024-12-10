USE AnimeDatabase;

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

call CreateUser('Ben', 'Brook', 1, 1, 1, 1);
call CreateUser("Jayden", "Vinsmoke", 2, 2, 2, 2);
call CreateUser("Evan", "Flam", 3, 3, 3, 3);
call CreateUser('Cole', 'Luffy', 4, 4, 4, 4); 
call CreateUser('Alyssa', 'Robin', 5, 5, 5, 5); 
call CreateUser('Nick', 'Zoro', 6, 6, 6, 6);
call CreateUser('Greg', 'Tony', 7, 7, 7, 7);

call DeleteUser(1);
call DeleteUser(2);
call DeleteUser(3);
call DeleteUser(4);
call DeleteUser(5);
call DeleteUser(6);
call DeleteUser(7);