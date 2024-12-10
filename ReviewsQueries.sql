Use AnimeDatabase;

DELIMITER $$
CREATE PROCEDURE DeleteAnimeReview(In anime_id Int, In anime_reviewerid INT)

BEGIN
	DELETE FROM AnimeReviews
    WHERE AnimeMatchID = anime_Id AND AnimeReviewerID = anime_reviewerid ;
END 


  DELIMITER ;

SELECT * FROM AnimeReviews
JOIN Anime
ON Anime.AnimeID = AnimeReviews.AnimeMatchID; 

Select * FROM AnimeReviews 
Join Users
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;
