USE AnimeDatabase; 
CALL AddToWatchList(1, 1);
CALL AddToWatchList(1, 2);
CALL AddToWatchList(4, 5);

CALL GetWatchList(1);
CALL GetWatchList(2);
CALL GetWatchList(4);

CALL DeleteFromWatchList(1, 1);
CALL DeleteFromWatchList(4,5);