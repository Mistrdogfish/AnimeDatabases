Use AnimeDatabase;

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
