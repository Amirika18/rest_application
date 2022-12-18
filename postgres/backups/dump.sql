--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-17 12:46:30

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

DROP DATABASE "vue-db";
--
-- TOC entry 3466 (class 1262 OID 16384)
-- Name: vue-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "vue-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "vue-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='vue-db'"

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 857 (class 1247 OID 16388)
-- Name: action; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.action AS ENUM (
    'read',
    'create',
    'update',
    'delete'
);


ALTER TYPE public.action OWNER TO postgres;

--
-- TOC entry 860 (class 1247 OID 16398)
-- Name: clearance; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.clearance AS ENUM (
    'denied',
    'if_owned',
    'allowed'
);


ALTER TYPE public.clearance OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16405)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    login text,
    password text,
    email text NOT NULL,
    user_id integer,
    active boolean DEFAULT false NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16560)
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_id_seq OWNER TO postgres;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 234
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;


--
-- TOC entry 215 (class 1259 OID 16410)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dep_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16415)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 216
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.dep_id;


--
-- TOC entry 217 (class 1259 OID 16416)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    perm_id integer NOT NULL,
    table_name text NOT NULL,
    clearance public.clearance NOT NULL,
    system_role integer NOT NULL,
    action public.action NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16421)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.perm_id;


--
-- TOC entry 219 (class 1259 OID 16422)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    pos_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16427)
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.pos_id;


--
-- TOC entry 221 (class 1259 OID 16428)
-- Name: project_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_roles (
    proj_role_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.project_roles OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16433)
-- Name: project_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 222
-- Name: project_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_roles_id_seq OWNED BY public.project_roles.proj_role_id;


--
-- TOC entry 223 (class 1259 OID 16434)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    proj_id integer NOT NULL,
    name text NOT NULL,
    start date NOT NULL,
    "end" date,
    description text NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16439)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 224
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.proj_id;


--
-- TOC entry 225 (class 1259 OID 16440)
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16445)
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 226
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.skill_id;


--
-- TOC entry 227 (class 1259 OID 16446)
-- Name: system_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_roles (
    system_role_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.system_roles OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16451)
-- Name: system_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 228
-- Name: system_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_roles_id_seq OWNED BY public.system_roles.system_role_id;


--
-- TOC entry 229 (class 1259 OID 16452)
-- Name: user_x_project_x_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_x_project_x_role (
    "user" integer NOT NULL,
    project_role integer,
    project integer NOT NULL
);


ALTER TABLE public.user_x_project_x_role OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16455)
-- Name: user_x_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_x_skill (
    "user" integer NOT NULL,
    skill integer NOT NULL
);


ALTER TABLE public.user_x_skill OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16458)
-- Name: user_x_sys_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_x_sys_role (
    account integer NOT NULL,
    system_role integer NOT NULL
);


ALTER TABLE public.user_x_sys_role OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16461)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    patronymic text NOT NULL,
    department integer,
    "position" integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16466)
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
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3255 (class 2604 OID 16561)
-- Name: accounts account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 16551)
-- Name: departments dep_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN dep_id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16552)
-- Name: permissions perm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN perm_id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 16553)
-- Name: positions pos_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN pos_id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 16554)
-- Name: project_roles proj_role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_roles ALTER COLUMN proj_role_id SET DEFAULT nextval('public.project_roles_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 16555)
-- Name: projects proj_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN proj_id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 16556)
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 16557)
-- Name: system_roles system_role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_roles ALTER COLUMN system_role_id SET DEFAULT nextval('public.system_roles_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16558)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3440 (class 0 OID 16405)
-- Dependencies: 214
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (login, password, email, user_id, active, account_id) FROM stdin;
foilhatguy	$argon2id$v=19$m=65536,t=3,p=4$FOsOh+zNioqeaXK/AUfsVA$lfteZ1lnaw0eTvbZAmQhSkyZ2dR9V4mAOBlD7krUWl0	antony.aleynikov@gmail.com	\N	t	1
\.


--
-- TOC entry 3441 (class 0 OID 16410)
-- Dependencies: 215
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dep_id, name) FROM stdin;
1	AS400
7	sdssds
8	sdsc
9	sadsadsadsada
10	aaaaaaaaaa
11	sddssd
12	asdwewq
13	aaa
5	saaaaske
6	Коноха
\.


--
-- TOC entry 3443 (class 0 OID 16416)
-- Dependencies: 217
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (perm_id, table_name, clearance, system_role, action) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 16422)
-- Dependencies: 219
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (pos_id, name) FROM stdin;
2	Middle Data Engineer
3	Senior C++ developer
4	System Architect
5	CEO
30	wqe
31	qwew
\.


--
-- TOC entry 3447 (class 0 OID 16428)
-- Dependencies: 221
-- Data for Name: project_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_roles (proj_role_id, name) FROM stdin;
3	Operator
6	Viewer
7	swag
2	Administrator
\.


--
-- TOC entry 3449 (class 0 OID 16434)
-- Dependencies: 223
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (proj_id, name, start, "end", description) FROM stdin;
7	qwqwwq	2022-11-08	2022-11-19	qwwwww
2	Work	2022-11-12	2022-11-26	Роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать роботать 
1	Studysn	2000-01-02	2022-11-26	nnnnnn
\.


--
-- TOC entry 3451 (class 0 OID 16440)
-- Dependencies: 225
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (skill_id, name, description) FROM stdin;
3	Java	\N
4	JavaScript	\N
5	Architecture	\N
6	Databases	\N
7	SQL	\N
8	C++	\N
9	C#	\N
10	Коммуникабельность	\N
11	sssss	sssss
12	пык	пек
1	wrokaholic	23324
2	Python	\N
13	sdsddssddsc	xxxxxxxxxxxxxx
\.


--
-- TOC entry 3453 (class 0 OID 16446)
-- Dependencies: 227
-- Data for Name: system_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_roles (system_role_id, name) FROM stdin;
1	admin
3	junior dev
2	middle dev
4	HR
\.


--
-- TOC entry 3455 (class 0 OID 16452)
-- Dependencies: 229
-- Data for Name: user_x_project_x_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_x_project_x_role ("user", project_role, project) FROM stdin;
1	6	7
2	3	2
19	\N	7
1	\N	2
3	3	1
2	2	1
20	3	1
19	7	1
1	6	1
\.


--
-- TOC entry 3456 (class 0 OID 16455)
-- Dependencies: 230
-- Data for Name: user_x_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_x_skill ("user", skill) FROM stdin;
1	4
1	5
3	5
1	7
1	8
1	9
1	10
3	10
1	11
1	2
1	3
20	8
20	9
2	6
2	10
2	11
2	1
3	11
3	12
3	7
3	6
3	3
3	4
3	1
3	8
3	2
3	9
19	10
19	6
19	5
19	4
19	3
\.


--
-- TOC entry 3457 (class 0 OID 16458)
-- Dependencies: 231
-- Data for Name: user_x_sys_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_x_sys_role (account, system_role) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 16461)
-- Dependencies: 232
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, surname, patronymic, department, "position") FROM stdin;
20	Ивашка	Дурашкович	Дурашка	8	4
1	sadad	sda	patr	1	2
2	Ivan	sfdfsdfsv	Ivanovich	8	2
19	Ыыы	Ыыывов	Ывовичь	9	5
26	sdbg	ads	,,,mnnn	\N	3
3	Petr	Petrov	Petrovich	1	3
\.


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 234
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 1, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 216
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 2, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 220
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_id_seq', 1, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 222
-- Name: project_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_roles_id_seq', 1, false);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 224
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 226
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 228
-- Name: system_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_roles_id_seq', 4, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 233
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 3267 (class 2606 OID 16571)
-- Name: accounts accounts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pk PRIMARY KEY (account_id);


--
-- TOC entry 3269 (class 2606 OID 16476)
-- Name: departments departments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pk PRIMARY KEY (dep_id);


--
-- TOC entry 3272 (class 2606 OID 16478)
-- Name: positions positions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pk PRIMARY KEY (pos_id);


--
-- TOC entry 3274 (class 2606 OID 16480)
-- Name: project_roles project_roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_roles
    ADD CONSTRAINT project_roles_pk PRIMARY KEY (proj_role_id);


--
-- TOC entry 3276 (class 2606 OID 16482)
-- Name: projects projects_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pk PRIMARY KEY (proj_id);


--
-- TOC entry 3278 (class 2606 OID 16484)
-- Name: skills skills_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pk PRIMARY KEY (skill_id);


--
-- TOC entry 3284 (class 2606 OID 16486)
-- Name: user_x_sys_role system_clearance_person_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT system_clearance_person_key UNIQUE (account);


--
-- TOC entry 3280 (class 2606 OID 16488)
-- Name: system_roles system_roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_roles
    ADD CONSTRAINT system_roles_pk PRIMARY KEY (system_role_id);


--
-- TOC entry 3286 (class 2606 OID 16490)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- TOC entry 3264 (class 1259 OID 16569)
-- Name: accounts_account_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX accounts_account_id_idx ON public.accounts USING btree (account_id);


--
-- TOC entry 3265 (class 1259 OID 16491)
-- Name: accounts_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX accounts_email_idx ON public.accounts USING btree (email);


--
-- TOC entry 3270 (class 1259 OID 16493)
-- Name: permissions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX permissions_id_idx ON public.permissions USING btree (perm_id);


--
-- TOC entry 3281 (class 1259 OID 16494)
-- Name: project_clearance_person_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX project_clearance_person_idx ON public.user_x_project_x_role USING btree ("user", project);


--
-- TOC entry 3282 (class 1259 OID 16495)
-- Name: user_x_skill_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_x_skill_user_idx ON public.user_x_skill USING btree ("user", skill);


--
-- TOC entry 3287 (class 2606 OID 16496)
-- Name: accounts accounts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- TOC entry 3288 (class 2606 OID 16501)
-- Name: permissions permissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_fk FOREIGN KEY (system_role) REFERENCES public.system_roles(system_role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3289 (class 2606 OID 16506)
-- Name: user_x_project_x_role project_clearance_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk0 FOREIGN KEY ("user") REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 16511)
-- Name: user_x_project_x_role project_clearance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk1 FOREIGN KEY (project_role) REFERENCES public.project_roles(proj_role_id) ON DELETE SET NULL;


--
-- TOC entry 3291 (class 2606 OID 16516)
-- Name: user_x_project_x_role project_clearance_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_project_x_role
    ADD CONSTRAINT project_clearance_fk2 FOREIGN KEY (project) REFERENCES public.projects(proj_id) ON DELETE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 16521)
-- Name: user_x_skill skill_allocation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_skill
    ADD CONSTRAINT skill_allocation_fk0 FOREIGN KEY ("user") REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 16526)
-- Name: user_x_skill skill_allocation_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_skill
    ADD CONSTRAINT skill_allocation_fk1 FOREIGN KEY (skill) REFERENCES public.skills(skill_id) ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 16536)
-- Name: user_x_sys_role system_clearance_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT system_clearance_fk1 FOREIGN KEY (system_role) REFERENCES public.system_roles(system_role_id) ON DELETE CASCADE;


--
-- TOC entry 3295 (class 2606 OID 16577)
-- Name: user_x_sys_role user_x_sys_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_x_sys_role
    ADD CONSTRAINT user_x_sys_role_fk FOREIGN KEY (account) REFERENCES public.accounts(account_id) ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 16541)
-- Name: users users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk FOREIGN KEY (department) REFERENCES public.departments(dep_id) ON DELETE SET NULL;


--
-- TOC entry 3297 (class 2606 OID 16546)
-- Name: users users_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_fk1 FOREIGN KEY ("position") REFERENCES public.positions(pos_id) ON DELETE SET NULL;


-- Completed on 2022-12-17 12:46:32

--
-- PostgreSQL database dump complete
--

