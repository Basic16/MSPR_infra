--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-26 08:02:59 UTC

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

--
-- TOC entry 3439 (class 1262 OID 16384)
-- Name: paye_ton_kawa; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE paye_ton_kawa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE paye_ton_kawa OWNER TO postgres;

\connect paye_ton_kawa

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
-- TOC entry 214 (class 1259 OID 16385)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    postalcode text,
    city text
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16390)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 215
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- TOC entry 216 (class 1259 OID 16391)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id integer NOT NULL,
    companyname text
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16396)
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO postgres;

--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 217
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_seq OWNED BY public.company.id;


--
-- TOC entry 218 (class 1259 OID 16397)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    createdat timestamp without time zone,
    name text,
    username text,
    firstname text,
    lastname text,
    addressid integer,
    profileid integer,
    companyid integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16402)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 220 (class 1259 OID 16403)
-- Name: details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.details (
    id integer NOT NULL,
    price numeric(10,2),
    description text,
    color character varying(50)
);


ALTER TABLE public.details OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16408)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    createdat timestamp without time zone,
    customerid integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16411)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 228 (class 1259 OID 16478)
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    id_order integer NOT NULL,
    id_product integer NOT NULL
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16412)
-- Name: product_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_details (
    id integer NOT NULL,
    price numeric(10,2) NOT NULL,
    description text NOT NULL,
    color character varying(50) NOT NULL
);


ALTER TABLE public.product_details OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16417)
-- Name: product_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_details_id_seq OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_details_id_seq OWNED BY public.product_details.id;


--
-- TOC entry 225 (class 1259 OID 16418)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    stock integer,
    createdat timestamp without time zone,
    details_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16421)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    firstname text,
    lastname text
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16426)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_id_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 227
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;


--
-- TOC entry 230 (class 1259 OID 16494)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    email character varying(100),
    cles_securite character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16493)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3241 (class 2604 OID 16427)
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16428)
-- Name: company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id SET DEFAULT nextval('public.company_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16429)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16430)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16431)
-- Name: product_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details ALTER COLUMN id SET DEFAULT nextval('public.product_details_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16432)
-- Name: profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16497)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3417 (class 0 OID 16385)
-- Dependencies: 214
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address VALUES (1, '43019', 'Port Reanna');
INSERT INTO public.address VALUES (2, '85106-9637', 'Adamland');
INSERT INTO public.address VALUES (3, '40340-9198', 'Darylmouth');


--
-- TOC entry 3419 (class 0 OID 16391)
-- Dependencies: 216
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company VALUES (1, 'Leffler, Murphy and Wunsch');
INSERT INTO public.company VALUES (2, 'Smitham - Balistreri');
INSERT INTO public.company VALUES (3, 'Deckow Group');


--
-- TOC entry 3421 (class 0 OID 16397)
-- Dependencies: 218
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers VALUES (2, '2023-02-19 15:04:34.584', 'Lela Dickinson', 'Sienna30', 'Lauren', 'Howell', 2, 2, 2);
INSERT INTO public.customers VALUES (3, '2023-02-19 15:58:18.07', 'Stanley Vandervort', 'Howard.Ullrich10', 'Fanny', 'Davis', 3, 3, 3);
INSERT INTO public.customers VALUES (1, '2023-02-19 15:26:38.45', 'Jessica Grady', 'Merle.Hammes', 'Johnson', 'Gutmann', 1, 1, 1);


--
-- TOC entry 3423 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.details VALUES (1, 921.00, 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four-wheel drive', 'cyan');
INSERT INTO public.details VALUES (2, 662.00, 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 'violet');
INSERT INTO public.details VALUES (3, 680.00, 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 'black');


--
-- TOC entry 3424 (class 0 OID 16408)
-- Dependencies: 221
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (1, '2023-02-19 21:15:11.18', 1);
INSERT INTO public.orders VALUES (2, '2023-02-19 14:36:25.139', 1);
INSERT INTO public.orders VALUES (3, '2023-02-20 13:12:43.431', 2);
INSERT INTO public.orders VALUES (4, '2023-02-20 02:22:45.643', 2);
INSERT INTO public.orders VALUES (5, '2023-02-19 18:12:16.457', 3);
INSERT INTO public.orders VALUES (6, '2023-02-19 20:58:11.238', 3);


--
-- TOC entry 3431 (class 0 OID 16478)
-- Dependencies: 228
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders_products VALUES (3, 6);
INSERT INTO public.orders_products VALUES (3, 5);
INSERT INTO public.orders_products VALUES (2, 6);
INSERT INTO public.orders_products VALUES (1, 6);
INSERT INTO public.orders_products VALUES (1, 4);


--
-- TOC entry 3426 (class 0 OID 16412)
-- Dependencies: 223
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_details VALUES (1, 921.00, 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 'cyan');
INSERT INTO public.product_details VALUES (2, 662.00, 'Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals', 'violet');
INSERT INTO public.product_details VALUES (3, 680.00, 'The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive', 'black');
INSERT INTO public.product_details VALUES (4, 296.00, 'The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design', 'mint green');


--
-- TOC entry 3428 (class 0 OID 16418)
-- Dependencies: 225
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (4, 'Leroy Skiles', 90601, '2023-02-20 00:52:07.409', 1);
INSERT INTO public.products VALUES (5, 'Jacquelyn Hyatt', 67002, '2023-02-20 01:12:28.696', 2);
INSERT INTO public.products VALUES (6, 'Al Zieme', 2308, '2023-02-19 16:18:16.432', 3);


--
-- TOC entry 3429 (class 0 OID 16421)
-- Dependencies: 226
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profile VALUES (1, 'Malcolm', 'Ward');
INSERT INTO public.profile VALUES (2, 'Wayne', 'Treutel');
INSERT INTO public.profile VALUES (3, 'Teagan', 'Boyle');


--
-- TOC entry 3433 (class 0 OID 16494)
-- Dependencies: 230
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 215
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 3, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 217
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_seq', 3, true);


--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 219
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 26, true);


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 227
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 3, true);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3249 (class 2606 OID 16434)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 16436)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16438)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16440)
-- Name: details details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16442)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 16482)
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id_order, id_product);


--
-- TOC entry 3259 (class 2606 OID 16444)
-- Name: product_details product_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 16446)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 16448)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 16499)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 16449)
-- Name: customers customers_addressid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_addressid_fkey FOREIGN KEY (addressid) REFERENCES public.address(id);


--
-- TOC entry 3269 (class 2606 OID 16454)
-- Name: customers customers_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_companyid_fkey FOREIGN KEY (companyid) REFERENCES public.company(id);


--
-- TOC entry 3270 (class 2606 OID 16459)
-- Name: customers customers_profileid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_profileid_fkey FOREIGN KEY (profileid) REFERENCES public.profile(id);


--
-- TOC entry 3273 (class 2606 OID 16483)
-- Name: orders_products id_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT id_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- TOC entry 3274 (class 2606 OID 16488)
-- Name: orders_products id_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT id_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- TOC entry 3271 (class 2606 OID 16464)
-- Name: orders orders_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);


--
-- TOC entry 3272 (class 2606 OID 16469)
-- Name: products products_details_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_details_id_fkey FOREIGN KEY (details_id) REFERENCES public.details(id);


-- Completed on 2023-07-26 08:02:59 UTC

--
-- PostgreSQL database dump complete
--

