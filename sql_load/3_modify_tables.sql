SELECT
    COUNT(job_id),
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE '%Germany%' THEN 'Local'
        ELSE 'Onsite'
    END AS location_cat
FROM
    job_postings_fact
GROUP BY
    location_cat
;