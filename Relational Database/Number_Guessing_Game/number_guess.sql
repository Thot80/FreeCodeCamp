--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_to_guess integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (4, 51, 89, 90);
INSERT INTO public.games VALUES (5, 51, 231, 232);
INSERT INTO public.games VALUES (6, 52, 431, 432);
INSERT INTO public.games VALUES (7, 52, 267, 268);
INSERT INTO public.games VALUES (8, 51, 479, 482);
INSERT INTO public.games VALUES (9, 51, 767, 769);
INSERT INTO public.games VALUES (10, 51, 91, 92);
INSERT INTO public.games VALUES (11, 53, 272, 273);
INSERT INTO public.games VALUES (12, 53, 981, 982);
INSERT INTO public.games VALUES (13, 54, 439, 440);
INSERT INTO public.games VALUES (14, 54, 360, 361);
INSERT INTO public.games VALUES (15, 53, 350, 353);
INSERT INTO public.games VALUES (16, 53, 854, 855);
INSERT INTO public.games VALUES (17, 53, 779, 780);
INSERT INTO public.games VALUES (18, 55, 426, 427);
INSERT INTO public.games VALUES (19, 55, 201, 202);
INSERT INTO public.games VALUES (20, 56, 673, 674);
INSERT INTO public.games VALUES (21, 56, 687, 688);
INSERT INTO public.games VALUES (22, 55, 135, 138);
INSERT INTO public.games VALUES (23, 55, 720, 721);
INSERT INTO public.games VALUES (24, 55, 754, 755);
INSERT INTO public.games VALUES (25, 57, 97, 98);
INSERT INTO public.games VALUES (26, 57, 330, 331);
INSERT INTO public.games VALUES (27, 58, 12, 13);
INSERT INTO public.games VALUES (28, 58, 895, 896);
INSERT INTO public.games VALUES (29, 57, 56, 59);
INSERT INTO public.games VALUES (30, 57, 471, 472);
INSERT INTO public.games VALUES (31, 57, 569, 570);
INSERT INTO public.games VALUES (32, 59, 488, 11);
INSERT INTO public.games VALUES (33, 60, 619, 620);
INSERT INTO public.games VALUES (34, 60, 708, 709);
INSERT INTO public.games VALUES (35, 61, 96, 97);
INSERT INTO public.games VALUES (36, 61, 181, 182);
INSERT INTO public.games VALUES (37, 60, 489, 492);
INSERT INTO public.games VALUES (38, 60, 815, 816);
INSERT INTO public.games VALUES (39, 60, 49, 50);
INSERT INTO public.games VALUES (40, 62, 660, 661);
INSERT INTO public.games VALUES (41, 62, 483, 484);
INSERT INTO public.games VALUES (42, 63, 80, 81);
INSERT INTO public.games VALUES (43, 63, 670, 671);
INSERT INTO public.games VALUES (44, 62, 207, 210);
INSERT INTO public.games VALUES (45, 62, 249, 250);
INSERT INTO public.games VALUES (46, 62, 514, 515);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (51, 'user_1676320049071');
INSERT INTO public.users VALUES (52, 'user_1676320049070');
INSERT INTO public.users VALUES (53, 'user_1676320180747');
INSERT INTO public.users VALUES (54, 'user_1676320180746');
INSERT INTO public.users VALUES (55, 'user_1676320214476');
INSERT INTO public.users VALUES (56, 'user_1676320214475');
INSERT INTO public.users VALUES (57, 'user_1676320334925');
INSERT INTO public.users VALUES (58, 'user_1676320334924');
INSERT INTO public.users VALUES (59, 'toto');
INSERT INTO public.users VALUES (60, 'user_1676320429283');
INSERT INTO public.users VALUES (61, 'user_1676320429282');
INSERT INTO public.users VALUES (62, 'user_1676320691140');
INSERT INTO public.users VALUES (63, 'user_1676320691139');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 46, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 63, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

