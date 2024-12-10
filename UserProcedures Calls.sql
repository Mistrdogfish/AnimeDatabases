USE AnimeDatabase;

CALL CreateNewUser('Ben', 'Brook', 1, 1, 1, 1);
CALL CreateNewUser("Jayden", "Vinsmoke", 2, 2, 2, 2);
CALL CreateNewUser("Evan", "Flam", 3, 3, 3, 3);
CALL CreateNewUser('Cole', 'Luffy', 4, 4, 4, 4); 
CALL CreateNewUser('Alyssa', 'Robin', 5, 5, 5, 5); 
CALL CreateNewUser('Nick', 'Zoro', 6, 6, 6, 6);
CALL CreateNewUser('Greg', 'Tony', 7, 7, 7, 7);

#Call the DeleteUser procedure
CALL DeleteUser(1);
CALL DeleteUser(2);
CALL DeleteUser(3);
CALL DeleteUser(4);
CALL DeleteUser(5);
CALL DeleteUser(6);
CALL DeleteUser(7);