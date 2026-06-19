--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: artificial_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.artificial_planet (
    artificial_planet_id integer NOT NULL,
    made_by_planet character varying(30),
    is_livable boolean,
    name character varying(30) NOT NULL
);


ALTER TABLE public.artificial_planet OWNER TO freecodecamp;

--
-- Name: artificial_planet_ap_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.artificial_planet_ap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artificial_planet_ap_id_seq OWNER TO freecodecamp;

--
-- Name: artificial_planet_ap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.artificial_planet_ap_id_seq OWNED BY public.artificial_planet.artificial_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_of_planets integer,
    age_in_millions_of_years integer,
    planet_types text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_planet numeric(100,10),
    age_in_millions_of_years numeric(100,10),
    planet_id integer
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
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_ily numeric(100,10),
    star_id integer
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
    num_of_planets integer,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer NOT NULL
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
-- Name: artificial_planet artificial_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_planet ALTER COLUMN artificial_planet_id SET DEFAULT nextval('public.artificial_planet_ap_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: artificial_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.artificial_planet VALUES (1, 'Terra Nova', true, 'Aetherion');
INSERT INTO public.artificial_planet VALUES (2, 'Zyphos', false, 'Oblivara');
INSERT INTO public.artificial_planet VALUES (3, 'Xenora', true, 'Lumina Prime');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Antomedia', 12090, 7400, 'LEVEL 03');
INSERT INTO public.galaxy VALUES (2, 'MILKY WAY', 10000, 400, 'LEVEL 01');
INSERT INTO public.galaxy VALUES (3, 'AKUNUGALAXY', 12000, 870, 'LEVEL 02');
INSERT INTO public.galaxy VALUES (4, 'DEMPASAN', 14000, 210, 'LEVEL 08');
INSERT INTO public.galaxy VALUES (5, 'STARWARS', 12000, 240, 'LEVEL 18');
INSERT INTO public.galaxy VALUES (6, 'BENTEN', 124000, 440, 'LEVEL 8');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lunaris', 384400.1234567890, 4520.5000000000, 1);
INSERT INTO public.moon VALUES (2, 'Selena', 120000.5678901234, 3100.2500000000, 2);
INSERT INTO public.moon VALUES (3, 'Nyx', 54000.1234500000, 1200.0000000000, 3);
INSERT INTO public.moon VALUES (4, 'Eclipse', 780000.9999999999, 5000.7500000000, 1);
INSERT INTO public.moon VALUES (5, 'Orbitia', 230000.1111111111, 2700.3300000000, 2);
INSERT INTO public.moon VALUES (7, 'Pharos', 99000.4444444444, 1800.9000000000, 3);
INSERT INTO public.moon VALUES (8, 'Titanis', 145000.2222222222, 3900.1200000000, 1);
INSERT INTO public.moon VALUES (9, 'Dracon', 600000.3333333333, 4100.4500000000, 2);
INSERT INTO public.moon VALUES (10, 'Astra', 320000.8765432100, 2200.6000000000, 3);
INSERT INTO public.moon VALUES (11, 'Virelia', 410000.6543210000, 3300.7700000000, 1);
INSERT INTO public.moon VALUES (12, 'Cryon', 275000.1231231231, 1500.3000000000, 2);
INSERT INTO public.moon VALUES (13, 'Zephra', 89000.9999999999, 900.4500000000, 3);
INSERT INTO public.moon VALUES (14, 'Orionis', 500000.1111111111, 4800.8800000000, 1);
INSERT INTO public.moon VALUES (15, 'Lumora', 360000.2222222222, 2600.9900000000, 2);
INSERT INTO public.moon VALUES (16, 'Nebulae', 710000.3333333333, 5200.1100000000, 3);
INSERT INTO public.moon VALUES (17, 'Cryxis', 125000.4444444444, 1400.2200000000, 1);
INSERT INTO public.moon VALUES (18, 'Solara', 640000.5555555555, 3600.3300000000, 2);
INSERT INTO public.moon VALUES (19, 'Umbra', 98000.6666666666, 800.4400000000, 3);
INSERT INTO public.moon VALUES (20, 'Galexia', 450000.7777777777, 2900.5500000000, 1);
INSERT INTO public.moon VALUES (21, 'Vortexa', 300000.8888888888, 3100.6600000000, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'EARTH', true, true, 218438.0000000000, 1);
INSERT INTO public.planet VALUES (2, 'MARS', false, false, 218438.0000000000, 1);
INSERT INTO public.planet VALUES (3, 'Namaste', false, false, 732413.0000000000, 3);
INSERT INTO public.planet VALUES (4, 'Congor', false, false, 134323.0000000000, 5);
INSERT INTO public.planet VALUES (5, 'DAMIAN', false, true, 434323.0000000000, 3);
INSERT INTO public.planet VALUES (6, 'URANAS', false, true, 134323.0000000000, 1);
INSERT INTO public.planet VALUES (7, 'CRYPTO', false, true, 134323.0000000000, 5);
INSERT INTO public.planet VALUES (8, 'NOEL', true, true, 134323.0000000000, 2);
INSERT INTO public.planet VALUES (9, 'KRYPTON', true, true, 234323.0000000000, 5);
INSERT INTO public.planet VALUES (10, 'LIME', true, false, 124353.0000000000, 4);
INSERT INTO public.planet VALUES (11, 'COCO', false, false, 53233.0000000000, 3);
INSERT INTO public.planet VALUES (12, 'CATS', true, true, 253233.0000000000, 2);
INSERT INTO public.planet VALUES (13, 'MARKII', true, true, 2253233.0000000000, 4);
INSERT INTO public.planet VALUES (14, 'DARKV', false, false, 8124353.0000000000, 3);
INSERT INTO public.planet VALUES (15, 'Xenora', false, true, 984321.0000000000, 1);
INSERT INTO public.planet VALUES (16, 'Zyphos', false, true, 1298432.0000000000, 1);
INSERT INTO public.planet VALUES (17, 'Terra Nova', true, true, 0.0000000000, 3);
INSERT INTO public.planet VALUES (18, 'Krylon', false, true, 782193.0000000000, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 9, 'SUN', 2, 921388);
INSERT INTO public.star VALUES (2, 19, 'ANTROPIC', 1, 21388);
INSERT INTO public.star VALUES (3, 4, 'NOTCOHESIA', 5, 129482);
INSERT INTO public.star VALUES (4, 1, 'ITHIPOIA', 4, 1294282);
INSERT INTO public.star VALUES (5, 76, 'DARN', 3, 11294282);
INSERT INTO public.star VALUES (6, 10, 'NOEL', 4, 1284647);


--
-- Name: artificial_planet_ap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.artificial_planet_ap_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: artificial_planet artificial_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_planet
    ADD CONSTRAINT artificial_planet_name_key UNIQUE (name);


--
-- Name: artificial_planet artificial_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.artificial_planet
    ADD CONSTRAINT artificial_planet_pkey PRIMARY KEY (artificial_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

