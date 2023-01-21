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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km integer,
    mass_kg integer,
    distance_from_center_ua numeric(4,1),
    description text,
    visited boolean,
    has_water boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: metaverse; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.metaverse (
    name character varying(30) NOT NULL,
    metaverse_id integer NOT NULL,
    is_real boolean
);


ALTER TABLE public.metaverse OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    radius_km integer,
    mass_kg integer,
    distance_from_center_ua numeric(4,1),
    description text,
    visited boolean,
    has_water boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    radius_km integer,
    mass_kg integer,
    distance_from_center_ua numeric(4,1),
    description text,
    visited boolean,
    has_water boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    radius_km integer,
    mass_kg integer,
    distance_from_center_ua numeric(4,1),
    description text,
    visited boolean,
    has_water boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 1, 1, 1.0, 'lorem Ipsum', true, true);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 2, 2, 2.0, 'lorem Ipsum', true, true);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 3, 3, 3.0, 'lorem ipsum', true, true);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 4, 4, 4.0, 'loremipsum', true, true);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 5, 5, 5.0, 'loremipsum', true, true);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 6, 6, 6.0, 'lorem', true, true);


--
-- Data for Name: metaverse; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.metaverse VALUES ('meta1', 1, true);
INSERT INTO public.metaverse VALUES ('meta2', 2, false);
INSERT INTO public.metaverse VALUES ('meta3', 3, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'star1', 1, 1, 1.0, 'lorem', false, false, 25);
INSERT INTO public.moon VALUES (2, 'star2', 2, 2, 2.0, 'lorem Ipsum', true, true, 25);
INSERT INTO public.moon VALUES (3, 'star3', 3, 3, 3.0, 'lorem ipsum', true, true, 25);
INSERT INTO public.moon VALUES (4, 'star4', 4, 4, 4.0, 'loremipsum', true, true, 25);
INSERT INTO public.moon VALUES (5, 'star5', 5, 5, 5.0, 'loremipsum', true, true, 26);
INSERT INTO public.moon VALUES (6, 'star6', 6, 6, 6.0, 'lorem', true, true, 26);
INSERT INTO public.moon VALUES (7, 'planet1', 1, 1, 1.0, 'lorem', true, false, 26);
INSERT INTO public.moon VALUES (8, 'planet2', 2, 2, 2.0, 'lorem', true, true, 27);
INSERT INTO public.moon VALUES (9, 'planet3', 3, 3, 3.0, 'lorem', true, false, 26);
INSERT INTO public.moon VALUES (10, 'planet4', 4, 4, 4.0, 'lorem', false, false, 26);
INSERT INTO public.moon VALUES (11, 'planet5', 5, 5, 5.0, 'lorem', false, true, 27);
INSERT INTO public.moon VALUES (12, 'planet6', 6, 6, 6.0, 'lorem', true, true, 27);
INSERT INTO public.moon VALUES (13, 'star21', 1, 1, 1.0, 'lorem', false, false, 30);
INSERT INTO public.moon VALUES (14, 'star20', 2, 2, 2.0, 'lorem Ipsum', true, true, 30);
INSERT INTO public.moon VALUES (15, 'star30', 3, 3, 3.0, 'lorem ipsum', true, true, 31);
INSERT INTO public.moon VALUES (16, 'star42', 4, 4, 4.0, 'loremipsum', true, true, 36);
INSERT INTO public.moon VALUES (17, 'star50', 5, 5, 5.0, 'loremipsum', true, true, 36);
INSERT INTO public.moon VALUES (18, 'star60', 6, 6, 6.0, 'lorem', true, true, 36);
INSERT INTO public.moon VALUES (19, 'planet10', 1, 1, 1.0, 'lorem', true, false, 34);
INSERT INTO public.moon VALUES (20, 'planet02', 2, 2, 2.0, 'lorem', true, true, 27);
INSERT INTO public.moon VALUES (21, 'planet30', 3, 3, 3.0, 'lorem', true, false, 32);
INSERT INTO public.moon VALUES (22, 'planet40', 4, 4, 4.0, 'lorem', false, false, 32);
INSERT INTO public.moon VALUES (23, 'planet51', 5, 5, 5.0, 'lorem', false, true, 28);
INSERT INTO public.moon VALUES (24, 'planet60', 6, 6, 6.0, 'lorem', true, true, 27);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'star1', 1, 1, 1.0, 'lorem', false, false, 5);
INSERT INTO public.planet VALUES (26, 'star2', 2, 2, 2.0, 'lorem Ipsum', true, true, 5);
INSERT INTO public.planet VALUES (27, 'star3', 3, 3, 3.0, 'lorem ipsum', true, true, 5);
INSERT INTO public.planet VALUES (28, 'star4', 4, 4, 4.0, 'loremipsum', true, true, 5);
INSERT INTO public.planet VALUES (29, 'star5', 5, 5, 5.0, 'loremipsum', true, true, 5);
INSERT INTO public.planet VALUES (30, 'star6', 6, 6, 6.0, 'lorem', true, true, 6);
INSERT INTO public.planet VALUES (31, 'planet1', 1, 1, 1.0, 'lorem', true, false, 6);
INSERT INTO public.planet VALUES (32, 'planet2', 2, 2, 2.0, 'lorem', true, true, 5);
INSERT INTO public.planet VALUES (33, 'planet3', 3, 3, 3.0, 'lorem', true, false, 6);
INSERT INTO public.planet VALUES (34, 'planet4', 4, 4, 4.0, 'lorem', false, false, 6);
INSERT INTO public.planet VALUES (35, 'planet5', 5, 5, 5.0, 'lorem', false, true, 5);
INSERT INTO public.planet VALUES (36, 'planet6', 6, 6, 6.0, 'lorem', true, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'star1', 1, 1, 1.0, 'lorem', false, false, 1);
INSERT INTO public.star VALUES (6, 'star2', 2, 2, 2.0, 'lorem Ipsum', true, true, 2);
INSERT INTO public.star VALUES (7, 'star3', 3, 3, 3.0, 'lorem ipsum', true, true, 3);
INSERT INTO public.star VALUES (8, 'star4', 4, 4, 4.0, 'loremipsum', true, true, 1);
INSERT INTO public.star VALUES (9, 'star5', 5, 5, 5.0, 'loremipsum', true, true, 5);
INSERT INTO public.star VALUES (10, 'star6', 6, 6, 6.0, 'lorem', true, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: metaverse metaverse_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.metaverse
    ADD CONSTRAINT metaverse_name_key UNIQUE (name);


--
-- Name: metaverse metaverse_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.metaverse
    ADD CONSTRAINT metaverse_pkey PRIMARY KEY (metaverse_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

