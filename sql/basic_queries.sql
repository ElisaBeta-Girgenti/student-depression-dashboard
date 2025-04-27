1. Basic Query — Select all student records
sql
Copy
Edit
SELECT *
FROM student_depression;

-------------------

2. Filter Students with Severe Depression
sql
Copy
Edit
SELECT student_id, depression_score, gpa, study_hours
FROM student_depression
WHERE depression_score >= 8; -- Assuming 8+ is severe (adjust as needed)

--------------------------

3. Find Average GPA by Depression Level
sql
Copy
Edit
SELECT 
    CASE 
        WHEN depression_score <= 3 THEN 'Low'
        WHEN depression_score BETWEEN 4 AND 7 THEN 'Moderate'
        ELSE 'Severe'
    END AS depression_level,
    AVG(gpa) AS average_gpa
FROM student_depression
GROUP BY depression_level;

--------------------------

4. Top 5 Students with Highest Study Hours and High Depression
sql
Copy
Edit
SELECT student_id, study_hours, depression_score
FROM student_depression
WHERE depression_score > 7
ORDER BY study_hours DESC
LIMIT 5;

------------------------

5. Correlation Check — Study Hours vs Depression
(Simple aggregate to check average study hours by depression level)

sql
Copy
Edit
SELECT 
    CASE 
        WHEN depression_score <= 3 THEN 'Low'
        WHEN depression_score BETWEEN 4 AND 7 THEN 'Moderate'
        ELSE 'Severe'
    END AS depression_level,
    AVG(study_hours) AS average_study_hours
FROM student_depression
GROUP BY depression_level;

---------------------

6. Impact of Parental Pressure on Depression
sql
Copy
Edit
SELECT 
    parental_pressure,
    AVG(depression_score) AS avg_depression_score,
    COUNT(*) AS number_of_students
FROM student_depression
GROUP BY parental_pressure
ORDER BY avg_depression_score DESC;

-------------------------------

7. Students with Low Social Support and Severe Depression
sql
Copy
Edit
SELECT student_id, depression_score, social_support
FROM student_depression
WHERE social_support = 'Low' 
  AND depression_score >= 8;
