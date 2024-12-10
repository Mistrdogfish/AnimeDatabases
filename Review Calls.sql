Use AnimeDatabase;

DROP PROCEDURE IF EXISTS DeleteAnimeReview;
DELIMITER $$
CREATE PROCEDURE DeleteAnimeReview(
	In anime_id Int,
    In anime_reviewerid INT
)

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

#See a singular user's reviews
CALL ListUserAnimeReview(1);
CALL ListUserAnimeReview(2);
CALL ListUserAnimeReview(3);
CALL ListUserAnimeReview(4);
CALL ListUserAnimeReview(5);
CALL ListUserAnimeReview(6);
CALL ListUserAnimeReview(7);

CALL ListUserMangaReview(1);
CALL ListUserMangaReview(2);
CALL ListUserMangaReview(3);
CALL ListUserMangaReview(4);
CALL ListUserMangaReview(5);
CALL ListUserMangaReview(6);
CALL ListUserMangaReview(7);

#See all reviews
Select FirstName AS "First Name", LastName, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount FROM Users 
Join AnimeReviews
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;
