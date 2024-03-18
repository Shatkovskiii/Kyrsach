--Представление с использованием расчетных полей (2 шт.)--
-- 1. Представление для расчета стоимости недвижимости на квадратный метр
CREATE  VIEW property_value_per_area AS
SELECT id_property, address, type, area, price, price / area AS value_per_area
FROM property;

-- 2. Представление для расчета общей стоимости сделки с учетом комиссии
CREATE   VIEW total_transaction_cost AS
SELECT t.id_transaction, t.amount, t.amount * 0.5 AS commission,
       t.amount + (t.amount * 0.5) AS total_cost
FROM transaction t;
