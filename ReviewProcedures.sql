Use AnimeDatabase;

Select FirstName AS "First Name", LastName, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount FROM Users 
Join AnimeReviews
On Users.AnimeReviewerID = AnimeReviews.AnimeReviewerID;

