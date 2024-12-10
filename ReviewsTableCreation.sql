USE AnimeDatabase; 

DROP TABLE IF EXISTS AnimeReviews;
CREATE TABLE AnimeReviews 
( 
AnimeMatchID int,
AnimeReviewerID int, 
AnimeReviewBody VARCHAR(100),
AnimeStarRating int,
AnimeReviewLikeCount int
);

INSERT INTO AnimeReviews (AnimeMatchID, AnimeReviewerID, AnimeReviewBody, AnimeStarRating, AnimeReviewLikeCount)
VALUES 
(1, 2, 'An amazing adventure filled with great characters and story arcs!', 5, 120),
(1, 4, 'The long-running saga of pirates with an exciting and emotional journey.', 4, 85),
(1, 6, 'Some episodes feel slow, but the adventure is unforgettable.', 4, 55),
(1, 1, 'Great animation, but the pacing sometimes hurts the overall experience.', 3, 45),
(1, 6, 'One of my all-time favorites. The character growth is fantastic!', 5, 200),
(2, 5, 'A unique movie with strong world-building and an intense plot.', 4, 90),
(2, 7, 'Straw Hat Pirates once again shine in this action-packed film.', 5, 150),
(2, 4, 'The villain is intimidating, but I felt the story was a bit predictable.', 3, 60),
(2, 2, 'Love the animation quality. Toei Animation did a great job!', 4, 80),
(2, 3, 'The movie is good, but it doesn’t offer anything new compared to the show.', 3, 40),
(3, 3, 'A timeless classic with breathtaking animation and a deeply emotional story.', 5, 230),
(3, 5, 'The music and visuals alone make this movie worth watching.', 5, 180),
(3, 1, 'I was captivated by the story and world, but the pacing could be better.', 4, 70),
(3, 2, 'The themes in this movie are deep and meaningful. A must-watch for any anime fan.', 5, 250),
(3, 5, 'Visually stunning, but I felt the plot was a bit too abstract for my taste.', 3, 50),
(4, 4, 'Such a unique concept! The relationship between the characters is so touching.', 5, 300),
(4, 7, 'A beautiful and emotional experience with incredible animation.', 5, 210),
(4, 5, 'The body-swapping was handled so well, and the music is amazing!', 4, 90),
(4, 4, 'This movie will leave you thinking long after it ends. Very well done!', 5, 180),
(4, 2, 'I was a bit confused at times, but it’s still an enjoyable watch overall.', 4, 60),
(5, 4, 'A masterpiece of storytelling with high-stakes action and incredible world-building.', 5, 220),
(5, 1, 'The intensity and drama in this series are top-notch. It kept me on the edge of my seat!', 5, 160),
(5, 2, 'The action is fantastic, but some episodes felt a bit dragged out.', 4, 110),
(5, 3, 'Great characters and solid plot, but it can be a bit too dark at times.', 4, 80),
(5, 4, 'This show had me hooked from the very first episode. Highly recommend!', 5, 250),
(1, 6, 'One Piece has one of the most extensive and engaging stories out there!', 5, 140),
(1, 5, 'The action scenes are awesome, and I love the character interactions.', 4, 90),
(2, 4, 'A solid movie, but I wish it explored more of the characters’ backgrounds.', 4, 50),
(3, 3, 'An incredibly well-crafted story, with visuals that take your breath away.', 5, 220),
(3, 6, 'Spirited Away is a film that every anime lover should experience at least once.', 5, 210),
(4, 7, 'The story of body-switching is both charming and thought-provoking. Beautiful film!', 5, 170);


DROP TABLE IF EXISTS MangaReviews;
CREATE TABLE MangaReviews 
( 
MangaMatchID int,
MangaReviewerID int, 
MangaReviewBody VARCHAR(100),
MangaStarRating int,
MangaReviewLikeCount int
);

INSERT INTO MangaReviews (MangaMatchID, MangaReviewerID, MangaReviewBody, MangaStarRating, MangaReviewLikeCount) VALUES
(1, 1, 'A great start to an adventure. Highly recommend!', 5, 10),
(1, 2, 'Amazing characters and world-building.', 4, 8),
(1, 3, 'The plot is engaging, but the pacing is slow at times.', 3, 7),
(1, 4, 'Really love the art style. One of my favorites!', 5, 12),
(1, 5, 'An enjoyable read, though some parts felt repetitive.', 3, 5),
(1, 6, 'The story has its ups and downs, but it\'s worth the read.', 4, 9),
(1, 7, 'Great action scenes, but the character development needs work.', 3, 6),
(1, 8, 'Can\'t wait to see where this story goes!', 5, 11),
(1, 1, 'The world-building is impressive, but the characters feel flat.', 2, 4),
(1, 2, 'Loved the first few chapters, but the story started losing me.', 3, 5),
(2, 5, 'One of the best manga series I\'ve ever read!', 5, 15),
(2, 6, 'The storyline is fantastic, and the artwork is beautiful!', 5, 14),
(2, 7, 'The main character is really relatable. Amazing work!', 4, 10),
(2, 2, 'Some parts were slow, but overall a solid read.', 4, 8),
(2, 5, 'An emotional roller coaster. Loved it!', 5, 9),
(2, 1, 'The world-building and the side characters are great.', 4, 6),
(2, 1, 'It has some filler arcs, but the main story is awesome.', 3, 7),
(2, 6, 'Great writing, but I wish the pacing was a bit faster.', 3, 6),
(2, 4, 'A bit predictable, but still a great series.', 3, 5),
(2, 3, 'A must-read for fans of action-packed stories.', 5, 13),
(3, 2, 'A truly unique concept. I couldn\'t stop reading.', 4, 10),
(3, 1, 'The characters are very interesting, but the ending was rushed.', 3, 8),
(3, 4, 'Intense action and a solid plot. A great addition to my collection.', 5, 11),
(3, 2, 'A few boring chapters, but the rest was solid.', 4, 6),
(3, 1, 'The art is beautiful, and the plot is engaging.', 4, 9),
(3, 4, 'Fell in love with the characters. A great story overall.', 5, 7),
(3, 5, 'The pacing was slow, but the world-building is amazing.', 4, 8),
(3, 6, 'Could have used more character development.', 3, 6),
(3, 2, 'The twists in this manga are amazing!', 5, 10),
(3, 5, 'An interesting story, but it left a lot of questions unanswered.', 3, 5),
(4, 4, 'One of the best action manga out there!', 5, 13),
(4, 5, 'The main character is too predictable, but still fun to read.', 3, 7),
(4, 3, 'A good read, but it can get repetitive at times.', 4, 6),
(4, 2, 'The artwork is gorgeous, and the action scenes are fantastic.', 5, 14),
(4, 5, 'I\'ve enjoyed every chapter. Truly epic.', 5, 12),
(4, 6, 'Interesting plot, but the characters need more depth.', 3, 9),
(4, 3, 'Highly recommend it to anyone who loves action-packed stories.', 4, 10),
(4, 2, 'Some characters are a bit one-dimensional, but still a fun read.', 3, 6),
(4, 1, 'The action sequences are top-notch, but the story feels a bit generic.', 4, 5),
(4, 7, 'I\'m hooked! The latest chapter was a game changer.', 5, 11);


SELECT * FROM MangaReviews;