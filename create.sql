Create database operaci

CREATE TABLE Documents ( id_document SERIAL PRIMARY KEY,  
 DocumentType VARCHAR(24) NOT NULL, 
 Description VARCHAR(512)  NOT NULL, 
FileLink VARCHAR(64) NOT NULL);


CREATE TABLE Customer ( id_customer SERIAL PRIMARY KEY,  
 firstname  VARCHAR(24) NOT NULL, lastname VARCHAR(24)   NOT NULL, 
  contact_information VARCHAR(255) NOT NULL UNIQUE);

CREATE TABLE Estate_Agent (id_agent SERIAL PRIMARY KEY,S
   firstname VARCHAR(24) NOT NULL,  
    lastname VARCHAR(24)  NOT NULL, 
    contact_information VARCHAR(255) NOT NULL UNIQUE);


CREATE TABLE Property ( id_property SERIAL PRIMARY KEY,  
address VARCHAR(64) NOT NULL, 
type VARCHAR(64)  NOT NULL, 
area FLOAT NOT NULL,
price DECIMAL NOT NULL);

CREATE TABLE Transaction ( id_transaction SERIAL PRIMARY KEY,  
id_document integer NOT NULL,
id_customer integer NOT NULL,
id_property integer NOT NULL,
id_agent integer NOT NULL, 
transaction_date DATE NOT NULL, 
transaction_type VARCHAR(64) NOT NULL,
amount DECIMAL NOT NULL,
status BOOLEAN NOT NULL,
FOREIGN KEY (id_document) REFERENCES Documents (id_document),
FOREIGN KEY (id_agent) REFERENCES Estate_Agent (id_agent),
FOREIGN KEY (id_property) REFERENCES Property (id_property),
FOREIGN KEY (id_customer) REFERENCES Customer (id_customer));