CREATE  PROCEDURE update_document_description(
    document_id INT,
    new_description VARCHAR(512),
    property_id INT,
    new_price DECIMAL
)
AS
$$
BEGIN
    UPDATE Documents
    SET Description = new_description
    WHERE id_document = document_id;

    UPDATE Property
    SET price = new_price
    WHERE id_property = property_id;
END;
$$
LANGUAGE PLPGSQL;
