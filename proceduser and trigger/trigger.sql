CREATE FUNCTION update_transaction_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.amount >= 1000000 THEN
        NEW.status := TRUE; 
    ELSE
        NEW.status := FALSE;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER transaction_status_update
BEFORE INSERT OR UPDATE ON Transaction
FOR EACH ROW
EXECUTE FUNCTION update_transaction_status();
------------------------------------------------------------------------------------
CREATE  FUNCTION log_transaction_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Новая транзакция была добавлена в базу данных!';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_transaction_insert_trigger
AFTER INSERT ON Transaction
FOR EACH ROW
EXECUTE FUNCTION log_transaction_insert();
-------------------------------------------------------------------------------------
CREATE TRIGGER enforce_daily_transaction_limit
BEFORE INSERT OR UPDATE ON Transaction
FOR EACH ROW
EXECUTE FUNCTION check_daily_transaction_limit();

CREATE FUNCTION check_price_positive()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price < 0 THEN
        RAISE EXCEPTION 'Цена не может быть отрицательной';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_positive_price
BEFORE INSERT OR UPDATE ON Property
FOR EACH ROW
EXECUTE FUNCTION check_price_positive();