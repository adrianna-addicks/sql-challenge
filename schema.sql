--
-- PostgreSQL database dump
--

-- Dumped from database version 11.11
-- Dumped by pg_dump version 12.6

-- Started on 2021-05-21 21:46:26 CDT

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

--
-- TOC entry 196 (class 1259 OID 16509)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying NOT NULL,
    dept_name character varying NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16533)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16546)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16525)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title_id character varying NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sex character varying NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16541)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16517)
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title (
    title_id character varying NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.title OWNER TO postgres;

--
-- TOC entry 3026 (class 2606 OID 16516)
-- Name: departments pk_departments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT pk_departments PRIMARY KEY (dept_no);


--
-- TOC entry 3032 (class 2606 OID 16540)
-- Name: dept_emp pk_dept_emp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 3036 (class 2606 OID 16553)
-- Name: dept_manager pk_dept_manager; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no);


--
-- TOC entry 3030 (class 2606 OID 16532)
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (emp_no);


--
-- TOC entry 3034 (class 2606 OID 16545)
-- Name: salaries pk_salaries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT pk_salaries PRIMARY KEY (emp_no);


--
-- TOC entry 3028 (class 2606 OID 16524)
-- Name: title pk_title; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT pk_title PRIMARY KEY (title_id);


--
-- TOC entry 3039 (class 2606 OID 16564)
-- Name: dept_emp fk_dept_emp_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3038 (class 2606 OID 16559)
-- Name: dept_emp fk_dept_emp_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3041 (class 2606 OID 16574)
-- Name: dept_manager fk_dept_manager_dept_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3042 (class 2606 OID 16579)
-- Name: dept_manager fk_dept_manager_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3037 (class 2606 OID 16554)
-- Name: employees fk_employees_emp_title_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES public.title(title_id);


--
-- TOC entry 3040 (class 2606 OID 16569)
-- Name: salaries fk_salaries_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2021-05-21 21:46:26 CDT

--
-- PostgreSQL database dump complete
--

