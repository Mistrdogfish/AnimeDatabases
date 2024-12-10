Use AnimeDatabase;

DELIMITER $$
CREATE PROCEDURE DeleteAnimeReview(In anime_id Int, In anime_reviewerid INT)

BEGIN
	DELETE FROM AnimeReviews
    WHERE AnimeMatchID = anime_Id AND AnimeReviewerID = anime_reviewerid ;
END 

CREATE TRIGGER updateSummary
AFTER DELETE ON AnimeReview
BEGIN
	UPDATE AnimeReviewSummary 
    SET TotalReviews = TotalReviews - 1,
	AverageReview = IF(TotalReviews > 0, (SELECT SUM(AnimeStarRating) FROM AnimeReviews WHERE AnimeID = OLD.AnimeID) / Total_Reviews, 0)
    WHERE AnimeID = OLD.AnimeID;
END

  DELIMITER ;

SELECT * FROM AnimeReviews
JOIN Anime
ON Anime.AnimeID = AnimeReviews.AnimeMatchID; 

Select * FROM AnimeReviews 
Join Users
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;
