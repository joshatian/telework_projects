--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

-- Started on 2020-04-01 18:22:23 CDT

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
-- TOC entry 1 (class 3079 OID 13039)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 16424)
-- Name: bli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE DATABASE sfd_contracts
WITH
OWNER = postgres
ENCODING = 'UTF8'
LC_COLLATE = 'English_United States.1252'
LC_CTYPE = 'English_United States.1252'
TABLESPACE = pg_default
CONNECTION LIMIT = -1;

CREATE SCHEMA sfd_contract_tables
AUTHORIZATION postgres;

CREATE TABLE public.bli (
    bli_id integer NOT NULL,
    boc_id integer,
    PRIMARY_KEY(bli_id),
    FOREIGN_KEY(boc_id) REFERENCES boc (boc_id)
);


ALTER TABLE public.bli OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16429)
-- Name: boc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boc (
    boc_id integer NOT NULL,
    boc_value character varying(255),
    PRIMARY_KEY(boc_id)
);


ALTER TABLE public.boc OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16454)
-- Name: budget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.budget (
    budget_id integer NOT NULL,
    value numeric(11,2),
    obligated_amt_paid_id integer,
    committed_amt_paid_id integer,
    prior_fy_fund_id integer,
    PRIMARY_KEY(budget_id),
    FOREIGN_KEY(obligated_amt_paid_id) REFERENCES obligated_amt_paid (obligated_amt_paid_id),
    FOREIGN_KEY(committed_amt_paid_id) REFERENCES committed_amt_paid (committed_amt_paid_id),
    FOREIGN_KEY(prior_fy_fund_id) REFERENCES prior_fy_fund (prior_fy_fund_id)
);


ALTER TABLE public.budget OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16439)
-- Name: clin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clin (
    clin_id integer NOT NULL,
    clin_value character varying(255),
    PRIMARY_KEY(clin_id)
);


ALTER TABLE public.clin OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16469)
-- Name: committed_amt_paid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.committed_amt_paid (
    committed_amt_paid_id integer NOT NULL,
    value numeric(11,2),
    PRIMARY_KEY(committed_amt_paid_id)
);


ALTER TABLE public.committed_amt_paid OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16414)
-- Name: contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract (
    contract_id integer NOT NULL,
    number character varying(30),
    name character varying(255),
    prism character varying(30),
    bli_id integer,
    clin_id integer,
    PRIMARY_KEY(contract_id),
    FOREIGN_KEY(bli_id) REFERENCES bli (bli_id)
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16514)
-- Name: est_paid_through_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.est_paid_through_date (
    est_paid_through_date_id integer NOT NULL,
    date integer,
    PRIMARY_KEY(est_paid_through_date_id)
);


ALTER TABLE public.est_paid_through_date OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16489)
-- Name: fund_commit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fund_commit (
    fund_commit_id integer NOT NULL,
    date date,
    PRIMARY_KEY(fund_commit_id)
);


ALTER TABLE public.fund_commit OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16504)
-- Name: fund_obligate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fund_obligate (
    fund_obligate_id integer NOT NULL,
    date date,
    PRIMARY_KEY(fund_obligate_id)
);


ALTER TABLE public.fund_obligate OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main (
    uid uuid NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer,
    budget_id integer,
    fund_commit_id integer,
    fund_obligate_id integer,
    pop_start_id integer,
    pop_end_id integer,
    est_paid_through_date_id integer,
    PRIMARY_KEY(uid),
    FOREIGN_KEY(tracker_id) REFERENCES tracker (tracker_id),
    FOREIGN_KEY(project_id) REFERENCES project (project_id),
    FOREIGN_KEY(budget_id) REFERENCES budget (budget_id),
    FOREIGN_KEY(fund_commit_id) REFERENCES fund_commit (fund_commit_id),
    FOREIGN_KEY(fund_obligate_id) REFERENCES fund_obligate (fund_obligate_id),
    FOREIGN_KEY(pop_start_id) REFERENCES pop_start (pop_start_id),
    FOREIGN_KEY(pop_end_id) REFERENCES pop_end (pop_end_id),
    FOREIGN_KEY(est_paid_through_date_id) REFERENCES est_paid_through_date (est_paid_through_date_id)
);


ALTER TABLE public.main OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16459)
-- Name: obligated_amt_paid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obligated_amt_paid (
    obligated_amt_paid_id integer NOT NULL,
    value numeric(11,2),
    PRIMARY_KEY(obligated_amt_paid_id)
);


ALTER TABLE public.obligated_amt_paid OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16534)
-- Name: pop_end; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pop_end (
    pop_end_id integer NOT NULL,
    date date,
    PRIMARY_KEY(pop_end_id)
);


ALTER TABLE public.pop_end OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16524)
-- Name: pop_start; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pop_start (
    pop_start_id integer NOT NULL,
    date date,
    PRIMARY_KEY(pop_start_id)
);


ALTER TABLE public.pop_start OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16479)
-- Name: prior_fy_fund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prior_fy_fund (
    prior_fy_fund_id integer NOT NULL,
    prior_fy integer,
    PRIMARY_KEY(prior_fy_fund_id)
);


ALTER TABLE public.prior_fy_fund OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16404)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    project_id integer NOT NULL,
    name character varying(30),
    summary character varying(255),
    contract_id integer,
    PRIMARY_KEY(project_id),
    FOREIGN_KEY(contract_id) REFERENCES contract (contract_id)
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16390)
-- Name: tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker (
    tracker_id integer NOT NULL,
    "user" character varying(30),
    user_id integer,
    date date,
    PRIMARY_KEY(tracker_id)
);


ALTER TABLE public.tracker OWNER TO postgres;

--
-- TOC entry 2851 (class 2606 OID 16428)
-- Name: bli bli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- Completed on 2020-04-01 18:22:23 CDT

--
-- PostgreSQL database dump complete
--
