USE AnimeDatabase;

CALL CreateFriend('Ben', 'Brook', 1, 1, 1, 1);
CALL CreateFriend("Jayden", "Vinsmoke", 2, 1, 2, 2);
CALL CreateFriend("Evan", "Flam", 3, 1, 3, 3);
CALL CreateFriend('Cole', 'Luffy', 4, 2, 4, 4); 
CALL CreateFriend('Alyssa', 'Robin', 5, 2, 5, 5); 
CALL CreateFriend('Nick', 'Zoro', 6, 3, 6, 6);
CALL CreateFriend('Greg', 'Tony', 7, 5, 7, 7);

CALL DeleteFriend(1);
CALL DeleteFriend(2);
CALL DeleteFriend(3);
CALL DeleteFriend(4);
CALL DeleteFriend(5);
CALL DeleteFriend(6);
CALL DeleteFriend(7);

CALL ListFriends(1);
CALL ListFriends(2);
CALL ListFriends(3);
CALL ListFriends(4);
CALL ListFriends(5);
CALL ListFriends(6);

CALL ListAllFriends(1);