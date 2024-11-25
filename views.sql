CREATE VIEW travels.horizontal_view AS
SELECT 
    "photo_id", 
    "resort_id", 
    "photo_title", 
    "photo_file", 
    "photo_tags", 
    "photo_date"
FROM travels.photos

CREATE VIEW travels.vertical_view AS
SELECT 
    "photo_id", 
    "photo_title", 
    "photo_tags"
FROM travels.photos;

CREATE VIEW travels.mixed_view AS
SELECT 
    p."photo_id", 
    p."photo_title", 
    p."photo_file", 
    p."photo_tags", 
    r."resort_name", 
    r."location"
FROM travels.photos p
JOIN travels.resorts r ON p."resort_id" = r."resort_id";

CREATE VIEW travels.comments_with_photos AS
SELECT 
    c."comment_id", 
    c."comment_text", 
    c."comment_date", 
    p."photo_title", 
    u."user_name"
FROM travels.comments c
JOIN travels.photos p ON c."photo_id" = p."photo_id"
JOIN travels.users u ON c."user_id" = u."user_id";

CREATE VIEW travels.photo_comment_count AS
SELECT 
    p."photo_id", 
    p."photo_title", 
    (SELECT COUNT(*) 
     FROM travels.comments c 
     WHERE c."photo_id" = p."photo_id") AS "comment_count"
FROM travels.photos p;

CREATE VIEW travels.photo_union_view AS
SELECT 
    "photo_id", 
    "photo_title", 
    "photo_file"
FROM travels.photos
WHERE "resort_id" = 1
UNION
SELECT 
    "photo_id", 
    "photo_title", 
    "photo_file"
FROM travels.photos
WHERE "resort_id" = 2;

CREATE VIEW travels.comments_on_photos_view AS
SELECT 
    "comment_id", 
    "comment_text", 
    "comment_date", 
    "photo_title"
FROM travels.comments_with_photos;

CREATE VIEW travels.resort_1_photos AS
SELECT 
    "photo_id", 
    "resort_id", 
    "photo_title", 
    "photo_file", 
    "photo_tags", 
    "photo_date"
FROM travels.photos
WHERE "resort_id" = 1
WITH CHECK OPTION;