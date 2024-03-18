--Представление с использованием генерируемых столбцов(2шт)--
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
