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


CREATE PROCEDURE update_transaction_cascade_property(
    property_id INT,
    new_transaction_type VARCHAR(64), 
    new_amount DECIMAL 
)
AS $$
BEGIN
    UPDATE transaction
    SET transaction_type = new_transaction_type, amount = new_amount
    WHERE id_property = property_id;
    
END;
$$
LANGUAGE plpgsql;

CREATE  PROCEDURE UpdateDocumentInfo(
    doc_id INTEGER,
    new_type VARCHAR(24),
    new_description VARCHAR(512),
    new_filelink VARCHAR(64)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Documents
    SET DocumentType = new_type,
        Description = new_description,
        FileLink = new_filelink
    WHERE id_document = doc_id;

    UPDATE Transaction
    SET transaction_date = CURRENT_DATE
    WHERE id_document = doc_id;
END;
$$;




