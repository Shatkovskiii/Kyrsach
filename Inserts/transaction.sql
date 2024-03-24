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

INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (1, 5, 10, 15, 'Sale', 50000, '2024-01-01', 't'),
       (2, 6, 11, 16, 'Rent', 1500, '2024-01-02', 'f'),
       (3, 7, 12, 17, 'Sale', 60000, '2024-01-03', 't'),
       (4, 8, 13, 18, 'Lease', 1200, '2024-01-04', 'f'),
       (5, 9, 14, 19, 'Sale', 70000, '2024-01-05', 't'),
       (6, 10, 15, 20, 'Rent', 1800, '2024-01-06', 'f'),
       (7, 11, 16, 21, 'Sale', 80000, '2024-01-07', 't'),
       (8, 12, 17, 22, 'Lease', 1300, '2024-01-08', 'f'),
       (9, 13, 18, 23, 'Sale', 90000, '2024-01-09', 't'),
       (10, 14, 19, 24, 'Rent', 2000, '2024-01-10', 'f');

 INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
 VALUES (11, 15, 20, 25, 'Sale', 55000, '2024-01-11', 't'),
     (12, 16, 21, 26, 'Rent', 1600, '2024-01-12', 'f'),
     (13, 17, 22, 27, 'Sale', 65000, '2024-01-13', 't'),
     (14, 18, 23, 28, 'Lease', 1400, '2024-01-14', 'f'),
    (15, 19, 24, 29, 'Sale', 75000, '2024-01-15', 't'),
     (16, 20, 25, 30, 'Rent', 1700, '2024-01-16', 'f');

INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (31, 35, 40, 5, 'Sale', 55000, '2024-02-01', 't'),
       (32, 36, 41, 6, 'Rent', 1600, '2024-02-02', 'f'),
       (33, 37, 42, 7, 'Sale', 65000, '2024-02-03', 't'),
       (34, 38, 43, 8, 'Lease', 1400, '2024-02-04', 'f'),
       (35, 39, 44, 9, 'Sale', 75000, '2024-02-05', 't'),
       (36, 40, 45, 10, 'Rent', 1700, '2024-02-06', 'f'),
       (37, 41, 46, 11, 'Sale', 85000, '2024-02-07', 't'),
       (38, 42, 47, 12, 'Lease', 1500, '2024-02-08', 'f'),
       (39, 43, 48, 13, 'Sale', 95000, '2024-02-09', 't'),
       (40, 44, 49, 14, 'Rent', 2200, '2024-02-10', 'f');

INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (41, 45, 50, 1, 'Sale', 100000, '2024-02-11', 't'),
       (42, 46, 51, 2, 'Rent', 2000, '2024-02-12', 'f'),
       (43, 47, 52, 3, 'Sale', 110000, '2024-02-13', 't'),
       (44, 48, 53, 4, 'Lease', 1800, '2024-02-14', 'f'),
       (45, 49, 54, 15, 'Sale', 120000, '2024-02-15', 't'),
       (46, 50, 55, 16, 'Rent', 2200, '2024-02-16', 'f'),
       (47, 51, 56, 17, 'Sale', 130000, '2024-02-17', 't'),
       (48, 52, 57, 18, 'Lease', 1900, '2024-02-18', 'f'),
       (49, 53, 58, 19, 'Sale', 140000, '2024-02-19', 't'),
       (85, 54, 59, 30, 'Rent', 2400, '2024-02-20', 'f');

       INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (51, 55, 60, 21, 'Sale', 150000, '2024-02-21', 't'),
       (52, 56, 61, 22, 'Rent', 2600, '2024-02-22', 'f'),
       (53, 57, 62, 23, 'Sale', 160000, '2024-02-23', 't'),
       (54, 58, 63, 24, 'Lease', 2800, '2024-02-24', 'f'),
       (55, 59, 64, 25, 'Sale', 170000, '2024-02-25', 't'),
       (56, 60, 65, 26, 'Rent', 3000, '2024-02-26', 'f'),
       (57, 61, 66, 27, 'Sale', 180000, '2024-02-27', 't'),
       (58, 62, 67, 28, 'Lease', 3200, '2024-02-28', 'f'),
       (59, 63, 68, 29, 'Sale', 190000, '2024-02-29', 't'),
       (60, 64, 69, 90, 'Rent', 3400, '2024-03-01', 'f');


INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (61, 65, 70, 41, 'Sale', 200000, '2024-03-02', 't'),
       (62, 66, 71, 42, 'Rent', 3600, '2024-03-03', 'f'),
       (63, 67, 72, 43, 'Sale', 210000, '2024-03-04', 't'),
       (64, 68, 73, 44, 'Lease', 3800, '2024-03-05', 'f'),
       (65, 69, 74, 45, 'Sale', 220000, '2024-03-06', 't'),
       (66, 70, 75, 46, 'Rent', 4000, '2024-03-07', 'f'),
       (67, 71, 76, 47, 'Sale', 230000, '2024-03-08', 't'),
       (68, 72, 77, 48, 'Lease', 4200, '2024-03-09', 'f'),
       (69, 73, 78, 49, 'Sale', 240000, '2024-03-10', 't'),
       (70, 74, 79, 50, 'Rent', 4400, '2024-03-11', 'f');


INSERT INTO transaction (id_document, id_customer, id_property, id_agent, transaction_type, amount, transaction_date, status)
VALUES (71, 75, 80, 51, 'Sale', 250000, '2024-03-12', 't'),
       (72, 76, 81, 52, 'Rent', 4600, '2024-03-13', 'f'),
       (73, 77, 82, 53, 'Sale', 260000, '2024-03-14', 't'),
       (74, 78, 83, 54, 'Lease', 5000, '2024-03-15', 'f'),
       (75, 79, 84, 55, 'Sale', 270000, '2024-03-16', 't'),
       (76, 80, 85, 56, 'Rent', 4800, '2024-03-17', 'f'),
       (77, 81, 86, 57, 'Sale', 280000, '2024-03-18', 't'),
       (78, 82, 87, 58, 'Lease', 5200, '2024-03-19', 'f'),
       (79, 83, 88, 59, 'Sale', 290000, '2024-03-20', 't'),
       (80, 84, 89, 60, 'Rent', 5400, '2024-03-21', 'f');



