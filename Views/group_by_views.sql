--Представление с использованием групповых операций (3 шт.)--
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