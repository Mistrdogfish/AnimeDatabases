Use AnimeDatabase;

Select FirstName AS "First Name", LastName, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount FROM Users 
Join AnimeReviews
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;

DROP PROCEDURE IF EXISTS ListUserAnimeReview;
DELIMITER $$
CREATE PROCEDURE ListUserAnimeReview (IN reviewerID INT) 
BEGIN
	Select FirstName AS "First Name", LastName AS "Last Name", AnimeReviewBody AS "Review", AnimeStarRating AS "Anime Star Count", AnimeReviewLikeCount AS "Review Like Count" FROM Users 
	Join AnimeReviews
	On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID 
    WHERE Users.AnimeReviewerID = reviewerID AND AnimeReviews.AnimeReviewerID = reviewerID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS ListUserMangaReview;
DELIMITER $$
CREATE PROCEDURE ListUserMangaReview (IN reviewerID INT) 
BEGIN
	Select FirstName AS "First Name", LastName AS "Last Name", MangaReviewBody AS "Review", MangaStarRating AS "Anime Star Count", MangaReviewLikeCount AS "Review Like Count" FROM Users 
	Join MangaReviews
	On Users.MangaReviewerID = MangaReviews.MangaReviewerID 
    WHERE Users.MangaReviewerID = reviewerID AND MangaReviews.MangaReviewerID = reviewerID;
END $$
DELIMITER ;
