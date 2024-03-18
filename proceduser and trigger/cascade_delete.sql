CREATE PROCEDURE delete_customer_transactions(IN customer_id INT)

AS $$
BEGIN
    DELETE FROM Transaction WHERE id_customer = customer_id;
END;
$$
LANGUAGE plpgsql;


CREATE PROCEDURE delete_agent_transactions(IN agent_id INT)
AS $$
BEGIN
    DELETE FROM Transaction WHERE id_agent = agent_id;
END;
$$
LANGUAGE plpgsql;

CREATE PROCEDURE delete_property_documents(IN property_id INT)

AS $$
BEGIN
    DELETE FROM Documents WHERE id_document IN (SELECT id_document FROM Transaction WHERE id_property = property_id);
END;
$$
LANGUAGE plpgsql;
