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
    name character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    distance_from_earth_lightyears_million numeric NOT NULL,
    constellation character varying(20),
    notes text
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
    name character varying(20) NOT NULL,
    orbital_period_days integer NOT NULL,
    distance_from_planet_km numeric,
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying,
    constellation character varying,
    is_supernovaremnant boolean
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebulae_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulae_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulae_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebulae_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulae_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    radius_km numeric NOT NULL,
    has_life boolean,
    star_id integer,
    orbital_period_years integer
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
    name character varying(20) NOT NULL,
    distance_from_earth_lightyears numeric NOT NULL,
    class character varying(5),
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebulae_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Sagittarius', 'The galaxy that contains the Sun and Solar System, therfore Earth');
INSERT INTO public.galaxy VALUES (3, 'Backward', 'Spiral', 200, 'Centaurus', 'Also known as NGC 4622, is known to appear to rotate backwards');
INSERT INTO public.galaxy VALUES (4, 'Butterfly Galaxies', 'Spiral', 60, 'Virgo', 'Also known as NGC 4567 and NGC 4568, they look like a butterfly');
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'Starburst', 12, 'Ursa Major', 'Also known as Messier 82, M82 or NGC 3034, it appears to look like a cigar');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular Ring', 500, 'Sculptor', 'Also known as ESO 350-40 or PGC 2248, it appears to look like a spoked cartwheel');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.5, 'Andromeda', 'The closest big galaxy to the Milkyway and is expected to collide with it in 4.5 billion years');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 27, 384399, 3);
INSERT INTO public.moon VALUES (22, 'Io', 2, 421600, 5);
INSERT INTO public.moon VALUES (23, 'Europa', 4, 670900, 5);
INSERT INTO public.moon VALUES (24, 'Ganymede', 7, 1070400, 5);
INSERT INTO public.moon VALUES (25, 'Calisto', 17, 1882700, 5);
INSERT INTO public.moon VALUES (26, 'Mimas', 1, 185520, 6);
INSERT INTO public.moon VALUES (27, 'Enceladus', 1, 237948, 6);
INSERT INTO public.moon VALUES (28, 'Tethys', 2, 294619, 6);
INSERT INTO public.moon VALUES (29, 'Dione', 3, 377396, 6);
INSERT INTO public.moon VALUES (30, 'Rhea', 5, 527108, 6);
INSERT INTO public.moon VALUES (31, 'Titan', 16, 1221870, 6);
INSERT INTO public.moon VALUES (32, 'Iapetus', 79, 3560820, 6);
INSERT INTO public.moon VALUES (33, 'Miranda', 1, 129390, 7);
INSERT INTO public.moon VALUES (34, 'Ariel', 3, 190900, 7);
INSERT INTO public.moon VALUES (35, 'Umbriel', 4, 266000, 7);
INSERT INTO public.moon VALUES (36, 'Titania', 9, 436300, 7);
INSERT INTO public.moon VALUES (37, 'Oberon', 14, 583519, 7);
INSERT INTO public.moon VALUES (38, 'Triton', 6, 354759, 8);
INSERT INTO public.moon VALUES (39, 'Charon', 6, 17536, 10);
INSERT INTO public.moon VALUES (40, 'Dysnomia', 16, 37300, 13);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Ant Nebula', 'Planetary', 'Norma', false);
INSERT INTO public.nebula VALUES (2, 'Barnard''s Bubble Nebula', 'Diffuse', 'Sagittarius', false);
INSERT INTO public.nebula VALUES (3, 'Bat Nebula', 'Supernova Remnant', 'Cygnus', true);
INSERT INTO public.nebula VALUES (4, 'Blinking Planetary', 'Planetary', 'Cygnus', true);
INSERT INTO public.nebula VALUES (5, 'Calabash Nebula', 'Protoplanetary', 'Puppis', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440.53, false, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 6051.8, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6378.1366, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3396.19, false, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 71492, false, 1, 12);
INSERT INTO public.planet VALUES (6, 'Saturn', 60268, false, 1, 29);
INSERT INTO public.planet VALUES (7, 'Uranus', 25559, false, 1, 84);
INSERT INTO public.planet VALUES (8, 'Neptune', 24764, false, 1, 165);
INSERT INTO public.planet VALUES (9, 'Ceres', 473, false, 1, 5);
INSERT INTO public.planet VALUES (10, 'Pluto', 1188.3, false, 1, 248);
INSERT INTO public.planet VALUES (11, 'Haumea', 816, false, 1, 284);
INSERT INTO public.planet VALUES (12, 'Makemake', 715, false, 1, 306);
INSERT INTO public.planet VALUES (13, 'Eris', 1163, false, 1, 559);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 'G2', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 9, 'A1', 1);
INSERT INTO public.star VALUES (3, 'Polaris', 430, 'F8', 1);
INSERT INTO public.star VALUES (5, 'AF Andromedae', 2500000, 'LBV', 2);
INSERT INTO public.star VALUES (6, 'Omega Draconis', 76, 'F5V', NULL);
INSERT INTO public.star VALUES (4, 'Godzilla', 10900000000, 'LBV', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: nebulae_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulae_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: nebula nebulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebulae_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_diameter_millionkm_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_diameter_millionkm_key UNIQUE (distance_from_earth_lightyears);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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

