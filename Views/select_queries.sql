--Представление на выборку данных из нескольких таблиц с использованием условий отбора по нескольким полям (4 шт.)--

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