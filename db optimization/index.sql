--индекс поможет ускорить операции выгрузки, когда данные фильтруются или сортируются по дате транзакции. 
CREATE INDEX idx_transaction_date ON Transaction (transaction_date);

--индекс поможет ускорить операции копирования и восстановления, поскольку улучшит доступ к данным в таблице Transaction,
-- которые часто будут использоваться в этих операциях.
CREATE INDEX idx_transaction_id ON Transaction (id_transaction);

--Для оптимизации запросов и их планирования можно использовать индекс,который фильтрует данные по типу транзакции.
CREATE INDEX idx_transaction_type ON Transaction (transaction_type);

--analyze типо проанализировать
ANALYZE;

--EXPLANE план запроса
EXPLAIN SELECT * FROM Transaction WHERE transaction_type = 'Sale';
