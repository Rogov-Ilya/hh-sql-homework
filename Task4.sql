--Запрос месяца с наибольшим количеством вакансий
SELECT vacancy_data_publication        AS data,
       count(vacancy_data_publication) AS vacansy_count
FROM vacancy
GROUP BY vacancy_data_publication
ORDER BY vacansy_count DESC
LIMIT 1;

--Запрос месяца с наибольшим количеством резюме

SELECT resume_data_publication        AS data,
       count(resume_data_publication) AS vacansy_count
FROM resume
GROUP BY resume_data_publication
ORDER BY vacansy_count DESC
LIMIT 1;
