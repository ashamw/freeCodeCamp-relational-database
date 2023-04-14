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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_in_cm numeric,
    family text,
    exist boolean,
    is_that_near_earth boolean,
    discovered_year integer,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    diameter_in_cm numeric,
    family text,
    no_of_lakes_present integer,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_cm numeric,
    family text,
    position_no_from_the_sun numeric,
    age_in_millions_of_years integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_cm numeric,
    family text,
    no_of_stars boolean,
    belonging_galaxy_name character varying(60),
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    diameter_in_cm numeric,
    family text,
    age_in_millions_of_years integer,
    name character varying(40) NOT NULL,
    sun_id integer NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milkyway', 1, 3000000, 'f1001', true, false, 2006, 78);
INSERT INTO public.galaxy VALUES ('g2', 2, 6000000, 'f1001', true, true, 2006, 78);
INSERT INTO public.galaxy VALUES ('g3', 3, 8400000, 'f1003', true, false, 1997, 56);
INSERT INTO public.galaxy VALUES ('g4', 4, 3400000, 'f1002', true, true, 1978, 98);
INSERT INTO public.galaxy VALUES ('g5', 5, 6500000, 'f1001', true, false, 2010, 70);
INSERT INTO public.galaxy VALUES ('g6', 6, 3508000, 'f1003', false, true, 2010, 55);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('m1', 40, 'm001', 4, 40, 1, 21);
INSERT INTO public.moon VALUES ('m2', 39, 'm001', 0, 67, 5, 22);
INSERT INTO public.moon VALUES ('m3', 48, 'm002', 3, 38, 4, 23);
INSERT INTO public.moon VALUES ('m4', 45, 'm003', 1, 42, 1, 24);
INSERT INTO public.moon VALUES ('m5', 30, 'm005', 0, 67, 4, 25);
INSERT INTO public.moon VALUES ('m6', 51, 'm004', 0, 56, 6, 26);
INSERT INTO public.moon VALUES ('m7', 37, 'm006', 0, 54, 6, 27);
INSERT INTO public.moon VALUES ('m8', 74, 'm004', 2, 63, 6, 28);
INSERT INTO public.moon VALUES ('m9', 25, 'm002', 0, 45, 2, 29);
INSERT INTO public.moon VALUES ('m10', 86, 'm002', 0, 54, 3, 30);
INSERT INTO public.moon VALUES ('m11', 63, 'm002', 5, 38, 1, 31);
INSERT INTO public.moon VALUES ('m12', 45, 'm004', 0, 65, 2, 32);
INSERT INTO public.moon VALUES ('m13', 54, 'm006', 3, 76, 1, 33);
INSERT INTO public.moon VALUES ('m14', 54, 'm005', 0, 45, 3, 34);
INSERT INTO public.moon VALUES ('m15', 68, 'm007', 0, 48, 2, 35);
INSERT INTO public.moon VALUES ('m16', 70, 'm008', 0, 61, 5, 36);
INSERT INTO public.moon VALUES ('m17', 39, 'm007', 0, 28, 4, 37);
INSERT INTO public.moon VALUES ('m18', 65, 'm004', 2, 51, 5, 38);
INSERT INTO public.moon VALUES ('m19', 98, 'm006', 0, 48, 3, 39);
INSERT INTO public.moon VALUES ('m20', 74, 'm008', 1, 65, 1, 40);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('p1', 1, 45, 'p1001', 56, 76, 1);
INSERT INTO public.planet VALUES ('p2', 2, 67, 'p1001', 58, 65, 1);
INSERT INTO public.planet VALUES ('p3', 3, 56, 'p1001', 62, 67, 3);
INSERT INTO public.planet VALUES ('p4', 4, 65, 'p1002', 49, 56, 2);
INSERT INTO public.planet VALUES ('p5', 5, 64, 'p1002', 65, 76, 3);
INSERT INTO public.planet VALUES ('p6', 6, 61, 'p1003', 64, 46, 3);
INSERT INTO public.planet VALUES ('p7', 7, 61, 'p1003', 36, 65, 6);
INSERT INTO public.planet VALUES ('p8', 8, 45, 'p1004', 94, 62, 6);
INSERT INTO public.planet VALUES ('p9', 9, 49, 'p1005', 82, 59, 5);
INSERT INTO public.planet VALUES ('p10', 10, 65, 'p1006', 39, 58, 5);
INSERT INTO public.planet VALUES ('p11', 11, 83, 'p1006', 47, 61, 4);
INSERT INTO public.planet VALUES ('p12', 12, 65, 'p1005', 49, 53, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('s1', 1, 54, 'sf1001', true, 'g2', 65, 2);
INSERT INTO public.star VALUES ('s2', 2, 67, 'sf1003', true, 'g2', 76, 2);
INSERT INTO public.star VALUES ('s3', 3, 45, 'sf1003', false, 'g1', 56, 1);
INSERT INTO public.star VALUES ('s4', 4, 65, 'sf1002', true, 'g3', 59, 3);
INSERT INTO public.star VALUES ('s5', 5, 84, 'sf1004', false, 'g4', 87, 4);
INSERT INTO public.star VALUES ('s6', 6, 52, 'sf1002', true, 'g1', 43, 1);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (45, 'sn1', 56, 'sun1', 1);
INSERT INTO public.sun VALUES (76, 'sn1', 76, 'sun2', 2);
INSERT INTO public.sun VALUES (48, 'sn2', 36, 'sun3', 3);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


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
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


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

