SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS occurance
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short='Data Scientist'
---    AND
---    job_location='Anywhere'
GROUP BY
    skills_dim.skills
ORDER BY
    occurance DESC
LIMIT
    5
;