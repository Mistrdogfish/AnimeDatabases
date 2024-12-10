USE AnimeDatabase; 

DROP TABLE IF EXISTS AnimeReviews;
CREATE TABLE AnimeReviews 
( 
AnimeMatchID int,
AnimeReviewerID int, 
AnimeReviewBody VARCHAR(100),
AnimeStarRating int,
OverallStarRating int NULL,
AnimeReviewLikeCount int
);

INSERT INTO AnimeReviews (AnimeMatchID, AnimeReviewerID, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount) VALUES 
(1, 1, "This is the greatest show I've ever seen", 5, 12), 
(2, 2, "This is the worst show I've ever seen", 1, 2),
(15, 3, "This is kinda mid not gonna lie", 3, 5), 
(7, 4, "Would die for Tanjiro", 5, 2),
(12, 2, "Meh.", 3, 10);

DROP TABLE IF EXISTS MangaReviews;
CREATE TABLE MangaReviews 
( 
MangaMatchID int,
MangaReviewerID int, 
MangaReviewBody VARCHAR(100),
MangaStarRating int,
OverallStarRating int NULL,
MangaReviewLikeCount int,
PRIMARY KEY (MangaMatchID)
);

INSERT INTO MangaReviews (MangaMatchID, MangaReviewerID, MangaReviewBody, MangaStarRating, MangaReviewLikeCount) VALUES 
(1, 1, "This is the greatest manga I've ever seen", 5, 12), 
(2, 2, "This is the worst manga I've ever seen", 1, 2),
(15, 3, "This is kinda mid not gonna lie", 3, 5), 
(7, 4, "Would die for Tanjiro", 5, 2),
(12, 2, "Meh.", 3, 10);
