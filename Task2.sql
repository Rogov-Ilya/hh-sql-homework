--Заполнение таблиц данными
WITH users_dataset(id, user_name, user_date_of_birth, user_telephone) AS
         (SELECT generate_series(1, 100)                                                        AS id,
                 md5(random()::text)                                                            AS user_name,
                 TIMESTAMP '2014-01-10 20:00:00' +
                 random() * (TIMESTAMP '2014-01-20 20:00:00' - TIMESTAMP '2014-01-10 10:00:00') AS user_date_of_birth,
                 random() * 1000000                                                             AS user_telephone)
INSERT
INTO users(user_name, user_date_of_birth, user_telephone)
SELECT user_name,
       user_date_of_birth,
       user_telephone
FROM users_dataset;

WITH area_dataset(id, area_name) AS
         (SELECT generate_series(1, 100) AS id,
                 md5(random()::text)     AS name)
INSERT
INTO area(area_name)
SELECT area_name
FROM area_dataset;

WITH specialization_dataset(id, name) AS
         (SELECT generate_series(1, 10) AS id,
                 md5(random()::text)    AS name)
INSERT
INTO specialization(specialization_name)
SELECT name
FROM specialization_dataset;

WITH company_dataset(id, name, description) AS
         (SELECT generate_series(1, 100) AS id,
                 md5(random()::text)     AS name,
                 md5(random()::text)     AS description)
INSERT
INTO company(company_name, company_description)
SELECT name,
       description
FROM company_dataset;

WITH vacancy_dataset(id, vacancy_data_publication, vacancy_name, vacancy_description, compensation_from,
                     compensation_to, specialization_id, area_id, company_id) AS
         (SELECT generate_series(1, 10000) AS                                                                             id,
                 TIMESTAMP '2014-01-10 20:00:00' + random() *
                                                   (TIMESTAMP '2014-01-20 20:00:00' - TIMESTAMP '2021-01-10 10:00:00') AS vacancy_data_publication,
                 md5(random()::text) AS                                                                                   vacancy_name,
                 md5(random()::text) AS                                                                                   vacancy_description,
                 round((random() * 100000)::int),
                 round((random() * 100000 * 2)::int),
                 round(((random() * 9) + 1)::int),
                 round(((random() * 99) + 1)::int),
                 round(((random() * 99) + 1)::int))
INSERT
INTO vacancy(vacancy_data_publication, vacancy_name, vacancy_description, compensation_from, compensation_to,
             specialization_id, area_id, company_id)
SELECT vacancy_data_publication,
       vacancy_name,
       vacancy_description,
       compensation_from,
       compensation_to,
       specialization_id,
       area_id,
       company_id
FROM vacancy_dataset;

WITH resume_dataset(id, resume_data_publication, users_id, resume_education, resume_slary, specialization_id) AS
         (SELECT generate_series(1, 100000) AS                                                                            id,
                 TIMESTAMP '2014-01-10 20:00:00' + random() *
                                                   (TIMESTAMP '2014-01-20 20:00:00' - TIMESTAMP '2021-01-10 10:00:00') AS resume_data_publication,
                 round((random() * 99) + 1),
                 md5(random()::text) AS                                                                                   resume_education,
                 round(random() * 10000) AS                                                                               resume_slary,
                 round(((random() * 9) + 1)::int))
INSERT
INTO resume(resume_data_publication, users_id, resume_education, resume_slary, specialization_id)
SELECT resume_data_publication,
       users_id,
       resume_education,
       resume_slary,
       specialization_id
FROM resume_dataset;

WITH response_dataset(id, resume_id, vacancy_id, response_data, response_description) AS
         (SELECT generate_series(1, 100000)                                                     AS id,
                 random() * 99999 + 1::int                                                      AS resume_id,
                 random() * 9999 + 1::int                                                       AS vacancy_id,
                 TIMESTAMP '2014-01-10 20:00:00' +
                 random() * (TIMESTAMP '2014-01-20 20:00:00' - TIMESTAMP '2021-01-10 10:00:00') AS response_data,
                 md5(random()::text)                                                            AS response_description)
INSERT
INTO response(resume_id, vacancy_id, response_data, response_description)
SELECT resume_id,
       vacancy_id,
       response_data,
       response_description
FROM response_dataset;