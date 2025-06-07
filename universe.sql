--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    age_in_millions_of_years integer,
    distance_from_earth integer,
    size character varying(1),
    discovered_by character varying(30)
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
-- Name: lifeform; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.lifeform (
    lifeform_id integer NOT NULL,
    name character varying(30) NOT NULL,
    colour text,
    size integer
);


ALTER TABLE public.lifeform OWNER TO freecodecamp;

--
-- Name: liforms_lifeorm_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.liforms_lifeorm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liforms_lifeorm_id_seq OWNER TO freecodecamp;

--
-- Name: liforms_lifeorm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.liforms_lifeorm_id_seq OWNED BY public.lifeform.lifeform_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    distance_from_planet_km numeric(8,1),
    planet_id integer,
    lifeform_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    has_life boolean,
    distance_from_star_km numeric(8,1),
    star_id integer,
    lifeform_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_id integer,
    discovered_by character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: lifeform lifeform_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform ALTER COLUMN lifeform_id SET DEFAULT nextval('public.liforms_lifeorm_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alpha', 4300, 234234, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Beta', 324, 234, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Gamma', 5345, 34534, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Delta', 430340, 23784234, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Epsilon', 37824, 28734, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Zeta', 582345, 3453734, NULL, NULL);


--
-- Data for Name: lifeform; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.lifeform VALUES (1, 'Human', NULL, NULL);
INSERT INTO public.lifeform VALUES (2, 'Jedi', NULL, NULL);
INSERT INTO public.lifeform VALUES (3, 'Cow', NULL, NULL);
INSERT INTO public.lifeform VALUES (4, 'Moose', NULL, NULL);
INSERT INTO public.lifeform VALUES (5, 'Tree Frog', NULL, NULL);
INSERT INTO public.lifeform VALUES (6, 'Yoda', NULL, NULL);
INSERT INTO public.lifeform VALUES (7, 'Klingon', NULL, NULL);
INSERT INTO public.lifeform VALUES (8, 'Vulcan', NULL, NULL);
INSERT INTO public.lifeform VALUES (9, 'Fish', NULL, NULL);
INSERT INTO public.lifeform VALUES (10, 'Whale', NULL, NULL);
INSERT INTO public.lifeform VALUES (11, 'Shark', NULL, NULL);
INSERT INTO public.lifeform VALUES (12, 'Flower', NULL, NULL);
INSERT INTO public.lifeform VALUES (13, 'Martian', NULL, NULL);
INSERT INTO public.lifeform VALUES (14, 'Kryptonian', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 465, 1, false, 1.0, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Vince', 45, 1, false, 4.0, 1, NULL);
INSERT INTO public.moon VALUES (3, 'Phaser', 345, 1, false, 1.0, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Corona', 245, 1, false, 1.0, 2, NULL);
INSERT INTO public.moon VALUES (5, 'Iona', 245, 1, false, 1.0, 2, NULL);
INSERT INTO public.moon VALUES (6, 'Noir', 45, 1, false, 4.0, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Phasered', 545, 1, false, 1.0, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Acorona', 545, 1, false, 1.0, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Dona', 545, 1, false, 1.0, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Moon 43', 645, 1, false, 4.0, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Nottz', 745, 1, false, 1.0, 7, NULL);
INSERT INTO public.moon VALUES (12, 'Scorona', 745, 1, false, 1.0, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Booona', 6545, 1, false, 1.0, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Moon 4311', 4115, 1, false, 4.0, 11, NULL);
INSERT INTO public.moon VALUES (15, 'Zottz', 745, 1, false, 1.0, 9, NULL);
INSERT INTO public.moon VALUES (16, 'Zcorona', 745, 1, false, 1.0, 9, NULL);
INSERT INTO public.moon VALUES (17, 'Zooona', 9545, 1, false, 1.0, 9, NULL);
INSERT INTO public.moon VALUES (18, 'Moon x 1011', 410105, 1, false, 4.0, 10, NULL);
INSERT INTO public.moon VALUES (19, 'Xottx', 745, 1, false, 1.0, 8, NULL);
INSERT INTO public.moon VALUES (20, 'Xorona', 745, 1, false, 1.0, 7, NULL);
INSERT INTO public.moon VALUES (21, 'Xooona', 1245, 1, false, 1.0, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 46, 0, true, 93000.0, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 46, 1, true, 56400.0, 1, 13);
INSERT INTO public.planet VALUES (3, 'Venus', 46, 0, false, 0.0, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Planet 47', 46, 0, false, 4400.0, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Flugel', 436, 0, false, 3300.0, 3, NULL);
INSERT INTO public.planet VALUES (6, 'Hyaboon', 42226, 1, true, 562400.0, 2, NULL);
INSERT INTO public.planet VALUES (7, 'Cleanus', 46, 0, false, 0.0, 6, NULL);
INSERT INTO public.planet VALUES (8, 'Cascade', 446, 0, false, 47400.0, 5, NULL);
INSERT INTO public.planet VALUES (9, 'Saaz', 436, 0, false, 3300.0, 4, NULL);
INSERT INTO public.planet VALUES (10, 'Gontomn', 445326, 5, true, 5663400.0, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Crytonic', 496, 0, false, 6600.0, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Altmus', 46646, 0, false, 47770.0, 5, NULL);
INSERT INTO public.planet VALUES (13, 'Trask', 4356, 0, false, 33500.0, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 45645, 93000000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Steve', 45775645, 93545, 2, NULL);
INSERT INTO public.star VALUES (3, 'Star Name #57', 475645, 96700, 3, NULL);
INSERT INTO public.star VALUES (4, 'Untitled', 477546, 4545000, 4, NULL);
INSERT INTO public.star VALUES (5, 'Sun II', 456645, 75640000, 5, NULL);
INSERT INTO public.star VALUES (6, 'Ryder', 77435, 345500, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: liforms_lifeorm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.liforms_lifeorm_id_seq', 14, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: lifeform liforms_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform
    ADD CONSTRAINT liforms_pkey PRIMARY KEY (lifeform_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: lifeform unique_lifeform; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lifeform
    ADD CONSTRAINT unique_lifeform UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

