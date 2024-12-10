Use AnimeDatabase;

#Users Procedures/Triggers

#Get user accounts

#Delete user account

#Friends Procedures/Triggers
SELECT * from Users
JOIN Friends
ON Users.UserID = Friends.FriendID
WHERE Users.UserID <> Friends.UserID
