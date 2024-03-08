--чтобы внести изменения можно написать Create or replace view
--Представление на выборку данных из нескольких таблиц с использованием условий отбора по нескольким полям (4 шт.)

-- 1. Представление для успешных сделок с дорогой недвижимостью
CREATE  VIEW successful_high_value_transactions AS
SELECT t.id_transaction, t.transaction_date, t.transaction_type, t.amount, t.status,
       c.firstname AS customer_firstname, c.lastname AS customer_lastname,
       e.firstname AS agent_firstname, e.lastname AS agent_lastname,
       p.address AS property_address
FROM transaction t
JOIN customer c ON t.id_customer = c.id_customer
JOIN estate_agent e ON t.id_agent = e.id_agent
JOIN property p ON t.id_property = p.id_property
WHERE t.status = true AND t.amount > 300000;

-- 2. Представление для активных клиентов с высокими тратами
CREATE  VIEW active_high_spending_customers AS
SELECT c.id_customer, c.firstname, c.lastname, c.contact_information,
       SUM(t.amount) AS total_spent
FROM customer c
JOIN transaction t ON c.id_customer = t.id_customer
WHERE t.status = true
GROUP BY c.id_customer, c.firstname, c.lastname, c.contact_information
HAVING SUM(t.amount) > 200000;

-- 3. Представление для сделок с конкретным агентом
CREATE  VIEW transactions_with_specific_agent AS
SELECT t.id_transaction, t.transaction_date, t.transaction_type, t.amount, t.status,
       c.firstname AS customer_firstname, c.lastname AS customer_lastname,
       e.firstname AS agent_firstname, e.lastname AS agent_lastname,
       p.address AS property_address
FROM transaction t
JOIN customer c ON t.id_customer = c.id_customer
JOIN estate_agent e ON t.id_agent = e.id_agent
JOIN property p ON t.id_property = p.id_property
WHERE e.firstname = 'Sophie' AND e.lastname = 'Jones';

-- 4. Представление для сделок с определенной недвижимостью
CREATE  VIEW transactions_with_specific_property AS
SELECT t.id_transaction, t.transaction_date, t.transaction_type, t.amount, t.status,
       c.firstname AS customer_firstname, c.lastname AS customer_lastname,
       e.firstname AS agent_firstname, e.lastname AS agent_lastname,
       p.address AS property_address
FROM transaction t
JOIN customer c ON t.id_customer = c.id_customer
JOIN estate_agent e ON t.id_agent = e.id_agent
JOIN property p ON t.id_property = p.id_property
WHERE p.address = '123 Oak Lane';



--Представление с использованием расчетных полей (2 шт.)
-- 1. Представление для расчета стоимости недвижимости на квадратный метр
CREATE  VIEW property_value_per_area AS
SELECT id_property, address, type, area, price, price / area AS value_per_area
FROM property;

-- 2. Представление для расчета общей стоимости сделки с учетом комиссии
CREATE   VIEW total_transaction_cost AS
SELECT t.id_transaction, t.amount, t.amount * 0.5 AS commission,
       t.amount + (t.amount * 0.5) AS total_cost
FROM transaction t;



--Представление с использованием оконных функций (2 шт.)
-- 1. Представление для агентов с суммой сделок и их процентным соотношением
CREATE VIEW agent_transaction_stats AS
SELECT e.id_agent, e.firstname, e.lastname,
       SUM(t.amount) OVER (PARTITION BY e.id_agent) AS total_amount,
       t.amount / SUM(t.amount) OVER (PARTITION BY e.id_agent) AS percentage_of_total
FROM estate_agent e
JOIN transaction t ON e.id_agent = t.id_agent;


-- 2. Представление для агентов с рангом по сумме сделок
CREATE  VIEW agent_ranking AS
SELECT e.id_agent, e.firstname, e.lastname,
       RANK() OVER (ORDER BY SUM(t.amount) DESC) AS transaction_rank
FROM estate_agent e
JOIN transaction t ON e.id_agent = t.id_agent
GROUP BY e.id_agent, e.firstname, e.lastname;



--Представление с использованием групповых операций (3 шт.)
-- 1. Представление для подсчета количества сделок по типам недвижимости
CREATE VIEW property_transaction_count AS
SELECT p.type, COUNT(t.id_transaction) AS transaction_count
FROM property p
LEFT JOIN transaction t ON p.id_property = t.id_property
GROUP BY p.type;

-- 2. Представление для подсчета средней стоимости недвижимости по агентам
CREATE VIEW agent_average_property_price AS
SELECT e.id_agent, e.firstname, e.lastname,
       AVG(p.price) AS average_property_price
FROM estate_agent e
JOIN transaction t ON e.id_agent = t.id_agent
JOIN property p ON t.id_property = p.id_property
GROUP BY e.id_agent, e.firstname, e.lastname;

-- 3. Представление для подсчета общей суммы сделок по месяцам
CREATE VIEW total_transactions_by_month AS
SELECT EXTRACT(MONTH FROM transaction_date) AS month,
       SUM(amount) AS total_amount
FROM transaction
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY EXTRACT(MONTH FROM transaction_date);



--Представление с использованием генерируемых столбцов(2шт)
-- 1. Представление для отображения количества сделок по дням
CREATE  VIEW daily_transaction_count AS
SELECT transaction_date, COUNT(*) AS transactions_count
FROM transaction
GROUP BY transaction_date
ORDER BY transaction_date;

-- 2. Представление для добавления столбца с признаком новой сделки
CREATE  new_transactions AS
SELECT t.*, 
       CASE WHEN transaction_date >= CURRENT_DATE - INTERVAL '30 days' THEN true ELSE false END AS is_new_transaction
FROM transaction t;
