-- Создание роли "admin" с правами суперпользователя
CREATE ROLE admin WITH SUPERUSER;

-- Создание роли "manager" с правами на чтение и запись таблиц
CREATE ROLE manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO manager;


--создание роли агент для просмотра таблицы customer
CREATE ROLE agent;
GRANT SELECT ON Customer IN SCHEMA public to agent;

create user agent1 with password '123';
GRANT 