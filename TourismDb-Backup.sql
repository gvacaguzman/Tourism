--
-- PostgreSQL database dump
--

-- Started on 2018-09-25 08:59:36

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1501 (class 1259 OID 16438)
-- Dependencies: 3
-- Name: CATEGORY; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "CATEGORY" (
    "categoryId" integer NOT NULL,
    name character(250) NOT NULL,
    description character(1024) NOT NULL
);


ALTER TABLE public."CATEGORY" OWNER TO postgres;

--
-- TOC entry 1499 (class 1259 OID 16425)
-- Dependencies: 3
-- Name: LOCATION; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "LOCATION" (
    "locationId" integer NOT NULL,
    description character(1024) NOT NULL,
    name character(250) NOT NULL,
    coordinates character(2048) NOT NULL
);


ALTER TABLE public."LOCATION" OWNER TO postgres;

--
-- TOC entry 1503 (class 1259 OID 16449)
-- Dependencies: 3
-- Name: MULTIMEDIA; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "MULTIMEDIA" (
    "multimediaId" integer NOT NULL,
    "locarionId" integer NOT NULL,
    name character(250) NOT NULL,
    description character(1024) NOT NULL,
    format character(50) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public."MULTIMEDIA" OWNER TO postgres;

--
-- TOC entry 1505 (class 1259 OID 16460)
-- Dependencies: 1792 1793 3
-- Name: OFFER; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "OFFER" (
    "offerId" integer NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "cashDiscount" integer DEFAULT 0 NOT NULL,
    "limitDate" date NOT NULL,
    "packageId" integer NOT NULL,
    description character(1024) NOT NULL
);


ALTER TABLE public."OFFER" OWNER TO postgres;

--
-- TOC entry 1497 (class 1259 OID 16395)
-- Dependencies: 1785 3
-- Name: PACKAGE; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "PACKAGE" (
    "packageId" integer NOT NULL,
    "minimunGroup" integer DEFAULT 0,
    "categoryId" integer NOT NULL,
    name character(250) NOT NULL,
    description character(1024) NOT NULL,
    keywords character(1024) NOT NULL,
    inversion integer NOT NULL
);


ALTER TABLE public."PACKAGE" OWNER TO postgres;

--
-- TOC entry 1512 (class 1259 OID 16523)
-- Dependencies: 1799 3
-- Name: PACKAGELOCATION; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "PACKAGELOCATION" (
    "isActive" boolean DEFAULT false NOT NULL,
    "packageId" integer NOT NULL,
    "locationId" integer NOT NULL
);


ALTER TABLE public."PACKAGELOCATION" OWNER TO postgres;

--
-- TOC entry 1515 (class 1259 OID 16543)
-- Dependencies: 3
-- Name: PACKAGEPERIOD; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "PACKAGEPERIOD" (
    "packageperiodId" integer NOT NULL,
    "startDate" date NOT NULL,
    "endDate" date NOT NULL,
    "startSaleDate" date NOT NULL,
    "endSaleDate" date NOT NULL,
    "packageId" integer NOT NULL
);


ALTER TABLE public."PACKAGEPERIOD" OWNER TO postgres;

--
-- TOC entry 1507 (class 1259 OID 16473)
-- Dependencies: 3
-- Name: SCHEDULE; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "SCHEDULE" (
    "scheduleId" integer NOT NULL,
    date date NOT NULL,
    hour time with time zone NOT NULL,
    "packageId" integer NOT NULL,
    name character(250) NOT NULL,
    "activityDescription" character(1024) NOT NULL
);


ALTER TABLE public."SCHEDULE" OWNER TO postgres;

--
-- TOC entry 1500 (class 1259 OID 16436)
-- Dependencies: 3 1501
-- Name: CATEGORY_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "CATEGORY_categoryId_seq"
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."CATEGORY_categoryId_seq" OWNER TO postgres;

--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 1500
-- Name: CATEGORY_categoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "CATEGORY_categoryId_seq" OWNED BY "CATEGORY"."categoryId";


--
-- TOC entry 1498 (class 1259 OID 16423)
-- Dependencies: 1499 3
-- Name: LOCATION_locationId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "LOCATION_locationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."LOCATION_locationId_seq" OWNER TO postgres;

--
-- TOC entry 1829 (class 0 OID 0)
-- Dependencies: 1498
-- Name: LOCATION_locationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "LOCATION_locationId_seq" OWNED BY "LOCATION"."locationId";


--
-- TOC entry 1516 (class 1259 OID 16555)
-- Dependencies: 1503 3
-- Name: MULTIMEDIA_locarionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MULTIMEDIA_locarionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."MULTIMEDIA_locarionId_seq" OWNER TO postgres;

--
-- TOC entry 1830 (class 0 OID 0)
-- Dependencies: 1516
-- Name: MULTIMEDIA_locarionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MULTIMEDIA_locarionId_seq" OWNED BY "MULTIMEDIA"."locarionId";


--
-- TOC entry 1502 (class 1259 OID 16447)
-- Dependencies: 1503 3
-- Name: MULTIMEDIA_multimediaId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MULTIMEDIA_multimediaId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."MULTIMEDIA_multimediaId_seq" OWNER TO postgres;

--
-- TOC entry 1831 (class 0 OID 0)
-- Dependencies: 1502
-- Name: MULTIMEDIA_multimediaId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MULTIMEDIA_multimediaId_seq" OWNED BY "MULTIMEDIA"."multimediaId";


--
-- TOC entry 1504 (class 1259 OID 16458)
-- Dependencies: 3 1505
-- Name: OFFER_offerId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "OFFER_offerId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."OFFER_offerId_seq" OWNER TO postgres;

--
-- TOC entry 1832 (class 0 OID 0)
-- Dependencies: 1504
-- Name: OFFER_offerId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "OFFER_offerId_seq" OWNED BY "OFFER"."offerId";


--
-- TOC entry 1509 (class 1259 OID 16500)
-- Dependencies: 1505 3
-- Name: OFFER_packageId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "OFFER_packageId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."OFFER_packageId_seq" OWNER TO postgres;

--
-- TOC entry 1833 (class 0 OID 0)
-- Dependencies: 1509
-- Name: OFFER_packageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "OFFER_packageId_seq" OWNED BY "OFFER"."packageId";


--
-- TOC entry 1514 (class 1259 OID 16541)
-- Dependencies: 1515 3
-- Name: PACKAGEPERIOD_packageId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGEPERIOD_packageId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGEPERIOD_packageId_seq" OWNER TO postgres;

--
-- TOC entry 1834 (class 0 OID 0)
-- Dependencies: 1514
-- Name: PACKAGEPERIOD_packageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGEPERIOD_packageId_seq" OWNED BY "PACKAGEPERIOD"."packageId";


--
-- TOC entry 1513 (class 1259 OID 16539)
-- Dependencies: 1515 3
-- Name: PACKAGEPERIOD_packageperiodId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGEPERIOD_packageperiodId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGEPERIOD_packageperiodId_seq" OWNER TO postgres;

--
-- TOC entry 1835 (class 0 OID 0)
-- Dependencies: 1513
-- Name: PACKAGEPERIOD_packageperiodId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGEPERIOD_packageperiodId_seq" OWNED BY "PACKAGEPERIOD"."packageperiodId";


--
-- TOC entry 1511 (class 1259 OID 16521)
-- Dependencies: 1512 3
-- Name: PACKAGE_LOCATION_locationId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGE_LOCATION_locationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGE_LOCATION_locationId_seq" OWNER TO postgres;

--
-- TOC entry 1836 (class 0 OID 0)
-- Dependencies: 1511
-- Name: PACKAGE_LOCATION_locationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGE_LOCATION_locationId_seq" OWNED BY "PACKAGELOCATION"."locationId";


--
-- TOC entry 1510 (class 1259 OID 16519)
-- Dependencies: 3 1512
-- Name: PACKAGE_LOCATION_packageId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGE_LOCATION_packageId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGE_LOCATION_packageId_seq" OWNER TO postgres;

--
-- TOC entry 1837 (class 0 OID 0)
-- Dependencies: 1510
-- Name: PACKAGE_LOCATION_packageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGE_LOCATION_packageId_seq" OWNED BY "PACKAGELOCATION"."packageId";


--
-- TOC entry 1508 (class 1259 OID 16482)
-- Dependencies: 1497 3
-- Name: PACKAGE_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGE_categoryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGE_categoryId_seq" OWNER TO postgres;

--
-- TOC entry 1838 (class 0 OID 0)
-- Dependencies: 1508
-- Name: PACKAGE_categoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGE_categoryId_seq" OWNED BY "PACKAGE"."categoryId";


--
-- TOC entry 1496 (class 1259 OID 16393)
-- Dependencies: 1497 3
-- Name: PACKAGE_packageId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "PACKAGE_packageId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."PACKAGE_packageId_seq" OWNER TO postgres;

--
-- TOC entry 1839 (class 0 OID 0)
-- Dependencies: 1496
-- Name: PACKAGE_packageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "PACKAGE_packageId_seq" OWNED BY "PACKAGE"."packageId";


--
-- TOC entry 1517 (class 1259 OID 16572)
-- Dependencies: 1507 3
-- Name: SCHEDULE_packageId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SCHEDULE_packageId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."SCHEDULE_packageId_seq" OWNER TO postgres;

--
-- TOC entry 1840 (class 0 OID 0)
-- Dependencies: 1517
-- Name: SCHEDULE_packageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SCHEDULE_packageId_seq" OWNED BY "SCHEDULE"."packageId";


--
-- TOC entry 1506 (class 1259 OID 16471)
-- Dependencies: 1507 3
-- Name: SCHEDULE_scheduleId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SCHEDULE_scheduleId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public."SCHEDULE_scheduleId_seq" OWNER TO postgres;

--
-- TOC entry 1841 (class 0 OID 0)
-- Dependencies: 1506
-- Name: SCHEDULE_scheduleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SCHEDULE_scheduleId_seq" OWNED BY "SCHEDULE"."scheduleId";


--
-- TOC entry 1788 (class 2604 OID 16441)
-- Dependencies: 1500 1501 1501
-- Name: categoryId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "CATEGORY" ALTER COLUMN "categoryId" SET DEFAULT nextval('"CATEGORY_categoryId_seq"'::regclass);


--
-- TOC entry 1787 (class 2604 OID 16428)
-- Dependencies: 1499 1498 1499
-- Name: locationId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "LOCATION" ALTER COLUMN "locationId" SET DEFAULT nextval('"LOCATION_locationId_seq"'::regclass);


--
-- TOC entry 1789 (class 2604 OID 16452)
-- Dependencies: 1503 1502 1503
-- Name: multimediaId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "MULTIMEDIA" ALTER COLUMN "multimediaId" SET DEFAULT nextval('"MULTIMEDIA_multimediaId_seq"'::regclass);


--
-- TOC entry 1790 (class 2604 OID 16557)
-- Dependencies: 1516 1503
-- Name: locarionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "MULTIMEDIA" ALTER COLUMN "locarionId" SET DEFAULT nextval('"MULTIMEDIA_locarionId_seq"'::regclass);


--
-- TOC entry 1791 (class 2604 OID 16463)
-- Dependencies: 1504 1505 1505
-- Name: offerId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "OFFER" ALTER COLUMN "offerId" SET DEFAULT nextval('"OFFER_offerId_seq"'::regclass);


--
-- TOC entry 1794 (class 2604 OID 16502)
-- Dependencies: 1509 1505
-- Name: packageId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "OFFER" ALTER COLUMN "packageId" SET DEFAULT nextval('"OFFER_packageId_seq"'::regclass);


--
-- TOC entry 1784 (class 2604 OID 16398)
-- Dependencies: 1496 1497 1497
-- Name: packageId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGE" ALTER COLUMN "packageId" SET DEFAULT nextval('"PACKAGE_packageId_seq"'::regclass);


--
-- TOC entry 1786 (class 2604 OID 16484)
-- Dependencies: 1508 1497
-- Name: categoryId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGE" ALTER COLUMN "categoryId" SET DEFAULT nextval('"PACKAGE_categoryId_seq"'::regclass);


--
-- TOC entry 1797 (class 2604 OID 16526)
-- Dependencies: 1512 1510 1512
-- Name: packageId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGELOCATION" ALTER COLUMN "packageId" SET DEFAULT nextval('"PACKAGE_LOCATION_packageId_seq"'::regclass);


--
-- TOC entry 1798 (class 2604 OID 16527)
-- Dependencies: 1511 1512 1512
-- Name: locationId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGELOCATION" ALTER COLUMN "locationId" SET DEFAULT nextval('"PACKAGE_LOCATION_locationId_seq"'::regclass);


--
-- TOC entry 1800 (class 2604 OID 16546)
-- Dependencies: 1515 1513 1515
-- Name: packageperiodId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGEPERIOD" ALTER COLUMN "packageperiodId" SET DEFAULT nextval('"PACKAGEPERIOD_packageperiodId_seq"'::regclass);


--
-- TOC entry 1801 (class 2604 OID 16547)
-- Dependencies: 1515 1514 1515
-- Name: packageId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "PACKAGEPERIOD" ALTER COLUMN "packageId" SET DEFAULT nextval('"PACKAGEPERIOD_packageId_seq"'::regclass);


--
-- TOC entry 1795 (class 2604 OID 16476)
-- Dependencies: 1506 1507 1507
-- Name: scheduleId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "SCHEDULE" ALTER COLUMN "scheduleId" SET DEFAULT nextval('"SCHEDULE_scheduleId_seq"'::regclass);


--
-- TOC entry 1796 (class 2604 OID 16574)
-- Dependencies: 1517 1507
-- Name: packageId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE "SCHEDULE" ALTER COLUMN "packageId" SET DEFAULT nextval('"SCHEDULE_packageId_seq"'::regclass);


--
-- TOC entry 1807 (class 2606 OID 16446)
-- Dependencies: 1501 1501
-- Name: categoryId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "CATEGORY"
    ADD CONSTRAINT "categoryId_constraint" PRIMARY KEY ("categoryId");


--
-- TOC entry 1805 (class 2606 OID 16433)
-- Dependencies: 1499 1499
-- Name: locationId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "LOCATION"
    ADD CONSTRAINT "locationId_constraint" PRIMARY KEY ("locationId");


--
-- TOC entry 1809 (class 2606 OID 16457)
-- Dependencies: 1503 1503
-- Name: multimediaId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "MULTIMEDIA"
    ADD CONSTRAINT "multimediaId_constraint" PRIMARY KEY ("multimediaId");


--
-- TOC entry 1811 (class 2606 OID 16470)
-- Dependencies: 1505 1505
-- Name: offerId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "OFFER"
    ADD CONSTRAINT "offerId_constraint" PRIMARY KEY ("offerId");


--
-- TOC entry 1803 (class 2606 OID 16435)
-- Dependencies: 1497 1497
-- Name: packageId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "PACKAGE"
    ADD CONSTRAINT "packageId_constraint" PRIMARY KEY ("packageId");


--
-- TOC entry 1815 (class 2606 OID 16549)
-- Dependencies: 1515 1515
-- Name: packageperiodId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "PACKAGEPERIOD"
    ADD CONSTRAINT "packageperiodId_constraint" PRIMARY KEY ("packageperiodId");


--
-- TOC entry 1813 (class 2606 OID 16481)
-- Dependencies: 1507 1507
-- Name: scheduleId_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "SCHEDULE"
    ADD CONSTRAINT "scheduleId_constraint" PRIMARY KEY ("scheduleId");


--
-- TOC entry 1816 (class 2606 OID 16495)
-- Dependencies: 1497 1806 1501
-- Name: categoryId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PACKAGE"
    ADD CONSTRAINT "categoryId_fk_constraint" FOREIGN KEY ("categoryId") REFERENCES "CATEGORY"("categoryId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1821 (class 2606 OID 16533)
-- Dependencies: 1499 1804 1512
-- Name: locationId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PACKAGELOCATION"
    ADD CONSTRAINT "locationId_fk_constraint" FOREIGN KEY ("locationId") REFERENCES "LOCATION"("locationId");


--
-- TOC entry 1817 (class 2606 OID 16567)
-- Dependencies: 1804 1503 1499
-- Name: locationd_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MULTIMEDIA"
    ADD CONSTRAINT locationd_fk_constraint FOREIGN KEY ("locarionId") REFERENCES "LOCATION"("locationId");


--
-- TOC entry 1818 (class 2606 OID 16514)
-- Dependencies: 1802 1505 1497
-- Name: packageId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OFFER"
    ADD CONSTRAINT "packageId_fk_constraint" FOREIGN KEY ("packageId") REFERENCES "PACKAGE"("packageId");


--
-- TOC entry 1820 (class 2606 OID 16528)
-- Dependencies: 1802 1512 1497
-- Name: packageId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PACKAGELOCATION"
    ADD CONSTRAINT "packageId_fk_constraint" FOREIGN KEY ("packageId") REFERENCES "PACKAGE"("packageId");


--
-- TOC entry 1822 (class 2606 OID 16550)
-- Dependencies: 1497 1515 1802
-- Name: packageId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PACKAGEPERIOD"
    ADD CONSTRAINT "packageId_fk_constraint" FOREIGN KEY ("packageId") REFERENCES "PACKAGE"("packageId");


--
-- TOC entry 1819 (class 2606 OID 16584)
-- Dependencies: 1802 1497 1507
-- Name: packageId_fk_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SCHEDULE"
    ADD CONSTRAINT "packageId_fk_constraint" FOREIGN KEY ("packageId") REFERENCES "PACKAGE"("packageId");


--
-- TOC entry 1827 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-09-25 08:59:36

--
-- PostgreSQL database dump complete
--

