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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    has_supermassive_black_hole boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    is_spherical boolean,
    has_atmosphere boolean,
    orbital_period_days numeric,
    discovery_year integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    has_life boolean,
    is_spherical boolean,
    distance_from_star numeric,
    orbital_period_days integer,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50),
    is_main_sequence boolean,
    mass_in_solar_masses numeric,
    temperature_kelvin integer,
    age_in_millions_of_years integer
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
-- Name: telescope; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescope (
    telescope_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    year_built integer,
    is_operational boolean
);


ALTER TABLE public.telescope OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescope_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescope_telescope_id_seq OWNED BY public.telescope.telescope_id;


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
-- Name: telescope telescope_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescope_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', true, 0, 13600, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'galaxy1', 'Spiral', true, 2537000, 10000, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'galaxy2', 'Spiral', false, 2730000, 11000, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'galaxy3', 'Spiral', true, 23000000, 400, 'Grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'galaxy4', 'Lenticular', true, 29300000, 13000, 'Known for its bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'galaxy5', 'Lenticular', false, 500000000, 200, 'Formed by galactic collision');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 3, 3474, true, false, 27.3, 1610);
INSERT INTO public.moon VALUES (2, 'moon2', 4, 22, false, false, 0.32, 1877);
INSERT INTO public.moon VALUES (3, 'moon3', 4, 12, false, false, 1.26, 1877);
INSERT INTO public.moon VALUES (4, 'moon4', 5, 3643, true, false, 1.77, 1610);
INSERT INTO public.moon VALUES (5, 'moon5', 5, 3122, true, false, 3.55, 1610);
INSERT INTO public.moon VALUES (6, 'moon6', 5, 5268, true, false, 7.15, 1610);
INSERT INTO public.moon VALUES (7, 'moon7', 5, 4821, true, false, 16.69, 1610);
INSERT INTO public.moon VALUES (8, 'moon8', 6, 5150, true, true, 15.95, 1655);
INSERT INTO public.moon VALUES (9, 'moon9', 6, 504, true, false, 1.37, 1789);
INSERT INTO public.moon VALUES (10, 'moon10', 6, 396, true, false, 0.94, 1789);
INSERT INTO public.moon VALUES (11, 'moon11', 6, 1527, true, false, 4.52, 1672);
INSERT INTO public.moon VALUES (12, 'moon12', 6, 1469, true, false, 79.32, 1671);
INSERT INTO public.moon VALUES (13, 'moon13', 7, 1578, true, false, 8.71, 1787);
INSERT INTO public.moon VALUES (14, 'moon14', 7, 1523, true, false, 13.46, 1787);
INSERT INTO public.moon VALUES (15, 'moon15', 7, 471, true, false, 1.41, 1948);
INSERT INTO public.moon VALUES (16, 'moon16', 7, 1158, true, false, 2.52, 1851);
INSERT INTO public.moon VALUES (17, 'moon17', 7, 1169, true, false, 4.14, 1851);
INSERT INTO public.moon VALUES (18, 'moon18', 8, 2707, true, true, 5.88, 1846);
INSERT INTO public.moon VALUES (19, 'moon19', 8, 340, false, false, 360.13, 1949);
INSERT INTO public.moon VALUES (20, 'moon20', 8, 420, false, false, 1.12, 1989);
INSERT INTO public.moon VALUES (21, 'moon21', 8, 66, false, false, 0.29, 1989);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 57.9, 88, 'Smallest planet in the Solar System');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 108.2, 225, 'Hottest planet due to greenhouse effect');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 149.6, 365, 'Only known planet with life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 227.9, 687, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 778.5, 4333, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 1434.0, 10759, 'Famous for its ring system');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 2871.0, 30687, 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 4495.0, 60190, 'Most distant planet from the Sun');
INSERT INTO public.planet VALUES (9, 'planet1', 4, 'Terrestrial', false, true, 7.5, 11, 'Orbits within habitable zone');
INSERT INTO public.planet VALUES (10, 'planet2', 2, 'Super-Earth', false, true, 15.0, 290, 'First planet found in habitable zone');
INSERT INTO public.planet VALUES (11, 'planet3', 5, 'Gas Giant', false, true, 5.0, 2, 'One of the darkest known exoplanets');
INSERT INTO public.planet VALUES (12, 'planet4', 3, 'Gas Giant', false, true, 8.0, 4, 'First exoplanet found around a Sun-like star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', true, 1.0, 5778, 4600);
INSERT INTO public.star VALUES (2, 'star1', 1, 'A-type', true, 2.1, 9940, 240);
INSERT INTO public.star VALUES (3, 'star2', 1, 'G-type', true, 1.1, 5790, 4850);
INSERT INTO public.star VALUES (4, 'star3', 1, 'Red Dwarf', true, 0.12, 3042, 4850);
INSERT INTO public.star VALUES (5, 'star4', 1, 'Red Supergiant', false, 16.5, 3500, 10);
INSERT INTO public.star VALUES (6, 'star5', 2, 'Blue Supergiant', false, 20.0, 20000, 8);


--
-- Data for Name: telescope; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescope VALUES (1, 'Hubble', 'Low Earth Orbit', 1990, true);
INSERT INTO public.telescope VALUES (2, 'James Webb', 'L2 Orbit', 2021, true);
INSERT INTO public.telescope VALUES (3, 'Very Large Telescope', 'Chile', 1998, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescope_telescope_id_seq', 3, true);


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
-- Name: telescope telescope_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_name_key UNIQUE (name);


--
-- Name: telescope telescope_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_pkey PRIMARY KEY (telescope_id);


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

