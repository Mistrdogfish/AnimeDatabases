use AnimeDatabase;

DELIMITER $$

CREATE PROCEDURE AddNewAnimeReview(
    IN p_AnimeID INT,
    IN p_AnimeReviewerID INT,
    IN p_AnimeReviewBody VARCHAR(100),
    IN p_AnimeStarRating INT,
    IN p_AnimeReviewLikeCount INT
)
BEGIN
    -- Insert the new review into AnimeReviews table
    INSERT INTO AnimeReviews (AnimeMatchID, AnimeReviewerID, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount)
    VALUES (p_AnimeID, p_AnimeReviewerID, p_AnimeReviewBody, p_AnimeStarRating, p_AnimeReviewLikeCount);

END $$

CREATE TRIGGER updateSummmary
AFTER INSERT ON AnimeReviews
BEGIN
    -- Declare variables to hold total reviews and sum of ratings
    DECLARE total_reviews INT;
    DECLARE total_rating INT;
    
    -- Get the current total reviews and total ratings for the given AnimeID
    SELECT COUNT(*), SUM(AnimeStarRating) 
    INTO total_reviews, total_rating
    FROM AnimeReviews
    WHERE AnimeMatchID = p_AnimeID;

    -- If there's no entry for this AnimeID, initialize the values
    IF total_reviews IS NULL THEN
        SET total_reviews = 0;
        SET total_rating = 0;
    END IF;

    -- Calculate the average rating
    DECLARE average_rating DECIMAL(3, 2);
    SET average_rating = IF(total_reviews > 0, total_rating / total_reviews, 0);

    -- Update or insert the summary into the AnimeReviewSummary table
    INSERT INTO AnimeReviewSummary (AnimeID, TotalReviews, AverageReview)
    VALUES (NEW.AnimeMatchID, total_reviews, average_rating)
    ON DUPLICATE KEY UPDATE
        TotalReviews = total_reviews,
        AverageReview = average_rating;
END
    
DELIMITER ;

CALL AddNewAnimeReview(1, 2, 'Great show with lots of action and emotional moments!', 5, 150);

SELECT * FROM AnimeReviews;

SELECT 
    a.AnimeID, 
    a.Title, 
    COUNT(r.AnimeReviewBody) AS TotalReviews, 
    AVG(r.AnimeStarRating) AS AverageReview
FROM 
    Anime a
LEFT JOIN 
    AnimeReviews r 
ON 
    a.AnimeID = r.AnimeMatchID
GROUP BY 
    a.AnimeID, a.Title
HAVING 
    COUNT(r.AnimeReviewBody) > 0;
