/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
-  Why? It reveals how different skills impact salary levels for Data Analysts 
and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
Based on the analyzed job postings, the highest paying job skills for data analysts revolve around:
- Big data and machine learning: big data technologies such as PySpark and Couchbase,
machine learning tools such as DataRobot and Jupyter, and Python libraries such as Pandas and NumPy
- Software development and deployment proficiency: development and deployment tools such as GitLab, Kubernetes, and Airflow
- Cloud computing expertise: cloud and data engineering tools such as Elasticsearch, Databricks, GCP
*/