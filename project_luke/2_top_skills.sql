/*
Question: What skills are required for the top-paying data scientist jobs?
- Use the top 10 highest-salary Data Scientist jobs from the first query
- Add the specific skills required for these jobs
- Why? It provides the high demand skills needed for data scentists in the market
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        company_dim.name AS company_name
    FROM
        job_postings_fact
    INNER JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
    WHERE
        salary_year_avg IS NOT NULL
        AND
        job_location LIKE '%Germany%'
        AND
        job_title_short = 'Data Scientist'
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)
SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs

INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC

;

/*
Most In-Demand Skills:
Skill	Occurrences
Python	9
SQL	4
Spark	4

[
  {
    "job_id": 846218,
    "job_title": "Team Lead Data Scientist/ Data Science Manager (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "192000.0",
    "company_name": "AUTO1 Group",
    "skills": "sql"
  },
  {
    "job_id": 846218,
    "job_title": "Team Lead Data Scientist/ Data Science Manager (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "192000.0",
    "company_name": "AUTO1 Group",
    "skills": "python"
  },
  {
    "job_id": 199874,
    "job_title": "Data Science Manager (m/f/d)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "192000.0",
    "company_name": "AVIV Group",
    "skills": "python"
  },
  {
    "job_id": 199874,
    "job_title": "Data Science Manager (m/f/d)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "192000.0",
    "company_name": "AVIV Group",
    "skills": "pyspark"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "job_location": "Germany",
    "salary_year_avg": "171121.0",
    "company_name": "Stripe",
    "skills": "sql"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "job_location": "Germany",
    "salary_year_avg": "171121.0",
    "company_name": "Stripe",
    "skills": "python"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "job_location": "Germany",
    "salary_year_avg": "171121.0",
    "company_name": "Stripe",
    "skills": "r"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "job_location": "Germany",
    "salary_year_avg": "171121.0",
    "company_name": "Stripe",
    "skills": "spark"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "python"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "aws"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "redshift"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "fastapi"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "jenkins"
  },
  {
    "job_id": 1807178,
    "job_title": "Director of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166941.5",
    "company_name": "AUTO1 Group",
    "skills": "terraform"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "python"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "aws"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "redshift"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "fastapi"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "linux"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "jenkins"
  },
  {
    "job_id": 680785,
    "job_title": "Head of Data Science (f/m/x)",
    "job_location": "Berlin, Germany",
    "salary_year_avg": "166419.5",
    "company_name": "AUTO1 Group",
    "skills": "terraform"
  },
  {
    "job_id": 227864,
    "job_title": "Digital Expert / Data Scientist (m/w/x) 22/167ie",
    "job_location": "Meinerzhagen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "OTTO FUCHS KG",
    "skills": "python"
  },
  {
    "job_id": 265027,
    "job_title": "Data Scientist für datengetriebene Entwicklung in der...",
    "job_location": "Reutlingen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 265027,
    "job_title": "Data Scientist für datengetriebene Entwicklung in der...",
    "job_location": "Reutlingen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 265027,
    "job_title": "Data Scientist für datengetriebene Entwicklung in der...",
    "job_location": "Reutlingen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "airflow"
  },
  {
    "job_id": 265027,
    "job_title": "Data Scientist für datengetriebene Entwicklung in der...",
    "job_location": "Reutlingen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "hadoop"
  },
  {
    "job_id": 265027,
    "job_title": "Data Scientist für datengetriebene Entwicklung in der...",
    "job_location": "Reutlingen, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "kubernetes"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "azure"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "tableau"
  },
  {
    "job_id": 1064622,
    "job_title": "Data Scientist - Analytics and Automation Hub (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "kubernetes"
  },
  {
    "job_id": 1017937,
    "job_title": "Data Scientist (m/f/d)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "sql"
  },
  {
    "job_id": 1017937,
    "job_title": "Data Scientist (m/f/d)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "python"
  },
  {
    "job_id": 1017937,
    "job_title": "Data Scientist (m/f/d)",
    "job_location": "Munich, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Jochen Schweizer mydays Group",
    "skills": "kafka"
  },
  {
    "job_id": 1107648,
    "job_title": "Data Scientist (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 1107648,
    "job_title": "Data Scientist (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1107648,
    "job_title": "Data Scientist (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "r"
  },
  {
    "job_id": 1107648,
    "job_title": "Data Scientist (f/m/div.)",
    "job_location": "Stuttgart, Germany",
    "salary_year_avg": "157500.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  }
]

*/

