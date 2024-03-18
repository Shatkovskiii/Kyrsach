--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id_customer integer NOT NULL,
    firstname character varying(24),
    lastname character varying(24) NOT NULL,
    contact_information character varying(255) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_customer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_customer_seq OWNER TO postgres;

--
-- Name: customer_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_customer_seq OWNED BY public.customer.id_customer;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id_document integer NOT NULL,
    documenttype character varying(24) NOT NULL,
    description character varying(512) NOT NULL,
    filelink character varying(64) NOT NULL
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_document_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_document_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documents_id_document_seq OWNER TO postgres;

--
-- Name: documents_id_document_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_document_seq OWNED BY public.documents.id_document;


--
-- Name: estate_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estate_agent (
    id_agent integer NOT NULL,
    firstname character varying(24) NOT NULL,
    lastname character varying(24) NOT NULL,
    contact_information character varying(255) NOT NULL
);


ALTER TABLE public.estate_agent OWNER TO postgres;

--
-- Name: estate_agent_id_agent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estate_agent_id_agent_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estate_agent_id_agent_seq OWNER TO postgres;

--
-- Name: estate_agent_id_agent_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estate_agent_id_agent_seq OWNED BY public.estate_agent.id_agent;


--
-- Name: property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property (
    id_property integer NOT NULL,
    address character varying(64) NOT NULL,
    type character varying(64) NOT NULL,
    area double precision NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.property OWNER TO postgres;

--
-- Name: property_id_property_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_id_property_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.property_id_property_seq OWNER TO postgres;

--
-- Name: property_id_property_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_id_property_seq OWNED BY public.property.id_property;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id_transaction integer NOT NULL,
    id_document integer NOT NULL,
    id_customer integer NOT NULL,
    id_property integer NOT NULL,
    id_agent integer NOT NULL,
    transaction_date date NOT NULL,
    transaction_type character varying(64) NOT NULL,
    amount numeric NOT NULL,
    status boolean NOT NULL,
    CONSTRAINT transaction_amount_check CHECK ((amount > (0)::numeric))
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_id_transaction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_transaction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_transaction_seq OWNER TO postgres;

--
-- Name: transaction_id_transaction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_transaction_seq OWNED BY public.transaction.id_transaction;


--
-- Name: view_agent_transaction_count; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_agent_transaction_count AS
 SELECT a.id_agent,
    a.firstname,
    a.lastname,
    count(t.id_transaction) AS transaction_count
   FROM (public.estate_agent a
     LEFT JOIN public.transaction t ON ((a.id_agent = t.id_agent)))
  GROUP BY a.id_agent, a.firstname, a.lastname;


ALTER VIEW public.view_agent_transaction_count OWNER TO postgres;

--
-- Name: view_average_transaction_last_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_average_transaction_last_month AS
 SELECT id_transaction,
    transaction_date,
    amount,
    avg(amount) OVER (ORDER BY transaction_date RANGE BETWEEN '1 mon'::interval month PRECEDING AND CURRENT ROW) AS avg_transaction_last_month
   FROM public.transaction;


ALTER VIEW public.view_average_transaction_last_month OWNER TO postgres;

--
-- Name: view_avg_transaction_per_agent_last_month; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_avg_transaction_per_agent_last_month AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    a.id_agent,
    a.firstname AS agent_firstname,
    a.lastname AS agent_lastname,
    avg(t.amount) OVER (PARTITION BY a.id_agent ORDER BY t.transaction_date RANGE BETWEEN '1 mon'::interval month PRECEDING AND CURRENT ROW) AS avg_transaction_last_month
   FROM (public.transaction t
     JOIN public.estate_agent a ON ((t.id_agent = a.id_agent)));


ALTER VIEW public.view_avg_transaction_per_agent_last_month OWNER TO postgres;

--
-- Name: view_calculated_fields; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_calculated_fields AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    (t.amount * 0.15) AS agent_commission,
    p.type AS property_type
   FROM (public.transaction t
     JOIN public.property p ON ((t.id_property = p.id_property)));


ALTER VIEW public.view_calculated_fields OWNER TO postgres;

--
-- Name: view_customer_total_amount; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_customer_total_amount AS
 SELECT c.id_customer,
    c.firstname,
    c.lastname,
    sum(t.amount) AS total_transaction_amount
   FROM (public.customer c
     LEFT JOIN public.transaction t ON ((c.id_customer = t.id_customer)))
  GROUP BY c.id_customer, c.firstname, c.lastname;


ALTER VIEW public.view_customer_total_amount OWNER TO postgres;

--
-- Name: view_generated_columns_persistent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_generated_columns_persistent AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    (t.amount * 0.1) AS tax_amount,
    d.description AS document_description
   FROM (public.transaction t
     JOIN public.documents d ON ((t.id_document = d.id_document)));


ALTER VIEW public.view_generated_columns_persistent OWNER TO postgres;

--
-- Name: view_generated_columns_tax; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_generated_columns_tax AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    (t.amount * 0.1) AS tax_amount,
    d.description AS document_description
   FROM (public.transaction t
     JOIN public.documents d ON ((t.id_document = d.id_document)));


ALTER VIEW public.view_generated_columns_tax OWNER TO postgres;

--
-- Name: view_generated_columns_transient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_generated_columns_transient AS
 SELECT id_transaction,
    transaction_date,
    amount,
    lag(amount) OVER (ORDER BY transaction_date) AS prev_amount,
    lead(amount) OVER (ORDER BY transaction_date) AS next_amount
   FROM public.transaction t;


ALTER VIEW public.view_generated_columns_transient OWNER TO postgres;

--
-- Name: view_grouped_operations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_grouped_operations AS
 SELECT p.type AS property_type,
    avg(t.amount) AS avg_transaction_amount,
    count(t.id_transaction) AS transaction_count
   FROM (public.transaction t
     JOIN public.property p ON ((t.id_property = p.id_property)))
  GROUP BY p.type;


ALTER VIEW public.view_grouped_operations OWNER TO postgres;

--
-- Name: view_multiple_conditions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_multiple_conditions AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    t.transaction_type,
    c.firstname AS customer_firstname,
    c.lastname AS customer_lastname,
    a.firstname AS agent_firstname,
    a.lastname AS agent_lastname
   FROM ((public.transaction t
     JOIN public.customer c ON ((t.id_customer = c.id_customer)))
     JOIN public.estate_agent a ON ((t.id_agent = a.id_agent)))
  WHERE (((t.transaction_type)::text = 'Sale'::text) AND (t.amount > (100000)::numeric));


ALTER VIEW public.view_multiple_conditions OWNER TO postgres;

--
-- Name: view_sum_transaction_per_customer_last_3_months; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_sum_transaction_per_customer_last_3_months AS
 SELECT t.id_transaction,
    t.transaction_date,
    t.amount,
    c.id_customer,
    c.firstname AS customer_firstname,
    c.lastname AS customer_lastname,
    sum(t.amount) OVER (PARTITION BY c.id_customer ORDER BY t.transaction_date RANGE BETWEEN '3 mons'::interval month PRECEDING AND CURRENT ROW) AS sum_transaction_last_3_months
   FROM (public.transaction t
     JOIN public.customer c ON ((t.id_customer = c.id_customer)));


ALTER VIEW public.view_sum_transaction_per_customer_last_3_months OWNER TO postgres;

--
-- Name: view_transaction_difference; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_transaction_difference AS
 SELECT id_transaction,
    transaction_date,
    amount,
    lag(amount) OVER (ORDER BY transaction_date) AS previous_transaction_amount,
    (amount - lag(amount) OVER (ORDER BY transaction_date)) AS amount_difference
   FROM public.transaction;


ALTER VIEW public.view_transaction_difference OWNER TO postgres;

--
-- Name: view_window_functions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_window_functions AS
 SELECT id_transaction,
    transaction_date,
    amount,
    sum(amount) OVER (PARTITION BY transaction_type ORDER BY transaction_date) AS total_amount,
    avg(amount) OVER () AS global_avg_amount
   FROM public.transaction t;


ALTER VIEW public.view_window_functions OWNER TO postgres;

--
-- Name: ‘ustomer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."‘ustomer" (
    id_customer integer NOT NULL,
    firstname character varying(24),
    lastname character varying(24) NOT NULL,
    contact_information character varying(255) NOT NULL
);


ALTER TABLE public."‘ustomer" OWNER TO postgres;

--
-- Name: ‘ustomer_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."‘ustomer_id_customer_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."‘ustomer_id_customer_seq" OWNER TO postgres;

--
-- Name: ‘ustomer_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."‘ustomer_id_customer_seq" OWNED BY public."‘ustomer".id_customer;


--
-- Name: customer id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id_customer SET DEFAULT nextval('public.customer_id_customer_seq'::regclass);


--
-- Name: documents id_document; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id_document SET DEFAULT nextval('public.documents_id_document_seq'::regclass);


--
-- Name: estate_agent id_agent; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estate_agent ALTER COLUMN id_agent SET DEFAULT nextval('public.estate_agent_id_agent_seq'::regclass);


--
-- Name: property id_property; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property ALTER COLUMN id_property SET DEFAULT nextval('public.property_id_property_seq'::regclass);


--
-- Name: transaction id_transaction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id_transaction SET DEFAULT nextval('public.transaction_id_transaction_seq'::regclass);


--
-- Name: ‘ustomer id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."‘ustomer" ALTER COLUMN id_customer SET DEFAULT nextval('public."‘ustomer_id_customer_seq"'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id_customer, firstname, lastname, contact_information) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id_document, documenttype, description, filelink) FROM stdin;
\.


--
-- Data for Name: estate_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estate_agent (id_agent, firstname, lastname, contact_information) FROM stdin;
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property (id_property, address, type, area, price) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id_transaction, id_document, id_customer, id_property, id_agent, transaction_date, transaction_type, amount, status) FROM stdin;
\.


--
-- Data for Name: ‘ustomer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."‘ustomer" (id_customer, firstname, lastname, contact_information) FROM stdin;
\.


--
-- Name: customer_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_customer_seq', 1, false);


--
-- Name: documents_id_document_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_document_seq', 1, false);


--
-- Name: estate_agent_id_agent_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estate_agent_id_agent_seq', 1, false);


--
-- Name: property_id_property_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_id_property_seq', 1, false);


--
-- Name: transaction_id_transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_transaction_seq', 1, false);


--
-- Name: ‘ustomer_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."‘ustomer_id_customer_seq"', 1, false);


--
-- Name: customer customer_contact_information_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_contact_information_key UNIQUE (contact_information);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_customer);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id_document);


--
-- Name: estate_agent estate_agent_contact_information_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estate_agent
    ADD CONSTRAINT estate_agent_contact_information_key UNIQUE (contact_information);


--
-- Name: estate_agent estate_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estate_agent
    ADD CONSTRAINT estate_agent_pkey PRIMARY KEY (id_agent);


--
-- Name: property property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (id_property);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id_transaction);


--
-- Name: ‘ustomer ‘ustomer_contact_information_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."‘ustomer"
    ADD CONSTRAINT "‘ustomer_contact_information_key" UNIQUE (contact_information);


--
-- Name: ‘ustomer ‘ustomer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."‘ustomer"
    ADD CONSTRAINT "‘ustomer_pkey" PRIMARY KEY (id_customer);


--
-- Name: transaction transaction_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES public.estate_agent(id_agent);


--
-- Name: transaction transaction_id_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES public.customer(id_customer);


--
-- Name: transaction transaction_id_document_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_id_document_fkey FOREIGN KEY (id_document) REFERENCES public.documents(id_document);


--
-- Name: transaction transaction_id_property_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_id_property_fkey FOREIGN KEY (id_property) REFERENCES public.property(id_property);


--
-- PostgreSQL database dump complete
--

