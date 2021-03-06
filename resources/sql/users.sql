-- name: get-users
-- Returns all users
SELECT *
FROM users


-- name: user-count
-- Counts all the users.
SELECT count(*) AS count
FROM users


-- name: save-user<!
-- Creates a new user
INSERT INTO users
(hash_string, visit_count, first_visit_date, last_visit_date, fast_forward_count)
VALUES
(:hash_string, :visit_count, :first_visit_date, :last_visit_date, :fast_forward_count)


-- name: update-user-by-hash!
-- updates a user record
UPDATE users
SET
visit_count = :visit_count,
last_visit_date = :last_visit_date,
fast_forward_count = :fast_forward_count
WHERE
hash_string = :hash_string


-- name: find-user-by-hash
-- Finds user by md5 hash
SELECT *
FROM users
WHERE hash_string = :hash_string


-- name: find-user-by-id
-- Finds user by id
SELECT *
FROM users
WHERE id = :id


-- name: get-quotes-seen
-- Returns a list of quotes user seen
SELECT *
FROM users_quotes
WHERE user_id = :user_id


-- name: count-users-quotes
-- Bu user ve quote ikilisi var mi kontrol etmek icin kullanilir.
SELECT count(*) as num
FROM users_quotes
WHERE
user_id = :user_id AND
quote_id = :quote_id


-- name: save-users-quotes!
-- Returns a list of quotes user seen
INSERT INTO users_quotes
(user_id, quote_id, skip_flag, like_flag, share_flag, report_flag)
VALUES
(:user_id, :quote_id, :skip_flag, :like_flag, :share_flag, :report_flag)


-- name: find-users-quotes
-- Bu user ve quote ikilisini getirir
SELECT *
FROM users_quotes
WHERE
user_id = :user_id AND
quote_id = :quote_id


-- name: update-users-quotes!
-- updates the users_quote item
UPDATE users_quotes
SET
skip_flag = :set_flag,
like_flag = :like_flag,
share_flag = :share_flag,
report_flag = :report_flag
WHERE
user_id = :user_id AND
quote_id = :quote_id
