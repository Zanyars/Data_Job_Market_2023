WITH remote_job_skills AS(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_posting
        ON job_posting.job_id = skills_to_job.job_id
    WHERE
        job_work_from_home = TRUE
    GROUP BY
        skill_id
)

SELECT
    skills.skill_id,
    skills.skills,
    skill_count
FROM
    remote_job_skills
INNER JOIN skills_dim AS skills
    ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC

;

