-- 1:
SELECT count(*) as total_rows
FROM data_analyst_jobs;

-- 2: ExxonMobil
SELECT company
FROM data_analyst_jobs LIMIT 10;

-- 3: TN_21, TNorKY_27
SELECT location,COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
OR location = 'KY'
GROUP BY location;


-- 4:  3
SELECT count(*) as star_rating_over_4
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

-- 5:   151
SELECT count(*) as review_count
FROM data_analyst_jobs
WHERE review_count > 499
AND review_count <= 1000;

-- 6:  NE highest rating
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- 7: 1793
SELECT COUNT(DISTINCT title) as unique_job_titles
FROM data_analyst_jobs;

-- 8: 376
SELECT COUNT(DISTINCT title) as ca_job_title_count
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9: 70 w/o [null]
SELECT company, AVG(star_rating) as avg_star_rating
FROM data_analyst_jobs
WHERE company NOT ILIKE '[null]'
GROUP BY company
HAVING SUM(review_count) > 5000

-- 10:  Googol 4.3
SELECT company, AVG(star_rating) as avg_star_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY avg_star_rating DESC
LIMIT 1;

-- 11:  1669
SELECT COUNT(DISTINCT title) as no_of_jobs
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- 12: SQL
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

-- Bonus:
SELECT domain, COUNT(*) as hard_to_fill
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC
LIMIT 4;

-- reference for sanity
SELECT *
FROM data_analyst_jobs;
