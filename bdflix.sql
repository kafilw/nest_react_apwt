--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password character varying
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    isblocked boolean DEFAULT false,
    filename character varying,
    "adminId" integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, name, email, password) FROM stdin;
1	Admin\n	admin@bdflix.com	abcd
2	test	test@test.gg	abcd
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, password, isblocked, filename, "adminId") FROM stdin;
20	abcd	abcd@aa.com	$2b$10$prWuEXBs206MlwCQGI1zC.BOvT3MONgsg1J8n8DjPMagjnWQa8u7e	f	1678784837491unnamed.png	1
21	abcd	aaaa@aa.com	$2b$10$wVsQb.OgVTDweR4jNGKJXuRQjO.MGgPIHZ34aJa0mImTiLYFW4q.u	f	1678785108033unnamed.png	2
22	abcd	bbbb@aa.com	$2b$10$R3Up2RVD8Dn7SV/r6mNmX.0HR/B/W.76TmF3PSTM5bsUJIioBv0Bm	f	1678785183694unnamed.png	1
23	rafid	random@rand.gg	$2b$10$YDxKUdOG4apWgWE9/dKu0OroMgi/Rr2JmDf9N529Pb51/KKYDM2oW	f	\N	\N
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 23, true);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: user user_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_admin_id_fkey FOREIGN KEY ("adminId") REFERENCES public.admin(id);


--
-- PostgreSQL database dump complete
--

