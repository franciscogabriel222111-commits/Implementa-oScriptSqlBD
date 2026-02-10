--
-- PostgreSQL database dump
--

\restrict ddCWMczyjogV5DhicPDeptdByjpxeB8dDpIMTedhSdQXjp5OwJneQ4ewm4ek5Bm

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-10 01:37:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16403)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id_aluno integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16402)
-- Name: aluno_id_aluno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aluno_id_aluno_seq OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 219
-- Name: aluno_id_aluno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_aluno_seq OWNED BY public.aluno.id_aluno;


--
-- TOC entry 224 (class 1259 OID 16427)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id_curso integer NOT NULL,
    titulo character varying(150) NOT NULL,
    descricao text,
    preco numeric(10,2) DEFAULT 0.00,
    data_criacao date DEFAULT CURRENT_DATE,
    id_instrutor integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16426)
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curso_id_curso_seq OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 223
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_curso_seq OWNED BY public.curso.id_curso;


--
-- TOC entry 222 (class 1259 OID 16416)
-- Name: instrutor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrutor (
    id_instrutor integer NOT NULL,
    nome character varying(100) NOT NULL,
    especialidade character varying(100),
    minibiografia text
);


ALTER TABLE public.instrutor OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16415)
-- Name: instrutor_id_instrutor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrutor_id_instrutor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrutor_id_instrutor_seq OWNER TO postgres;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 221
-- Name: instrutor_id_instrutor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrutor_id_instrutor_seq OWNED BY public.instrutor.id_instrutor;


--
-- TOC entry 228 (class 1259 OID 16462)
-- Name: licao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licao (
    id_licao integer NOT NULL,
    titulo character varying(150) NOT NULL,
    tipo_conteudo character varying(50) NOT NULL,
    url_video text,
    texto text,
    ordem integer NOT NULL,
    id_modulo integer NOT NULL
);


ALTER TABLE public.licao OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16461)
-- Name: licao_id_licao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licao_id_licao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.licao_id_licao_seq OWNER TO postgres;

--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 227
-- Name: licao_id_licao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licao_id_licao_seq OWNED BY public.licao.id_licao;


--
-- TOC entry 229 (class 1259 OID 16480)
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    id_aluno integer NOT NULL,
    id_curso integer NOT NULL,
    data_matricula date DEFAULT CURRENT_DATE,
    status_matricula character varying(20) DEFAULT 'Ativo'::character varying
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16446)
-- Name: modulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulo (
    id_modulo integer NOT NULL,
    nome character varying(100) NOT NULL,
    ordem integer NOT NULL,
    id_curso integer NOT NULL
);


ALTER TABLE public.modulo OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16445)
-- Name: modulo_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulo_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulo_id_modulo_seq OWNER TO postgres;

--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 225
-- Name: modulo_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulo_id_modulo_seq OWNED BY public.modulo.id_modulo;


--
-- TOC entry 231 (class 1259 OID 16500)
-- Name: progresso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progresso (
    id_progresso integer NOT NULL,
    data_conclusao date DEFAULT CURRENT_DATE,
    percentual_concluido numeric(5,2) DEFAULT 0.00,
    id_aluno integer NOT NULL,
    id_licao integer NOT NULL
);


ALTER TABLE public.progresso OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16499)
-- Name: progresso_id_progresso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progresso_id_progresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.progresso_id_progresso_seq OWNER TO postgres;

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 230
-- Name: progresso_id_progresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progresso_id_progresso_seq OWNED BY public.progresso.id_progresso;


--
-- TOC entry 4885 (class 2604 OID 16406)
-- Name: aluno id_aluno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id_aluno SET DEFAULT nextval('public.aluno_id_aluno_seq'::regclass);


--
-- TOC entry 4887 (class 2604 OID 16430)
-- Name: curso id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id_curso SET DEFAULT nextval('public.curso_id_curso_seq'::regclass);


--
-- TOC entry 4886 (class 2604 OID 16419)
-- Name: instrutor id_instrutor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrutor ALTER COLUMN id_instrutor SET DEFAULT nextval('public.instrutor_id_instrutor_seq'::regclass);


--
-- TOC entry 4891 (class 2604 OID 16465)
-- Name: licao id_licao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licao ALTER COLUMN id_licao SET DEFAULT nextval('public.licao_id_licao_seq'::regclass);


--
-- TOC entry 4890 (class 2604 OID 16449)
-- Name: modulo id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo ALTER COLUMN id_modulo SET DEFAULT nextval('public.modulo_id_modulo_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 16503)
-- Name: progresso id_progresso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso ALTER COLUMN id_progresso SET DEFAULT nextval('public.progresso_id_progresso_seq'::regclass);


--
-- TOC entry 5068 (class 0 OID 16403)
-- Dependencies: 220
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aluno (id_aluno, nome, email, senha) FROM stdin;
1	Marcos Henrique	marcos@email.com	123
2	Ray William	ray@email.com	123
3	Ivo da Silva	ivo@email.com	123
\.


--
-- TOC entry 5072 (class 0 OID 16427)
-- Dependencies: 224
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (id_curso, titulo, descricao, preco, data_criacao, id_instrutor) FROM stdin;
1	Banco de Dados	\N	0.00	2026-01-30	1
2	Python Avançado	\N	50.00	2026-01-30	1
\.


--
-- TOC entry 5070 (class 0 OID 16416)
-- Dependencies: 222
-- Data for Name: instrutor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrutor (id_instrutor, nome, especialidade, minibiografia) FROM stdin;
1	Francisco Gabriel	Backend	Especialista em Java e Python
\.


--
-- TOC entry 5076 (class 0 OID 16462)
-- Dependencies: 228
-- Data for Name: licao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licao (id_licao, titulo, tipo_conteudo, url_video, texto, ordem, id_modulo) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 16480)
-- Dependencies: 229
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matricula (id_aluno, id_curso, data_matricula, status_matricula) FROM stdin;
1	1	2026-01-30	Ativo
1	2	2026-01-30	Ativo
2	1	2026-01-30	Ativo
\.


--
-- TOC entry 5074 (class 0 OID 16446)
-- Dependencies: 226
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulo (id_modulo, nome, ordem, id_curso) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 16500)
-- Dependencies: 231
-- Data for Name: progresso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progresso (id_progresso, data_conclusao, percentual_concluido, id_aluno, id_licao) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 219
-- Name: aluno_id_aluno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_id_aluno_seq', 6, true);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 223
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_curso_seq', 2, true);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 221
-- Name: instrutor_id_instrutor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrutor_id_instrutor_seq', 1, true);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 227
-- Name: licao_id_licao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licao_id_licao_seq', 1, false);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 225
-- Name: modulo_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulo_id_modulo_seq', 1, false);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 230
-- Name: progresso_id_progresso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progresso_id_progresso_seq', 1, false);


--
-- TOC entry 4898 (class 2606 OID 16414)
-- Name: aluno aluno_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_email_key UNIQUE (email);


--
-- TOC entry 4900 (class 2606 OID 16412)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id_aluno);


--
-- TOC entry 4904 (class 2606 OID 16439)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 4902 (class 2606 OID 16425)
-- Name: instrutor instrutor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrutor
    ADD CONSTRAINT instrutor_pkey PRIMARY KEY (id_instrutor);


--
-- TOC entry 4908 (class 2606 OID 16474)
-- Name: licao licao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licao
    ADD CONSTRAINT licao_pkey PRIMARY KEY (id_licao);


--
-- TOC entry 4910 (class 2606 OID 16488)
-- Name: matricula matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id_aluno, id_curso);


--
-- TOC entry 4906 (class 2606 OID 16455)
-- Name: modulo modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id_modulo);


--
-- TOC entry 4912 (class 2606 OID 16510)
-- Name: progresso progresso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso
    ADD CONSTRAINT progresso_pkey PRIMARY KEY (id_progresso);


--
-- TOC entry 4913 (class 2606 OID 16440)
-- Name: curso curso_id_instrutor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_id_instrutor_fkey FOREIGN KEY (id_instrutor) REFERENCES public.instrutor(id_instrutor);


--
-- TOC entry 4915 (class 2606 OID 16475)
-- Name: licao licao_id_modulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licao
    ADD CONSTRAINT licao_id_modulo_fkey FOREIGN KEY (id_modulo) REFERENCES public.modulo(id_modulo);


--
-- TOC entry 4916 (class 2606 OID 16489)
-- Name: matricula matricula_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.aluno(id_aluno);


--
-- TOC entry 4917 (class 2606 OID 16494)
-- Name: matricula matricula_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- TOC entry 4914 (class 2606 OID 16456)
-- Name: modulo modulo_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT modulo_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);


--
-- TOC entry 4918 (class 2606 OID 16511)
-- Name: progresso progresso_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso
    ADD CONSTRAINT progresso_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.aluno(id_aluno);


--
-- TOC entry 4919 (class 2606 OID 16516)
-- Name: progresso progresso_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso
    ADD CONSTRAINT progresso_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licao(id_licao);


-- Completed on 2026-02-10 01:37:59

--
-- PostgreSQL database dump complete
--

\unrestrict ddCWMczyjogV5DhicPDeptdByjpxeB8dDpIMTedhSdQXjp5OwJneQ4ewm4ek5Bm

