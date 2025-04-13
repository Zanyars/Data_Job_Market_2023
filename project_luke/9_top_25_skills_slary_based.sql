WITH top_skills AS(

WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name
    FROM
        job_postings_fact
    INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        salary_year_avg IS NOT NULL
        AND
        job_title_short='Data Scientist'
    ORDER BY
        salary_year_avg DESC
    )

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
)


SELECT
    top_skills.skills,
    ROUND(AVG(salary_year_avg), 0) AS sal_avg
FROM
    top_skills
GROUP BY
    skills
ORDER BY
    sal_avg DESC
LIMIT
    25
;