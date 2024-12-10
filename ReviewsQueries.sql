Use AnimeDatabase;

SELECT * FROM AnimeReviews
JOIN Anime
ON Anime.AnimeID = AnimeReviews.AnimeMatchID; 

Select * FROM AnimeReviews 
Join Users
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;