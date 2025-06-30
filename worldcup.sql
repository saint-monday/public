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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 494, 495, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 496, 497, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 495, 497, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 494, 496, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 495, 498, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 497, 499, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 496, 500, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 494, 501, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 497, 502, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 499, 503, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 496, 504, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 500, 505, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 495, 506, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 498, 507, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 501, 508, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 494, 509, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 510, 509, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 511, 500, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 509, 511, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 510, 500, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 511, 512, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 509, 496, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 500, 502, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 510, 494, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 500, 513, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 502, 501, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 494, 514, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 510, 515, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 511, 505, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 512, 516, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 509, 503, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 496, 517, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (494, 'France');
INSERT INTO public.teams VALUES (495, 'Croatia');
INSERT INTO public.teams VALUES (496, 'Belgium');
INSERT INTO public.teams VALUES (497, 'England');
INSERT INTO public.teams VALUES (498, 'Russia');
INSERT INTO public.teams VALUES (499, 'Sweden');
INSERT INTO public.teams VALUES (500, 'Brazil');
INSERT INTO public.teams VALUES (501, 'Uruguay');
INSERT INTO public.teams VALUES (502, 'Colombia');
INSERT INTO public.teams VALUES (503, 'Switzerland');
INSERT INTO public.teams VALUES (504, 'Japan');
INSERT INTO public.teams VALUES (505, 'Mexico');
INSERT INTO public.teams VALUES (506, 'Denmark');
INSERT INTO public.teams VALUES (507, 'Spain');
INSERT INTO public.teams VALUES (508, 'Portugal');
INSERT INTO public.teams VALUES (509, 'Argentina');
INSERT INTO public.teams VALUES (510, 'Germany');
INSERT INTO public.teams VALUES (511, 'Netherlands');
INSERT INTO public.teams VALUES (512, 'Costa Rica');
INSERT INTO public.teams VALUES (513, 'Chile');
INSERT INTO public.teams VALUES (514, 'Nigeria');
INSERT INTO public.teams VALUES (515, 'Algeria');
INSERT INTO public.teams VALUES (516, 'Greece');
INSERT INTO public.teams VALUES (517, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 517, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: teams teams_team_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_key UNIQUE (name);


--
-- Name: games opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

