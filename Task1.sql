-- Таблица пользователей
CREATE TABLE users
(
    user_id            serial PRIMARY KEY,
    user_name          text NOT NULL,
    user_date_of_birth date,
    user_telephone     text
);

--Таблица регионов
CREATE TABLE area
(
    area_id   serial PRIMARY KEY,
    area_name text NOT NULL
);

--Таблица компаний
CREATE TABLE company
(
    company_id          serial PRIMARY KEY,
    company_name        text NOT NULL,
    company_description text
);

--Таблица спечиализаций
CREATE TABLE specialization
(
    specialization_id   serial PRIMARY KEY,
    specialization_name text NOT NULL
);

--Таблица вакансий
--Свяжем с специализацией,регионом и компанией
CREATE TABLE vacancy
(
    vacancy_id               serial PRIMARY KEY,
    vacancy_data_publication date    NOT NULL,
    vacancy_name             text    NOT NULL,
    vacancy_description      text,
    specialization_id        integer REFERENCES specialization (specialization_id),
    compensation_from        integer,
    compensation_to          integer,
    area_id                  integer NOT NULL REFERENCES area (area_id),
    company_id               integer NOT NULL REFERENCES company (company_id)
);

--Таблица резюме
--Свяжем с пользователем и специализацией
CREATE TABLE resume
(
    resume_id               serial PRIMARY KEY,
    resume_data_publication date    NOT NULL,
    users_id                integer NOT NULL REFERENCES users (user_id),
    resume_education        text,
    resume_slary            integer,
    specialization_id       integer REFERENCES specialization (specialization_id)
);

--Отклики
--Свяжем с вакансией и резюме
CREATE TABLE response
(
    resume_id            integer REFERENCES resume (resume_id)   NOT NULL,
    vacancy_id           integer REFERENCES vacancy (vacancy_id) NOT NULL,
    response_data        date                                    NOT NULL,
    response_description text
);