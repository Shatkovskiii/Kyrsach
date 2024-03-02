-- Покупка жилого дома
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (14, 27, 5, 38, 'Purchase of Residential Property', 500000, '2024-03-02', 't');

-- Продажа квартиры
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (9, 45, 22, 3, 'Sale of Apartment', 300000, '2024-03-03', 't');

-- Аренда коммерческого помещения
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (36, 18, 8, 49, 'Commercial Property Rental', 2000, '2024-03-04', 't');

-- Обмен земельных участков
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (26, 11, 43, 19, 'Land Exchange', 10000, '2024-03-05', 'f');

-- Покупка коммерческой недвижимости
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (31, 7, 42, 15, 'Purchase of Commercial Real Estate', 750000, '2024-03-06', 'f');

-- Ипотечный кредит на покупку недвижимости
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (2, 29, 37, 6, 'Mortgage Loan for Real Estate Purchase', 400000, '2024-03-07', 't');

-- Аренда виллы на отпуск
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (46, 24, 10, 35, 'Vacation Villa Rental', 3500, '2024-03-08', 'f');

-- Переоценка стоимости недвижимости
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (13, 48, 20, 4, 'Real Estate Valuation', 1000, '2024-03-09', 't');

-- Лизинг земельного участка
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (25, 41, 17, 32, 'Land Leasing', 20000, '2024-03-10', 'f');

-- Ремонт и обновление жилого помещения
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (44, 23, 12, 30, 'Repair and Renovation of Residential Property', 15000, '2024-03-11', 't');

-- Покупка земельного участка для строительства
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (1, 39, 28, 16, 'Purchase of Land for Construction', 30000, '2024-03-12', 'f');


-- Обратный ипотечный кредит
INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (3, 27, 16, 22, 'Reverse Mortgage Loan', 75000, '2024-03-16', 'f');
