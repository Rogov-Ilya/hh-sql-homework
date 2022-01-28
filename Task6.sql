--Индексы
--Поск вакансий по зарплате
CREATE INDEX vacancy_slary ON vacancy (compensation_to,compensation_from);

--Поиск вакансий по региону
CREATE INDEX region_of_vacancy ON vacancy(vacancy_id,area_id);

--Поиск свежих вакансий
CREATE INDEX vacancy_data ON vacancy(vacancy_data_publication);