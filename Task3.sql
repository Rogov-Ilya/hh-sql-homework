-- Запрос средних ЗП по регионам
SELECT area_name,
       min(vacancy.compensation_from)                           AS min_slary,
       max(vacancy.compensation_to)                             AS max_slary,
       avg(vacancy.compensation_to - vacancy.compensation_from) AS avg_salary,
       count(vacancy_id)                                        AS vacancy_count
FROM vacancy
         JOIN area a ON a.area_id = vacancy.area_id
GROUP BY area_name;