--Представление с использованием оконных функций (2 шт.)--
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