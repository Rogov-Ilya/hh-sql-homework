--Запрос вакансий с >5 откликов в 1 неделю
SELECT v.vacancy_id AS id,
       vacancy_name AS name
FROM vacancy v
         JOIN response r ON v.vacancy_id = r.vacancy_id
WHERE DATE(r.response_data) - DATE(v.vacancy_data_publication) <= 7
GROUP BY v.vacancy_id,
         vacancy_name
HAVING count(r.vacancy_id) > 5
ORDER BY v.vacancy_id;