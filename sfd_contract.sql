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

CREATE TABLE public.bli (
    bli_id integer NOT NULL,
    boc_id integer
);


ALTER TABLE public.bli OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16429)
-- Name: boc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boc (
    boc_id integer NOT NULL,
    boc_value character varying(255)
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
    prior_fy_fund_id integer
);


ALTER TABLE public.budget OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16439)
-- Name: clin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clin (
    clin_id integer NOT NULL,
    clin_value character varying(255)
);


ALTER TABLE public.clin OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16469)
-- Name: committed_amt_paid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.committed_amt_paid (
    committed_amt_paid_id integer NOT NULL,
    value numeric(11,2)
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
    clin_id integer
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16514)
-- Name: est_paid_through_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.est_paid_through_date (
    est_paid_through_date_id integer NOT NULL,
    date integer
);


ALTER TABLE public.est_paid_through_date OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16489)
-- Name: fund_commit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fund_commit (
    fund_commit_id integer NOT NULL,
    date date
);


ALTER TABLE public.fund_commit OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16504)
-- Name: fund_obligate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fund_obligate (
    fund_obligate_id integer NOT NULL,
    date date
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
    est_paid_through_date_id integer
);


ALTER TABLE public.main OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16459)
-- Name: obligated_amt_paid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obligated_amt_paid (
    obligated_amt_paid_id integer NOT NULL,
    value numeric(11,2)
);


ALTER TABLE public.obligated_amt_paid OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16534)
-- Name: pop_end; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pop_end (
    pop_end_id integer NOT NULL,
    date date
);


ALTER TABLE public.pop_end OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16524)
-- Name: pop_start; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pop_start (
    pop_start_id integer NOT NULL,
    date date
);


ALTER TABLE public.pop_start OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16479)
-- Name: prior_fy_fund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prior_fy_fund (
    prior_fy_fund_id integer NOT NULL,
    prior_fy integer
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
    contract_id integer
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16390)
-- Name: tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracker (
    "user" character varying(30),
    user_id integer,
    date date,
    tracker_id integer NOT NULL
);


ALTER TABLE public.tracker OWNER TO postgres;

--
-- TOC entry 2851 (class 2606 OID 16428)
-- Name: bli bli_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bli
    ADD CONSTRAINT bli_pkey PRIMARY KEY (bli_id);


--
-- TOC entry 2853 (class 2606 OID 16433)
-- Name: boc boc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boc
    ADD CONSTRAINT boc_pkey PRIMARY KEY (boc_id);


--
-- TOC entry 2857 (class 2606 OID 16458)
-- Name: budget budget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (budget_id);


--
-- TOC entry 2855 (class 2606 OID 16443)
-- Name: clin clin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clin
    ADD CONSTRAINT clin_pkey PRIMARY KEY (clin_id);


--
-- TOC entry 2861 (class 2606 OID 16473)
-- Name: committed_amt_paid committed_amt_paid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.committed_amt_paid
    ADD CONSTRAINT committed_amt_paid_pkey PRIMARY KEY (committed_amt_paid_id);


--
-- TOC entry 2849 (class 2606 OID 16418)
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);


--
-- TOC entry 2869 (class 2606 OID 16518)
-- Name: est_paid_through_date est_paid_through_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.est_paid_through_date
    ADD CONSTRAINT est_paid_through_date_pkey PRIMARY KEY (est_paid_through_date_id);


--
-- TOC entry 2865 (class 2606 OID 16493)
-- Name: fund_commit fund_commit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fund_commit
    ADD CONSTRAINT fund_commit_pkey PRIMARY KEY (fund_commit_id);


--
-- TOC entry 2867 (class 2606 OID 16508)
-- Name: fund_obligate fund_obligate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fund_obligate
    ADD CONSTRAINT fund_obligate_pkey PRIMARY KEY (fund_obligate_id);


--
-- TOC entry 2843 (class 2606 OID 16389)
-- Name: main main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_pkey PRIMARY KEY (uid);


--
-- TOC entry 2859 (class 2606 OID 16463)
-- Name: obligated_amt_paid obligated_amt_paid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obligated_amt_paid
    ADD CONSTRAINT obligated_amt_paid_pkey PRIMARY KEY (obligated_amt_paid_id);


--
-- TOC entry 2873 (class 2606 OID 16538)
-- Name: pop_end pop_end_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pop_end
    ADD CONSTRAINT pop_end_pkey PRIMARY KEY (pop_end_id);


--
-- TOC entry 2871 (class 2606 OID 16528)
-- Name: pop_start pop_start_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pop_start
    ADD CONSTRAINT pop_start_pkey PRIMARY KEY (pop_start_id);


--
-- TOC entry 2863 (class 2606 OID 16483)
-- Name: prior_fy_fund prior_fy_fund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prior_fy_fund
    ADD CONSTRAINT prior_fy_fund_pkey PRIMARY KEY (prior_fy_fund_id);


--
-- TOC entry 2847 (class 2606 OID 16408)
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);


--
-- TOC entry 2845 (class 2606 OID 16398)
-- Name: tracker tracker_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_id PRIMARY KEY (tracker_id);


--
-- TOC entry 2885 (class 2606 OID 16434)
-- Name: bli bli_boc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bli
    ADD CONSTRAINT bli_boc_fkey FOREIGN KEY (boc_id) REFERENCES public.boc(boc_id);


--
-- TOC entry 2887 (class 2606 OID 16474)
-- Name: budget budget_committed_amt_paid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_committed_amt_paid_fkey FOREIGN KEY (committed_amt_paid_id) REFERENCES public.committed_amt_paid(committed_amt_paid_id);


--
-- TOC entry 2886 (class 2606 OID 16464)
-- Name: budget budget_obligated_amt_paid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_obligated_amt_paid_fkey FOREIGN KEY (obligated_amt_paid_id) REFERENCES public.obligated_amt_paid(obligated_amt_paid_id);


--
-- TOC entry 2888 (class 2606 OID 16484)
-- Name: budget budget_prior_fy_fund_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_prior_fy_fund_fkey FOREIGN KEY (prior_fy_fund_id) REFERENCES public.prior_fy_fund(prior_fy_fund_id);


--
-- TOC entry 2884 (class 2606 OID 16449)
-- Name: contract contract_bli_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_bli_fkey FOREIGN KEY (bli_id) REFERENCES public.bli(bli_id);


--
-- TOC entry 2883 (class 2606 OID 16444)
-- Name: contract contract_clin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_clin_fkey FOREIGN KEY (clin_id) REFERENCES public.clin(clin_id);


--
-- TOC entry 2876 (class 2606 OID 16494)
-- Name: main main_budget_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_budget_fkey FOREIGN KEY (budget_id) REFERENCES public.budget(budget_id);


--
-- TOC entry 2879 (class 2606 OID 16519)
-- Name: main main_est_paid_through_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_est_paid_through_fkey FOREIGN KEY (est_paid_through_date_id) REFERENCES public.est_paid_through_date(est_paid_through_date_id);


--
-- TOC entry 2877 (class 2606 OID 16499)
-- Name: main main_fund_commit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_fund_commit_fkey FOREIGN KEY (fund_commit_id) REFERENCES public.fund_commit(fund_commit_id);


--
-- TOC entry 2878 (class 2606 OID 16509)
-- Name: main main_fund_obligate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_fund_obligate_fkey FOREIGN KEY (fund_obligate_id) REFERENCES public.fund_obligate(fund_obligate_id);


--
-- TOC entry 2881 (class 2606 OID 16539)
-- Name: main main_pop_end_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_pop_end_fkey FOREIGN KEY (pop_end_id) REFERENCES public.pop_end(pop_end_id);


--
-- TOC entry 2880 (class 2606 OID 16529)
-- Name: main main_pop_start_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_pop_start_fkey FOREIGN KEY (pop_start_id) REFERENCES public.pop_start(pop_start_id);


--
-- TOC entry 2875 (class 2606 OID 16409)
-- Name: main main_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_project_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);


--
-- TOC entry 2874 (class 2606 OID 16399)
-- Name: main main_tracker_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_tracker_fkey FOREIGN KEY (tracker_id) REFERENCES public.tracker(tracker_id);


--
-- TOC entry 2882 (class 2606 OID 16419)
-- Name: project project_contract_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_contract_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(contract_id);


-- Completed on 2020-04-01 18:22:23 CDT

--
-- PostgreSQL database dump complete
--

