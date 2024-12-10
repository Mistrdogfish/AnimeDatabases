use AnimeDatabase;

DELIMITER $$

DROP PROCEDURE IF EXISTS AddMangaReview;
CREATE PROCEDURE AddMangaReview(
    IN p_MangaMatchID INT,
    IN p_MangaReviewerID INT,
    IN p_MangaReviewBody VARCHAR(100),
    IN p_MangaReviewLikeCount INT,
    IN p_MangaStarRating INT
)
BEGIN
    -- Step 1: Insert the new review into the MangaReviews table
    INSERT INTO MangaReviews (MangaMatchID, MangaReviewerID, MangaReviewBody, MangaReviewLikeCount, MangaStarRating)
    VALUES (p_MangaMatchID, p_MangaReviewerID, p_MangaReviewBody, p_MangaReviewLikeCount, p_MangaStarRating);

END $$

DROP TRIGGER IF EXISTS updateSummary;
CREATE TRIGGER updateSummary
AFTER INSERT ON MangaReviews
FOR EACH ROW
BEGIN
    -- Step 2: Calculate the total number of reviews and average rating for the manga
    DECLARE totalReviews INT;
    DECLARE avgRating DECIMAL(3, 2);

    -- Get the total number of reviews for the manga
    SELECT COUNT(*) INTO totalReviews
    FROM MangaReviews
    WHERE MangaMatchID = NEW.MangaMatchID;

    -- Get the average rating for the manga
    SELECT AVG(MangaStarRating) INTO avgRating
    FROM MangaReviews
    WHERE MangaMatchID = NEW.MangaMatchID;

    -- Step 3: Update the MangaReviewStats table with the new values
    UPDATE MangaReviewStats
    SET TotalReviews = totalReviews,
        AverageRating = avgRating
    WHERE MangaID = NEW.MangaMatchID;
END
DELIMITER ;

CALL AddMangaReview(3, 1, 'Great manga! Very exciting and full of twists.', 10, 5);

SELECT 
    m.MangaID,
    m.Title AS MangaTitle,
    COUNT(r.MangaReviewBody) AS TotalReviews, 
    AVG(r.MangaStarRating) AS AverageReview
FROM 
    Manga m
LEFT JOIN 
    MangaReviews r 
ON 
	m.MangaID = r.MangaMatchID
GROUP BY 
	m.MangaID, m.Title
HAVING
    count(r.MangaReviewBody) > 0;
