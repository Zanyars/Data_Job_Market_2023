SELECT
    job_title_short,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg,
    COUNT(salary_year_avg) AS num_slaries
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
GROUP BY
    job_title_short    
ORDER BY
    salary_avg DESC,
    num_slaries DESC

;