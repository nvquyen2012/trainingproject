--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-23 14:08:03

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

--
-- TOC entry 9 (class 2615 OID 16668)
-- Name: auth_bib; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auth_bib;


ALTER SCHEMA auth_bib OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 17230)
-- Name: auth_company; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_company (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(500),
    mng_fee_sharing numeric,
    transaction_fee_sharing numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    name1 character varying(255),
    status character varying(20)
);


ALTER TABLE auth_bib.auth_company OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN auth_company.mng_fee_sharing; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_company.mng_fee_sharing IS 'management fee sharing';


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN auth_company.transaction_fee_sharing; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_company.transaction_fee_sharing IS 'transaction fee sharing';


--
-- TOC entry 212 (class 1259 OID 17228)
-- Name: auth_company_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_company_id_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_company_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_company_id_seq OWNED BY auth_bib.auth_company.id;


--
-- TOC entry 229 (class 1259 OID 17599)
-- Name: auth_company_copy1; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_company_copy1 (
    id integer DEFAULT nextval('auth_bib.auth_company_id_seq'::regclass) NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(500),
    mng_fee_sharing numeric(5,2),
    transaction_fee_sharing numeric(5,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by character varying,
    updated_by character varying,
    name1 character varying(255),
    status character varying(20)
);


ALTER TABLE auth_bib.auth_company_copy1 OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN auth_company_copy1.mng_fee_sharing; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_company_copy1.mng_fee_sharing IS 'management fee sharing';


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN auth_company_copy1.transaction_fee_sharing; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_company_copy1.transaction_fee_sharing IS 'transaction fee sharing';


--
-- TOC entry 217 (class 1259 OID 17255)
-- Name: auth_login_log; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_login_log (
    id integer NOT NULL,
    user_id integer,
    login_status character varying NOT NULL,
    device character varying NOT NULL,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying
);


ALTER TABLE auth_bib.auth_login_log OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17253)
-- Name: auth_login_log_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_login_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_login_log_id_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_login_log_id_seq OWNED BY auth_bib.auth_login_log.id;


--
-- TOC entry 222 (class 1259 OID 17426)
-- Name: auth_ott; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_ott (
    id integer NOT NULL,
    token character varying NOT NULL,
    phone_number character varying(255),
    for_action character varying NOT NULL,
    expired_date timestamp without time zone NOT NULL,
    is_confirmed character varying(6) DEFAULT 'NOT_OK'::character varying,
    email character varying(100),
    ott_send_time integer DEFAULT 0,
    ott_verify_wrong_time integer
);


ALTER TABLE auth_bib.auth_ott OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17424)
-- Name: auth_ott_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_ott_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_ott_id_seq OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_ott_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_ott_id_seq OWNED BY auth_bib.auth_ott.id;


--
-- TOC entry 215 (class 1259 OID 17241)
-- Name: auth_password_log; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_password_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    pwd_hash character varying(500) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    created_by character varying
);


ALTER TABLE auth_bib.auth_password_log OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN auth_password_log.created_at; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_password_log.created_at IS 'created time';


--
-- TOC entry 214 (class 1259 OID 17239)
-- Name: auth_password_log_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_password_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_password_log_id_seq OWNER TO postgres;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_password_log_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_password_log_id_seq OWNED BY auth_bib.auth_password_log.id;


--
-- TOC entry 211 (class 1259 OID 17217)
-- Name: auth_user; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_user (
    id integer NOT NULL,
    image character varying(50),
    full_name character varying(150),
    email character varying(150) NOT NULL,
    password character varying(100) NOT NULL,
    phone_number character varying(255) NOT NULL,
    country_phone_prefix character varying(3) DEFAULT '+91'::character varying,
    roles character varying(15) NOT NULL,
    workspace integer NOT NULL,
    status character varying(15),
    login_fail_count integer,
    company_id integer NOT NULL,
    last_login timestamp without time zone,
    password_expired_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    username character varying,
    namespace integer
);


ALTER TABLE auth_bib.auth_user OWNER TO postgres;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.email; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.email IS 'emails of users';


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.password; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.password IS 'password of user';


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.phone_number; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.phone_number IS 'phone of user';


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.roles; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.roles IS 'roles for user';


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.workspace; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.workspace IS 'for workspace of user, 1:admin dashboard, 2: rm app';


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.status; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.status IS 'for active or deactivate user';


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.login_fail_count; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.login_fail_count IS 'count for login fail time';


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN auth_user.created_at; Type: COMMENT; Schema: auth_bib; Owner: postgres
--

COMMENT ON COLUMN auth_bib.auth_user.created_at IS 'created time';


--
-- TOC entry 219 (class 1259 OID 17266)
-- Name: auth_user_action_log; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_user_action_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    entity_id integer,
    namespace integer,
    prev_entity_value character varying,
    new_entity_value character varying,
    user_ip character varying,
    action_name character varying,
    action_count integer,
    "time" timestamp without time zone
);


ALTER TABLE auth_bib.auth_user_action_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17264)
-- Name: auth_user_action_log_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_user_action_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_user_action_log_id_seq OWNER TO postgres;

--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_user_action_log_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_user_action_log_id_seq OWNED BY auth_bib.auth_user_action_log.id;


--
-- TOC entry 210 (class 1259 OID 17215)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_user_id_seq OWNED BY auth_bib.auth_user.id;


--
-- TOC entry 241 (class 1259 OID 20646)
-- Name: auth_user_log_action; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.auth_user_log_action (
    id integer NOT NULL,
    user_id integer NOT NULL,
    action_count integer,
    "time" timestamp without time zone DEFAULT now(),
    action_name character varying
);


ALTER TABLE auth_bib.auth_user_log_action OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 20644)
-- Name: auth_user_log_action_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.auth_user_log_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.auth_user_log_action_id_seq OWNER TO postgres;

--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_user_log_action_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.auth_user_log_action_id_seq OWNED BY auth_bib.auth_user_log_action.id;


--
-- TOC entry 228 (class 1259 OID 17570)
-- Name: device_info; Type: TABLE; Schema: auth_bib; Owner: postgres
--

CREATE TABLE auth_bib.device_info (
    id integer NOT NULL,
    status character varying NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    device_id character varying(50) NOT NULL
);


ALTER TABLE auth_bib.device_info OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17568)
-- Name: device_info_id_seq; Type: SEQUENCE; Schema: auth_bib; Owner: postgres
--

CREATE SEQUENCE auth_bib.device_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_bib.device_info_id_seq OWNER TO postgres;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 227
-- Name: device_info_id_seq; Type: SEQUENCE OWNED BY; Schema: auth_bib; Owner: postgres
--

ALTER SEQUENCE auth_bib.device_info_id_seq OWNED BY auth_bib.device_info.id;


--
-- TOC entry 2920 (class 2604 OID 17233)
-- Name: auth_company id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_company ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_company_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 17258)
-- Name: auth_login_log id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_login_log ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_login_log_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 17429)
-- Name: auth_ott id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_ott ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_ott_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 17244)
-- Name: auth_password_log id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_password_log ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_password_log_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 17220)
-- Name: auth_user id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_user_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 17269)
-- Name: auth_user_action_log id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user_action_log ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_user_action_log_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 20649)
-- Name: auth_user_log_action id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user_log_action ALTER COLUMN id SET DEFAULT nextval('auth_bib.auth_user_log_action_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 17573)
-- Name: device_info id; Type: DEFAULT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.device_info ALTER COLUMN id SET DEFAULT nextval('auth_bib.device_info_id_seq'::regclass);


--
-- TOC entry 3086 (class 0 OID 17230)
-- Dependencies: 213
-- Data for Name: auth_company; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_company VALUES (85, '123123', 'we', 23, 23, '2022-04-28 16:17:16.904971', '2022-04-29 11:23:08.005709', 'admin', 'challote@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (67, 'Thuy qa', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 23, 45, '2022-04-28 15:04:27.020092', '2022-04-29 11:23:16.7578', 'admin', 'challote@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (87, 'Work', '123', 100, 99, '2022-04-28 17:01:32.503337', '2022-04-29 11:29:49.381071', 'nhoht978@gmail.com', 'liam@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (61, '##%^(#@#@#^%(*#@@@&(%($@$@$#$**&&', '9 Duy Tan', 20, 12, '2022-04-28 14:05:33.204167', '2022-04-29 13:38:50.34117', 'admin', 'challote@gmail.com', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (65, 'Karate Co., Ltd', 'Ds. Babadan, Gunung Kawi, Malang, Malang, East Jave, 65138', -12, 0.12, '2022-04-28 14:35:28.807962', '2022-04-29 13:39:10.880588', 'admin', 'challote@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (89, 'Company test 1', 'quang trung, gò vâp', 3, 5, '2022-05-05 14:12:03.082715', '2022-05-05 14:12:03.082715', 'nvva9999@gmail.com', 'nvva9999@gmail.com', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (90, 'king123', 'hà nội', 3.2, 3.4, '2022-05-05 14:44:51.033149', '2022-05-05 14:44:51.033149', 'ptanh5@gmail.com', 'ptanh5@gmail.com', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (59, 'Masan Group', '8 Central Plaza, 17 Le Duan street, Ben Nghe district, HCM city, Viet Nam', 20, 12, '2022-04-28 13:28:36.626032', '2022-04-28 14:15:03.437981', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (95, 'EPAPP', '780', 10.2, 99.9, '2022-05-06 16:15:06.270752', '2022-05-09 10:50:03.390824', 'ptanh5@gmail.com', 'nvva0907@gmail.com', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (3, 'abaac', 'Tran Duy Hưng', 9.99999, 20, '2022-04-20 08:41:07.799139', '2022-05-09 11:12:04.166777', NULL, 'nvva0907@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (5, 'string', 'Nho tham den', 1, 1.2, '2022-04-20 08:41:07.799139', NULL, NULL, NULL, NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (54, 'King Test', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 12.3, 123, '2022-04-27 10:50:06.054165', '2022-04-27 13:49:41.908177', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (101, 'asdsad', 'asdasd', 3.4, 23, '2022-05-09 11:12:25.94262', '2022-05-16 09:45:13.329191', 'nvva0907@gmail.com', 'ptanh5@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (58, 'King ', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 12, 100, '2022-04-27 14:52:06.294151', '2022-04-28 11:38:33.82744', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (63, 'Kim Hoang Long', 'Tran Huu Duc street, Ba Dinh, Ha Noi', -12, -13, '2022-04-28 14:20:48.637915', '2022-04-28 14:20:48.637915', 'admin', 'admin', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (66, 'Glencore International', ' Barr city, Switzerland', -12, 0.13, '2022-04-28 14:37:22.93059', '2022-04-28 15:04:24.223597', 'admin', 'admin', NULL, 'APPROVED');
INSERT INTO auth_bib.auth_company VALUES (80, 'abc', '123', 1, 7, '2022-04-28 15:58:20.517323', '2022-04-28 15:58:20.517323', 'admin', 'admin', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (82, 'ear', '123', 100, 100, '2022-04-28 16:12:10.464488', '2022-04-28 16:12:10.464488', 'admin', 'admin', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (93, '45', '456', 20, 25, '2022-05-06 10:48:26.842503', '2022-05-17 15:06:49.897944', 'ptanhchecker@gmail.com', 'anonymousUser', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (102, 'test1', 'asd', 100, 23, '2022-05-17 14:03:57.63475', '2022-05-18 11:36:58.067426', 'ptanh5@gmail.com', 'thuy121@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (2, 'CMC GLOBAL', 'Ha Noi', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_bib.auth_company VALUES (4, 'abaa1c', 'sdfgsdf', 1, 1, '2022-04-20 08:41:07.799139', '2022-05-23 14:07:42.889962', NULL, 'anonymousUser', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (56, 'BIB', '14 Dao Tan St', 5, 12, '2022-04-27 13:48:57.535349', '2022-04-29 08:54:05.049687', 'admin', 'ptanh5@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (62, 'Youthful', '8 Heaven garden', 105, 110, '2022-04-28 14:18:24.657994', '2022-04-28 14:18:24.657994', 'admin', 'admin', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (60, 'King 223', '8 Central Plaza, 17 Le Duan street, Ben Nghe district, HCM city, Viet Nam', 12, 12, '2022-04-28 14:04:57.443513', '2022-04-28 14:31:28.979835', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (50, 'Nho Thâm', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 546, 456, '2022-04-14 08:41:07.799', '2022-04-27 09:03:53.297955', NULL, 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (1, 'BIB', 'Ha Noi', 1, 1, '2022-05-05 10:34:49.354', '2022-05-05 10:34:49.354', 'nvva9999@gmail.com', 'nvva9999@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (81, 'ABB Group', '273 Zurich, Switzerland', 30, 35, '2022-04-28 15:59:26.773495', '2022-04-28 16:09:39.295381', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (6, 'Thien ta than com1111', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 100, 1.2, '2022-04-20 08:41:07.799139', '2022-05-09 09:10:17.59426', NULL, 'ptanh5@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (83, 'linh', 'asdasd', 100, 100, '2022-04-28 16:16:30.769445', '2022-05-09 09:10:28.443543', 'admin', 'ptanh5@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (86, 'Faithful Corp', 'Tran Duc Tho street, Ba Dinh, Ha Noi', 20, 15, '2022-04-28 16:58:32.42936', '2022-04-29 11:26:34.216056', 'dalih@gmail.com', 'challote@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (64, 'Greenfields', 'Ds. Babadan, Gunung Kawi, Malang, Malang, East Jave, 65138', 0.12, 0.15, '2022-04-28 14:22:32.640399', '2022-04-29 11:26:49.479566', 'admin', 'challote@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (88, 'anc', 'asd asdaseq', 2, 3, '2022-05-05 10:34:49.354474', '2022-05-05 10:34:49.354474', 'nvva9999@gmail.com', 'nvva9999@gmail.com', NULL, 'PENDING');
INSERT INTO auth_bib.auth_company VALUES (84, 'abcsd', 'jdsaljd', 100, 100, '2022-04-28 16:16:46.383166', '2022-05-05 16:49:55.634536', 'admin', 'nvva0907@gmail.com', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (92, 'ptanhtest2', 'asd', 52, 24.4, '2022-05-05 15:25:40.024654', '2022-05-13 13:53:18.917174', 'ptanh5@gmail.com', 'ptanh5@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (9, 'VietAn11h1aaa', 'string', 100, 1.2, '2022-04-14 08:41:07.799139', '2022-04-27 08:42:09.757082', NULL, 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (91, 'ptanhtest1', 'abc', 1.2, 42, '2022-05-05 15:25:00.542493', '2022-05-17 15:07:08.031282', 'ptanh5@gmail.com', 'anonymousUser', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (52, 'LUFY', '11 Phố Duy Tân, Dịch Vọng Hậu, Từ Liêm, Hà Nội, Việt Nam', 12.3, 12.3, '2022-04-27 09:52:28.489921', '2022-04-27 09:52:28.489921', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (53, 'sdfsdfsdf', 'sdfsdfsdf', 0, 0, '2022-04-27 10:23:11.42438', '2022-04-27 10:49:33.126861', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (55, 'CMC Corporation', 'CMC town, Duy Tan street, Cau Giay district, Ha Noi, Viet Nam', 20, 20, '2022-04-27 11:49:21.005543', '2022-04-27 13:27:33.569777', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (57, 'BX', 'ASD', 23, 123, '2022-04-27 14:37:27.121337', '2022-04-27 14:40:25.507632', 'admin', 'admin', NULL, 'REJECTED');
INSERT INTO auth_bib.auth_company VALUES (94, 'ptanh5', 'asdsd', 2.6, 100, '2022-05-06 13:15:46.861455', '2022-05-18 09:38:02.384926', 'ptanhchecker@gmail.com', 'thang123@gmail.com', NULL, 'INACTIVE');
INSERT INTO auth_bib.auth_company VALUES (103, '______________________!', 'Sky', 25, 25, '2022-05-19 17:10:10.485576', '2022-05-19 17:26:21.860933', 'challote@gmail.com', 'anonymousUser', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (105, 'TH', 'Sky', 12, 12, '2022-05-19 17:19:13.175233', '2022-05-20 09:13:36.133924', 'winnie@qa.team', 'anonymousUser', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (104, '23', '23', 23, 23, '2022-05-19 17:18:50.976183', '2022-05-23 09:19:41.888224', 'ptanh56@gmail.com', 'ptanh5@gmail.com', NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company VALUES (106, 'cty trách nhiệm vô hạn không thành viên', 'hà lội', 1, 1, '2022-05-23 11:26:33.087137', '2022-05-23 11:26:33.087137', 'nvva0907@gmail.com', 'nvva0907@gmail.com', NULL, 'PENDING');


--
-- TOC entry 3097 (class 0 OID 17599)
-- Dependencies: 229
-- Data for Name: auth_company_copy1; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_company_copy1 VALUES (2, 'CMC', 'VietNam', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (1, 'BIB', 'India', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'ACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (3, 'Edwards Inc. Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.Edwards Inc.', '593 S Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (4, 'Richardson Brothers Inc.', '952 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (81, 'Earl Inc.', '965 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (5, 'Frank Trading Inc.', '759 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (6, 'Wood''s Food Inc.', '352 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (7, 'Brown Brothers Toy LLC', '261 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (8, 'Gibson''s Telecommunication LLC', '907 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (9, 'Romero Brothers Inc.', '749 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (10, 'Amy Software Inc.', '389 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (11, 'Tony LLC', '528 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (12, 'Powell Communications LLC', '189 Nostrand Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (13, 'Luis Logistic LLC', '705 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (14, 'Nicole LLC', '940 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (15, 'Smith Toy Inc.', '588 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (16, 'Kim Pharmaceutical LLC', '760 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (17, 'Dawn LLC', '792 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (18, 'Steve Engineering Inc.', '263 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (19, 'Francisco Engineering LLC', '607 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (20, 'Davis''s LLC', '39 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (21, 'Gary Inc.', '381 Grape Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (22, 'Paul Consultants LLC', '239 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (23, 'Daniels Software LLC', '253 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (24, 'Simpson''s Inc.', '539 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (25, 'Bell Technology Inc.', '741 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (26, 'Collins Brothers Inc.', '241 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (27, 'Bernard Pharmaceutical Inc.', '289 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (28, 'Glenn Trading LLC', '707 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (29, 'Holmes Trading LLC', '44 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (30, 'Edwin Inc.', '797 Bank Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (31, 'Olson''s Inc.', '798 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (32, 'Beverly LLC', '487 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (33, 'Thelma Technology Inc.', '633 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (34, 'Jimenez Network Systems LLC', '891 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (35, 'Murray Network Systems LLC', '144 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (36, 'Carmen Trading LLC', '429 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (37, 'Cook''s Toy Inc.', '112 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (38, 'Todd Logistic LLC', '441 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (39, 'Woods Logistic LLC', '597 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (40, 'Roy LLC', '697 State Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (41, 'Powell''s LLC', '634 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (42, 'Virginia Toy Inc.', '270 Nostrand Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (43, 'Graham Brothers Food LLC', '503 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (44, 'Rice''s Consultants Inc.', '231 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (45, 'Cindy LLC', '183 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (46, 'Kim Brothers Trading LLC', '172 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (47, 'Ricky LLC', '527 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (48, 'Butler Brothers Trading LLC', '336 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (49, 'Evans Brothers Inc.', '350 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (50, 'Payne''s Trading LLC', '821 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (51, 'Kimberly Pharmaceutical Inc.', '805 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (52, 'Fisher''s Network Systems Inc.', '150 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (53, 'Morales''s Electronic Inc.', '113 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (54, 'Sharon Network Systems LLC', '830 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (55, 'Mark Technology Inc.', '537 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (56, 'Henry Toy Inc.', '637 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (57, 'Joyce Consultants LLC', '760 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (58, 'Theresa LLC', '386 West Market Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (59, 'Brian Inc.', '513 Riverview Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (60, 'Howard''s Inc.', '173 Wall Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (61, 'Leslie Inc.', '76 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (62, 'Smith''s Trading LLC', '791 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (63, 'Owens''s Food LLC', '929 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (64, 'James Brothers LLC', '17 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (65, 'Joel Network Systems LLC', '76 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (66, 'Collins''s LLC', '180 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (67, 'Spencer Brothers LLC', '813 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (68, 'Hazel Pharmaceutical LLC', '685 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (69, 'Joseph Technology Inc.', '911 Alameda Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (70, 'Cox Trading LLC', '687 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (71, 'Clara LLC', '670 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (72, 'Fernandez Brothers Inc.', '655 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (73, 'Jordan Food LLC', '567 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (74, 'Crawford Toy Inc.', '826 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (75, 'Cole Brothers Engineering Inc.', '120 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (76, 'Gutierrez''s LLC', '914 Columbia St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (77, 'Hall''s Consultants Inc.', '678 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (78, 'Hunter LLC', '881 Diplomacy Drive', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (79, 'Keith Technology LLC', '930 Bank Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (0, 'DCOM Why deactive still list in the list. WWhy??? I don''t know why !!!!!!!!!!!', 'VIETNAM', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (80, 'Peggy Communications LLC', '841 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (82, 'Woods LLC', '889 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (83, 'Wood''s Electronic LLC', '395 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (84, 'Pamela Telecommunication LLC', '965 Pedway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (85, 'Barry LLC', '928 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (86, 'Mary Inc.', '757 Columbia St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (87, 'James Inc.', '48 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (88, 'Griffin Trading Inc.', '426 Lark Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (89, 'Gordon Brothers LLC', '570 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (90, 'Phyllis LLC', '905 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (91, 'Thomas Brothers Toy LLC', '597 West Houston Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (92, 'Jordan Brothers Trading LLC', '809 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (93, 'Patricia Engineering Inc.', '108 Nostrand Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (94, 'Earl LLC', '42 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (95, 'Gerald Toy LLC', '953 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (96, 'Gladys Technology LLC', '896 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (97, 'Clara Telecommunication Inc.', '443 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (98, 'Weaver''s Communications LLC', '171 Wicklow Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (99, 'Snyder''s Inc.', '418 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (100, 'Jeremy Logistic Inc.', '12 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (101, 'Aguilar Brothers Pharmaceutical Inc.', '616 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (102, 'Fernandez''s LLC', '88 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (103, 'Carol Electronic Inc.', '781 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (104, 'Dixon Communications LLC', '782 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (105, 'Meyer LLC', '784 Sky Way', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (106, 'Louise LLC', '56 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (107, 'Roberts Food Inc.', '314 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (108, 'George Pharmaceutical Inc.', '748 Bank Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (109, 'Brenda Technology LLC', '23 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (110, 'Walker Pharmaceutical LLC', '310 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (111, 'Alan Trading LLC', '816 S Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (112, 'Amanda Network Systems LLC', '525 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (113, 'Black Brothers Inc.', '976 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (114, 'Garza Inc.', '913 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (115, 'Jonathan LLC', '403 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (116, 'Hawkins Brothers Inc.', '237 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (117, 'Bradley Electronic LLC', '951 Grape Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (118, 'Reyes''s Engineering LLC', '146 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (119, 'Reed Inc.', '646 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (120, 'Fred LLC', '433 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (121, 'Helen LLC', '782 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (122, 'Jacob Trading LLC', '662 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (123, 'Howard Electronic LLC', '184 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (124, 'Fred Telecommunication Inc.', '268 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (125, 'Jenkins Food Inc.', '819 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (126, 'Turner Brothers LLC', '32 Wall Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (127, 'Martin Inc.', '157 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (128, 'Ruiz''s Technology Inc.', '498 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (129, 'Cox LLC', '929 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (130, 'Wood''s Consultants Inc.', '600 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (131, 'Ruby LLC', '156 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (132, 'Lori Consultants LLC', '964 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (133, 'Jeremy Telecommunication Inc.', '504 Alameda Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (134, 'Rose Technology LLC', '539 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (135, 'Aguilar Communications Inc.', '686 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (136, 'Fred LLC', '880 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (137, 'Sean Network Systems LLC', '25 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (138, 'Douglas Inc.', '491 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (139, 'Jane Logistic Inc.', '113 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (140, 'Aguilar Brothers Logistic LLC', '985 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (141, 'Butler''s LLC', '311 Flatbush Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (142, 'Vasquez Brothers Trading LLC', '259 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (143, 'Eugene Inc.', '606 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (144, 'Sheila Engineering LLC', '633 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (145, 'Perez Engineering LLC', '580 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (146, 'Jennifer Logistic LLC', '647 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (147, 'Amber LLC', '439 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (148, 'Andrew Pharmaceutical LLC', '960 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (149, 'Alvarez Brothers Trading Inc.', '90 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (150, 'Morgan Electronic LLC', '715 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (151, 'Spencer''s Pharmaceutical Inc.', '351 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (152, 'Stephens LLC', '331 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (153, 'Gonzalez''s Trading LLC', '274 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (154, 'Henderson''s Network Systems LLC', '431 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (155, 'Bryan Electronic Inc.', '830 Nostrand Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (156, 'Silva Brothers Food LLC', '285 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (157, 'Price Brothers Inc.', '556 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (158, 'Gerald Telecommunication LLC', '535 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (159, 'Carter''s Inc.', '648 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (160, 'Alvarez''s Trading Inc.', '30 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (161, 'Medina Brothers Inc.', '547 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (162, 'Marvin Telecommunication Inc.', '475 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (163, 'Martin Technology Inc.', '607 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (164, 'Hayes LLC', '99 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (165, 'Meyer Technology LLC', '756 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (166, 'Coleman Brothers Software Inc.', '531 Wall Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (167, 'Grant Brothers Inc.', '538 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (168, 'Andrea Communications LLC', '444 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (169, 'Soto''s Technology LLC', '889 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (170, 'Ryan Brothers Inc.', '986 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (171, 'Marie Logistic LLC', '17 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (172, 'Reynolds''s Telecommunication Inc.', '752 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (173, 'Johnny LLC', '883 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (174, 'Juan LLC', '33 Bank Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (175, 'Kim Engineering LLC', '552 Grape Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (176, 'Elaine Engineering LLC', '920 East Alley', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (177, 'Carolyn Logistic LLC', '49 Nostrand Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (178, 'Valerie Electronic LLC', '271 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (179, 'Peggy Trading Inc.', '536 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (180, 'Doris LLC', '546 1st Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (181, 'Daniel LLC', '27 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (182, 'Herrera Network Systems LLC', '391 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (183, 'Wilson''s Inc.', '690 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (184, 'Flores Logistic LLC', '62 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (185, 'Ethel Communications LLC', '61 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (186, 'Ruth Inc.', '902 Alameda Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (187, 'Stone Brothers LLC', '355 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (188, 'Tammy LLC', '864 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (189, 'Porter''s Inc.', '937 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (190, 'Morales Brothers Trading Inc.', '122 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (191, 'Joseph LLC', '872 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (192, 'Morales Communications Inc.', '177 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (193, 'Lewis LLC', '534 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (194, 'Sheila Food LLC', '24 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (195, 'Lillian Technology Inc.', '909 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (196, 'Ruiz Brothers Inc.', '464 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (197, 'Carrie Communications Inc.', '651 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (198, 'Phyllis Electronic Inc.', '711 S Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (199, 'Gibson''s LLC', '176 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (200, 'Paul Inc.', '986 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (201, 'Barry Consultants Inc.', '89 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (202, 'Ellis Trading LLC', '396 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (203, 'Leslie Logistic Inc.', '956 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (204, 'Thompson Brothers Software Inc.', '25 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (205, 'Rodney Inc.', '644 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (206, 'Kennedy''s LLC', '457 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (207, 'Luis Communications LLC', '736 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (208, 'Joel Electronic Inc.', '118 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (209, 'Rosa LLC', '151 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (210, 'Powell Inc.', '710 Tremont Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (211, 'Silva Brothers Trading Inc.', '260 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (212, 'Gonzales Pharmaceutical LLC', '469 East Alley', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (213, 'Kelley''s LLC', '917 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (214, 'Vincent Toy LLC', '708 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (215, 'Clara LLC', '568 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (216, 'Chen''s Food Inc.', '515 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (217, 'Terry Inc.', '851 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (218, 'Harold Toy Inc.', '23 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (219, 'Tony LLC', '593 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (220, 'Jeffrey Logistic Inc.', '129 Wicklow Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (221, 'Herrera''s Inc.', '992 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (222, 'Ralph Trading Inc.', '539 S Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (223, 'Allen Brothers Engineering Inc.', '288 Canal Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (224, 'Billy Electronic Inc.', '956 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (225, 'Ellis Inc.', '585 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (226, 'Cynthia Trading Inc.', '823 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (227, 'Palmer Consultants LLC', '421 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (228, 'Debra Inc.', '923 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (229, 'Watson Food LLC', '833 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (230, 'Cox Brothers Consultants Inc.', '369 State Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (231, 'Lillian Toy LLC', '314 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (232, 'Cooper Brothers Pharmaceutical LLC', '469 Lark Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (233, 'Mason Electronic Inc.', '813 Rush Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (234, 'Taylor Brothers LLC', '509 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (235, 'Harold Food LLC', '105 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (236, 'Cooper Brothers LLC', '393 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (237, 'Theresa Toy Inc.', '626 Grape Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (238, 'Fred Network Systems LLC', '712 Figueroa Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (239, 'Danny Toy Inc.', '898 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (240, 'Crystal Inc.', '326 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (241, 'Jeffery Technology LLC', '535 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (242, 'Hicks Consultants LLC', '919 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (243, 'Nancy Software Inc.', '70 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (244, 'Jimenez Pharmaceutical Inc.', '85 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (245, 'Parker Brothers Software LLC', '648 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (246, 'Kimberly Communications LLC', '374 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (247, 'Eugene Inc.', '47 East Alley', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (248, 'Torres Network Systems Inc.', '445 Flatbush Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (249, 'Johnny Toy LLC', '860 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (250, 'Earl LLC', '568 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (251, 'Jennifer Inc.', '384 Figueroa Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (252, 'Eddie Network Systems Inc.', '958 Canal Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (253, 'Sara Telecommunication Inc.', '579 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (254, 'Flores''s Food Inc.', '201 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (255, 'Harrison Brothers Inc.', '167 1st Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (256, 'Anita LLC', '735 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (257, 'Vargas Inc.', '233 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (258, 'Green Inc.', '11 Sky Way', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (259, 'Gordon''s Inc.', '612 Fern Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (260, 'Shirley Software LLC', '883 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (261, 'Green''s Inc.', '35 Bank Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (262, 'Schmidt''s Logistic Inc.', '470 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (263, 'Henry Consultants Inc.', '904 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (264, 'Wells Inc.', '355 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (265, 'Christine Network Systems LLC', '360 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (266, 'Evans Brothers LLC', '348 West Houston Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (267, 'Anita LLC', '424 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (268, 'Richardson Brothers Software LLC', '685 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (269, 'Sanchez Brothers Inc.', '577 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (270, 'Danielle LLC', '125 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (271, 'Donna Inc.', '302 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (272, 'Donna Logistic Inc.', '926 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (273, 'Howard Brothers LLC', '683 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (274, 'Robinson''s Logistic Inc.', '307 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (275, 'Munoz''s Inc.', '459 Diplomacy Drive', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (276, 'Chad Trading Inc.', '768 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (277, 'Craig Inc.', '339 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (278, 'Morris LLC', '644 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (279, 'Joseph Network Systems LLC', '744 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (280, 'Benjamin Telecommunication Inc.', '153 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (281, 'King Brothers Technology Inc.', '837 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (282, 'Sarah Pharmaceutical LLC', '541 Sky Way', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (283, 'Schmidt''s Inc.', '912 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (284, 'Ferguson Brothers LLC', '270 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (285, 'Fox''s Software LLC', '94 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (286, 'Bradley LLC', '651 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (287, 'Christopher Toy LLC', '218 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (288, 'Reynolds Electronic Inc.', '284 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (289, 'Mendez Brothers Technology LLC', '460 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (290, 'Howard Inc.', '502 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (291, 'Murray Brothers LLC', '343 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (292, 'Henry''s LLC', '87 Alameda Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (293, 'Foster''s Software Inc.', '386 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (294, 'Henderson Pharmaceutical LLC', '686 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (295, 'Frances Pharmaceutical LLC', '68 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (296, 'Florence Technology Inc.', '972 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (297, 'Willie Consultants LLC', '988 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (298, 'Betty Inc.', '324 Nostrand Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (299, 'Melvin Telecommunication LLC', '822 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (300, 'Jessica Consultants LLC', '263 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (301, 'Wallace Brothers Toy LLC', '243 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (302, 'Donna LLC', '764 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (303, 'Tammy Logistic Inc.', '103 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (304, 'Adams Consultants LLC', '232 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (305, 'Carrie Inc.', '369 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (306, 'Gray''s Telecommunication Inc.', '129 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (307, 'Michelle Toy Inc.', '637 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (308, 'Ross Communications LLC', '746 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (309, 'Connie LLC', '893 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (310, 'Fisher Brothers Telecommunication LLC', '203 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (311, 'Randy Consultants Inc.', '601 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (312, 'Long''s Consultants LLC', '361 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (313, 'Joanne Electronic LLC', '350 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (314, 'Sharon Logistic LLC', '910 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (315, 'Robin LLC', '26 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (316, 'Ruiz''s Engineering LLC', '285 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (317, 'Brooks Brothers LLC', '627 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (318, 'Terry Trading LLC', '530 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (319, 'Chavez Brothers Inc.', '103 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (320, 'Rose Engineering LLC', '23 Columbia St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (321, 'Bailey Logistic Inc.', '759 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (322, 'Linda Network Systems Inc.', '294 Riverview Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (323, 'Jane LLC', '100 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (324, 'Cole Inc.', '66 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (325, 'Barbara Telecommunication Inc.', '449 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (326, 'Joyce LLC', '482 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (327, 'Clara Telecommunication Inc.', '20 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (328, 'Thomas Technology Inc.', '634 Riverview Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (329, 'Manuel Inc.', '257 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (330, 'Patricia Inc.', '430 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (331, 'Thomas Brothers Inc.', '593 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (332, 'Bobby Consultants LLC', '195 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (333, 'Phillip Logistic Inc.', '806 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (334, 'Nichols''s LLC', '111 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (335, 'Cindy Food LLC', '668 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (336, 'Jamie Toy LLC', '715 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (337, 'Moreno Brothers Logistic LLC', '583 Pedway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (338, 'Juanita Inc.', '57 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (339, 'Parker Brothers Inc.', '501 S Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (340, 'Butler Brothers Communications LLC', '470 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (341, 'Jacqueline Consultants LLC', '933 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (342, 'Fisher''s Engineering LLC', '20 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (343, 'Mills Logistic LLC', '458 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (344, 'Jacob Electronic Inc.', '193 Canal Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (345, 'Bobby Inc.', '512 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (346, 'Soto Brothers Inc.', '175 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (347, 'Ruth LLC', '713 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (348, 'Kelly''s Software LLC', '503 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (349, 'Silva Brothers Network Systems LLC', '255 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (350, 'James Electronic LLC', '734 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (351, 'Larry Software Inc.', '601 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (352, 'Torres Brothers Engineering LLC', '596 West Houston Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (353, 'Edward Inc.', '86 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (354, 'Reyes''s Engineering LLC', '115 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (355, 'Albert Network Systems LLC', '241 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (356, 'Jane Logistic Inc.', '493 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (357, 'Alexander Electronic LLC', '377 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (358, 'John Engineering Inc.', '588 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (359, 'Bryan Pharmaceutical Inc.', '811 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (360, 'Crystal LLC', '747 Tremont Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (361, 'Moreno Brothers LLC', '95 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (362, 'Meyer''s LLC', '703 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (363, 'Murphy''s Inc.', '68 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (364, 'Harrison Brothers Trading Inc.', '515 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (365, 'Judy LLC', '918 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (366, 'Castillo Brothers Logistic Inc.', '492 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (367, 'Lee Brothers Food LLC', '315 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (368, 'Timothy LLC', '932 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (369, 'Tony Inc.', '431 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (370, 'Paula Inc.', '416 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (371, 'Hill Brothers Pharmaceutical Inc.', '551 Canal Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (372, 'Hill Brothers Technology LLC', '467 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (373, 'Stevens Brothers Trading LLC', '161 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (374, 'Vasquez''s Inc.', '672 Fern Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (375, 'Sheila Consultants Inc.', '141 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (376, 'Gonzalez''s Network Systems Inc.', '123 Fern Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (377, 'Alexander''s LLC', '295 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (378, 'Meyer Brothers Software Inc.', '159 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (379, 'Rivera''s Technology LLC', '398 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (380, 'Timothy Network Systems LLC', '291 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (381, 'Marvin Network Systems Inc.', '910 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (382, 'Manuel Network Systems Inc.', '407 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (383, 'Antonio Inc.', '355 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (384, 'Bailey Brothers Inc.', '802 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (385, 'Jenkins Electronic Inc.', '951 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (386, 'Nancy Engineering Inc.', '111 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (387, 'Juanita LLC', '628 Rush Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (388, 'Anderson Telecommunication Inc.', '830 Lark Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (389, 'Nguyen Inc.', '65 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (390, 'Gardner Inc.', '58 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (391, 'Antonio Technology LLC', '506 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (392, 'Tiffany LLC', '815 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (393, 'Esther Trading Inc.', '302 Nostrand Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (394, 'Schmidt''s Food LLC', '234 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (395, 'Rita Toy LLC', '451 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (396, 'Tracy Inc.', '374 Alameda Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (397, 'Marjorie LLC', '987 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (398, 'Nancy Engineering LLC', '21 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (399, 'Peterson Brothers Network Systems LLC', '412 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (400, 'Jeremy Software LLC', '915 Flatbush Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (401, 'Grant Communications LLC', '529 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (402, 'Lucille Network Systems Inc.', '190 West Houston Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (403, 'Kevin Communications LLC', '819 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (404, 'Silva Network Systems Inc.', '327 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (405, 'Tina Trading Inc.', '120 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (406, 'Kathy Network Systems LLC', '410 Sky Way', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (407, 'Melissa Network Systems LLC', '470 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (408, 'Juanita LLC', '749 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (409, 'Boyd''s Inc.', '630 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (410, 'James Electronic LLC', '600 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (411, 'Willie Electronic Inc.', '281 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (412, 'Willie LLC', '678 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (413, 'Tracy Inc.', '933 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (414, 'Hazel Pharmaceutical Inc.', '860 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (415, 'Burns Consultants Inc.', '79 Canal Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (416, 'Beverly LLC', '971 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (417, 'Morgan Electronic LLC', '244 West Market Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (418, 'Kim Inc.', '585 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (419, 'Leslie Software Inc.', '701 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (420, 'Ferguson Brothers Technology Inc.', '335 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (421, 'Dixon''s Electronic LLC', '463 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (422, 'Norma Technology Inc.', '398 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (423, 'Fernandez''s Communications Inc.', '379 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (424, 'Bradley Inc.', '966 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (425, 'Jackson Brothers Food Inc.', '174 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (426, 'Katherine Inc.', '613 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (427, 'Williams''s Network Systems LLC', '621 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (428, 'Perez''s LLC', '227 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (429, 'Simmons Technology LLC', '105 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (430, 'Reyes Brothers Toy Inc.', '235 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (431, 'Vargas Telecommunication Inc.', '637 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (432, 'Hamilton Inc.', '622 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (433, 'Boyd''s LLC', '300 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (434, 'Brandon Inc.', '159 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (435, 'Bobby Inc.', '774 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (436, 'Debbie Engineering LLC', '749 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (437, 'Mcdonald''s Communications Inc.', '729 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (438, 'Mendoza Brothers Engineering LLC', '558 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (439, 'Washington Brothers Inc.', '599 West Houston Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (440, 'Harry Inc.', '282 Tremont Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (441, 'Justin Engineering LLC', '457 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (442, 'Gregory Inc.', '995 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (443, 'Joseph Inc.', '776 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (444, 'Schmidt Inc.', '742 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (445, 'Norman LLC', '886 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (446, 'Lee Technology LLC', '125 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (447, 'Stephanie LLC', '808 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (448, 'Mildred Communications LLC', '737 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (449, 'Carolyn Inc.', '161 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (450, 'Edith Toy Inc.', '594 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (451, 'Gonzales Technology Inc.', '353 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (452, 'Ethel LLC', '508 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (453, 'Brooks''s Electronic Inc.', '788 Flatbush Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (454, 'Dale Communications LLC', '38 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (455, 'Gladys Inc.', '383 State Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (456, 'Jenkins Inc.', '395 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (457, 'Aaron Logistic LLC', '458 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (458, 'Philip Toy LLC', '283 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (459, 'Robinson''s Inc.', '682 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (460, 'Chen Brothers Inc.', '827 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (461, 'Howard''s LLC', '897 Alameda Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (462, 'Alvarez Communications LLC', '790 Pedway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (463, 'Mildred Network Systems LLC', '980 Columbia St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (464, 'Price''s LLC', '462 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (465, 'Holmes Trading Inc.', '221 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (466, 'Micheal Inc.', '432 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (467, 'Albert Consultants LLC', '785 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (468, 'Diane Inc.', '163 East Alley', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (469, 'Vasquez Pharmaceutical Inc.', '814 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (470, 'Simmons''s Inc.', '11 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (471, 'Wagner Brothers Consultants Inc.', '636 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (472, 'Rhonda Inc.', '737 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (473, 'Rita Inc.', '412 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (474, 'Chavez Brothers Logistic LLC', '88 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (475, 'Francis LLC', '397 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (476, 'Crystal Inc.', '357 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (477, 'Beverly LLC', '747 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (478, 'Julie Logistic Inc.', '756 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (479, 'Clark''s Software LLC', '484 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (480, 'Smith Brothers Electronic LLC', '953 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (481, 'Lucille LLC', '289 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (482, 'Lee Brothers Network Systems LLC', '761 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (483, 'Raymond Software Inc.', '694 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (484, 'James Brothers LLC', '807 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (485, 'Henry Inc.', '955 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (486, 'Frank Electronic LLC', '323 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (487, 'Phyllis Network Systems Inc.', '440 Flatbush Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (488, 'Chen Brothers LLC', '838 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (489, 'Castro Technology LLC', '518 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (490, 'Katherine Inc.', '992 Figueroa Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (491, 'Washington''s Pharmaceutical Inc.', '42 Alameda Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (492, 'Stephanie Electronic Inc.', '545 East Alley', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (493, 'Long LLC', '573 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (494, 'Ellis Inc.', '526 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (495, 'Murray Brothers Pharmaceutical LLC', '381 S Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (496, 'Ellen Electronic Inc.', '561 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (497, 'Wilson Electronic Inc.', '874 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (498, 'Williams''s Inc.', '614 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (499, 'Burns Telecommunication Inc.', '838 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (500, 'Kim''s LLC', '490 Lark Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (501, 'Gutierrez Inc.', '749 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (502, 'Castro LLC', '672 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (503, 'Olson Trading LLC', '260 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (504, 'Gonzales Brothers Inc.', '262 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (505, 'Ross''s Inc.', '681 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (506, 'Carl LLC', '494 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (507, 'Alvarez''s Communications Inc.', '170 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (508, 'Deborah LLC', '816 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (509, 'Holmes Food Inc.', '277 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (510, 'Cole Brothers Trading Inc.', '416 Columbia St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (511, 'Walker Electronic Inc.', '890 Flatbush Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (512, 'Ann LLC', '505 East Alley', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (513, 'Boyd Brothers Logistic Inc.', '215 S Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (514, 'Ford Brothers Telecommunication Inc.', '663 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (515, 'Clarence Inc.', '772 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (516, 'Morales Engineering Inc.', '996 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (517, 'Warren LLC', '345 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (518, 'Dunn''s LLC', '48 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (519, 'Brooks Technology Inc.', '1 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (520, 'Ramos Brothers Toy Inc.', '86 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (521, 'Griffin''s Telecommunication Inc.', '346 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (522, 'Billy Consultants Inc.', '956 Wall Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (523, 'Lisa Inc.', '445 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (524, 'John Engineering LLC', '627 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (525, 'Gordon Inc.', '545 Lark Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (526, 'Ellen Inc.', '629 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (527, 'Ferguson Brothers Inc.', '585 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (528, 'Jason Logistic Inc.', '550 Rush Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (529, 'Jackson''s LLC', '722 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (530, 'Thomas LLC', '910 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (531, 'Tracy Inc.', '414 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (532, 'Theodore Software Inc.', '533 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (533, 'Jason Communications LLC', '479 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (534, 'Annie LLC', '706 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (535, 'Stevens Brothers Logistic LLC', '976 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (536, 'Martha Pharmaceutical Inc.', '903 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (537, 'Lopez Electronic LLC', '663 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (538, 'Foster Brothers LLC', '933 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (539, 'Willie Software LLC', '208 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (540, 'Thompson Software LLC', '811 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (541, 'Morales Brothers Electronic Inc.', '761 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (542, 'Kim Food Inc.', '226 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (543, 'Flores Telecommunication Inc.', '539 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (544, 'Anna LLC', '204 Figueroa Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (545, 'Margaret Technology LLC', '843 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (546, 'Deborah Inc.', '633 Alameda Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (547, 'Martin''s Logistic LLC', '343 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (548, 'Gibson Brothers Software Inc.', '326 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (549, 'Cynthia Communications LLC', '433 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (550, 'Michelle LLC', '767 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (551, 'Norma Trading LLC', '902 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (552, 'Cynthia Pharmaceutical LLC', '870 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (553, 'Brown LLC', '529 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (554, 'Grace Inc.', '626 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (555, 'Ronald Inc.', '217 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (556, 'Leonard Inc.', '556 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (557, 'Silva LLC', '543 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (558, 'Chad Inc.', '831 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (559, 'Wilson''s Electronic Inc.', '33 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (560, 'Jackson Logistic Inc.', '967 Pedway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (561, 'Stephens''s Electronic LLC', '876 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (562, 'Jacqueline LLC', '506 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (563, 'Roy LLC', '775 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (564, 'Johnson Consultants LLC', '894 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (565, 'Olson Brothers LLC', '644 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (566, 'Leslie Software LLC', '967 Rush Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (567, 'Ruth Toy Inc.', '438 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (568, 'Phillip Network Systems LLC', '72 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (569, 'Kevin Engineering Inc.', '841 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (570, 'Lee Brothers Consultants LLC', '828 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (571, 'Scott''s Logistic Inc.', '932 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (572, 'Hernandez LLC', '964 West Market Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (573, 'Jackson Brothers Engineering Inc.', '90 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (574, 'Cynthia Communications Inc.', '380 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (575, 'Garcia''s Inc.', '509 Nostrand Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (576, 'Simmons''s Inc.', '466 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (577, 'Lisa Trading LLC', '327 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (578, 'Taylor Network Systems LLC', '904 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (579, 'Watson''s Consultants LLC', '571 Wicklow Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (580, 'Betty Pharmaceutical Inc.', '690 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (581, 'Fred Telecommunication Inc.', '930 East Cooke Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (582, 'Bell''s Electronic LLC', '640 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (583, 'Denise Inc.', '149 Bank Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (584, 'Robert Telecommunication Inc.', '725 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (585, 'Mendoza Brothers Inc.', '737 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (586, 'Black Telecommunication Inc.', '37 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (587, 'Crawford''s LLC', '722 Alameda Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (588, 'Tran Technology LLC', '821 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (589, 'Stewart Electronic Inc.', '670 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (590, 'Alan Inc.', '675 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (591, 'Pamela Communications LLC', '883 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (592, 'Danielle Trading LLC', '258 Diplomacy Drive', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (593, 'Hamilton LLC', '717 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (594, 'Morales Brothers Software LLC', '919 Riverview Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (595, 'Eugene Consultants LLC', '720 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (596, 'Norma Inc.', '433 S Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (597, 'Ruth Food Inc.', '212 Nostrand Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (598, 'Ellen Toy Inc.', '450 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (599, 'Henry Technology Inc.', '416 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (600, 'Watson Brothers Pharmaceutical LLC', '143 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (601, 'Ruiz''s Software LLC', '611 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (602, 'Barnes''s Trading Inc.', '847 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (603, 'Wagner Food Inc.', '19 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (604, 'Keith Pharmaceutical LLC', '327 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (605, 'Nguyen Communications LLC', '264 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (606, 'Jimenez Inc.', '994 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (607, 'Rhonda Network Systems LLC', '409 Rush Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (608, 'Joyce LLC', '541 Collier Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (609, 'Henry Telecommunication Inc.', '781 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (610, 'Simpson Logistic Inc.', '124 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (611, 'Carol Electronic LLC', '285 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (612, 'Roberts''s Consultants Inc.', '486 Wicklow Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (613, 'Martin''s Telecommunication LLC', '489 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (614, 'Charles Network Systems Inc.', '989 West Market Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (615, 'Bell Consultants Inc.', '757 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (616, 'Linda Toy Inc.', '675 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (617, 'Aaron Inc.', '163 Rush Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (618, 'Norman Pharmaceutical Inc.', '924 Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (619, 'Garcia Brothers Inc.', '23 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (620, 'Spencer Technology Inc.', '573 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (621, 'Nguyen Brothers LLC', '961 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (622, 'Connie Inc.', '854 Columbia St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (623, 'Rose Toy Inc.', '437 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (624, 'Debra Consultants LLC', '957 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (625, 'Snyder Brothers Technology LLC', '146 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (626, 'Peterson Inc.', '482 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (627, 'Elaine Pharmaceutical LLC', '640 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (628, 'Alice Electronic Inc.', '26 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (629, 'Jones Brothers Engineering LLC', '136 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (630, 'Williams''s Communications Inc.', '135 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (631, 'Patricia Toy Inc.', '135 Flatbush Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (632, 'Rice Brothers Technology LLC', '681 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (633, 'Micheal LLC', '264 Fern Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (634, 'Tammy Technology LLC', '823 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (635, 'Phyllis Pharmaceutical LLC', '231 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (636, 'Webb Engineering Inc.', '830 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (637, 'Martha Toy LLC', '586 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (638, 'Victoria Pharmaceutical LLC', '238 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (639, 'Butler Brothers Food LLC', '22 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (640, 'Gary LLC', '715 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (641, 'Jeffery LLC', '801 Rush Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (642, 'Jeffery Communications LLC', '187 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (643, 'Rodriguez Brothers Inc.', '822 Lark Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (644, 'Betty Food LLC', '922 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (645, 'Snyder''s Communications LLC', '44 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (646, 'Gonzales''s Telecommunication Inc.', '685 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (647, 'Lucille Engineering Inc.', '112 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (648, 'Reynolds Brothers Inc.', '436 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (649, 'Alvarez LLC', '765 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (650, 'Joseph Food Inc.', '384 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (651, 'Jenkins Brothers Toy LLC', '337 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (652, 'Cooper Network Systems LLC', '420 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (653, 'Anderson Brothers Inc.', '21 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (654, 'Morris Brothers LLC', '517 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (655, 'Gonzales Inc.', '980 S Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (656, 'Russell Pharmaceutical Inc.', '462 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (657, 'Richard Software Inc.', '814 Flatbush Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (658, 'Hughes Toy Inc.', '757 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (659, 'Jeffrey LLC', '604 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (660, 'Kelly Brothers LLC', '329 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (661, 'Jimmy Telecommunication LLC', '664 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (662, 'Snyder''s Technology Inc.', '262 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (663, 'Shannon Inc.', '514 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (664, 'Joan Engineering LLC', '207 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (665, 'Lisa Software LLC', '83 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (666, 'Murphy Brothers Pharmaceutical Inc.', '180 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (667, 'Lewis Brothers Toy LLC', '341 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (668, 'Marilyn LLC', '709 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (669, 'White''s Food Inc.', '417 Wicklow Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (670, 'Rhonda Telecommunication Inc.', '607 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (671, 'Fox Brothers Engineering Inc.', '370 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (672, 'Gray Brothers Software LLC', '705 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (673, 'Martha Communications LLC', '49 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (674, 'Chavez Inc.', '916 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (675, 'Rivera''s Inc.', '592 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (676, 'Anna Technology Inc.', '177 Wicklow Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (677, 'Ramirez Food LLC', '85 Ridgewood Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (678, 'Charlotte Technology LLC', '739 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (679, 'Mildred Inc.', '888 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (680, 'Elaine Inc.', '217 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (681, 'Rose Consultants LLC', '18 Figueroa Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (682, 'Roger Electronic LLC', '867 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (683, 'Gladys Inc.', '124 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (684, 'Justin Inc.', '65 1st Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (685, 'Mario LLC', '635 Canal Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (686, 'Boyd Electronic Inc.', '367 Ridgewood Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (687, 'Robinson''s Consultants Inc.', '812 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (688, 'Kennedy Brothers LLC', '45 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (689, 'Julie Telecommunication LLC', '664 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (690, 'Roger LLC', '609 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (691, 'Eddie Inc.', '144 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (692, 'Gladys Technology Inc.', '477 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (693, 'Hernandez''s Telecommunication LLC', '600 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (694, 'April Consultants LLC', '669 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (695, 'Janice Inc.', '241 West Houston Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (696, 'Daniel Pharmaceutical Inc.', '567 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (697, 'Cindy Communications Inc.', '825 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (698, 'Marcus Inc.', '410 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (699, 'Lisa Logistic Inc.', '723 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (700, 'Linda LLC', '372 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (701, 'Holmes Brothers LLC', '423 Tremont Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (702, 'Melissa Engineering LLC', '844 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (703, 'Wells''s Technology Inc.', '630 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (704, 'Leslie LLC', '248 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (705, 'Edward Pharmaceutical Inc.', '205 Lark Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (706, 'Jeffrey Network Systems LLC', '950 Wicklow Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (707, 'Webb Consultants LLC', '885 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (708, 'Jerry Inc.', '716 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (709, 'Morales Inc.', '361 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (710, 'Graham''s Consultants Inc.', '355 Pedway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (711, 'Connie Trading Inc.', '966 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (712, 'Walker Brothers Inc.', '121 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (713, 'Kelly Inc.', '643 Fern Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (714, 'Virginia Telecommunication LLC', '568 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (715, 'Carter''s Logistic LLC', '669 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (716, 'Gerald Trading Inc.', '218 Figueroa Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (717, 'Amber Pharmaceutical Inc.', '733 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (718, 'Meyer Engineering Inc.', '877 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (719, 'Douglas Food LLC', '65 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (720, 'Stephens Inc.', '650 Bank Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (721, 'Richard Software LLC', '403 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (722, 'Frank LLC', '671 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (723, 'Ruiz Telecommunication Inc.', '858 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (724, 'Jacqueline Pharmaceutical LLC', '428 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (725, 'Smith Trading Inc.', '72 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (726, 'Stanley LLC', '217 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (727, 'Joe Food Inc.', '907 Broadway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (728, 'Troy Food Inc.', '493 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (729, 'Moreno Communications Inc.', '5 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (730, 'Sean Inc.', '359 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (731, 'Simpson''s Consultants LLC', '21 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (732, 'Thomas''s Inc.', '496 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (733, 'Clifford Pharmaceutical LLC', '501 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (734, 'Rogers''s Communications LLC', '861 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (735, 'Alfred Inc.', '398 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (736, 'Rosa Food Inc.', '587 Canal Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (737, 'Diana Engineering Inc.', '508 S Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (738, 'Soto''s Logistic LLC', '404 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (739, 'Rice Brothers LLC', '966 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (740, 'Howard LLC', '442 Columbia St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (741, 'Carlos Inc.', '397 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (742, 'Aguilar Technology Inc.', '93 Alameda Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (743, 'Simpson''s Inc.', '602 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (744, 'Teresa LLC', '355 Bank Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (745, 'Marjorie LLC', '554 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (746, 'Melissa Pharmaceutical LLC', '286 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (747, 'Allen Trading LLC', '256 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (748, 'Diana Electronic LLC', '727 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (749, 'Bell Brothers LLC', '68 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (750, 'Dennis Food LLC', '265 West Houston Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (751, 'Glenn LLC', '467 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (752, 'Mike Trading Inc.', '637 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (753, 'Mendoza''s Network Systems LLC', '227 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (754, 'Shawn Consultants LLC', '156 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (755, 'Miller''s Inc.', '308 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (756, 'Lopez''s Inc.', '808 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (757, 'Gloria Inc.', '935 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (758, 'Barnes''s Inc.', '457 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (759, 'Dixon''s LLC', '582 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (760, 'Perez Brothers Pharmaceutical LLC', '951 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (761, 'Jordan''s Inc.', '353 Lark Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (762, 'Laura Toy LLC', '285 S Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (763, 'Laura Inc.', '640 Flatbush Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (764, 'Joan Inc.', '142 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (765, 'Manuel Inc.', '960 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (766, 'Coleman Brothers LLC', '335 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (767, 'Doris Electronic Inc.', '513 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (768, 'Joseph LLC', '250 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (769, 'Fox Brothers Pharmaceutical LLC', '878 Diplomacy Drive', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (770, 'Dawn Inc.', '113 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (771, 'Walter Inc.', '865 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (772, 'Cheryl Inc.', '68 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (773, 'Dorothy Telecommunication LLC', '327 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (774, 'Nelson''s Consultants Inc.', '506 Figueroa Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (775, 'Evans Brothers Network Systems Inc.', '603 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (776, 'Hernandez''s LLC', '787 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (777, 'Davis''s Inc.', '353 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (778, 'Tina Consultants Inc.', '878 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (779, 'Jenkins''s Pharmaceutical Inc.', '80 Lark Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (780, 'Turner''s Inc.', '674 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (781, 'Randall LLC', '757 Nostrand Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (782, 'Doris Software LLC', '876 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (783, 'Jeffery Technology LLC', '168 Bank Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (784, 'Campbell Brothers Telecommunication LLC', '499 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (785, 'Olson''s LLC', '132 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (786, 'Glenn Trading Inc.', '533 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (787, 'Marvin Electronic LLC', '193 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (788, 'Debra Pharmaceutical LLC', '695 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (789, 'Patrick LLC', '670 Wall Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (790, 'Martha Consultants Inc.', '801 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (791, 'Jordan Brothers Engineering Inc.', '104 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (792, 'Herrera Brothers Inc.', '897 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (793, 'Sarah Trading Inc.', '239 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (794, 'Eugene Food LLC', '301 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (795, 'Marilyn Technology Inc.', '328 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (796, 'Adam LLC', '762 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (797, 'Anthony Logistic LLC', '157 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (798, 'Ann Inc.', '900 Columbia St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (799, 'Alexander Toy LLC', '389 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (800, 'Jimmy Logistic Inc.', '388 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (801, 'Annie Network Systems LLC', '414 1st Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (802, 'Henry Brothers Telecommunication LLC', '377 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (803, 'Wanda Software LLC', '498 Fifth Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (804, 'Phyllis LLC', '421 Diplomacy Drive', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (805, 'Thelma Communications Inc.', '230 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (806, 'Victoria Inc.', '487 East Cooke Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (807, 'Martin Food LLC', '664 Wicklow Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (808, 'Porter Trading Inc.', '803 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (809, 'Johnny Trading LLC', '519 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (810, 'Terry Engineering Inc.', '930 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (811, 'Russell Brothers Consultants Inc.', '429 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (812, 'Amy Software Inc.', '996 Ridgewood Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (813, 'Peggy LLC', '402 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (814, 'Christine Technology LLC', '913 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (815, 'Rosa Pharmaceutical Inc.', '540 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (816, 'Charlotte Inc.', '39 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (817, 'Eddie Consultants LLC', '549 Figueroa Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (818, 'Steven LLC', '504 Sky Way', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (819, 'Scott''s Toy Inc.', '306 Nostrand Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (820, 'Williams Technology LLC', '444 Bergen St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (821, 'Mason Electronic Inc.', '874 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (822, 'Phillip LLC', '314 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (823, 'Stephen LLC', '7 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (824, 'Herrera Brothers Trading LLC', '56 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (825, 'Brenda Inc.', '342 East Alley', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (826, 'Williams Trading Inc.', '183 West Market Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (827, 'Kenneth Telecommunication Inc.', '212 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (828, 'Cox Brothers LLC', '229 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (829, 'Perry Brothers Consultants Inc.', '40 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (830, 'Alvarez''s Software Inc.', '424 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (831, 'Kennedy''s Software LLC', '395 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (832, 'Carmen Communications Inc.', '4 West Houston Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (833, 'Rodriguez Brothers Logistic LLC', '289 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (834, 'Crawford Logistic Inc.', '274 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (835, 'Burns Brothers LLC', '676 Pedway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (836, 'Mason Network Systems LLC', '95 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (837, 'Gladys LLC', '302 State Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (838, 'Lucille Engineering Inc.', '967 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (839, 'Anderson Consultants Inc.', '763 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (840, 'Washington Inc.', '499 Fifth Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (841, 'White Toy LLC', '401 Alameda Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (842, 'Sanchez Inc.', '686 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (843, 'Stanley Consultants LLC', '143 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (844, 'Deborah Communications Inc.', '305 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (845, 'Robertson Brothers Inc.', '612 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (846, 'Morris Brothers Telecommunication LLC', '316 Wooster Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (847, 'Alice Toy Inc.', '653 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (848, 'Castro''s Software Inc.', '504 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (849, 'King''s Engineering LLC', '867 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (850, 'Bell Brothers Software Inc.', '495 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (851, 'Lewis''s Inc.', '139 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (852, 'Jacqueline LLC', '39 Bank Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (853, 'Douglas LLC', '502 Collier Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (854, 'Tran Technology LLC', '220 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (855, 'Carol LLC', '328 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (856, 'Joyce Electronic Inc.', '383 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (857, 'Cook Brothers Trading LLC', '265 Fern Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (858, 'Andrea LLC', '854 Sky Way', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (859, 'Silva Brothers LLC', '147 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (860, 'Kyle LLC', '770 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (861, 'Sean LLC', '639 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (862, 'Fisher''s Inc.', '259 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (863, 'Foster Brothers Engineering LLC', '853 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (864, 'Jenkins''s Toy Inc.', '728 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (865, 'Evans''s Inc.', '958 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (866, 'Lewis Software Inc.', '762 Grape Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (867, 'Russell Communications LLC', '956 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (868, 'Jeffery Technology LLC', '746 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (869, 'Black''s Logistic LLC', '37 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (870, 'Vargas Technology Inc.', '484 Collier Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (871, 'Gladys Software Inc.', '714 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (872, 'Margaret Inc.', '240 Bergen St', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (873, 'Patterson Communications Inc.', '377 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (874, 'Ramos Consultants Inc.', '643 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (875, 'Carol LLC', '825 Canal Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (876, 'Kennedy LLC', '800 Central Avenue', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (877, 'Amy Engineering LLC', '396 Figueroa Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (878, 'Crawford LLC', '183 1st Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (879, 'Murray''s Food Inc.', '545 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (880, 'Sylvia LLC', '447 Canal Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (881, 'Sullivan Brothers Trading LLC', '7 East Alley', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (882, 'Bell Brothers LLC', '49 Columbia St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (883, 'Vargas Brothers LLC', '277 Wooster Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (884, 'Ward Brothers Communications LLC', '722 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (885, 'Ryan Brothers LLC', '532 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (886, 'Medina Brothers Pharmaceutical Inc.', '348 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (887, 'Green Brothers Consultants Inc.', '372 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (888, 'Weaver''s Pharmaceutical LLC', '11 West Houston Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (889, 'Wilson''s Network Systems LLC', '461 East Alley', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (890, 'Barnes Brothers Logistic Inc.', '570 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (891, 'Angela Network Systems LLC', '589 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (892, 'Jesus LLC', '453 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (893, 'Frederick Pharmaceutical Inc.', '172 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (894, 'Connie Communications LLC', '90 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (895, 'Roy Network Systems LLC', '858 Grape Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (896, 'Kim Logistic LLC', '945 Tremont Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (897, 'Joseph LLC', '463 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (898, 'James''s Inc.', '534 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (899, 'Leslie LLC', '568 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (900, 'Mcdonald''s Inc.', '305 Diplomacy Drive', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (901, 'Lee Brothers Software LLC', '49 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (902, 'Bruce Communications Inc.', '365 Nostrand Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (903, 'Evans Logistic Inc.', '23 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (904, 'Brown''s Electronic LLC', '732 Ridgewood Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (905, 'Holmes Consultants LLC', '274 Flatbush Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (906, 'Leonard Food LLC', '878 Riverview Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (907, 'Stanley Toy LLC', '820 Nostrand Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (908, 'Simpson''s Telecommunication Inc.', '152 State Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (909, 'Rose''s Inc.', '687 Fifth Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (910, 'Charlotte Inc.', '479 Rush Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (911, 'Morales''s LLC', '766 West Houston Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (912, 'Wright Inc.', '67 Pedway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (913, 'Jesus Inc.', '775 Lark Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (914, 'Hill Food Inc.', '547 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (915, 'Gary Inc.', '668 Wooster Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (916, 'Rice LLC', '278 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (917, 'Ryan Brothers Inc.', '668 North Michigan Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (918, 'Castro Brothers LLC', '809 East Alley', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (919, 'Herbert Communications LLC', '748 Canal Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (920, 'Carmen LLC', '821 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (921, 'Cox Technology Inc.', '939 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (922, 'Karen Telecommunication LLC', '824 Collier Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (923, 'Carrie Inc.', '369 Ridgewood Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (924, 'Jones''s Pharmaceutical LLC', '867 Riverview Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (925, 'Louise Technology Inc.', '365 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (926, 'Christine Inc.', '135 Alameda Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (927, 'Romero''s Trading LLC', '613 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (928, 'Victor Telecommunication Inc.', '179 S Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (929, 'Scott Logistic LLC', '270 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (930, 'Curtis Consultants Inc.', '642 East Cooke Road', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (931, 'Randall Telecommunication LLC', '145 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (932, 'Lewis Electronic LLC', '375 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (933, 'Marilyn Food LLC', '597 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (934, 'Paula Logistic Inc.', '530 1st Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (935, 'Rivera Brothers Pharmaceutical LLC', '166 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (936, 'Chen Toy LLC', '862 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (937, 'Jenkins''s Telecommunication Inc.', '100 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (938, 'Woods''s Logistic LLC', '425 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (939, 'Stewart Technology LLC', '144 State Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (940, 'Ortiz Brothers Electronic LLC', '547 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (941, 'Gladys Technology LLC', '994 Canal Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (942, 'Nicholas Inc.', '648 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (943, 'Marshall''s Pharmaceutical Inc.', '867 Wall Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (944, 'Robertson''s Toy LLC', '56 East Cooke Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (945, 'Taylor Toy LLC', '971 West Houston Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (946, 'Moore LLC', '391 Columbia St', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (947, 'Nelson Trading Inc.', '102 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (948, 'Francisco Inc.', '227 Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (949, 'Phillips LLC', '901 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (950, 'Anthony Food Inc.', '428 Grape Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (951, 'Gutierrez LLC', '474 Bank Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (952, 'Monica Communications LLC', '198 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (953, 'Jenkins''s Inc.', '891 Wall Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (954, 'Cruz''s Network Systems LLC', '511 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (955, 'Dorothy Trading LLC', '260 Wooster Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (956, 'Lisa Technology Inc.', '797 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (957, 'Luis LLC', '706 Sky Way', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (958, 'Anderson Brothers Inc.', '742 Broadway', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (959, 'Guzman Trading LLC', '792 Fifth Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (960, 'Henderson''s Logistic Inc.', '618 Rush Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (961, 'Owens Brothers Food LLC', '639 East Alley', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (962, 'Catherine Electronic Inc.', '888 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (963, 'Eric Consultants Inc.', '328 North Michigan Ave', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (964, 'Jamie Toy Inc.', '839 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (965, 'Black Telecommunication LLC', '664 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (966, 'Ethel LLC', '392 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (967, 'Hunter Brothers Inc.', '15 Fern Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (968, 'Janet Telecommunication Inc.', '101 S Broadway', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (969, 'Gary Technology LLC', '170 West Market Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (970, 'Grant''s Consultants LLC', '150 Grape Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (971, 'Foster Inc.', '513 Riverview Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (972, 'Sylvia Software Inc.', '700 Figueroa Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (973, 'Hall Consultants LLC', '758 Pedway', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (974, 'Bryan Software Inc.', '680 Lark Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (975, 'Mendez Inc.', '587 North Michigan Ave', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (976, 'Danielle Consultants LLC', '911 Ridgewood Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (977, 'Guzman Inc.', '447 Fern Street', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (978, 'Danielle Electronic Inc.', '893 West Market Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (979, 'Pamela Inc.', '262 Diplomacy Drive', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (980, 'Clarence Inc.', '972 North Michigan Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (981, 'Guzman Technology LLC', '490 Tremont Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (982, 'Perry Brothers Telecommunication Inc.', '72 Lark Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (983, 'Cox Brothers Electronic Inc.', '669 Figueroa Street', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (984, 'Gomez Brothers LLC', '263 East Alley', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (985, 'Steve Food Inc.', '246 Wicklow Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (986, 'Dawn Logistic LLC', '542 Tremont Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (987, 'Alfred Electronic LLC', '409 Figueroa Street', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (988, 'Rodriguez Telecommunication Inc.', '364 S Broadway', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (989, 'Lopez Brothers LLC', '167 1st Ave', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (990, 'Jessica LLC', '630 Central Avenue', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (991, 'Rivera Inc.', '385 Wall Street', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (992, 'Kennedy Brothers LLC', '878 Tremont Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (993, 'Anderson''s Technology Inc.', '628 Bergen St', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (994, 'Martha LLC', '923 Bergen St', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (995, 'Miller Software Inc.', '650 Sky Way', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (996, 'Perry Software LLC', '954 Flatbush Ave', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (997, 'Fred Electronic LLC', '166 Central Avenue', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (998, 'Brian LLC', '490 Central Avenue', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (999, 'Michael Communications LLC', '678 Wicklow Road', 1.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (1000, 'Gray Brothers LLC', '514 Riverview Road', 0.00, 1.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (1001, 'Edward Network Systems Inc.', '134 Diplomacy Drive', 1.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');
INSERT INTO auth_bib.auth_company_copy1 VALUES (1002, 'Anita LLC', '800 Wicklow Road', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'DEACTIVE');


--
-- TOC entry 3090 (class 0 OID 17255)
-- Dependencies: 217
-- Data for Name: auth_login_log; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_login_log VALUES (76, 1, 'OK', '2', '2022-04-05 16:58:00.707317', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (65, 1, 'OK', '2', '2022-04-05 14:53:25.95083', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (67, 1, 'OK', '2', '2022-04-05 14:53:40.098586', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (66, 1, 'OK', '2', '2022-04-05 14:53:38.656973', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (74, 1, 'OK', '2', '2022-04-05 16:00:44.175638', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (69, 999, 'OK', '2', '2022-04-05 14:56:33.062689', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (68, 1, 'OK', '2', '2022-04-05 14:55:35.530041', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (71, 1, 'OK', '2', '2022-04-05 15:08:56.529655', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (70, 1, 'OK', '2', '2022-04-05 14:57:56.826957', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (73, 1, 'OK', '2', '2022-04-05 15:25:18.474085', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (72, 16, 'OK', '2', '2022-04-05 15:24:33.643229', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (75, 1, 'OK', '2', '2022-04-05 16:03:32.510049', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (78, 1, 'OK', '2', '2022-04-05 16:58:38.307166', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (79, 1, 'OK', '2', '2022-04-05 16:58:39.388631', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (80, 1, 'FAIL', '2', '2022-04-05 16:58:46.517266', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (81, 1, 'FAIL', '2', '2022-04-05 16:58:47.468239', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (82, 1, 'FAIL', '2', '2022-04-05 16:58:48.428169', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (83, 1, 'FAIL', '2', '2022-04-05 16:58:55.070982', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (84, 1, 'FAIL', '2', '2022-04-05 16:59:00.477434', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (85, 1, 'OK', '2', '2022-04-05 17:11:54.48944', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (86, 1, 'OK', '2', '2022-04-05 17:12:13.90424', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (87, 1, 'OK', '2', '2022-04-05 17:28:22.016842', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (88, 25, 'OK', '1', '2022-04-05 17:33:30.809682', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (89, 25, 'OK', '1', '2022-04-05 17:34:46.724663', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (90, 25, 'OK', '1', '2022-04-05 17:34:47.436102', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (91, 25, 'FAIL', '1', '2022-04-05 17:34:49.842616', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (92, 25, 'FAIL', '1', '2022-04-05 17:34:50.412107', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (93, 1, 'FAIL', '2', '2022-04-06 08:26:16.689229', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (94, 1, 'FAIL', '2', '2022-04-06 08:27:22.843761', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (95, 37, 'FAIL', '1', '2022-04-06 08:29:14.045784', 'Hoang 111', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (96, 37, 'FAIL', '1', '2022-04-06 08:29:16.675285', 'Hoang 111', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (97, 37, 'FAIL', '1', '2022-04-06 08:29:17.435197', 'Hoang 111', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (98, 17, 'FAIL', '2', '2022-04-06 08:31:23.548541', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (99, 17, 'FAIL', '2', '2022-04-06 08:31:30.485179', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (100, 1, 'OK', '2', '2022-04-06 09:14:46.094096', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (101, 25, 'OK', '1', '2022-04-06 11:38:10.343946', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (102, 25, 'OK', '1', '2022-04-06 11:38:58.878003', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (103, 25, 'OK', '1', '2022-04-06 11:46:10.410497', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (104, 41, 'FAIL', '1', '2022-04-06 12:24:40.562225', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (105, 1, 'OK', '2', '2022-04-06 12:52:26.220022', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (106, 1, 'FAIL', '2', '2022-04-06 13:17:57.472329', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (107, 1, 'FAIL', '2', '2022-04-06 13:18:33.981318', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (108, 25, 'OK', '1', '2022-04-06 13:22:46.043814', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (109, 25, 'OK', '1', '2022-04-06 13:24:11.785333', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (110, 25, 'OK', '1', '2022-04-06 13:30:25.783885', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (111, 25, 'OK', '1', '2022-04-06 14:53:02.504618', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (112, 1, 'OK', '2', '2022-04-06 14:57:09.446742', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (113, 20, 'OK', '1', '2022-04-06 15:09:25.520389', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (114, 24, 'OK', '1', '2022-04-06 15:21:45.64923', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (115, 17, 'FAIL', '2', '2022-04-06 15:55:01.412389', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (116, 1, 'OK', '2', '2022-04-06 16:05:07.816926', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (117, 1, 'OK', '2', '2022-04-06 16:06:00.351713', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (118, 1, 'OK', '2', '2022-04-06 16:13:54.804198', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (119, 1, 'FAIL', '2', '2022-04-06 16:16:09.242629', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (120, 1, 'OK', '2', '2022-04-06 16:16:18.324657', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (121, 1, 'OK', '2', '2022-04-06 16:24:57.069461', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (122, 1, 'OK', '2', '2022-04-06 16:25:38.621904', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (123, 24, 'OK', '1', '2022-04-06 16:32:44.822463', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (124, 1, 'OK', '2', '2022-04-06 16:32:58.952856', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (125, 1, 'OK', '2', '2022-04-06 16:34:54.660875', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (126, 1, 'OK', '2', '2022-04-06 16:38:32.422355', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (127, 1, 'OK', '2', '2022-04-06 16:39:08.545675', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (128, 1, 'OK', '2', '2022-04-06 16:39:11.380375', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (129, 24, 'OK', '1', '2022-04-06 16:40:28.765804', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (130, 20, 'OK', '1', '2022-04-06 16:42:03.48972', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (131, 1, 'OK', '2', '2022-04-06 16:42:48.501231', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (132, 1, 'OK', '2', '2022-04-06 16:45:46.990392', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (133, 24, 'OK', '1', '2022-04-06 16:46:29.310185', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (134, 1, 'OK', '2', '2022-04-06 16:47:40.938246', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (135, 1, 'OK', '2', '2022-04-06 16:50:43.362083', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (136, 1, 'OK', '2', '2022-04-06 16:58:38.813915', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (137, 20, 'OK', '1', '2022-04-06 17:15:11.647738', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (138, 1, 'OK', '2', '2022-04-06 17:18:18.356931', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (139, 1, 'FAIL', '2', '2022-04-06 17:27:02.647818', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (140, 1, 'FAIL', '2', '2022-04-06 17:27:06.259999', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (141, 1, 'OK', '2', '2022-04-06 17:27:40.090535', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (142, 20, 'OK', '1', '2022-04-06 17:29:26.226167', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (143, 1, 'OK', '2', '2022-04-06 17:30:14.653445', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (144, 1, 'OK', '2', '2022-04-06 17:31:03.64738', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (145, 1, 'OK', '2', '2022-04-06 17:31:46.264251', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (146, 20, 'OK', '1', '2022-04-06 17:42:11.680903', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (147, 1, 'OK', '2', '2022-04-06 17:42:17.007066', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (148, 25, 'OK', '1', '2022-04-06 17:44:26.510323', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (149, 1, 'OK', '2', '2022-04-06 17:49:22.148085', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (150, 1, 'FAIL', '2', '2022-04-07 10:25:30.909669', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (151, 1, 'FAIL', '2', '2022-04-07 10:25:39.845686', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (152, 1, 'FAIL', '2', '2022-04-07 10:28:21.371254', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (153, 1, 'FAIL', '2', '2022-04-07 10:28:28.797864', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (154, 1, 'FAIL', '2', '2022-04-07 10:29:27.22237', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (155, 1, 'FAIL', '2', '2022-04-07 10:29:30.57465', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (156, 1, 'FAIL', '2', '2022-04-07 10:30:25.905338', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (157, 1, 'FAIL', '2', '2022-04-07 10:30:59.312457', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (158, 1, 'FAIL', '2', '2022-04-07 10:32:17.196706', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (159, 1, 'FAIL', '2', '2022-04-07 10:33:38.911366', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (160, 1, 'FAIL', '2', '2022-04-07 10:33:45.303345', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (161, 1, 'FAIL', '2', '2022-04-07 10:35:06.439113', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (162, 1, 'FAIL', '2', '2022-04-07 10:35:18.386939', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (163, 1, 'FAIL', '2', '2022-04-07 10:35:20.457966', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (164, 1, 'FAIL', '2', '2022-04-07 10:42:08.315744', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (165, 1, 'FAIL', '2', '2022-04-07 11:01:16.919115', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (166, 1, 'FAIL', '2', '2022-04-07 12:36:44.557458', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (167, 1, 'FAIL', '2', '2022-04-07 12:36:48.550808', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (168, 1, 'FAIL', '2', '2022-04-07 12:37:03.525879', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (169, 1, 'FAIL', '2', '2022-04-07 12:37:24.883187', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (170, 1, 'FAIL', '2', '2022-04-07 12:37:30.827802', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (171, 1, 'OK', '2', '2022-04-07 06:03:54.658794', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (172, 1, 'FAIL', '2', '2022-04-07 13:06:29.174924', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (173, 1, 'FAIL', '2', '2022-04-07 13:06:30.498594', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (174, 1, 'FAIL', '2', '2022-04-07 13:06:31.111762', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (175, 1, 'FAIL', '2', '2022-04-07 13:06:31.696242', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (176, 1, 'FAIL', '2', '2022-04-07 13:06:32.305392', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (177, 3, 'OK', '2', '2022-04-07 13:23:45.62377', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (178, 46, 'OK', '2', '2022-04-07 13:37:56.820068', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (179, 46, 'OK', '2', '2022-04-07 13:46:53.336317', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (180, 46, 'OK', '2', '2022-04-07 14:11:04.267395', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (181, 46, 'OK', '2', '2022-04-07 14:11:44.63463', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (182, 4, 'OK', '2', '2022-04-07 14:24:18.657587', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (183, 48, 'FAIL', '2', '2022-04-07 14:24:36.671003', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (184, 48, 'FAIL', '2', '2022-04-07 14:24:45.124922', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (185, 46, 'OK', '2', '2022-04-07 14:25:20.560007', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (186, 1, 'OK', '2', '2022-04-07 14:25:56.903405', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (187, 48, 'FAIL', '2', '2022-04-07 14:26:23.059422', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (188, 46, 'OK', '2', '2022-04-07 14:26:27.418436', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (189, 48, 'FAIL', '2', '2022-04-07 14:26:50.980089', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (190, 46, 'OK', '2', '2022-04-07 14:27:05.75674', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (191, 46, 'OK', '2', '2022-04-07 14:41:07.434286', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (192, 46, 'OK', '2', '2022-04-07 14:42:45.749321', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (193, 51, 'FAIL', '1', '2022-04-07 15:20:07.59965', 'Phanthuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (194, 51, 'FAIL', '1', '2022-04-07 15:22:40.201902', 'Phanthuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (195, 51, 'FAIL', '1', '2022-04-07 15:37:39.790026', 'Phanthuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (196, 51, 'FAIL', '1', '2022-04-07 15:37:44.780307', 'Phanthuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (197, 24, 'OK', '1', '2022-04-07 15:55:41.667924', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (198, 24, 'OK', '1', '2022-04-07 15:57:36.760569', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (199, 24, 'FAIL', '1', '2022-04-07 16:01:15.668329', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (200, 46, 'OK', '2', '2022-04-07 16:03:15.276592', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (201, 1, 'OK', '2', '2022-04-07 16:04:06.226797', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (202, 24, 'OK', '1', '2022-04-07 16:19:43.94659', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (203, 46, 'OK', '2', '2022-04-07 16:25:14.711668', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (204, 1, 'OK', '2', '2022-04-07 16:32:00.163561', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (205, 1, 'OK', '2', '2022-04-07 16:37:27.457082', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (206, 1, 'OK', '2', '2022-04-07 16:49:38.274454', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (207, 46, 'OK', '2', '2022-04-07 16:51:22.081107', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (208, 58, 'OK', '2', '2022-04-07 16:52:56.407491', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (209, 20, 'OK', '1', '2022-04-07 16:57:59.238792', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (210, 1, 'OK', '2', '2022-04-07 17:11:16.224759', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (211, 2, 'OK', '2', '2022-04-07 17:23:09.990435', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (212, 20, 'FAIL', '1', '2022-04-07 17:35:52.541424', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (213, 20, 'FAIL', '1', '2022-04-07 17:35:58.914554', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (214, 20, 'FAIL', '1', '2022-04-07 17:36:04.32963', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (215, 20, 'FAIL', '1', '2022-04-07 17:36:09.919262', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (216, 20, 'FAIL', '1', '2022-04-07 17:36:20.796599', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (217, 49, 'OK', '2', '2022-04-08 08:26:46.3821', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (218, 46, 'OK', '2', '2022-04-08 08:30:03.321355', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (219, 1, 'FAIL', '2', '2022-04-08 08:31:40.83278', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (220, 1, 'OK', '2', '2022-04-08 08:31:49.135188', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (221, 46, 'OK', '2', '2022-04-08 08:45:34.250047', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (222, 1, 'OK', '2', '2022-04-08 08:53:47.211098', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (223, 58, 'OK', '2', '2022-04-08 08:56:54.813324', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (224, 58, 'OK', '2', '2022-04-08 08:58:32.946688', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (225, 46, 'OK', '2', '2022-04-08 09:07:15.717458', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (226, 46, 'OK', '2', '2022-04-08 09:10:27.145485', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (227, 46, 'FAIL', '2', '2022-04-08 09:12:54.706334', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (228, 22, 'FAIL', '1', '2022-04-08 09:13:21.062908', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (229, 22, 'OK', '1', '2022-04-08 09:13:31.271332', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (230, 22, 'OK', '1', '2022-04-08 09:13:45.725489', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (231, 22, 'OK', '1', '2022-04-08 09:13:47.139076', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (232, 22, 'OK', '1', '2022-04-08 09:20:39.377774', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (233, 22, 'OK', '1', '2022-04-08 09:21:55.741192', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (234, 22, 'OK', '1', '2022-04-08 09:23:42.478272', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (235, 51, 'FAIL', '1', '2022-04-08 09:24:48.114192', 'Phanthuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (236, 20, 'OK', '1', '2022-04-08 09:51:43.9863', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (237, 20, 'OK', '1', '2022-04-08 09:51:53.811711', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (238, 20, 'OK', '1', '2022-04-08 09:52:55.724065', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (239, 57, 'FAIL', '1', '2022-04-08 09:54:33.577274', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (240, 57, 'FAIL', '1', '2022-04-08 09:54:37.516315', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (241, 19, 'OK', '1', '2022-04-08 09:57:35.651175', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (242, 1, 'OK', '2', '2022-04-08 09:58:22.981654', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (243, 19, 'OK', '1', '2022-04-08 10:09:21.016364', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (244, 46, 'FAIL', '2', '2022-04-08 10:09:39.508633', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (245, 46, 'OK', '2', '2022-04-08 10:09:44.858101', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (246, 57, 'OK', '1', '2022-04-08 10:11:35.681053', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (247, 57, 'OK', '1', '2022-04-08 10:11:37.837323', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (248, 57, 'OK', '1', '2022-04-08 10:11:39.02902', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (249, 57, 'OK', '1', '2022-04-08 10:11:40.038402', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (250, 57, 'OK', '1', '2022-04-08 10:11:41.079009', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (251, 57, 'OK', '1', '2022-04-08 10:11:42.254154', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (252, 57, 'OK', '1', '2022-04-08 10:11:43.29042', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (253, 2, 'FAIL', '2', '2022-04-08 10:12:33.833437', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (254, 20, 'OK', '1', '2022-04-08 10:12:56.250928', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (255, 1, 'OK', '2', '2022-04-08 10:16:40.181662', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (256, 2, 'OK', '2', '2022-04-08 10:19:33.303603', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (257, 57, 'FAIL', '1', '2022-04-08 10:20:04.034904', 'hahoangminh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (258, 2, 'FAIL', '2', '2022-04-08 10:20:16.889925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (259, 61, 'FAIL', '1', '2022-04-08 10:21:34.774297', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (260, 21, 'FAIL', '1', '2022-04-08 10:34:36.676338', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (261, 1, 'OK', '2', '2022-04-08 10:47:38.164226', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (262, 41, 'OK', '1', '2022-04-08 10:50:11.80571', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (263, 61, 'OK', '1', '2022-04-08 10:50:33.58993', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (264, 61, 'OK', '1', '2022-04-08 10:50:36.802453', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (265, 63, 'OK', '2', '2022-04-08 10:51:52.430788', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (266, 1, 'OK', '2', '2022-04-08 10:52:27.250797', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (267, 1, 'OK', '2', '2022-04-08 10:53:51.460778', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (268, 25, 'FAIL', '1', '2022-04-08 10:56:26.061557', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (269, 37, 'FAIL', '1', '2022-04-08 10:57:39.228394', 'Hoang 111', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (270, 49, 'FAIL', '2', '2022-04-08 10:59:22.383029', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (271, 49, 'OK', '2', '2022-04-08 10:59:27.811863', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (272, 1, 'OK', '2', '2022-04-08 11:02:08.266717', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (273, 1, 'OK', '2', '2022-04-08 11:05:57.28338', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (274, 41, 'OK', '1', '2022-04-08 11:21:43.769991', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (275, 61, 'OK', '1', '2022-04-08 11:27:56.050002', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (276, 61, 'OK', '1', '2022-04-08 11:41:49.125815', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (277, 1, 'OK', '2', '2022-04-08 12:25:09.555971', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (278, 1, 'OK', '2', '2022-04-08 13:04:33.47058', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (279, 41, 'FAIL', '1', '2022-04-08 13:17:03.932463', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (280, 41, 'OK', '1', '2022-04-08 13:17:40.292191', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (281, 41, 'OK', '1', '2022-04-08 13:18:53.404925', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (282, 60, 'FAIL', '1', '2022-04-08 13:23:08.041953', 'Sandy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (283, 60, 'OK', '1', '2022-04-08 13:24:31.077848', 'Sandy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (284, 41, 'FAIL', '1', '2022-04-08 13:40:39.97577', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (285, 41, 'OK', '1', '2022-04-08 13:41:29.711956', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (286, 41, 'OK', '1', '2022-04-08 13:42:24.479616', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (287, 41, 'OK', '1', '2022-04-08 13:43:00.823317', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (288, 4, 'FAIL', '2', '2022-04-08 13:47:22.188707', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (289, 4, 'FAIL', '2', '2022-04-08 13:47:27.709198', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (290, 4, 'FAIL', '2', '2022-04-08 13:47:31.317035', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (291, 1, 'OK', '2', '2022-04-08 13:48:08.069909', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (292, 1, 'OK', '2', '2022-04-08 14:07:19.174471', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (293, 42, 'FAIL', '1', '2022-04-08 14:07:40.983602', 'Nguyen Van', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (294, 3, 'OK', '2', '2022-04-08 14:08:26.227356', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (295, 1, 'OK', '2', '2022-04-08 14:08:39.978666', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (296, 61, 'OK', '1', '2022-04-08 14:10:28.50593', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (297, 41, 'OK', '1', '2022-04-08 14:13:57.955779', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (298, 42, 'FAIL', '1', '2022-04-08 14:14:53.389078', 'Nguyen Van', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (299, 42, 'FAIL', '1', '2022-04-08 14:14:57.395536', 'Nguyen Van', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (300, 1, 'OK', '2', '2022-04-08 14:26:08.569515', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (301, 1, 'OK', '2', '2022-04-08 14:38:45.320217', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (302, 1, 'OK', '2', '2022-04-08 14:42:01.555673', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (303, 1, 'OK', '2', '2022-04-08 14:43:15.058431', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (304, 58, 'FAIL', '2', '2022-04-08 14:45:04.428587', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (305, 58, 'OK', '2', '2022-04-08 14:45:11.597404', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (306, 49, 'OK', '2', '2022-04-08 14:48:03.147287', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (307, 49, 'OK', '2', '2022-04-08 14:48:42.127139', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (308, 49, 'OK', '2', '2022-04-08 14:52:32.185795', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (309, 1, 'OK', '2', '2022-04-08 15:03:33.691481', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (310, 46, 'OK', '2', '2022-04-08 15:20:39.360661', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (311, 49, 'OK', '2', '2022-04-08 15:32:42.796858', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (312, 61, 'OK', '1', '2022-04-08 15:36:44.25678', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (313, 3, 'OK', '2', '2022-04-08 16:00:57.516763', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (314, 3, 'OK', '2', '2022-04-08 16:03:11.784014', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (315, 1, 'OK', '2', '2022-04-08 16:07:20.776395', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (316, 3, 'OK', '2', '2022-04-08 16:11:37.153432', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (317, 41, 'OK', '1', '2022-04-08 16:20:31.871499', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (318, 66, 'OK', '1', '2022-04-08 16:23:55.162135', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (319, 66, 'OK', '1', '2022-04-08 16:26:03.109862', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (320, 66, 'FAIL', '1', '2022-04-08 16:26:23.275881', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (321, 66, 'FAIL', '1', '2022-04-08 16:26:24.335641', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (322, 66, 'FAIL', '1', '2022-04-08 16:26:25.14645', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (323, 66, 'FAIL', '1', '2022-04-08 16:26:26.090832', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (324, 66, 'FAIL', '1', '2022-04-08 16:26:26.791658', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (325, 66, 'FAIL', '1', '2022-04-08 16:27:48.204029', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (326, 66, 'FAIL', '1', '2022-04-08 16:28:34.891197', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (327, 66, 'OK', '1', '2022-04-08 16:28:41.975721', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (328, 66, 'OK', '1', '2022-04-08 16:28:58.025159', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (329, 66, 'OK', '1', '2022-04-08 16:32:51.755304', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (330, 66, 'OK', '1', '2022-04-08 16:39:45.281751', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (331, 66, 'FAIL', '1', '2022-04-08 16:41:57.969177', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (332, 66, 'OK', '1', '2022-04-08 16:42:08.948959', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (333, 66, 'OK', '1', '2022-04-08 16:43:14.9268', 'Hoang P333', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (334, 4, 'OK', '2', '2022-04-08 16:53:47.245788', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (335, 1, 'FAIL', '2', '2022-04-08 16:55:26.460968', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (336, 1, 'OK', '2', '2022-04-08 17:32:39.587769', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (337, 1, 'OK', '2', '2022-04-08 18:45:32.171195', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (338, 46, 'OK', '2', '2022-04-12 08:33:59.305123', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (339, 49, 'OK', '2', '2022-04-12 08:34:09.04675', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (340, 49, 'OK', '2', '2022-04-12 08:36:08.377781', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (341, 1, 'OK', '2', '2022-04-12 08:46:18.804095', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (342, 1, 'OK', '2', '2022-04-12 08:55:19.151803', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (343, 46, 'OK', '2', '2022-04-12 09:02:34.431525', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (344, 46, 'OK', '2', '2022-04-12 09:04:30.012176', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (345, 65, 'OK', '2', '2022-04-12 09:13:42.458265', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (346, 63, 'FAIL', '2', '2022-04-12 09:15:29.301434', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (347, 63, 'OK', '2', '2022-04-12 09:15:33.239026', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (348, 1, 'OK', '2', '2022-04-12 09:16:34.34135', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (349, 46, 'OK', '2', '2022-04-12 09:29:25.841876', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (350, 60, 'OK', '1', '2022-04-12 09:41:51.08243', 'Sandy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (351, 1, 'OK', '2', '2022-04-12 09:44:11.146688', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (352, 1, 'OK', '2', '2022-04-12 09:59:37.901422', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (353, 1, 'OK', '2', '2022-04-12 10:06:15.910339', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (354, 46, 'OK', '2', '2022-04-12 10:07:58.728797', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (355, 46, 'OK', '2', '2022-04-12 10:16:59.751266', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (356, 1, 'OK', '2', '2022-04-12 10:37:41.944567', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (357, 1, 'OK', '2', '2022-04-12 10:39:32.700857', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (358, 1, 'OK', '2', '2022-04-12 10:45:20.814427', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (359, 1, 'OK', '2', '2022-04-12 10:59:26.01892', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (360, 1, 'OK', '2', '2022-04-12 11:17:26.009214', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (361, 1, 'OK', '2', '2022-04-12 11:17:35.633796', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (362, 25, 'OK', '1', '2022-04-12 11:31:51.328046', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (363, 25, 'OK', '1', '2022-04-12 11:32:05.212211', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (364, 25, 'OK', '1', '2022-04-12 11:40:27.167672', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (365, 25, 'OK', '1', '2022-04-12 11:41:01.835734', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (366, 25, 'OK', '1', '2022-04-12 11:41:26.106595', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (367, 25, 'OK', '1', '2022-04-12 12:07:18.407118', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (368, 25, 'OK', '1', '2022-04-12 12:10:30.984603', 'Linh le', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (369, 46, 'OK', '2', '2022-04-12 12:36:31.659978', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (370, 46, 'OK', '2', '2022-04-12 12:48:26.348131', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (371, 46, 'OK', '2', '2022-04-12 13:01:36.893241', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (372, 45, 'FAIL', '1', '2022-04-12 13:17:02.843026', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (373, 45, 'FAIL', '1', '2022-04-12 13:17:04.078431', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (374, 45, 'FAIL', '1', '2022-04-12 13:17:16.199985', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (375, 1, 'OK', '2', '2022-04-12 13:28:36.306437', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (376, 1, 'OK', '2', '2022-04-12 13:28:38.480775', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (377, 1, 'OK', '2', '2022-04-12 13:29:22.630031', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (378, 1, 'OK', '2', '2022-04-12 13:30:14.03928', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (379, 1, 'OK', '2', '2022-04-12 13:38:14.546501', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (380, 1, 'OK', '2', '2022-04-12 13:40:02.678052', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (381, 1, 'OK', '2', '2022-04-12 13:40:03.853579', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (382, 1, 'OK', '2', '2022-04-12 13:45:04.895194', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (383, 46, 'OK', '2', '2022-04-12 13:45:50.252482', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (384, 1, 'OK', '2', '2022-04-12 13:45:56.874269', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (385, 46, 'OK', '2', '2022-04-12 13:45:58.215671', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (386, 46, 'OK', '2', '2022-04-12 13:46:19.368158', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (387, 46, 'OK', '2', '2022-04-12 13:47:44.315413', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (388, 46, 'OK', '2', '2022-04-12 13:47:56.720904', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (389, 46, 'OK', '2', '2022-04-12 13:51:23.595265', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (390, 1, 'OK', '2', '2022-04-12 13:52:42.683433', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (391, 1, 'OK', '2', '2022-04-12 13:53:45.164779', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (392, 22, 'OK', '1', '2022-04-12 14:07:01.167111', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (393, 49, 'OK', '2', '2022-04-12 14:20:52.58983', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (394, 1, 'OK', '2', '2022-04-12 14:32:54.432059', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (395, 1, 'OK', '2', '2022-04-12 14:54:52.49074', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (396, 46, 'OK', '2', '2022-04-12 14:54:56.839784', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (397, 46, 'OK', '2', '2022-04-12 15:07:46.911004', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (398, 46, 'OK', '2', '2022-04-12 15:19:06.625264', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (399, 46, 'OK', '2', '2022-04-12 15:48:13.418513', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (400, 2, 'OK', '2', '2022-04-12 16:27:12.325319', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (401, 2, 'FAIL', '2', '2022-04-12 16:27:20.562483', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (402, 2, 'FAIL', '2', '2022-04-12 16:27:28.713681', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (403, 2, 'FAIL', '2', '2022-04-12 16:27:35.32087', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (404, 2, 'FAIL', '2', '2022-04-12 16:27:46.586277', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (405, 1, 'OK', '2', '2022-04-12 16:28:20.662881', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (406, 2, 'FAIL', '2', '2022-04-12 16:31:19.970566', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (407, 1, 'OK', '2', '2022-04-12 16:34:53.641128', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (408, 1, 'OK', '2', '2022-04-12 16:45:52.105669', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (409, 20, 'FAIL', '1', '2022-04-12 16:49:54.136683', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (410, 20, 'FAIL', '1', '2022-04-12 16:50:01.269571', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (411, 20, 'FAIL', '1', '2022-04-12 16:53:29.876295', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (412, 20, 'FAIL', '1', '2022-04-12 16:53:31.525129', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (413, 20, 'FAIL', '1', '2022-04-12 16:53:44.812858', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (414, 46, 'OK', '2', '2022-04-12 16:58:01.304535', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (415, 46, 'OK', '2', '2022-04-12 16:59:58.348561', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (416, 46, 'OK', '2', '2022-04-12 17:06:57.442767', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (417, 1, 'OK', '2', '2022-04-12 17:20:26.46329', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (418, 1, 'OK', '2', '2022-04-12 17:24:47.971137', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (419, 20, 'OK', '1', '2022-04-12 17:37:21.580106', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (420, 18, 'OK', '1', '2022-04-12 18:12:13.745518', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (421, 60, 'FAIL', '1', '2022-04-12 18:16:07.668158', 'Sandy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (422, 18, 'OK', '1', '2022-04-12 18:17:39.656024', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (423, 46, 'OK', '2', '2022-04-13 08:27:17.777149', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (424, 20, 'OK', '1', '2022-04-13 08:28:36.841361', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (425, 20, 'OK', '1', '2022-04-13 08:29:46.988373', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (426, 49, 'OK', '2', '2022-04-13 08:31:36.060746', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (427, 20, 'OK', '1', '2022-04-13 08:34:39.112139', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (428, 1, 'OK', '2', '2022-04-13 08:38:28.695328', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (429, 49, 'OK', '2', '2022-04-13 08:38:45.239328', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (430, 20, 'OK', '1', '2022-04-13 08:39:54.264958', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (431, 20, 'OK', '1', '2022-04-13 08:50:46.955957', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (432, 20, 'OK', '1', '2022-04-13 08:53:34.781398', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (433, 1, 'OK', '2', '2022-04-13 08:54:40.830453', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (434, 1, 'OK', '2', '2022-04-13 09:02:25.161365', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (435, 59, 'OK', '1', '2022-04-13 09:08:33.201878', 'Olivia Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (436, 1, 'OK', '2', '2022-04-13 09:09:55.088898', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (437, 59, 'OK', '1', '2022-04-13 09:13:16.180345', 'Olivia Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (438, 59, 'OK', '1', '2022-04-13 09:13:16.88165', 'Olivia Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (439, 59, 'OK', '1', '2022-04-13 09:14:40.583103', 'Olivia Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (440, 18, 'FAIL', '1', '2022-04-13 09:28:14.001102', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (441, 18, 'FAIL', '1', '2022-04-13 09:28:18.883716', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (442, 18, 'FAIL', '1', '2022-04-13 09:28:21.308411', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (443, 22, 'FAIL', '1', '2022-04-13 09:28:58.0535', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (444, 22, 'FAIL', '1', '2022-04-13 09:29:02.339143', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (445, 22, 'FAIL', '1', '2022-04-13 09:29:07.980166', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (446, 46, 'FAIL', '2', '2022-04-13 09:34:25.008035', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (447, 46, 'FAIL', '2', '2022-04-13 09:34:25.776331', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (448, 46, 'FAIL', '2', '2022-04-13 09:34:26.519333', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (449, 46, 'FAIL', '2', '2022-04-13 09:42:57.846413', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (450, 46, 'FAIL', '2', '2022-04-13 09:43:20.733753', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (451, 46, 'FAIL', '2', '2022-04-13 09:43:51.129356', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (452, 46, 'OK', '2', '2022-04-13 09:48:03.927728', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (453, 46, 'FAIL', '2', '2022-04-13 10:12:58.119532', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (454, 46, 'FAIL', '2', '2022-04-13 10:12:58.600572', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (455, 46, 'FAIL', '2', '2022-04-13 10:12:58.914026', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (456, 18, 'FAIL', '1', '2022-04-13 10:16:01.150516', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (457, 18, 'FAIL', '1', '2022-04-13 10:16:04.468451', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (458, 18, 'FAIL', '1', '2022-04-13 10:16:06.717704', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (459, 45, 'FAIL', '1', '2022-04-13 10:19:21.303544', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (460, 46, 'FAIL', '2', '2022-04-13 10:19:54.387212', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (461, 46, 'FAIL', '2', '2022-04-13 10:19:56.530418', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (462, 46, 'FAIL', '2', '2022-04-13 10:19:57.578556', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (463, 45, 'FAIL', '1', '2022-04-13 10:20:31.614767', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (464, 46, 'FAIL', '2', '2022-04-13 10:20:36.172523', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (465, 46, 'OK', '2', '2022-04-13 10:20:42.033181', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (466, 45, 'FAIL', '1', '2022-04-13 10:20:54.068405', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (467, 22, 'FAIL', '1', '2022-04-13 10:21:45.980466', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (468, 45, 'FAIL', '1', '2022-04-13 10:23:51.319726', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (469, 45, 'FAIL', '1', '2022-04-13 10:24:11.308943', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (470, 45, 'FAIL', '1', '2022-04-13 10:24:57.282817', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (471, 45, 'FAIL', '1', '2022-04-13 10:29:13.720549', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (472, 45, 'FAIL', '1', '2022-04-13 10:29:25.458359', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (473, 1, 'OK', '2', '2022-04-13 10:39:41.741102', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (474, 39, 'OK', '1', '2022-04-13 10:40:53.346159', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (475, 39, 'FAIL', '1', '2022-04-13 10:41:03.278188', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (476, 39, 'FAIL', '1', '2022-04-13 10:41:03.631951', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (477, 39, 'FAIL', '1', '2022-04-13 10:41:03.958708', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (478, 45, 'FAIL', '1', '2022-04-13 10:41:39.703544', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (479, 45, 'FAIL', '1', '2022-04-13 10:41:43.11114', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (480, 45, 'FAIL', '1', '2022-04-13 10:41:47.290398', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (481, 39, 'OK', '1', '2022-04-13 10:42:11.142029', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (482, 46, 'FAIL', '2', '2022-04-13 10:43:07.43382', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (483, 46, 'OK', '2', '2022-04-13 10:43:12.333857', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (484, 45, 'OK', '1', '2022-04-13 10:44:20.990137', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (485, 1, 'OK', '2', '2022-04-13 10:44:45.57746', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (486, 46, 'OK', '2', '2022-04-13 10:48:14.185215', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (487, 1, 'OK', '2', '2022-04-13 10:50:25.150572', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (488, 55, 'OK', '2', '2022-04-13 10:50:49.820731', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (489, 55, 'FAIL', '2', '2022-04-13 10:51:56.34691', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (490, 55, 'OK', '2', '2022-04-13 10:52:04.249059', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (491, 55, 'FAIL', '2', '2022-04-13 10:54:57.058095', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (492, 55, 'OK', '2', '2022-04-13 10:55:05.202862', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (493, 46, 'OK', '2', '2022-04-13 11:03:29.370895', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (494, 184, 'OK', '1', '2022-04-13 11:04:36.238401', 'Numm', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (495, 45, 'FAIL', '1', '2022-04-13 11:06:33.019712', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (496, 45, 'FAIL', '1', '2022-04-13 11:06:36.813611', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (497, 45, 'FAIL', '1', '2022-04-13 11:06:40.003253', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (498, 1, 'OK', '2', '2022-04-13 11:16:43.169317', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (499, 1, 'OK', '2', '2022-04-13 11:20:57.551237', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (500, 18, 'FAIL', '1', '2022-04-13 11:26:16.060203', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (501, 1, 'OK', '2', '2022-04-13 11:50:38.932566', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (502, 1, 'OK', '2', '2022-04-13 13:06:15.498147', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (503, 1, 'OK', '2', '2022-04-13 13:06:35.140477', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (504, 194, 'FAIL', '1', '2022-04-13 13:19:57.870896', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (505, 1, 'OK', '2', '2022-04-13 13:25:31.185677', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (506, 1, 'OK', '2', '2022-04-13 13:26:12.463766', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (507, 1, 'OK', '2', '2022-04-13 13:26:15.392844', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (508, 46, 'OK', '2', '2022-04-13 13:27:31.96733', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (509, 46, 'OK', '2', '2022-04-13 13:29:48.532591', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (510, 195, 'OK', '1', '2022-04-13 13:48:35.779092', 'test51', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (511, 46, 'FAIL', '2', '2022-04-13 13:55:17.896374', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (512, 46, 'FAIL', '2', '2022-04-13 13:55:18.242579', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (513, 46, 'FAIL', '2', '2022-04-13 13:55:18.566794', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (514, 191, 'FAIL', '1', '2022-04-13 14:04:16.377881', 'test1', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (515, 191, 'FAIL', '1', '2022-04-13 14:04:26.669947', 'test1', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (516, 191, 'FAIL', '1', '2022-04-13 14:04:30.759141', 'test1', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (517, 18, 'FAIL', '1', '2022-04-13 14:08:03.28002', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (518, 195, 'OK', '1', '2022-04-13 14:14:00.799945', 'test51', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (519, 20, 'OK', '1', '2022-04-13 14:14:11.660252', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (520, 41, 'FAIL', '1', '2022-04-13 14:14:33.902535', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (521, 20, 'OK', '1', '2022-04-13 14:14:55.262369', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (522, 192, 'FAIL', '1', '2022-04-13 14:15:55.463056', 'test2', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (523, 20, 'OK', '1', '2022-04-13 14:16:12.25378', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (524, 1, 'OK', '2', '2022-04-13 14:18:59.395624', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (525, 1, 'OK', '2', '2022-04-13 14:19:20.829138', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (526, 20, 'OK', '1', '2022-04-13 14:27:32.664319', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (527, 193, 'FAIL', '1', '2022-04-13 14:40:14.339318', 'test3', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (528, 193, 'FAIL', '1', '2022-04-13 14:40:36.551663', 'test3', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (529, 20, 'FAIL', '1', '2022-04-13 14:42:57.635157', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (530, 20, 'FAIL', '1', '2022-04-13 14:43:07.187735', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (531, 20, 'OK', '1', '2022-04-13 14:54:19.704697', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (532, 195, 'OK', '1', '2022-04-13 15:00:36.473853', 'test51', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (533, 41, 'OK', '1', '2022-04-13 15:01:31.788535', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (534, 20, 'OK', '1', '2022-04-13 15:17:29.977688', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (535, 20, 'OK', '1', '2022-04-13 15:18:40.182804', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (536, 41, 'OK', '1', '2022-04-13 15:54:25.856229', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (537, 1, 'OK', '2', '2022-04-13 15:56:13.776825', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (538, 1, 'OK', '2', '2022-04-13 16:04:02.414917', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (539, 1, 'OK', '2', '2022-04-13 16:38:13.359286', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (540, 1, 'OK', '2', '2022-04-13 16:43:03.330866', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (541, 18, 'FAIL', '1', '2022-04-13 16:44:48.087634', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (542, 194, 'FAIL', '1', '2022-04-13 16:44:59.155881', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (543, 194, 'OK', '1', '2022-04-13 16:54:01.113379', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (544, 194, 'FAIL', '1', '2022-04-13 16:57:49.605496', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (545, 194, 'FAIL', '1', '2022-04-13 16:57:53.6341', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (546, 194, 'FAIL', '1', '2022-04-13 16:57:59.377715', 'test4', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (547, 1, 'OK', '2', '2022-04-13 16:59:32.790354', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (548, 192, 'OK', '1', '2022-04-13 17:09:27.847396', 'test2', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (549, 203, 'FAIL', '1', '2022-04-13 17:41:50.146343', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (550, 3, 'FAIL', '2', '2022-04-13 17:51:28.661391', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (551, 3, 'OK', '2', '2022-04-13 17:51:40.027515', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (552, 3, 'OK', '2', '2022-04-13 17:51:48.523161', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (553, 46, 'OK', '2', '2022-04-14 08:48:09.6463', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (554, 1, 'OK', '2', '2022-04-14 08:52:48.417829', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (555, 49, 'OK', '2', '2022-04-14 10:21:42.0424', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (556, 1, 'OK', '2', '2022-04-14 10:40:52.506548', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (557, 1, 'OK', '2', '2022-04-14 10:45:00.637279', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (558, 1, 'OK', '2', '2022-04-14 11:19:34.881107', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (559, 1, 'OK', '2', '2022-04-14 11:29:27.258539', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (560, 193, 'OK', '1', '2022-04-14 11:30:16.573637', 'test3', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (561, 1, 'OK', '2', '2022-04-14 13:04:41.035874', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (562, 1, 'OK', '2', '2022-04-14 13:05:22.031951', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (563, 1, 'OK', '2', '2022-04-14 13:08:39.760675', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (564, 46, 'OK', '2', '2022-04-14 13:37:28.48064', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (565, 46, 'OK', '2', '2022-04-14 13:53:25.450105', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (566, 1, 'OK', '2', '2022-04-14 14:43:33.807903', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (567, 1, 'OK', '2', '2022-04-14 14:43:47.919056', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (568, 1, 'FAIL', '2', '2022-04-14 14:54:35.584629', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (569, 1, 'FAIL', '2', '2022-04-14 14:54:37.58963', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (570, 1, 'FAIL', '2', '2022-04-14 14:54:38.566868', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (571, 46, 'FAIL', '2', '2022-04-14 15:03:09.117389', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (572, 46, 'FAIL', '2', '2022-04-14 15:03:09.508647', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (573, 46, 'FAIL', '2', '2022-04-14 15:03:09.87136', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (574, 1, 'OK', '2', '2022-04-14 15:39:10.062815', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (575, 1, 'OK', '2', '2022-04-14 15:54:38.088526', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (576, 1, 'OK', '2', '2022-04-14 15:57:30.839509', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (577, 1, 'FAIL', '2', '2022-04-14 15:59:20.561965', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (578, 1, 'OK', '2', '2022-04-14 15:59:29.757064', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (579, 1, 'OK', '2', '2022-04-14 16:00:30.840015', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (580, 49, 'OK', '2', '2022-04-14 16:00:52.922552', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (581, 1, 'OK', '2', '2022-04-14 16:06:01.636994', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (582, 1, 'FAIL', '2', '2022-04-14 16:10:51.030303', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (583, 1, 'OK', '2', '2022-04-14 16:10:57.900927', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (584, 1, 'FAIL', '2', '2022-04-14 16:31:59.3608', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (585, 1, 'FAIL', '2', '2022-04-14 16:32:05.260095', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (586, 1, 'FAIL', '2', '2022-04-14 16:32:30.721168', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (587, 4, 'OK', '2', '2022-04-14 16:46:39.056577', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (588, 4, 'OK', '2', '2022-04-14 16:47:49.541598', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (589, 186, 'OK', '2', '2022-04-14 16:49:03.772533', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (590, 46, 'OK', '2', '2022-04-14 16:50:15.058978', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (591, 46, 'OK', '2', '2022-04-14 16:51:05.717197', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (592, 4, 'OK', '2', '2022-04-14 16:51:16.086003', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (593, 4, 'OK', '2', '2022-04-14 17:27:07.419459', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (594, 2, 'FAIL', '2', '2022-04-14 17:49:08.153348', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (595, 2, 'FAIL', '2', '2022-04-14 17:49:14.322863', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (596, 2, 'FAIL', '2', '2022-04-14 17:49:20.734606', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (597, 2, 'OK', '2', '2022-04-14 17:52:54.576955', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (598, 2, 'OK', '2', '2022-04-14 17:53:31.567105', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (599, 49, 'FAIL', '2', '2022-04-15 08:36:14.413887', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (600, 49, 'OK', '2', '2022-04-15 08:36:16.296861', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (601, 1, 'FAIL', '2', '2022-04-15 08:38:00.452667', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (602, 1, 'FAIL', '2', '2022-04-15 08:38:19.967161', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (603, 1, 'OK', '2', '2022-04-15 08:39:08.076598', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (604, 46, 'OK', '2', '2022-04-15 08:40:06.76216', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (605, 4, 'OK', '2', '2022-04-15 08:40:27.867269', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (606, 1, 'FAIL', '2', '2022-04-15 09:18:28.991833', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (607, 1, 'FAIL', '2', '2022-04-15 09:18:31.778804', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (608, 1, 'FAIL', '2', '2022-04-15 09:18:40.85012', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (609, 49, 'OK', '2', '2022-04-15 09:21:10.454528', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (610, 4, 'OK', '2', '2022-04-15 10:44:46.366289', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (611, 4, 'FAIL', '2', '2022-04-15 10:45:43.010953', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (612, 4, 'OK', '2', '2022-04-15 10:45:48.143597', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (613, 4, 'OK', '2', '2022-04-15 10:46:20.171093', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (614, 1, 'FAIL', '2', '2022-04-15 10:46:44.739123', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (615, 1, 'OK', '2', '2022-04-15 10:46:48.778472', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (616, 1, 'FAIL', '2', '2022-04-15 10:52:41.928746', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (617, 1, 'FAIL', '2', '2022-04-15 10:52:50.87399', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (618, 1, 'OK', '2', '2022-04-15 10:54:02.091883', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (619, 1, 'OK', '2', '2022-04-15 10:54:43.950174', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (620, 1, 'OK', '2', '2022-04-15 11:01:43.738792', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (621, 46, 'OK', '2', '2022-04-15 11:05:47.534418', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (622, 3, 'OK', '2', '2022-04-15 11:09:38.067228', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (623, 3, 'FAIL', '2', '2022-04-15 11:10:56.290448', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (624, 3, 'OK', '2', '2022-04-15 11:11:06.54252', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (625, 3, 'FAIL', '2', '2022-04-15 11:12:33.248148', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (629, 3, 'OK', '2', '2022-04-15 11:14:51.271247', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (632, 205, 'OK', '2', '2022-04-15 11:17:52.219221', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (626, 3, 'FAIL', '2', '2022-04-15 11:12:36.068187', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (627, 3, 'FAIL', '2', '2022-04-15 11:12:38.385158', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (628, 1, 'OK', '2', '2022-04-15 11:14:13.042963', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (630, 1, 'FAIL', '2', '2022-04-15 11:17:31.510244', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (631, 205, 'FAIL', '2', '2022-04-15 11:17:44.99276', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (633, 186, 'OK', '2', '2022-04-15 11:53:07.285568', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (634, 1, 'FAIL', '2', '2022-04-15 13:11:48.09495', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (635, 1, 'FAIL', '2', '2022-04-15 13:13:03.823185', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (636, 1, 'FAIL', '2', '2022-04-15 13:14:39.724983', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (637, 1, 'FAIL', '2', '2022-04-15 13:15:07.829041', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (638, 1, 'FAIL', '2', '2022-04-15 13:15:13.784348', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (639, 1, 'OK', '2', '2022-04-15 13:19:47.911191', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (640, 209, 'FAIL', '2', '2022-04-15 14:15:47.459357', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (641, 209, 'FAIL', '2', '2022-04-15 14:15:57.354607', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (642, 4, 'OK', '2', '2022-04-15 14:17:16.629002', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (643, 1, 'OK', '2', '2022-04-15 14:17:37.778951', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (644, 49, 'OK', '2', '2022-04-15 14:22:41.846257', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (645, 49, 'OK', '2', '2022-04-15 14:26:55.385506', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (646, 1, 'OK', '2', '2022-04-15 14:27:08.842807', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (647, 1, 'FAIL', '2', '2022-04-15 14:50:43.821786', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (648, 1, 'FAIL', '2', '2022-04-15 14:50:46.957791', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (649, 1, 'FAIL', '2', '2022-04-15 14:50:51.696996', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (650, 1, 'FAIL', '2', '2022-04-15 14:52:39.882163', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (651, 1, 'FAIL', '2', '2022-04-15 14:53:27.43207', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (652, 1, 'FAIL', '2', '2022-04-15 14:54:19.567758', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (653, 213, 'FAIL', '2', '2022-04-15 14:56:44.159763', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (654, 213, 'OK', '2', '2022-04-15 14:57:51.581798', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (655, 213, 'OK', '2', '2022-04-15 15:00:25.668338', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (656, 213, 'OK', '2', '2022-04-15 15:22:29.45146', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (657, 213, 'OK', '2', '2022-04-15 16:56:39.327523', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (658, 46, 'OK', '2', '2022-04-18 08:26:45.19921', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (659, 49, 'FAIL', '2', '2022-04-18 08:32:22.810303', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (660, 49, 'OK', '2', '2022-04-18 08:32:28.376232', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (661, 205, 'OK', '2', '2022-04-18 08:32:50.253535', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (662, 46, 'FAIL', '2', '2022-04-18 08:39:38.292039', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (663, 46, 'FAIL', '2', '2022-04-18 08:39:42.043772', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (664, 46, 'OK', '2', '2022-04-18 08:39:44.231659', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (665, 46, 'FAIL', '2', '2022-04-18 08:47:57.491392', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (666, 46, 'FAIL', '2', '2022-04-18 08:48:01.266226', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (667, 46, 'OK', '2', '2022-04-18 08:48:06.305049', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (668, 46, 'FAIL', '2', '2022-04-18 08:54:20.843226', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (669, 46, 'FAIL', '2', '2022-04-18 08:54:24.784526', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (670, 46, 'OK', '2', '2022-04-18 08:54:26.618583', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (671, 1, 'OK', '2', '2022-04-18 09:16:07.058743', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (672, 205, 'OK', '2', '2022-04-18 10:02:21.42789', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (673, 192, 'OK', '1', '2022-04-18 10:54:55.056601', 'test2', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (674, 213, 'OK', '2', '2022-04-18 10:57:33.374505', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (675, 213, 'OK', '2', '2022-04-18 11:02:03.862578', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (676, 213, 'OK', '2', '2022-04-18 11:05:20.34198', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (677, 213, 'OK', '2', '2022-04-18 11:18:29.172922', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (678, 213, 'OK', '2', '2022-04-18 11:18:58.745049', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (679, 1, 'OK', '2', '2022-04-18 11:19:14.924054', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (680, 213, 'OK', '2', '2022-04-18 11:19:52.82604', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (681, 213, 'OK', '2', '2022-04-18 11:22:47.642507', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (682, 1, 'OK', '2', '2022-04-18 12:41:24.147389', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (683, 49, 'OK', '2', '2022-04-18 12:41:29.988125', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (684, 46, 'FAIL', '2', '2022-04-18 12:50:17.339706', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (685, 46, 'OK', '2', '2022-04-18 12:50:25.838617', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (686, 1, 'OK', '2', '2022-04-18 12:52:20.657659', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (687, 1, 'OK', '2', '2022-04-18 13:58:52.768226', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (688, 2, 'FAIL', '2', '2022-04-18 14:11:34.976872', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (689, 2, 'OK', '2', '2022-04-18 14:11:42.870825', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (690, 205, 'OK', '2', '2022-04-18 14:12:27.764916', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (691, 46, 'OK', '2', '2022-04-18 14:21:16.603623', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (692, 65, 'FAIL', '2', '2022-04-18 14:30:21.757209', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (693, 65, 'FAIL', '2', '2022-04-18 14:30:22.639221', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (694, 46, 'OK', '2', '2022-04-18 14:44:07.932298', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (695, 46, 'OK', '2', '2022-04-18 14:44:59.993299', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (696, 1, 'OK', '2', '2022-04-18 14:45:22.554608', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (697, 46, 'OK', '2', '2022-04-18 14:45:52.591893', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (698, 46, 'FAIL', '2', '2022-04-18 14:52:09.398067', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (699, 46, 'OK', '2', '2022-04-18 14:52:14.951007', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (700, 46, 'OK', '2', '2022-04-18 14:52:56.929773', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (701, 65, 'OK', '2', '2022-04-18 14:54:17.035415', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (702, 46, 'OK', '2', '2022-04-18 14:54:49.112861', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (703, 213, 'OK', '2', '2022-04-18 16:08:28.549404', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (704, 49, 'OK', '2', '2022-04-18 16:09:13.359106', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (705, 213, 'OK', '2', '2022-04-18 16:12:08.182796', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (706, 213, 'OK', '2', '2022-04-18 16:29:33.679942', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (707, 46, 'FAIL', '2', '2022-04-18 16:42:26.398881', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (708, 1, 'OK', '2', '2022-04-18 16:44:51.555982', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (709, 213, 'OK', '2', '2022-04-18 16:55:13.840275', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (710, 213, 'OK', '2', '2022-04-19 08:46:14.669569', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (711, 205, 'OK', '2', '2022-04-19 08:55:44.202603', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (712, 49, 'OK', '2', '2022-04-19 09:21:09.358646', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (713, 213, 'OK', '2', '2022-04-19 10:13:36.771413', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (714, 213, 'OK', '2', '2022-04-19 10:22:08.976146', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (715, 184, 'FAIL', '1', '2022-04-19 10:29:13.916378', 'Numm', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (716, 20, 'OK', '1', '2022-04-19 11:30:28.270451', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (717, 20, 'OK', '1', '2022-04-19 13:12:49.212898', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (718, 20, 'OK', '1', '2022-04-19 13:16:00.211073', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (719, 220, 'OK', '1', '2022-04-19 13:19:25.219984', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (720, 219, 'OK', '1', '2022-04-19 13:21:43.92719', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (721, 220, 'OK', '1', '2022-04-19 13:25:48.636697', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (722, 220, 'OK', '1', '2022-04-19 13:42:40.418793', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (723, 61, 'OK', '1', '2022-04-19 14:13:41.289379', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (724, 61, 'OK', '1', '2022-04-19 14:18:06.447239', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (725, 219, 'OK', '1', '2022-04-19 14:44:15.383414', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (726, 219, 'OK', '1', '2022-04-19 15:04:32.132674', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (727, 220, 'OK', '1', '2022-04-19 15:10:15.452932', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (728, 220, 'OK', '1', '2022-04-19 16:32:17.812267', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (729, 205, 'OK', '2', '2022-04-20 08:20:16.238774', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (730, 205, 'OK', '2', '2022-04-20 08:20:30.526742', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (731, 220, 'OK', '1', '2022-04-20 08:36:46.570168', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (732, 49, 'FAIL', '2', '2022-04-20 08:43:04.7296', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (733, 49, 'OK', '2', '2022-04-20 08:43:11.23052', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (734, 1, 'OK', '2', '2022-04-20 09:51:09.703498', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (735, 1, 'OK', '2', '2022-04-20 10:33:00.330802', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (736, 46, 'OK', '2', '2022-04-20 10:42:23.568835', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (737, 1, 'OK', '2', '2022-04-20 10:43:47.628692', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (738, 46, 'OK', '2', '2022-04-20 10:49:15.449722', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (739, 1, 'OK', '2', '2022-04-20 11:15:21.035044', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (740, 1, 'OK', '2', '2022-04-20 11:30:49.04162', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (741, 46, 'OK', '2', '2022-04-20 11:31:31.190686', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (742, 46, 'OK', '2', '2022-04-20 11:34:12.68573', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (743, 46, 'OK', '2', '2022-04-20 11:42:43.909202', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (744, 61, 'OK', '1', '2022-04-20 13:23:30.678428', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (745, 213, 'OK', '2', '2022-04-20 13:41:22.466032', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (746, 20, 'OK', '1', '2022-04-20 15:35:43.125072', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (747, 20, 'OK', '1', '2022-04-20 15:38:32.018041', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (748, 46, 'OK', '2', '2022-04-20 16:39:16.008542', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (749, 46, 'OK', '2', '2022-04-20 16:57:01.421012', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (750, 46, 'OK', '2', '2022-04-21 08:50:31.242682', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (751, 49, 'OK', '2', '2022-04-21 08:57:55.668012', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (752, 20, 'OK', '1', '2022-04-21 09:00:46.525101', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (753, 205, 'OK', '2', '2022-04-21 09:01:21.080314', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (754, 46, 'OK', '2', '2022-04-21 10:03:24.088521', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (755, 46, 'OK', '2', '2022-04-21 10:06:47.874614', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (756, 46, 'OK', '2', '2022-04-21 10:25:19.005456', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (757, 213, 'OK', '2', '2022-04-21 11:55:18.558578', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (758, 213, 'OK', '2', '2022-04-21 11:56:09.839568', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (759, 213, 'OK', '2', '2022-04-21 12:00:52.032832', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (760, 213, 'OK', '2', '2022-04-21 12:01:07.282066', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (761, 213, 'OK', '2', '2022-04-21 12:01:20.796476', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (762, 213, 'OK', '2', '2022-04-21 12:03:03.474256', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (763, 213, 'OK', '2', '2022-04-21 14:19:31.482934', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (764, 46, 'OK', '2', '2022-04-21 14:30:50.620368', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (765, 46, 'FAIL', '2', '2022-04-21 14:30:59.603488', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (766, 46, 'OK', '2', '2022-04-21 14:31:11.768986', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (767, 1, 'OK', '2', '2022-04-21 15:01:43.229496', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (768, 1, 'OK', '2', '2022-04-21 16:12:24.025961', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (769, 213, 'OK', '2', '2022-04-21 16:42:24.475286', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (770, 213, 'OK', '2', '2022-04-21 16:45:23.785383', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (771, 20, 'OK', '1', '2022-04-21 16:48:17.658919', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (772, 20, 'OK', '1', '2022-04-21 17:23:52.372384', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (773, 20, 'OK', '1', '2022-04-21 17:23:52.705715', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (774, 213, 'OK', '2', '2022-04-21 17:24:28.902408', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (775, 20, 'OK', '1', '2022-04-21 17:25:11.363203', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (776, 213, 'OK', '2', '2022-04-21 17:52:40.288952', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (777, 213, 'OK', '2', '2022-04-21 17:59:33.969847', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (778, 20, 'OK', '1', '2022-04-22 08:38:10.300563', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (779, 20, 'OK', '1', '2022-04-22 08:38:34.382434', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (780, 20, 'OK', '1', '2022-04-22 08:39:10.614742', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (781, 20, 'OK', '1', '2022-04-22 08:39:39.721352', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (782, 20, 'OK', '1', '2022-04-22 08:40:16.123525', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (783, 20, 'OK', '1', '2022-04-22 08:41:01.563174', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (784, 20, 'OK', '1', '2022-04-22 08:42:15.025475', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (785, 20, 'OK', '1', '2022-04-22 08:46:28.705726', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (786, 213, 'OK', '2', '2022-04-22 08:59:19.339188', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (787, 46, 'OK', '2', '2022-04-22 09:02:51.474281', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (788, 46, 'FAIL', '2', '2022-04-22 09:04:27.596425', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (789, 46, 'OK', '2', '2022-04-22 09:04:34.924684', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (790, 46, 'OK', '2', '2022-04-22 09:06:31.740739', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (791, 1, 'OK', '2', '2022-04-22 09:08:39.256244', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (792, 1, 'OK', '2', '2022-04-22 09:13:25.377953', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (793, 1, 'OK', '2', '2022-04-22 09:15:32.091438', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (794, 222, 'OK', '2', '2022-04-22 09:29:00.006487', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (795, 222, 'OK', '2', '2022-04-22 09:29:02.604264', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (796, 222, 'OK', '2', '2022-04-22 09:30:55.690621', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (797, 213, 'OK', '2', '2022-04-22 09:32:48.56891', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (798, 213, 'OK', '2', '2022-04-22 10:32:27.26658', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (799, 213, 'OK', '2', '2022-04-22 11:09:12.236226', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (800, 213, 'OK', '2', '2022-04-22 11:17:43.946438', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (801, 213, 'OK', '2', '2022-04-22 11:19:38.310848', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (802, 213, 'OK', '2', '2022-04-22 11:27:34.162558', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (803, 20, 'OK', '1', '2022-04-22 12:11:11.469733', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (804, 209, 'FAIL', '2', '2022-04-22 12:11:43.24177', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (805, 204, 'OK', '1', '2022-04-22 12:12:03.792551', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (806, 204, 'OK', '1', '2022-04-22 12:13:20.236905', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (807, 204, 'OK', '1', '2022-04-22 12:15:55.966206', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (808, 19, 'FAIL', '1', '2022-04-22 12:16:47.953993', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (809, 20, 'OK', '1', '2022-04-22 12:17:17.225969', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (810, 46, 'OK', '2', '2022-04-22 12:44:24.244369', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (811, 204, 'OK', '1', '2022-04-22 13:19:55.389549', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (812, 213, 'OK', '2', '2022-04-22 13:24:41.73113', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (813, 204, 'OK', '1', '2022-04-22 13:48:36.580423', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (814, 204, 'OK', '1', '2022-04-22 13:50:56.787945', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (815, 213, 'OK', '2', '2022-04-22 13:51:13.468801', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (816, 204, 'OK', '1', '2022-04-22 13:51:35.942867', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (817, 204, 'OK', '1', '2022-04-22 13:53:13.01276', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (818, 204, 'OK', '1', '2022-04-22 13:54:36.796825', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (819, 204, 'OK', '1', '2022-04-22 13:56:37.049541', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (820, 204, 'OK', '1', '2022-04-22 13:58:10.20288', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (821, 204, 'OK', '1', '2022-04-22 14:00:08.927098', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (822, 204, 'OK', '1', '2022-04-22 14:00:54.082639', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (823, 204, 'OK', '1', '2022-04-22 14:12:59.132571', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (824, 204, 'OK', '1', '2022-04-22 14:14:11.280938', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (825, 61, 'OK', '1', '2022-04-22 14:14:17.990269', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (826, 61, 'OK', '1', '2022-04-22 14:17:06.052215', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (827, 61, 'OK', '1', '2022-04-22 14:17:45.365934', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (828, 186, 'OK', '2', '2022-04-22 14:49:45.701361', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (829, 204, 'OK', '1', '2022-04-22 15:34:48.758326', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (830, 204, 'OK', '1', '2022-04-22 16:12:32.204863', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (831, 204, 'OK', '1', '2022-04-22 16:14:02.243855', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (832, 204, 'OK', '1', '2022-04-22 16:15:51.955215', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (833, 213, 'OK', '2', '2022-04-22 16:16:02.775289', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (834, 204, 'OK', '1', '2022-04-22 16:19:40.659337', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (835, 213, 'OK', '2', '2022-04-22 16:32:21.121044', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (836, 213, 'OK', '2', '2022-04-22 16:41:14.397469', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (837, 213, 'OK', '2', '2022-04-22 16:49:44.901782', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (838, 213, 'OK', '2', '2022-04-22 17:20:45.814563', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (839, 213, 'OK', '2', '2022-04-25 08:19:25.410471', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (840, 46, 'OK', '2', '2022-04-25 09:16:55.207388', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (841, 46, 'OK', '2', '2022-04-25 09:18:56.508011', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (842, 46, 'OK', '2', '2022-04-25 09:19:42.74261', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (843, 46, 'OK', '2', '2022-04-25 09:22:30.571522', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (844, 46, 'OK', '2', '2022-04-25 09:22:32.636724', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (845, 46, 'OK', '2', '2022-04-25 09:22:34.784925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (846, 46, 'OK', '2', '2022-04-25 09:22:42.600463', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (847, 46, 'OK', '2', '2022-04-25 09:22:44.013598', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (848, 46, 'OK', '2', '2022-04-25 09:22:57.340652', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (849, 204, 'OK', '1', '2022-04-25 10:13:52.578811', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (850, 204, 'OK', '1', '2022-04-25 10:18:54.88922', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (851, 204, 'OK', '1', '2022-04-25 10:23:57.371812', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (852, 204, 'OK', '1', '2022-04-25 10:28:16.101905', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (853, 20, 'OK', '1', '2022-04-25 10:47:04.030827', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (854, 20, 'FAIL', '1', '2022-04-25 10:53:28.307184', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (855, 20, 'FAIL', '1', '2022-04-25 10:53:30.334606', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (856, 20, 'FAIL', '1', '2022-04-25 10:53:32.31565', 'hoang', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (857, 204, 'OK', '1', '2022-04-25 11:06:54.064256', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (858, 204, 'OK', '1', '2022-04-25 11:07:11.630516', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (859, 204, 'OK', '1', '2022-04-25 11:11:50.045442', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (860, 46, 'OK', '2', '2022-04-25 11:17:11.246741', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (861, 204, 'OK', '1', '2022-04-25 11:20:12.186508', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (862, 46, 'OK', '2', '2022-04-25 11:23:59.33918', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (863, 204, 'OK', '1', '2022-04-25 11:25:43.721566', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (864, 227, 'OK', '1', '2022-04-25 11:32:29.901484', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (865, 227, 'OK', '1', '2022-04-25 11:34:23.488057', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (866, 227, 'OK', '1', '2022-04-25 11:35:39.545385', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (867, 227, 'OK', '1', '2022-04-25 11:37:10.848453', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (868, 204, 'OK', '1', '2022-04-25 13:06:12.132832', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (869, 204, 'FAIL', '1', '2022-04-25 13:08:25.227919', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (870, 204, 'OK', '1', '2022-04-25 13:08:35.71986', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (871, 204, 'OK', '1', '2022-04-25 13:17:36.189457', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (872, 227, 'OK', '1', '2022-04-25 13:26:31.856776', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (873, 227, 'OK', '1', '2022-04-25 13:26:52.042217', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (874, 227, 'OK', '1', '2022-04-25 13:27:38.039848', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (875, 204, 'OK', '1', '2022-04-25 13:28:45.389761', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (876, 204, 'OK', '1', '2022-04-25 13:29:07.991241', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (877, 204, 'OK', '1', '2022-04-25 13:29:53.210986', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (878, 61, 'OK', '1', '2022-04-25 13:30:10.413156', 'pan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (879, 46, 'OK', '2', '2022-04-25 13:30:21.570041', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (880, 213, 'OK', '2', '2022-04-25 13:31:25.902583', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (881, 226, 'OK', '1', '2022-04-25 13:43:38.034009', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (882, 204, 'OK', '1', '2022-04-25 13:44:42.226441', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (883, 213, 'OK', '2', '2022-04-25 13:55:11.857753', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (884, 226, 'OK', '1', '2022-04-25 13:55:31.783643', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (885, 226, 'OK', '1', '2022-04-25 13:55:45.793657', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (886, 226, 'OK', '1', '2022-04-25 13:56:17.874202', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (887, 213, 'OK', '2', '2022-04-25 14:05:36.696477', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (888, 186, 'OK', '2', '2022-04-25 14:08:23.951129', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (889, 204, 'OK', '1', '2022-04-25 14:14:28.79464', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (890, 226, 'OK', '1', '2022-04-25 14:16:10.205728', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (891, 213, 'OK', '2', '2022-04-25 14:18:52.308985', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (892, 226, 'OK', '1', '2022-04-25 14:22:11.997945', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (893, 213, 'OK', '2', '2022-04-25 14:25:51.835527', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (894, 213, 'OK', '2', '2022-04-25 14:25:55.170423', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (895, 204, 'OK', '1', '2022-04-25 14:26:43.557441', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (896, 204, 'OK', '1', '2022-04-25 14:28:22.003368', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (897, 226, 'OK', '1', '2022-04-25 14:40:02.198839', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (898, 226, 'OK', '1', '2022-04-25 14:57:14.858093', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (899, 226, 'OK', '1', '2022-04-25 15:00:30.531201', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (900, 204, 'OK', '1', '2022-04-25 15:06:06.935937', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (901, 204, 'OK', '1', '2022-04-25 15:09:27.439555', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (902, 204, 'OK', '1', '2022-04-25 15:13:14.852282', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (903, 213, 'OK', '2', '2022-04-25 15:17:52.646429', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (904, 213, 'OK', '2', '2022-04-25 15:25:45.273911', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (905, 201, 'FAIL', '1', '2022-04-25 15:39:12.398691', 'test5', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (906, 224, 'OK', '1', '2022-04-25 15:51:31.793936', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (907, 224, 'OK', '1', '2022-04-25 15:55:41.855684', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (908, 224, 'OK', '1', '2022-04-25 16:09:31.042287', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (909, 224, 'OK', '1', '2022-04-25 16:10:49.610933', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (910, 228, 'OK', '1', '2022-04-25 16:14:58.907857', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (911, 228, 'OK', '1', '2022-04-25 16:14:59.576519', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (912, 224, 'OK', '1', '2022-04-25 16:16:15.026273', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (913, 204, 'OK', '1', '2022-04-25 16:18:35.608788', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (914, 228, 'OK', '1', '2022-04-25 16:21:27.199028', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (915, 46, 'OK', '2', '2022-04-25 16:21:58.927304', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (916, 224, 'OK', '1', '2022-04-25 16:22:16.058697', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (917, 224, 'OK', '1', '2022-04-25 16:45:46.415005', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (918, 213, 'OK', '2', '2022-04-25 16:46:03.501783', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (919, 213, 'OK', '2', '2022-04-25 16:47:14.539995', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (920, 213, 'OK', '2', '2022-04-25 16:50:44.827792', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (921, 213, 'OK', '2', '2022-04-25 16:51:48.619928', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (922, 228, 'OK', '1', '2022-04-25 16:54:58.549916', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (923, 49, 'OK', '2', '2022-04-25 16:56:08.64257', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (924, 49, 'OK', '2', '2022-04-25 16:56:50.951357', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (925, 213, 'OK', '2', '2022-04-25 17:01:12.639394', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (926, 49, 'OK', '2', '2022-04-25 17:05:46.70509', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (927, 204, 'OK', '1', '2022-04-25 17:07:04.258019', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (928, 204, 'OK', '1', '2022-04-25 17:10:10.552636', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (929, 213, 'OK', '2', '2022-04-25 17:11:05.11663', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (930, 213, 'OK', '2', '2022-04-25 17:16:30.876377', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (931, 213, 'OK', '2', '2022-04-25 17:18:35.784058', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (932, 213, 'OK', '2', '2022-04-25 17:21:10.082498', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (933, 204, 'OK', '1', '2022-04-25 17:22:28.552114', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (934, 204, 'OK', '1', '2022-04-25 17:23:13.464784', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (935, 213, 'OK', '2', '2022-04-25 17:23:35.487367', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (936, 204, 'OK', '1', '2022-04-25 17:27:19.155326', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (937, 228, 'OK', '1', '2022-04-25 18:12:54.07223', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (938, 46, 'OK', '2', '2022-04-26 08:29:38.318386', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (939, 186, 'OK', '2', '2022-04-26 08:32:41.539571', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (940, 228, 'OK', '1', '2022-04-26 08:33:19.779289', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (941, 213, 'OK', '2', '2022-04-26 08:34:32.662676', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (942, 213, 'OK', '2', '2022-04-26 08:35:09.310146', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (943, 213, 'OK', '2', '2022-04-26 08:36:53.153685', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (944, 224, 'OK', '1', '2022-04-26 08:38:06.034707', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (945, 224, 'OK', '1', '2022-04-26 08:46:52.229799', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (946, 224, 'OK', '1', '2022-04-26 08:48:47.208186', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (947, 204, 'OK', '1', '2022-04-26 08:56:28.467598', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (948, 204, 'OK', '1', '2022-04-26 09:04:40.279988', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (949, 228, 'OK', '1', '2022-04-26 09:10:41.674055', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (950, 226, 'OK', '1', '2022-04-26 09:20:37.989496', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (951, 46, 'OK', '2', '2022-04-26 09:29:05.883968', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (952, 49, 'OK', '2', '2022-04-26 09:35:37.785189', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (953, 228, 'OK', '1', '2022-04-26 09:38:12.39826', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (954, 1, 'OK', '2', '2022-04-26 09:38:14.961084', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (955, 1, 'OK', '2', '2022-04-26 09:41:34.59615', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (956, 1, 'OK', '2', '2022-04-26 09:43:28.099456', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (957, 1, 'OK', '2', '2022-04-26 09:44:09.797273', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (958, 213, 'OK', '2', '2022-04-26 09:44:57.007292', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (959, 1, 'OK', '2', '2022-04-26 09:46:08.527513', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (960, 1, 'OK', '2', '2022-04-26 09:53:10.231023', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (961, 1, 'OK', '2', '2022-04-26 09:56:35.159434', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (962, 1, 'OK', '2', '2022-04-26 09:57:45.954565', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (963, 226, 'OK', '1', '2022-04-26 10:02:59.454735', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (964, 226, 'OK', '1', '2022-04-26 10:16:23.835472', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (965, 226, 'OK', '1', '2022-04-26 10:23:07.277269', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (966, 228, 'OK', '1', '2022-04-26 10:27:37.478132', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (967, 213, 'OK', '2', '2022-04-26 10:28:21.191831', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (968, 226, 'OK', '1', '2022-04-26 10:30:50.508522', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (969, 226, 'OK', '1', '2022-04-26 10:31:33.872089', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (970, 226, 'OK', '1', '2022-04-26 10:31:54.917481', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (971, 226, 'OK', '1', '2022-04-26 10:32:22.688094', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (972, 1, 'OK', '2', '2022-04-26 10:32:40.521162', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (973, 226, 'OK', '1', '2022-04-26 10:34:00.525497', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (974, 226, 'OK', '1', '2022-04-26 10:46:14.748565', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (975, 226, 'OK', '1', '2022-04-26 10:47:09.717773', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (976, 226, 'OK', '1', '2022-04-26 10:54:11.412923', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (977, 224, 'OK', '1', '2022-04-26 11:01:49.126612', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (978, 224, 'OK', '1', '2022-04-26 11:02:54.523368', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (979, 224, 'OK', '1', '2022-04-26 11:02:56.246336', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (980, 224, 'OK', '1', '2022-04-26 11:06:50.477299', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (981, 224, 'OK', '1', '2022-04-26 11:10:54.212006', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (982, 46, 'FAIL', '2', '2022-04-26 12:06:39.875346', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (983, 46, 'OK', '2', '2022-04-26 12:06:45.915122', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (984, 213, 'OK', '2', '2022-04-26 12:07:14.187162', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (985, 224, 'OK', '1', '2022-04-26 12:34:11.372677', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (986, 213, 'FAIL', '1', '2022-04-26 12:39:48.181122', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (987, 213, 'FAIL', '1', '2022-04-26 12:40:01.394032', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (988, 213, 'FAIL', '1', '2022-04-26 12:40:01.991862', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (989, 213, 'FAIL', '1', '2022-04-26 12:40:39.438961', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (990, 4, 'OK', '2', '2022-04-26 12:42:02.994248', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (991, 213, 'OK', '2', '2022-04-26 12:42:54.808585', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (992, 2, 'FAIL', '2', '2022-04-26 12:44:37.064188', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (993, 2, 'OK', '2', '2022-04-26 12:45:51.834798', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (994, 31, 'OK', '2', '2022-04-26 12:47:18.384925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (995, 2, 'OK', '2', '2022-04-26 12:47:47.570897', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (996, 2, 'OK', '2', '2022-04-26 12:48:56.824874', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (997, 2, 'OK', '2', '2022-04-26 12:51:49.476043', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (998, 31, 'OK', '2', '2022-04-26 12:52:49.520371', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (999, 2, 'OK', '2', '2022-04-26 12:53:03.570105', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1000, 2, 'OK', '2', '2022-04-26 13:03:44.392713', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1001, 46, 'OK', '2', '2022-04-26 13:08:45.855555', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1002, 226, 'OK', '1', '2022-04-26 13:24:36.109005', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1003, 1, 'OK', '2', '2022-04-26 13:25:29.516227', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1004, 226, 'OK', '1', '2022-04-26 13:40:10.054868', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1005, 220, 'OK', '1', '2022-04-26 13:48:35.063592', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1006, 213, 'OK', '2', '2022-04-26 13:54:29.349688', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1007, 204, 'OK', '1', '2022-04-26 14:02:28.655454', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1008, 220, 'OK', '1', '2022-04-26 14:08:11.972221', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1009, 226, 'OK', '1', '2022-04-26 14:12:47.813988', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1010, 226, 'FAIL', '1', '2022-04-26 14:21:48.71312', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1011, 226, 'FAIL', '1', '2022-04-26 14:21:50.150784', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1012, 204, 'OK', '1', '2022-04-26 14:21:54.721483', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1013, 226, 'OK', '1', '2022-04-26 14:21:59.488132', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1014, 226, 'OK', '1', '2022-04-26 14:25:20.134146', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1015, 220, 'OK', '1', '2022-04-26 14:27:03.355331', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1016, 226, 'OK', '1', '2022-04-26 14:35:02.843595', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1017, 226, 'OK', '1', '2022-04-26 14:39:13.390051', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1018, 46, 'OK', '2', '2022-04-26 14:49:41.639948', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1019, 226, 'OK', '1', '2022-04-26 14:51:02.698994', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1020, 226, 'OK', '1', '2022-04-26 14:51:26.279004', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1021, 226, 'OK', '1', '2022-04-26 15:01:16.125725', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1022, 226, 'OK', '1', '2022-04-26 15:02:46.662593', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1023, 2, 'OK', '2', '2022-04-26 15:03:01.963348', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1024, 226, 'OK', '1', '2022-04-26 15:06:34.673614', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1025, 226, 'OK', '1', '2022-04-26 15:10:29.195101', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1026, 226, 'OK', '1', '2022-04-26 15:12:39.048229', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1027, 46, 'OK', '2', '2022-04-26 15:13:53.918818', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1028, 226, 'OK', '1', '2022-04-26 15:20:37.846339', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1029, 226, 'OK', '1', '2022-04-26 16:00:20.695108', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1030, 1, 'OK', '2', '2022-04-26 16:01:13.715867', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1031, 226, 'OK', '1', '2022-04-26 16:03:08.013211', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1032, 226, 'OK', '1', '2022-04-26 16:14:08.854257', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1033, 226, 'OK', '1', '2022-04-26 16:16:05.619891', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1034, 204, 'FAIL', '1', '2022-04-26 16:17:57.37547', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1035, 204, 'OK', '1', '2022-04-26 16:18:08.112163', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1036, 226, 'OK', '1', '2022-04-26 16:19:55.502594', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1037, 1, 'OK', '2', '2022-04-26 16:23:48.899888', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1038, 1, 'OK', '2', '2022-04-26 16:28:27.042332', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1039, 226, 'OK', '1', '2022-04-26 16:52:43.421554', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1040, 224, 'OK', '1', '2022-04-26 16:56:22.561554', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1041, 204, 'OK', '1', '2022-04-26 17:04:53.201148', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1042, 204, 'OK', '1', '2022-04-26 17:06:52.870933', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1043, 1, 'OK', '2', '2022-04-26 17:07:27.309531', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1044, 204, 'OK', '1', '2022-04-26 17:08:56.238391', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1045, 204, 'OK', '1', '2022-04-26 17:12:06.346929', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1046, 224, 'OK', '1', '2022-04-26 17:21:31.779326', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1047, 204, 'OK', '1', '2022-04-26 17:25:46.469625', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1048, 186, 'OK', '2', '2022-04-26 17:37:39.698657', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1049, 46, 'OK', '2', '2022-04-27 08:25:37.163341', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1050, 1, 'OK', '2', '2022-04-27 08:32:53.224262', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1051, 2, 'OK', '2', '2022-04-27 08:36:35.585259', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1052, 213, 'OK', '2', '2022-04-27 08:44:37.049497', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1053, 49, 'OK', '2', '2022-04-27 08:45:30.303006', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1054, 204, 'FAIL', '1', '2022-04-27 08:54:00.135491', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1055, 204, 'OK', '1', '2022-04-27 08:54:09.297083', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1056, 49, 'OK', '2', '2022-04-27 08:58:55.73783', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1057, 49, 'OK', '2', '2022-04-27 09:00:27.278551', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1058, 49, 'OK', '2', '2022-04-27 09:04:11.260082', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1059, 213, 'OK', '2', '2022-04-27 09:40:56.731142', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1060, 213, 'OK', '2', '2022-04-27 09:42:47.734478', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1061, 1, 'OK', '2', '2022-04-27 09:51:33.712318', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1062, 1, 'OK', '2', '2022-04-27 09:51:42.261729', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1063, 46, 'OK', '2', '2022-04-27 09:52:45.90926', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1064, 213, 'OK', '2', '2022-04-27 10:05:02.293787', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1065, 228, 'OK', '1', '2022-04-27 10:08:12.529765', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1066, 228, 'OK', '1', '2022-04-27 10:09:08.987793', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1067, 204, 'OK', '1', '2022-04-27 10:11:59.568828', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1068, 228, 'OK', '1', '2022-04-27 10:12:16.117712', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1069, 204, 'OK', '1', '2022-04-27 10:14:50.007879', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1070, 204, 'OK', '1', '2022-04-27 10:15:33.754841', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1071, 46, 'OK', '2', '2022-04-27 10:16:08.192224', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1072, 204, 'OK', '1', '2022-04-27 10:16:14.157753', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1073, 204, 'OK', '1', '2022-04-27 10:17:37.073272', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1074, 204, 'OK', '1', '2022-04-27 10:19:05.721816', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1075, 204, 'OK', '1', '2022-04-27 10:21:40.97113', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1076, 65, 'OK', '2', '2022-04-27 10:21:41.897863', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1077, 204, 'OK', '1', '2022-04-27 10:22:16.423998', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1078, 213, 'OK', '2', '2022-04-27 10:22:34.960608', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1079, 46, 'OK', '2', '2022-04-27 10:23:24.639291', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1080, 204, 'OK', '1', '2022-04-27 10:24:02.110742', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1081, 204, 'OK', '1', '2022-04-27 10:26:00.994447', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1082, 204, 'OK', '1', '2022-04-27 10:29:50.978526', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1083, 204, 'OK', '1', '2022-04-27 10:33:12.651285', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1084, 204, 'OK', '1', '2022-04-27 10:34:31.011638', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1085, 204, 'OK', '1', '2022-04-27 10:34:32.418197', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1086, 204, 'OK', '1', '2022-04-27 10:36:07.77219', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1087, 204, 'OK', '1', '2022-04-27 10:36:47.577555', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1088, 204, 'OK', '1', '2022-04-27 10:39:46.525307', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1089, 46, 'OK', '2', '2022-04-27 10:40:32.810458', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1090, 204, 'OK', '1', '2022-04-27 10:41:07.246188', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1091, 204, 'OK', '1', '2022-04-27 10:42:24.795626', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1092, 1, 'OK', '2', '2022-04-27 10:42:57.92494', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1093, 204, 'OK', '1', '2022-04-27 10:44:00.361599', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1094, 204, 'OK', '1', '2022-04-27 10:45:29.781232', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1095, 204, 'OK', '1', '2022-04-27 10:46:21.035405', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1096, 186, 'OK', '2', '2022-04-27 10:48:24.065534', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1097, 1, 'OK', '2', '2022-04-27 10:48:27.363699', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1098, 46, 'OK', '2', '2022-04-27 10:48:34.918254', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1099, 46, 'OK', '2', '2022-04-27 10:48:44.685548', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1100, 2, 'OK', '2', '2022-04-27 10:49:04.637359', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1101, 224, 'OK', '1', '2022-04-27 10:49:58.892521', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1102, 204, 'OK', '1', '2022-04-27 10:50:19.171743', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1103, 204, 'OK', '1', '2022-04-27 10:50:53.858142', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1104, 204, 'OK', '1', '2022-04-27 10:50:54.813507', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1105, 224, 'OK', '1', '2022-04-27 10:51:01.042126', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1106, 224, 'OK', '1', '2022-04-27 10:51:36.694267', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1107, 224, 'OK', '1', '2022-04-27 10:52:04.587264', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1108, 228, 'OK', '1', '2022-04-27 10:52:06.567302', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1109, 226, 'OK', '1', '2022-04-27 10:52:26.020831', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1110, 224, 'OK', '1', '2022-04-27 10:52:35.375092', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1111, 224, 'OK', '1', '2022-04-27 10:52:47.383174', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1112, 2, 'FAIL', '2', '2022-04-27 10:53:02.17214', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1113, 213, 'OK', '2', '2022-04-27 10:53:28.35826', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1114, 41, 'OK', '1', '2022-04-27 10:54:31.787073', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1115, 226, 'OK', '1', '2022-04-27 10:55:08.709147', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1116, 2, 'FAIL', '2', '2022-04-27 10:56:00.399129', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1117, 204, 'OK', '1', '2022-04-27 10:56:09.980209', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1118, 224, 'OK', '1', '2022-04-27 10:56:31.272722', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1119, 204, 'OK', '1', '2022-04-27 10:56:48.672398', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1120, 224, 'OK', '1', '2022-04-27 10:57:00.83192', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1121, 224, 'OK', '1', '2022-04-27 10:57:05.286391', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1122, 224, 'OK', '1', '2022-04-27 10:58:29.575667', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1123, 224, 'OK', '1', '2022-04-27 11:00:03.499004', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1124, 213, 'OK', '2', '2022-04-27 11:00:21.001777', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1125, 72, 'FAIL', '1', '2022-04-27 11:00:52.094059', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1126, 204, 'OK', '1', '2022-04-27 11:04:03.638576', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1127, 204, 'OK', '1', '2022-04-27 11:07:20.774854', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1128, 204, 'OK', '1', '2022-04-27 11:14:51.285997', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1129, 213, 'OK', '2', '2022-04-27 11:16:03.054623', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1130, 228, 'OK', '1', '2022-04-27 11:16:25.958489', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1131, 228, 'OK', '1', '2022-04-27 11:16:51.397649', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1132, 46, 'OK', '2', '2022-04-27 11:17:48.847589', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1133, 49, 'OK', '2', '2022-04-27 11:21:47.816582', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1134, 204, 'OK', '1', '2022-04-27 11:23:21.378355', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1135, 46, 'OK', '2', '2022-04-27 11:23:28.465583', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1136, 204, 'OK', '1', '2022-04-27 11:26:46.640577', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1137, 46, 'OK', '2', '2022-04-27 11:28:23.235594', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1138, 213, 'OK', '2', '2022-04-27 11:32:30.543579', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1139, 204, 'OK', '1', '2022-04-27 11:35:08.560989', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1140, 204, 'OK', '1', '2022-04-27 11:36:09.806371', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1141, 204, 'OK', '1', '2022-04-27 11:36:38.500411', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1142, 204, 'OK', '1', '2022-04-27 11:38:16.475698', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1143, 213, 'OK', '2', '2022-04-27 11:44:39.88113', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1144, 186, 'OK', '2', '2022-04-27 11:46:00.627637', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1145, 204, 'OK', '1', '2022-04-27 12:17:42.226246', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1146, 65, 'OK', '2', '2022-04-27 12:18:54.751028', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1147, 204, 'OK', '1', '2022-04-27 12:25:24.262204', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1148, 204, 'OK', '1', '2022-04-27 12:30:07.494123', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1149, 204, 'OK', '1', '2022-04-27 12:32:14.463433', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1150, 46, 'OK', '2', '2022-04-27 12:35:40.598882', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1151, 204, 'OK', '1', '2022-04-27 12:45:40.633109', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1152, 1, 'OK', '2', '2022-04-27 12:56:57.456146', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1153, 1, 'OK', '2', '2022-04-27 12:57:08.320872', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1154, 1, 'OK', '2', '2022-04-27 12:57:20.849048', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1155, 204, 'OK', '1', '2022-04-27 13:02:11.645119', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1156, 204, 'OK', '1', '2022-04-27 13:10:22.970408', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1157, 204, 'OK', '1', '2022-04-27 13:11:30.600158', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1158, 204, 'OK', '1', '2022-04-27 13:12:40.53039', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1159, 204, 'OK', '1', '2022-04-27 13:13:25.635143', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1160, 204, 'OK', '1', '2022-04-27 13:15:20.734819', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1161, 204, 'OK', '1', '2022-04-27 13:17:04.089048', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1162, 226, 'OK', '1', '2022-04-27 13:17:44.707389', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1163, 46, 'OK', '2', '2022-04-27 13:20:20.83823', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1164, 46, 'OK', '2', '2022-04-27 13:20:56.658854', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1165, 204, 'OK', '1', '2022-04-27 13:24:20.296794', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1166, 186, 'OK', '2', '2022-04-27 13:26:47.650875', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1167, 204, 'OK', '1', '2022-04-27 13:27:49.344342', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1168, 204, 'OK', '1', '2022-04-27 13:27:56.068327', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1169, 228, 'OK', '1', '2022-04-27 13:29:28.143089', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1170, 1, 'OK', '2', '2022-04-27 13:31:58.117098', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1171, 204, 'OK', '1', '2022-04-27 13:34:53.900707', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1172, 228, 'OK', '1', '2022-04-27 13:35:47.683287', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1173, 204, 'OK', '1', '2022-04-27 13:37:02.490056', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1174, 226, 'OK', '1', '2022-04-27 13:37:37.015895', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1175, 204, 'OK', '1', '2022-04-27 13:38:25.509871', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1176, 228, 'OK', '1', '2022-04-27 13:43:24.343275', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1177, 228, 'OK', '1', '2022-04-27 13:49:31.765752', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1178, 1, 'OK', '2', '2022-04-27 13:51:11.931586', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1179, 204, 'FAIL', '1', '2022-04-27 13:52:38.756674', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1180, 204, 'FAIL', '1', '2022-04-27 13:52:45.025225', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1181, 204, 'OK', '1', '2022-04-27 13:52:55.981201', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1182, 204, 'OK', '1', '2022-04-27 13:53:56.214623', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1183, 204, 'OK', '1', '2022-04-27 13:57:13.869026', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1184, 204, 'OK', '1', '2022-04-27 14:02:10.157494', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1185, 204, 'OK', '1', '2022-04-27 14:02:23.419235', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1186, 4, 'OK', '2', '2022-04-27 14:11:08.708867', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1187, 204, 'OK', '1', '2022-04-27 14:12:21.276712', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1188, 228, 'OK', '1', '2022-04-27 14:20:20.681339', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1189, 228, 'OK', '1', '2022-04-27 14:20:21.08847', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1190, 204, 'OK', '1', '2022-04-27 14:21:41.853181', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1191, 46, 'OK', '2', '2022-04-27 14:23:57.651372', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1192, 204, 'OK', '1', '2022-04-27 14:27:02.886348', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1193, 46, 'OK', '2', '2022-04-27 14:27:25.309317', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1194, 226, 'OK', '1', '2022-04-27 14:28:38.522403', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1195, 1, 'OK', '2', '2022-04-27 14:29:37.102368', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1196, 204, 'OK', '1', '2022-04-27 14:30:42.731984', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1197, 204, 'OK', '1', '2022-04-27 14:45:22.366247', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1198, 204, 'OK', '1', '2022-04-27 14:46:20.755713', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1199, 1, 'OK', '2', '2022-04-27 14:47:35.170511', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1200, 204, 'OK', '1', '2022-04-27 14:48:04.657292', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1201, 204, 'OK', '1', '2022-04-27 14:54:36.998087', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1202, 204, 'OK', '1', '2022-04-27 15:14:03.054132', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1203, 204, 'OK', '1', '2022-04-27 15:15:27.543729', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1204, 228, 'OK', '1', '2022-04-27 15:17:57.461452', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1205, 226, 'OK', '1', '2022-04-27 15:34:50.544186', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1206, 204, 'OK', '1', '2022-04-27 15:45:35.190868', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1207, 204, 'FAIL', '1', '2022-04-27 15:57:18.338836', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1208, 204, 'FAIL', '1', '2022-04-27 15:57:19.57848', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1209, 204, 'OK', '1', '2022-04-27 15:57:34.082338', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1210, 204, 'OK', '1', '2022-04-27 15:57:55.394194', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1211, 204, 'OK', '1', '2022-04-27 16:02:59.295394', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1212, 204, 'OK', '1', '2022-04-27 16:04:48.052181', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1213, 226, 'OK', '1', '2022-04-27 16:05:26.298153', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1214, 204, 'FAIL', '1', '2022-04-27 16:05:33.682532', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1215, 204, 'OK', '1', '2022-04-27 16:05:43.336495', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1216, 204, 'OK', '1', '2022-04-27 16:09:14.075107', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1217, 204, 'OK', '1', '2022-04-27 16:09:57.242924', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1218, 204, 'FAIL', '1', '2022-04-27 16:10:11.902637', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1219, 204, 'FAIL', '1', '2022-04-27 16:10:13.480985', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1220, 204, 'FAIL', '1', '2022-04-27 16:11:16.125898', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1221, 204, 'FAIL', '1', '2022-04-27 16:14:24.575538', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1222, 204, 'FAIL', '1', '2022-04-27 16:14:32.471993', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1223, 204, 'OK', '1', '2022-04-27 16:18:18.220554', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1224, 204, 'FAIL', '1', '2022-04-27 16:19:49.026365', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1225, 204, 'OK', '1', '2022-04-27 16:25:54.782341', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1226, 204, 'OK', '1', '2022-04-27 16:30:37.542423', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1227, 204, 'OK', '1', '2022-04-27 16:30:56.625661', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1228, 46, 'OK', '2', '2022-04-27 16:35:36.29798', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1229, 204, 'FAIL', '1', '2022-04-27 16:45:15.514506', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1230, 204, 'OK', '1', '2022-04-27 16:45:20.078841', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1231, 204, 'OK', '1', '2022-04-27 16:45:27.70445', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1232, 204, 'OK', '1', '2022-04-27 16:47:06.977061', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1233, 204, 'FAIL', '1', '2022-04-27 16:47:22.110216', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1234, 204, 'FAIL', '1', '2022-04-27 16:49:30.992961', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1235, 204, 'FAIL', '1', '2022-04-27 16:49:32.79625', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1236, 209, 'FAIL', '2', '2022-04-27 17:11:44.668169', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1237, 209, 'FAIL', '2', '2022-04-27 17:12:48.568466', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1238, 204, 'OK', '1', '2022-04-27 17:18:33.678066', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1239, 226, 'OK', '1', '2022-04-27 17:20:56.285339', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1240, 204, 'OK', '1', '2022-04-27 17:22:58.786045', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1241, 204, 'OK', '1', '2022-04-27 17:30:26.162599', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1242, 209, 'FAIL', '2', '2022-04-27 17:30:57.45719', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1243, 203, 'OK', '1', '2022-04-27 17:31:08.677651', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1244, 228, 'OK', '1', '2022-04-27 17:35:55.962121', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1245, 204, 'OK', '1', '2022-04-27 17:44:42.258691', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1246, 46, 'OK', '2', '2022-04-28 08:16:00.273221', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1247, 46, 'OK', '2', '2022-04-28 08:25:28.644473', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1248, 204, 'OK', '1', '2022-04-28 08:44:21.332981', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1249, 226, 'FAIL', '1', '2022-04-28 08:45:45.974021', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1250, 226, 'FAIL', '1', '2022-04-28 08:45:47.897806', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1251, 226, 'OK', '1', '2022-04-28 08:45:57.856444', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1252, 204, 'OK', '1', '2022-04-28 08:50:45.466609', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1253, 204, 'OK', '1', '2022-04-28 08:51:38.873652', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1254, 226, 'OK', '1', '2022-04-28 09:10:55.973398', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1255, 204, 'OK', '1', '2022-04-28 09:15:51.91663', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1256, 186, 'OK', '2', '2022-04-28 09:41:06.107639', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1257, 186, 'OK', '2', '2022-04-28 09:51:14.404677', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1258, 228, 'OK', '1', '2022-04-28 09:53:43.19221', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1259, 204, 'OK', '1', '2022-04-28 09:56:36.059794', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1260, 1, 'FAIL', '2', '2022-04-28 09:57:25.940208', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1261, 205, 'OK', '2', '2022-04-28 09:57:40.594786', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1262, 204, 'OK', '1', '2022-04-28 10:02:22.644526', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1263, 228, 'OK', '1', '2022-04-28 10:03:01.273832', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1264, 226, 'OK', '1', '2022-04-28 10:03:07.767979', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1265, 228, 'OK', '1', '2022-04-28 10:05:19.795046', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1266, 204, 'OK', '1', '2022-04-28 10:06:32.122644', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1267, 203, 'OK', '1', '2022-04-28 10:06:52.437736', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1268, 204, 'OK', '1', '2022-04-28 10:07:17.522689', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1269, 204, 'OK', '1', '2022-04-28 10:07:34.309932', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1270, 220, 'OK', '1', '2022-04-28 10:22:10.752846', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1271, 226, 'OK', '1', '2022-04-28 10:27:24.742819', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1272, 204, 'OK', '1', '2022-04-28 10:51:32.788745', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1273, 204, 'OK', '1', '2022-04-28 10:53:32.031711', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1274, 204, 'OK', '1', '2022-04-28 11:06:59.085291', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1275, 204, 'OK', '1', '2022-04-28 11:08:11.866328', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1276, 213, 'OK', '2', '2022-04-28 11:12:30.412826', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1277, 226, 'OK', '1', '2022-04-28 11:24:12.093778', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1278, 186, 'OK', '2', '2022-04-28 11:33:45.594666', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1279, 228, 'FAIL', '1', '2022-04-28 11:34:11.02868', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1280, 228, 'FAIL', '1', '2022-04-28 11:36:04.671506', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1281, 228, 'FAIL', '1', '2022-04-28 11:36:06.165709', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1282, 229, 'FAIL', '1', '2022-04-28 11:36:27.197383', 'Saige1109', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1283, 229, 'FAIL', '1', '2022-04-28 11:36:29.853233', 'Saige1109', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1284, 204, 'OK', '1', '2022-04-28 11:36:40.791614', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1285, 204, 'OK', '1', '2022-04-28 11:37:09.480388', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1286, 204, 'OK', '1', '2022-04-28 11:39:32.211819', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1287, 204, 'OK', '1', '2022-04-28 11:45:12.744394', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1288, 203, 'OK', '1', '2022-04-28 11:46:26.402938', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1289, 203, 'OK', '1', '2022-04-28 11:47:21.791917', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1290, 228, 'OK', '1', '2022-04-28 11:51:31.888767', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1291, 203, 'OK', '1', '2022-04-28 11:54:56.540695', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1292, 228, 'OK', '1', '2022-04-28 12:06:42.051356', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1293, 228, 'OK', '1', '2022-04-28 12:38:58.962438', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1294, 228, 'OK', '1', '2022-04-28 12:38:59.758538', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1295, 46, 'OK', '2', '2022-04-28 12:44:38.310466', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1296, 226, 'OK', '1', '2022-04-28 13:02:55.776543', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1297, 213, 'OK', '2', '2022-04-28 13:03:31.504289', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1298, 226, 'OK', '1', '2022-04-28 13:14:58.271139', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1299, 49, 'OK', '2', '2022-04-28 13:17:40.623845', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1300, 226, 'OK', '1', '2022-04-28 13:27:39.847446', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1301, 213, 'OK', '2', '2022-04-28 13:56:04.658474', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1302, 213, 'OK', '2', '2022-04-28 13:57:49.161029', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1303, 226, 'OK', '1', '2022-04-28 13:58:42.493091', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1304, 1, 'OK', '2', '2022-04-28 14:14:32.562193', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1305, 220, 'OK', '1', '2022-04-28 14:30:56.088685', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1306, 213, 'OK', '2', '2022-04-28 14:39:01.136933', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1307, 213, 'OK', '2', '2022-04-28 14:39:18.349135', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1308, 46, 'FAIL', '2', '2022-04-28 14:44:03.456033', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1309, 46, 'OK', '2', '2022-04-28 14:44:10.067124', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1310, 235, 'OK', '2', '2022-04-28 14:45:10.739895', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1311, 49, 'OK', '2', '2022-04-28 14:56:24.566306', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1312, 220, 'OK', '1', '2022-04-28 14:58:00.829146', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1313, 220, 'OK', '1', '2022-04-28 14:59:12.70529', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1314, 46, 'OK', '2', '2022-04-28 15:00:20.681531', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1315, 63, 'OK', '2', '2022-04-28 15:00:29.492963', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1316, 63, 'OK', '2', '2022-04-28 15:02:53.138299', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1317, 63, 'OK', '2', '2022-04-28 15:03:31.618431', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1318, 235, 'OK', '2', '2022-04-28 15:03:53.736667', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1319, 63, 'OK', '2', '2022-04-28 15:04:15.913012', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1320, 1, 'OK', '2', '2022-04-28 15:14:14.86092', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1321, 235, 'OK', '2', '2022-04-28 15:15:43.948532', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1322, 72, 'OK', '1', '2022-04-28 15:19:35.499961', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1323, 46, 'OK', '2', '2022-04-28 15:26:50.682782', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1324, 213, 'OK', '2', '2022-04-28 15:27:34.965114', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1325, 1, 'OK', '2', '2022-04-28 15:28:39.121879', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1326, 72, 'OK', '1', '2022-04-28 15:28:40.304063', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1327, 1, 'OK', '2', '2022-04-28 15:31:32.199307', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1328, 65, 'OK', '2', '2022-04-28 15:37:38.077052', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1329, 46, 'FAIL', '2', '2022-04-28 15:44:18.684888', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1330, 14, 'OK', '2', '2022-04-28 15:44:28.067972', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1331, 46, 'FAIL', '2', '2022-04-28 15:44:30.282825', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1332, 46, 'OK', '2', '2022-04-28 15:44:32.39876', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1333, 14, 'OK', '2', '2022-04-28 15:44:54.077573', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1334, 14, 'OK', '2', '2022-04-28 15:46:50.97483', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1335, 72, 'OK', '1', '2022-04-28 15:47:38.054458', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1336, 213, 'OK', '2', '2022-04-28 15:48:19.932222', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1337, 203, 'OK', '1', '2022-04-28 15:49:52.415563', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1338, 213, 'OK', '2', '2022-04-28 16:08:14.631496', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1339, 226, 'OK', '1', '2022-04-28 16:09:18.407135', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1340, 72, 'OK', '1', '2022-04-28 16:11:48.957852', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1341, 239, 'OK', '2', '2022-04-28 16:11:56.196118', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1342, 14, 'OK', '2', '2022-04-28 16:14:18.062678', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1343, 213, 'OK', '2', '2022-04-28 16:20:12.955925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1344, 14, 'OK', '2', '2022-04-28 16:23:15.437347', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1345, 186, 'OK', '2', '2022-04-28 16:29:47.305599', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1346, 14, 'OK', '2', '2022-04-28 16:30:23.683535', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1347, 203, 'OK', '1', '2022-04-28 16:31:21.633972', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1348, 14, 'OK', '2', '2022-04-28 16:31:55.000041', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1349, 213, 'OK', '2', '2022-04-28 16:32:08.930592', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1350, 241, 'OK', '2', '2022-04-28 16:34:53.503444', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1351, 241, 'OK', '2', '2022-04-28 16:35:18.16322', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1352, 186, 'OK', '2', '2022-04-28 16:44:19.558771', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1353, 213, 'OK', '2', '2022-04-28 16:52:51.59537', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1354, 241, 'OK', '2', '2022-04-28 16:53:22.273197', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1355, 18, 'FAIL', '1', '2022-04-28 17:02:53.552054', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1356, 241, 'OK', '2', '2022-04-28 17:07:56.169784', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1357, 241, 'OK', '2', '2022-04-28 17:08:15.111174', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1358, 213, 'OK', '2', '2022-04-28 17:16:09.221257', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1359, 228, 'OK', '1', '2022-04-28 17:17:59.987579', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1360, 213, 'OK', '2', '2022-04-28 17:22:10.96819', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1361, 213, 'OK', '2', '2022-04-28 17:22:22.886759', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1362, 213, 'OK', '2', '2022-04-28 17:26:11.923424', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1363, 213, 'OK', '2', '2022-04-28 17:26:35.071846', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1364, 213, 'OK', '2', '2022-04-28 17:27:48.05447', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1365, 213, 'OK', '2', '2022-04-28 17:31:20.960995', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1366, 186, 'OK', '2', '2022-04-28 17:55:14.637177', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1367, 1, 'FAIL', '2', '2022-04-28 18:16:25.978898', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1368, 1, 'FAIL', '2', '2022-04-28 18:16:34.304046', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1369, 1, 'OK', '2', '2022-04-28 18:19:50.701292', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1370, 204, 'OK', '1', '2022-04-29 08:30:31.996401', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1371, 46, 'OK', '2', '2022-04-29 08:40:30.49505', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1372, 49, 'OK', '2', '2022-04-29 08:40:57.166901', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1373, 1, 'FAIL', '2', '2022-04-29 08:56:52.978302', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1374, 1, 'FAIL', '2', '2022-04-29 08:57:00.957479', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1375, 235, 'OK', '2', '2022-04-29 08:57:09.314696', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1376, 238, 'OK', '2', '2022-04-29 08:58:08.263859', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1377, 46, 'FAIL', '2', '2022-04-29 08:58:51.755807', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1378, 46, 'OK', '2', '2022-04-29 08:58:59.631211', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1379, 228, 'OK', '1', '2022-04-29 09:03:56.562919', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1380, 204, 'OK', '1', '2022-04-29 09:04:04.473693', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1381, 49, 'OK', '2', '2022-04-29 09:20:42.256849', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1382, 205, 'OK', '2', '2022-04-29 09:25:59.146196', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1383, 228, 'OK', '1', '2022-04-29 09:52:23.101738', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1384, 228, 'OK', '1', '2022-04-29 09:52:51.454242', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1385, 213, 'OK', '2', '2022-04-29 09:57:41.647042', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1386, 213, 'OK', '2', '2022-04-29 10:00:41.060034', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1387, 228, 'OK', '1', '2022-04-29 10:02:06.633809', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1388, 238, 'OK', '2', '2022-04-29 10:04:37.810159', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1389, 213, 'OK', '2', '2022-04-29 10:05:01.948525', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1390, 228, 'OK', '1', '2022-04-29 10:09:49.029263', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1391, 46, 'OK', '2', '2022-04-29 10:10:34.643816', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1392, 228, 'OK', '1', '2022-04-29 10:12:45.664471', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1393, 213, 'OK', '2', '2022-04-29 10:18:34.803766', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1394, 213, 'OK', '2', '2022-04-29 10:25:50.616683', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1395, 63, 'OK', '2', '2022-04-29 10:29:28.033749', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1396, 63, 'OK', '2', '2022-04-29 10:29:58.432609', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1397, 1, 'FAIL', '2', '2022-04-29 10:30:01.436497', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1398, 4, 'OK', '2', '2022-04-29 10:30:08.970359', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1399, 63, 'OK', '2', '2022-04-29 10:31:32.043864', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1400, 46, 'OK', '2', '2022-04-29 10:31:42.060088', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1401, 63, 'FAIL', '2', '2022-04-29 10:31:59.960861', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1402, 63, 'OK', '2', '2022-04-29 10:32:04.279989', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1403, 63, 'OK', '2', '2022-04-29 10:33:18.047837', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1404, 63, 'FAIL', '2', '2022-04-29 10:33:59.492016', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1405, 63, 'OK', '2', '2022-04-29 10:34:10.323789', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1406, 182, 'OK', '2', '2022-04-29 10:39:20.631938', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1407, 213, 'OK', '2', '2022-04-29 10:39:59.518911', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1408, 63, 'OK', '2', '2022-04-29 10:40:50.680159', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1409, 63, 'OK', '2', '2022-04-29 10:41:06.130393', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1410, 46, 'OK', '2', '2022-04-29 10:42:29.848526', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1411, 63, 'OK', '2', '2022-04-29 10:42:32.059961', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1412, 213, 'OK', '2', '2022-04-29 11:00:56.007008', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1413, 213, 'OK', '2', '2022-04-29 11:03:27.742207', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1414, 49, 'OK', '2', '2022-04-29 11:05:45.531165', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1415, 213, 'OK', '2', '2022-04-29 11:05:54.54508', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1416, 213, 'OK', '2', '2022-04-29 11:06:35.868792', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1417, 213, 'OK', '2', '2022-04-29 11:06:56.91696', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1418, 213, 'OK', '2', '2022-04-29 11:07:24.864176', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1419, 213, 'OK', '2', '2022-04-29 11:07:45.253807', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1420, 186, 'FAIL', '2', '2022-04-29 11:08:05.712217', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1421, 186, 'OK', '2', '2022-04-29 11:08:12.376113', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1422, 63, 'OK', '2', '2022-04-29 11:17:40.958185', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1423, 239, 'OK', '2', '2022-04-29 11:29:43.462213', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1424, 228, 'OK', '1', '2022-04-29 13:39:45.683371', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1425, 213, 'OK', '2', '2022-04-29 13:42:31.096223', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1426, 213, 'OK', '2', '2022-04-29 13:42:48.000077', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1427, 213, 'FAIL', '2', '2022-04-29 13:50:53.135834', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1428, 213, 'FAIL', '2', '2022-04-29 13:50:59.349203', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1429, 46, 'OK', '2', '2022-04-29 13:52:17.700954', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1430, 213, 'OK', '2', '2022-04-29 13:53:23.291555', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1431, 213, 'OK', '2', '2022-04-29 13:53:38.129139', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1432, 46, 'OK', '2', '2022-04-29 13:57:17.951303', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1433, 245, 'OK', '2', '2022-04-29 14:00:12.014965', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1434, 46, 'OK', '2', '2022-04-29 14:00:25.562742', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1435, 63, 'FAIL', '2', '2022-04-29 14:00:49.427032', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1436, 63, 'OK', '2', '2022-04-29 14:00:53.210658', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1437, 228, 'OK', '1', '2022-04-29 14:57:03.94797', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1438, 63, 'OK', '2', '2022-04-29 15:02:28.195774', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1439, 46, 'OK', '2', '2022-04-29 15:17:52.528711', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1440, 228, 'OK', '1', '2022-04-29 15:44:33.772763', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1441, 228, 'OK', '1', '2022-04-29 16:18:46.062988', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1442, 204, 'OK', '1', '2022-04-29 16:22:58.966572', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1443, 204, 'OK', '1', '2022-04-29 16:38:25.906326', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1444, 204, 'OK', '1', '2022-04-29 16:39:36.027429', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1445, 228, 'OK', '1', '2022-04-29 16:40:57.073963', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1446, 204, 'OK', '1', '2022-04-29 16:41:13.62004', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1447, 204, 'OK', '1', '2022-05-04 08:52:06.635058', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1448, 204, 'FAIL', '1', '2022-05-04 09:02:09.339555', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1449, 49, 'OK', '2', '2022-05-04 09:05:00.859894', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1450, 220, 'OK', '1', '2022-05-04 09:12:09.831076', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1451, 186, 'OK', '2', '2022-05-04 09:13:10.716599', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1452, 204, 'OK', '1', '2022-05-04 10:02:36.021016', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1453, 204, 'OK', '1', '2022-05-04 10:03:12.371399', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1454, 63, 'OK', '2', '2022-05-04 10:08:39.375536', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1455, 204, 'OK', '1', '2022-05-04 10:29:59.051984', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1456, 204, 'OK', '1', '2022-05-04 13:08:30.051288', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1457, 204, 'OK', '1', '2022-05-04 13:24:43.686466', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1458, 226, 'OK', '1', '2022-05-04 13:26:51.446478', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1459, 204, 'OK', '1', '2022-05-04 13:37:14.745234', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1460, 228, 'OK', '1', '2022-05-04 13:41:16.566819', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1461, 259, 'OK', '1', '2022-05-04 13:45:56.416228', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1462, 234, 'OK', '1', '2022-05-04 13:54:53.864791', 'thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1463, 228, 'OK', '1', '2022-05-04 14:04:01.9305', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1464, 228, 'OK', '1', '2022-05-04 14:11:05.018101', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1465, 228, 'OK', '1', '2022-05-04 14:26:00.439541', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1466, 228, 'OK', '1', '2022-05-04 14:28:46.590747', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1467, 213, 'OK', '2', '2022-05-04 15:27:07.561719', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1468, 226, 'OK', '1', '2022-05-04 16:06:26.900534', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1469, 226, 'OK', '1', '2022-05-04 16:06:27.347426', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1470, 226, 'OK', '1', '2022-05-04 16:07:26.576404', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1471, 63, 'OK', '2', '2022-05-04 16:14:47.25817', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1472, 226, 'OK', '1', '2022-05-04 16:15:13.971734', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1473, 46, 'OK', '2', '2022-05-04 16:19:04.269596', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1474, 204, 'OK', '1', '2022-05-04 16:26:40.73627', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1475, 226, 'OK', '1', '2022-05-04 16:28:11.876491', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1476, 228, 'OK', '1', '2022-05-04 16:36:03.885397', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1477, 228, 'OK', '1', '2022-05-04 16:38:30.653148', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1478, 63, 'OK', '2', '2022-05-04 16:42:55.75093', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1479, 46, 'OK', '2', '2022-05-04 16:43:07.878402', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1480, 228, 'OK', '1', '2022-05-04 16:45:19.546556', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1481, 46, 'OK', '2', '2022-05-04 17:02:56.830137', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1482, 228, 'OK', '1', '2022-05-04 17:41:13.835685', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1483, 49, 'OK', '2', '2022-05-05 08:47:12.241899', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1484, 203, 'FAIL', '1', '2022-05-05 08:57:56.607664', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1485, 203, 'OK', '1', '2022-05-05 08:58:30.2238', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1486, 203, 'OK', '1', '2022-05-05 09:11:40.359558', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1487, 228, 'OK', '1', '2022-05-05 09:15:52.561803', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1488, 204, 'OK', '1', '2022-05-05 09:21:04.631835', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1489, 228, 'OK', '1', '2022-05-05 09:23:24.02988', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1490, 213, 'OK', '2', '2022-05-05 09:28:32.723026', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1491, 4, 'OK', '2', '2022-05-05 09:29:32.171739', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1492, 186, 'OK', '2', '2022-05-05 09:30:22.771903', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1493, 228, 'OK', '1', '2022-05-05 09:33:13.958048', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1494, 234, 'OK', '1', '2022-05-05 09:44:41.764754', 'thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1495, 259, 'OK', '1', '2022-05-05 09:51:30.337115', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1496, 259, 'OK', '1', '2022-05-05 09:55:15.119706', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1497, 259, 'OK', '1', '2022-05-05 09:56:33.207544', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1498, 259, 'OK', '1', '2022-05-05 10:20:59.746565', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1499, 259, 'FAIL', '1', '2022-05-05 10:26:22.136183', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1500, 228, 'OK', '1', '2022-05-05 10:26:46.046852', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1501, 203, 'OK', '1', '2022-05-05 10:27:40.981669', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1502, 203, 'FAIL', '1', '2022-05-05 10:30:47.900473', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1503, 203, 'OK', '1', '2022-05-05 10:30:56.967869', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1504, 226, 'OK', '1', '2022-05-05 10:33:41.753841', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1505, 259, 'OK', '1', '2022-05-05 10:40:54.038778', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1506, 46, 'OK', '2', '2022-05-05 10:55:04.312701', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1507, 203, 'OK', '1', '2022-05-05 13:22:31.628152', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1508, 203, 'OK', '1', '2022-05-05 13:26:50.916013', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1509, 46, 'OK', '2', '2022-05-05 13:42:37.511692', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1510, 259, 'OK', '1', '2022-05-05 13:44:32.12687', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1511, 259, 'OK', '1', '2022-05-05 14:03:37.030234', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1512, 213, 'OK', '2', '2022-05-05 14:20:47.224282', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1513, 213, 'OK', '2', '2022-05-05 14:20:54.849895', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1514, 213, 'OK', '2', '2022-05-05 14:21:11.250591', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1515, 213, 'OK', '2', '2022-05-05 14:21:42.568177', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1516, 1, 'FAIL', '2', '2022-05-05 14:21:56.573161', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1517, 1, 'FAIL', '2', '2022-05-05 14:22:12.587017', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1518, 1, 'FAIL', '2', '2022-05-05 14:22:37.414768', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1519, 213, 'OK', '2', '2022-05-05 14:22:53.752927', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1520, 213, 'OK', '2', '2022-05-05 14:23:16.402084', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1521, 213, 'OK', '2', '2022-05-05 14:23:43.032381', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1522, 213, 'OK', '2', '2022-05-05 14:23:48.390853', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1523, 213, 'OK', '2', '2022-05-05 14:24:16.286766', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1524, 213, 'OK', '2', '2022-05-05 14:24:21.171112', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1525, 213, 'OK', '2', '2022-05-05 14:24:26.186268', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1526, 213, 'OK', '2', '2022-05-05 14:25:45.367203', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1527, 213, 'OK', '2', '2022-05-05 14:26:51.399578', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1528, 213, 'OK', '2', '2022-05-05 14:27:31.206529', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1529, 63, 'OK', '2', '2022-05-05 14:28:03.503664', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1530, 46, 'FAIL', '2', '2022-05-05 14:28:16.205166', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1531, 46, 'OK', '2', '2022-05-05 14:28:19.989563', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1532, 46, 'OK', '2', '2022-05-05 14:28:23.301874', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1533, 46, 'OK', '2', '2022-05-05 14:28:26.918356', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1534, 46, 'OK', '2', '2022-05-05 14:28:28.064396', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1535, 46, 'OK', '2', '2022-05-05 14:28:29.083253', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1536, 46, 'OK', '2', '2022-05-05 14:28:29.941514', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1537, 46, 'OK', '2', '2022-05-05 14:28:30.768559', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1538, 46, 'OK', '2', '2022-05-05 14:28:31.584431', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1539, 46, 'OK', '2', '2022-05-05 14:28:32.324851', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1540, 46, 'OK', '2', '2022-05-05 14:28:33.83529', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1541, 46, 'OK', '2', '2022-05-05 14:28:37.375202', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1542, 46, 'OK', '2', '2022-05-05 14:28:38.656702', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1543, 46, 'OK', '2', '2022-05-05 14:28:39.537967', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1544, 46, 'OK', '2', '2022-05-05 14:28:40.567457', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1545, 46, 'OK', '2', '2022-05-05 14:28:46.368725', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1546, 46, 'OK', '2', '2022-05-05 14:28:47.27054', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1547, 46, 'OK', '2', '2022-05-05 14:28:48.117306', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1548, 46, 'OK', '2', '2022-05-05 14:28:49.049954', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1549, 46, 'OK', '2', '2022-05-05 14:28:50.747133', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1550, 46, 'OK', '2', '2022-05-05 14:28:52.061498', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1551, 46, 'OK', '2', '2022-05-05 14:28:53.022693', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1552, 1, 'FAIL', '2', '2022-05-05 14:28:58.838643', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1553, 213, 'OK', '2', '2022-05-05 14:29:00.030257', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1554, 46, 'OK', '2', '2022-05-05 14:29:00.57407', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1555, 4, 'OK', '2', '2022-05-05 14:29:17.340047', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1556, 4, 'OK', '2', '2022-05-05 14:29:23.095619', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1557, 46, 'OK', '2', '2022-05-05 14:29:26.857586', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1558, 46, 'OK', '2', '2022-05-05 14:29:29.287977', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1559, 46, 'OK', '2', '2022-05-05 14:29:37.352954', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1560, 46, 'OK', '2', '2022-05-05 14:29:48.452389', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1561, 46, 'OK', '2', '2022-05-05 14:29:49.271252', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1562, 1, 'OK', '2', '2022-05-05 14:29:52.345212', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1563, 1, 'OK', '2', '2022-05-05 14:29:57.476225', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1564, 1, 'OK', '2', '2022-05-05 14:30:11.513155', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1565, 46, 'OK', '2', '2022-05-05 14:30:32.12931', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1566, 46, 'OK', '2', '2022-05-05 14:30:49.629849', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1567, 46, 'OK', '2', '2022-05-05 14:30:50.270087', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1568, 46, 'OK', '2', '2022-05-05 14:31:02.428357', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1569, 46, 'OK', '2', '2022-05-05 14:31:03.51869', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1570, 46, 'OK', '2', '2022-05-05 14:31:04.934767', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1571, 46, 'OK', '2', '2022-05-05 14:31:05.653065', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1572, 46, 'OK', '2', '2022-05-05 14:31:06.241753', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1573, 46, 'OK', '2', '2022-05-05 14:31:06.882837', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1574, 46, 'OK', '2', '2022-05-05 14:31:07.521602', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1575, 46, 'OK', '2', '2022-05-05 14:31:08.193078', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1576, 46, 'OK', '2', '2022-05-05 14:31:08.78118', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1577, 46, 'OK', '2', '2022-05-05 14:31:09.156629', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1578, 1, 'OK', '2', '2022-05-05 14:32:10.936274', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1579, 1, 'OK', '2', '2022-05-05 14:32:23.910903', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1580, 46, 'OK', '2', '2022-05-05 14:32:36.552073', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1581, 46, 'OK', '2', '2022-05-05 14:32:39.030946', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1582, 46, 'OK', '2', '2022-05-05 14:32:39.613094', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1583, 1, 'OK', '2', '2022-05-05 14:33:41.4978', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1584, 46, 'OK', '2', '2022-05-05 14:33:49.713719', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1585, 1, 'OK', '2', '2022-05-05 14:34:36.829758', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1586, 1, 'OK', '2', '2022-05-05 14:34:44.288249', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1587, 1, 'OK', '2', '2022-05-05 14:34:58.112114', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1588, 1, 'OK', '2', '2022-05-05 14:36:13.763923', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1589, 1, 'OK', '2', '2022-05-05 14:36:48.728195', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1590, 1, 'OK', '2', '2022-05-05 14:37:22.826962', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1591, 1, 'OK', '2', '2022-05-05 14:39:44.775192', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1592, 1, 'OK', '2', '2022-05-05 14:39:51.532493', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1593, 46, 'OK', '2', '2022-05-05 14:40:05.305444', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1594, 46, 'OK', '2', '2022-05-05 14:40:12.273681', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1595, 213, 'OK', '2', '2022-05-05 14:43:27.573254', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1596, 1, 'OK', '2', '2022-05-05 14:45:42.919283', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1597, 213, 'OK', '2', '2022-05-05 14:46:00.621787', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1598, 1, 'OK', '2', '2022-05-05 14:55:25.228006', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1599, 46, 'OK', '2', '2022-05-05 14:57:05.160903', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1600, 1, 'OK', '2', '2022-05-05 15:01:36.22241', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1601, 220, 'OK', '1', '2022-05-05 15:04:59.216387', 'Hoang Trong Nho Supervisor', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1602, 213, 'OK', '2', '2022-05-05 15:05:52.053496', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1603, 46, 'OK', '2', '2022-05-05 15:15:40.391866', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1604, 63, 'OK', '2', '2022-05-05 15:25:48.37645', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1605, 234, 'OK', '1', '2022-05-05 15:27:00.260046', 'thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1606, 203, 'OK', '1', '2022-05-05 15:28:48.452635', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1607, 259, 'OK', '1', '2022-05-05 16:57:18.091079', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1608, 203, 'FAIL', '1', '2022-05-05 17:51:10.597232', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1609, 203, 'OK', '1', '2022-05-05 17:51:21.091498', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1610, 46, 'OK', '2', '2022-05-06 08:30:59.266519', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1611, 1, 'OK', '2', '2022-05-06 08:36:22.30239', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1612, 1, 'OK', '2', '2022-05-06 08:45:23.070072', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1613, 204, 'OK', '1', '2022-05-06 08:55:51.830546', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1614, 1, 'OK', '2', '2022-05-06 09:04:25.169199', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1615, 46, 'OK', '2', '2022-05-06 09:08:23.34961', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1616, 213, 'OK', '2', '2022-05-06 09:13:00.164791', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1617, 1, 'OK', '2', '2022-05-06 09:14:37.209422', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1618, 213, 'OK', '2', '2022-05-06 09:14:49.490421', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1619, 46, 'OK', '2', '2022-05-06 09:19:41.739874', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1620, 49, 'OK', '2', '2022-05-06 09:41:21.668965', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1621, 1, 'OK', '2', '2022-05-06 09:43:30.256613', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1622, 213, 'OK', '2', '2022-05-06 09:48:21.538767', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1623, 213, 'OK', '2', '2022-05-06 09:58:34.340648', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1624, 46, 'OK', '2', '2022-05-06 10:05:00.946649', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1625, 46, 'OK', '2', '2022-05-06 10:05:39.513305', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1626, 46, 'OK', '2', '2022-05-06 10:05:42.574214', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1627, 46, 'OK', '2', '2022-05-06 10:05:48.996109', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1628, 64, 'FAIL', '2', '2022-05-06 10:07:42.009669', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1629, 65, 'OK', '2', '2022-05-06 10:08:04.002674', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1630, 1, 'OK', '2', '2022-05-06 10:17:28.951944', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1631, 1, 'OK', '2', '2022-05-06 10:18:48.055196', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1632, 1, 'OK', '2', '2022-05-06 10:19:00.524914', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1633, 1, 'OK', '2', '2022-05-06 10:23:13.118367', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1634, 203, 'OK', '1', '2022-05-06 10:43:12.096255', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1635, 1, 'OK', '2', '2022-05-06 10:45:15.135894', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1636, 63, 'OK', '2', '2022-05-06 10:46:36.129113', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1637, 63, 'OK', '2', '2022-05-06 10:46:57.523195', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1638, 65, 'OK', '2', '2022-05-06 10:47:34.434872', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1639, 259, 'OK', '1', '2022-05-06 11:07:53.255028', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1640, 203, 'OK', '1', '2022-05-06 11:25:10.069529', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1641, 46, 'FAIL', '2', '2022-05-06 13:16:23.346274', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1642, 46, 'FAIL', '2', '2022-05-06 13:16:26.689478', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1643, 46, 'OK', '2', '2022-05-06 13:16:31.695107', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1644, 203, 'FAIL', '1', '2022-05-06 13:17:01.247071', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1645, 203, 'OK', '1', '2022-05-06 13:17:12.775122', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1646, 203, 'FAIL', '1', '2022-05-06 13:26:41.486273', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1647, 203, 'FAIL', '1', '2022-05-06 13:28:04.415183', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1648, 203, 'FAIL', '1', '2022-05-06 13:29:31.985945', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1649, 203, 'FAIL', '1', '2022-05-06 13:35:09.004661', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1650, 203, 'OK', '1', '2022-05-06 13:46:46.402244', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1651, 186, 'OK', '2', '2022-05-06 14:05:52.775466', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1652, 259, 'OK', '1', '2022-05-06 14:16:01.766507', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1653, 203, 'OK', '1', '2022-05-06 14:17:35.519545', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1654, 259, 'OK', '1', '2022-05-06 14:20:21.240313', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1655, 1, 'OK', '2', '2022-05-06 14:42:49.259486', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1656, 1, 'OK', '2', '2022-05-06 14:49:45.021961', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1657, 213, 'OK', '2', '2022-05-06 14:53:35.77888', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1658, 1, 'OK', '2', '2022-05-06 14:54:29.214784', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1659, 213, 'OK', '2', '2022-05-06 14:55:33.56119', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1660, 213, 'OK', '2', '2022-05-06 14:57:27.041664', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1661, 203, 'OK', '1', '2022-05-06 14:59:56.615126', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1662, 1, 'OK', '2', '2022-05-06 15:05:42.813965', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1663, 203, 'OK', '1', '2022-05-06 15:08:37.594082', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1664, 213, 'OK', '2', '2022-05-06 15:21:22.601273', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1665, 213, 'OK', '2', '2022-05-06 15:35:36.266225', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1666, 203, 'OK', '1', '2022-05-06 15:36:34.67195', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1667, 213, 'OK', '2', '2022-05-06 15:38:45.158779', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1668, 213, 'OK', '2', '2022-05-06 15:55:02.307702', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1669, 213, 'OK', '2', '2022-05-06 16:13:42.181649', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1670, 46, 'FAIL', '2', '2022-05-06 16:14:15.157005', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1671, 46, 'FAIL', '2', '2022-05-06 16:14:16.639436', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1672, 46, 'OK', '2', '2022-05-06 16:14:23.358925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1673, 46, 'OK', '2', '2022-05-06 16:14:23.590004', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1674, 213, 'OK', '2', '2022-05-06 16:20:42.433229', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1675, 1, 'OK', '2', '2022-05-06 16:24:30.081879', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1676, 203, 'OK', '1', '2022-05-06 16:48:12.564786', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1677, 213, 'OK', '2', '2022-05-06 16:57:52.601969', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1678, 213, 'OK', '2', '2022-05-06 16:58:15.686863', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1679, 213, 'OK', '2', '2022-05-06 16:59:47.499277', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1680, 46, 'OK', '2', '2022-05-06 17:00:49.495726', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1681, 213, 'OK', '2', '2022-05-06 17:02:13.405719', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1682, 46, 'OK', '2', '2022-05-09 08:51:36.782333', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1683, 49, 'OK', '2', '2022-05-09 09:11:23.018153', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1684, 1, 'OK', '2', '2022-05-09 09:18:18.365959', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1685, 226, 'OK', '1', '2022-05-09 09:28:50.525885', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1686, 49, 'OK', '2', '2022-05-09 09:33:36.34657', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1687, 1, 'OK', '2', '2022-05-09 09:36:02.635362', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1688, 204, 'OK', '1', '2022-05-09 09:36:50.51348', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1689, 213, 'OK', '2', '2022-05-09 09:51:36.058725', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1690, 49, 'OK', '2', '2022-05-09 09:53:14.687278', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1691, 213, 'OK', '2', '2022-05-09 10:04:51.300735', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1692, 1, 'OK', '2', '2022-05-09 10:49:42.64587', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1693, 49, 'FAIL', '2', '2022-05-09 10:51:24.672677', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1694, 49, 'OK', '2', '2022-05-09 10:51:27.805165', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1695, 213, 'OK', '2', '2022-05-09 11:00:59.13911', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1696, 46, 'OK', '2', '2022-05-09 11:01:38.944392', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1697, 213, 'OK', '2', '2022-05-09 11:01:57.807672', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1698, 46, 'OK', '2', '2022-05-09 11:01:59.216783', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1699, 1, 'OK', '2', '2022-05-09 11:04:53.804486', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1700, 213, 'OK', '2', '2022-05-09 11:05:27.48998', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1701, 1, 'OK', '2', '2022-05-09 11:25:10.481833', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1702, 204, 'OK', '1', '2022-05-09 11:37:16.580388', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1703, 213, 'OK', '2', '2022-05-09 11:46:03.744421', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1704, 204, 'OK', '1', '2022-05-09 11:48:53.977898', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1705, 46, 'OK', '2', '2022-05-09 13:09:29.35239', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1706, 203, 'OK', '1', '2022-05-09 13:26:48.275526', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1707, 1, 'OK', '2', '2022-05-09 13:31:14.761222', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1708, 203, 'FAIL', '1', '2022-05-09 14:05:41.809028', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1709, 203, 'OK', '1', '2022-05-09 14:05:51.259448', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1710, 259, 'OK', '1', '2022-05-09 14:14:28.983098', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1711, 203, 'OK', '1', '2022-05-09 14:35:40.178919', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1712, 203, 'FAIL', '1', '2022-05-09 15:59:34.89805', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1713, 203, 'OK', '1', '2022-05-09 15:59:47.878649', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1714, 213, 'OK', '2', '2022-05-09 16:23:57.418967', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1715, 213, 'OK', '2', '2022-05-09 16:24:08.718825', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1716, 259, 'OK', '1', '2022-05-09 17:17:00.177093', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1717, 226, 'OK', '1', '2022-05-10 08:52:05.25081', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1718, 204, 'OK', '1', '2022-05-10 08:54:18.075255', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1719, 46, 'FAIL', '2', '2022-05-10 09:18:45.372059', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1720, 46, 'FAIL', '2', '2022-05-10 09:18:48.578724', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1721, 46, 'OK', '2', '2022-05-10 09:18:55.286887', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1722, 213, 'OK', '2', '2022-05-10 09:19:40.855901', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1723, 1, 'OK', '2', '2022-05-10 09:20:32.171786', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1724, 46, 'OK', '2', '2022-05-10 09:33:11.113815', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1725, 226, 'OK', '1', '2022-05-10 09:43:49.215357', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1726, 46, 'OK', '2', '2022-05-10 09:47:38.093135', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1727, 49, 'OK', '2', '2022-05-10 09:47:48.093987', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1728, 49, 'OK', '2', '2022-05-10 09:48:00.961925', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1729, 1, 'OK', '2', '2022-05-10 09:53:53.676681', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1730, 228, 'OK', '1', '2022-05-10 09:54:18.947007', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1731, 228, 'OK', '1', '2022-05-10 09:56:15.276018', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1732, 1, 'OK', '2', '2022-05-10 09:57:34.204705', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1733, 228, 'OK', '1', '2022-05-10 10:20:20.489116', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1734, 228, 'OK', '1', '2022-05-10 10:27:24.278175', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1735, 228, 'OK', '1', '2022-05-10 10:33:16.220906', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1736, 228, 'OK', '1', '2022-05-10 10:36:16.30457', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1737, 228, 'OK', '1', '2022-05-10 10:55:09.206709', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1738, 46, 'OK', '2', '2022-05-10 11:13:19.581422', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1739, 46, 'OK', '2', '2022-05-10 11:24:45.978534', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1740, 46, 'OK', '2', '2022-05-10 11:35:51.598215', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1741, 46, 'OK', '2', '2022-05-10 13:15:02.449424', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1742, 203, 'OK', '1', '2022-05-10 13:18:36.036795', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1743, 1, 'OK', '2', '2022-05-10 13:19:56.110366', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1744, 213, 'OK', '2', '2022-05-10 13:38:19.298153', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1745, 204, 'OK', '1', '2022-05-10 13:41:43.078484', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1746, 46, 'FAIL', '2', '2022-05-10 13:43:07.540368', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1747, 46, 'OK', '2', '2022-05-10 13:43:12.901965', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1748, 259, 'OK', '1', '2022-05-10 13:55:46.303688', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1749, 182, 'OK', '2', '2022-05-10 13:59:17.067991', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1750, 46, 'OK', '2', '2022-05-10 14:01:33.149215', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1751, 182, 'OK', '2', '2022-05-10 14:02:07.199145', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1752, 46, 'FAIL', '2', '2022-05-10 14:04:18.938055', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1753, 46, 'OK', '2', '2022-05-10 14:04:23.080712', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1754, 46, 'OK', '2', '2022-05-10 14:09:58.549169', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1755, 46, 'OK', '2', '2022-05-10 14:10:22.005695', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1756, 213, 'OK', '2', '2022-05-10 14:10:55.492704', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1757, 37, 'FAIL', '1', '2022-05-10 14:20:25.229829', 'Hoang 111', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1758, 213, 'OK', '2', '2022-05-10 14:32:13.757586', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1759, 46, 'OK', '2', '2022-05-10 14:44:18.347268', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1760, 147, 'FAIL', '1', '2022-05-10 14:44:25.075724', NULL, NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1761, 4, 'FAIL', '2', '2022-05-10 14:45:11.069548', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1762, 4, 'FAIL', '2', '2022-05-10 14:46:13.834743', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1763, 4, 'FAIL', '2', '2022-05-10 14:46:31.069115', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1764, 213, 'OK', '2', '2022-05-10 16:25:22.319233', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1765, 213, 'OK', '2', '2022-05-10 16:39:33.285599', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1766, 213, 'OK', '2', '2022-05-10 17:03:07.151823', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1767, 213, 'OK', '2', '2022-05-10 17:37:19.107901', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1768, 213, 'OK', '2', '2022-05-10 18:14:58.219156', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1769, 49, 'OK', '2', '2022-05-11 08:24:30.441105', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1770, 46, 'OK', '2', '2022-05-11 08:43:54.845508', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1771, 46, 'OK', '2', '2022-05-11 08:44:47.044606', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1772, 213, 'OK', '2', '2022-05-11 08:55:56.721641', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1773, 49, 'FAIL', '2', '2022-05-11 09:34:20.346541', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1774, 49, 'OK', '2', '2022-05-11 09:34:24.494329', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1775, 204, 'OK', '1', '2022-05-11 09:50:37.607569', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1776, 213, 'OK', '2', '2022-05-11 10:26:15.076417', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1777, 213, 'OK', '2', '2022-05-11 10:38:09.670308', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1778, 213, 'OK', '2', '2022-05-11 10:38:39.711425', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1779, 213, 'OK', '2', '2022-05-11 10:47:06.775848', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1780, 226, 'OK', '1', '2022-05-11 11:24:21.968069', 'Nhat Minh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1781, 213, 'OK', '2', '2022-05-11 11:33:16.89822', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1782, 213, 'OK', '2', '2022-05-11 11:46:25.427983', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1783, 46, 'OK', '2', '2022-05-11 12:28:07.176768', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1784, 213, 'OK', '2', '2022-05-11 12:49:21.640324', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1785, 204, 'OK', '1', '2022-05-11 13:27:05.960434', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1786, 259, 'OK', '1', '2022-05-11 13:59:45.91632', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1787, 213, 'OK', '2', '2022-05-11 14:15:39.534309', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1788, 227, 'OK', '1', '2022-05-11 14:16:10.381816', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1789, 49, 'FAIL', '2', '2022-05-11 14:17:55.209463', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1790, 49, 'OK', '2', '2022-05-11 14:18:08.27854', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1791, 49, 'OK', '2', '2022-05-11 14:27:24.856331', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1792, 227, 'OK', '1', '2022-05-11 14:28:00.611482', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1793, 227, 'OK', '1', '2022-05-11 14:33:38.380028', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1794, 46, 'FAIL', '2', '2022-05-11 14:42:48.294756', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1795, 46, 'OK', '2', '2022-05-11 14:42:52.034176', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1796, 49, 'FAIL', '2', '2022-05-11 14:52:21.183269', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1797, 49, 'FAIL', '2', '2022-05-11 14:52:28.392867', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1798, 49, 'OK', '2', '2022-05-11 14:52:31.180698', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1799, 213, 'OK', '2', '2022-05-11 14:54:39.039777', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1800, 213, 'OK', '2', '2022-05-11 14:54:44.648955', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1801, 46, 'OK', '2', '2022-05-11 15:03:36.720767', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1802, 46, 'OK', '2', '2022-05-11 15:04:56.278054', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1803, 49, 'OK', '2', '2022-05-11 15:04:57.933543', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1804, 213, 'OK', '2', '2022-05-11 15:11:34.566575', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1805, 182, 'OK', '2', '2022-05-11 15:34:46.089959', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1806, 46, 'OK', '2', '2022-05-11 15:42:49.955306', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1807, 1, 'OK', '2', '2022-05-11 15:43:06.256337', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1808, 49, 'OK', '2', '2022-05-11 15:45:11.287388', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1809, 1, 'OK', '2', '2022-05-11 15:50:16.641367', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1810, 186, 'OK', '2', '2022-05-11 15:56:48.04697', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1811, 46, 'OK', '2', '2022-05-11 15:57:48.999456', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1812, 46, 'OK', '2', '2022-05-11 15:58:54.723253', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1813, 1, 'OK', '2', '2022-05-11 15:59:58.375428', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1814, 1, 'OK', '2', '2022-05-11 16:01:39.96466', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1815, 46, 'OK', '2', '2022-05-11 16:06:58.197907', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1816, 46, 'OK', '2', '2022-05-11 16:08:28.791307', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1817, 49, 'FAIL', '2', '2022-05-11 16:10:43.249222', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1818, 49, 'OK', '2', '2022-05-11 16:10:49.123518', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1819, 204, 'OK', '1', '2022-05-11 16:20:05.724269', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1820, 270, 'OK', '1', '2022-05-11 16:24:18.767569', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1821, 270, 'OK', '1', '2022-05-11 16:24:18.767496', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1822, 270, 'OK', '1', '2022-05-11 16:24:32.511356', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1823, 270, 'OK', '1', '2022-05-11 16:24:32.4847', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1824, 270, 'OK', '1', '2022-05-11 16:24:24.322471', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1825, 270, 'OK', '1', '2022-05-11 16:24:32.487794', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1826, 270, 'OK', '1', '2022-05-11 16:24:33.174318', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1827, 270, 'OK', '1', '2022-05-11 16:24:32.509168', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1828, 270, 'OK', '1', '2022-05-11 16:24:43.145091', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1829, 270, 'OK', '1', '2022-05-11 16:24:42.587931', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1830, 270, 'OK', '1', '2022-05-11 16:24:32.507831', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1831, 270, 'OK', '1', '2022-05-11 16:24:32.518399', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1832, 270, 'OK', '1', '2022-05-11 16:24:38.944647', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1833, 270, 'OK', '1', '2022-05-11 16:24:32.525302', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1834, 270, 'OK', '1', '2022-05-11 16:25:02.889239', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1835, 270, 'OK', '1', '2022-05-11 16:24:43.496751', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1836, 270, 'OK', '1', '2022-05-11 16:25:03.469301', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1837, 270, 'OK', '1', '2022-05-11 16:25:03.470117', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1838, 270, 'OK', '1', '2022-05-11 16:24:43.445087', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1839, 270, 'OK', '1', '2022-05-11 16:24:33.207731', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1840, 270, 'OK', '1', '2022-05-11 16:25:03.035314', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1841, 270, 'OK', '1', '2022-05-11 16:25:03.482905', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1842, 270, 'OK', '1', '2022-05-11 16:25:03.463172', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1843, 270, 'OK', '1', '2022-05-11 16:25:03.494117', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1844, 270, 'OK', '1', '2022-05-11 16:25:03.495863', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1845, 270, 'OK', '1', '2022-05-11 16:25:03.509829', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1846, 270, 'OK', '1', '2022-05-11 16:25:03.482632', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1847, 270, 'OK', '1', '2022-05-11 16:25:03.399862', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1848, 270, 'OK', '1', '2022-05-11 16:25:01.455695', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1849, 270, 'OK', '1', '2022-05-11 16:25:03.514387', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1850, 270, 'OK', '1', '2022-05-11 16:25:03.511758', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1851, 270, 'OK', '1', '2022-05-11 16:26:16.334169', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1852, 1, 'OK', '2', '2022-05-11 16:26:30.717029', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1853, 270, 'OK', '1', '2022-05-11 16:27:09.731913', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1854, 213, 'OK', '2', '2022-05-11 16:29:50.774421', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1855, 213, 'OK', '2', '2022-05-11 16:40:40.096759', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1856, 270, 'OK', '1', '2022-05-11 16:41:45.738597', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1857, 204, 'OK', '1', '2022-05-11 16:46:51.206543', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1858, 203, 'OK', '1', '2022-05-11 17:03:25.381481', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1859, 204, 'OK', '1', '2022-05-11 17:05:00.653786', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1860, 46, 'FAIL', '2', '2022-05-11 17:19:10.587206', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1861, 46, 'OK', '2', '2022-05-11 17:19:14.335093', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1862, 213, 'OK', '2', '2022-05-12 08:35:31.510553', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1863, 49, 'OK', '2', '2022-05-12 08:36:04.179362', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1864, 204, 'OK', '1', '2022-05-12 08:48:06.979193', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1865, 213, 'OK', '2', '2022-05-12 08:50:29.134742', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1866, 46, 'FAIL', '2', '2022-05-12 08:50:34.488297', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1867, 46, 'OK', '2', '2022-05-12 08:50:37.803691', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1868, 186, 'OK', '2', '2022-05-12 08:54:07.666144', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1869, 204, 'OK', '1', '2022-05-12 10:00:16.064825', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1870, 259, 'OK', '1', '2022-05-12 10:01:49.862342', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1871, 46, 'FAIL', '2', '2022-05-12 10:02:11.348106', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1872, 46, 'OK', '2', '2022-05-12 10:02:14.8438', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1873, 259, 'OK', '1', '2022-05-12 10:03:19.091365', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1874, 204, 'OK', '1', '2022-05-12 10:04:47.267254', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1875, 204, 'OK', '1', '2022-05-12 10:07:01.76008', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1876, 1, 'OK', '2', '2022-05-12 10:17:07.830276', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1877, 46, 'OK', '2', '2022-05-12 10:26:06.590449', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1878, 203, 'OK', '1', '2022-05-12 10:33:52.385604', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1879, 49, 'OK', '2', '2022-05-12 10:38:13.07855', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1880, 186, 'OK', '2', '2022-05-12 10:39:08.165933', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1881, 213, 'OK', '2', '2022-05-12 10:39:14.119457', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1882, 213, 'OK', '2', '2022-05-12 10:39:28.683389', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1883, 204, 'OK', '1', '2022-05-12 10:52:49.322401', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1884, 204, 'OK', '1', '2022-05-12 10:59:08.819294', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1885, 213, 'OK', '2', '2022-05-12 11:03:01.981762', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1886, 213, 'OK', '2', '2022-05-12 11:04:14.095656', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1887, 259, 'OK', '1', '2022-05-12 11:09:59.768687', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1888, 204, 'OK', '1', '2022-05-12 11:30:00.247989', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1889, 46, 'FAIL', '2', '2022-05-12 13:14:16.119954', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1890, 46, 'OK', '2', '2022-05-12 13:14:20.601113', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1891, 213, 'OK', '2', '2022-05-12 13:21:25.157279', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1892, 213, 'OK', '2', '2022-05-12 13:23:39.057212', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1893, 213, 'OK', '2', '2022-05-12 13:24:37.152387', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1894, 1, 'OK', '2', '2022-05-12 13:54:11.224954', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1895, 227, 'OK', '1', '2022-05-12 14:38:55.37898', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1896, 203, 'OK', '1', '2022-05-12 14:42:08.718255', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1897, 203, 'OK', '1', '2022-05-12 14:42:29.001455', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1898, 203, 'OK', '1', '2022-05-12 14:43:00.228925', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1899, 213, 'OK', '2', '2022-05-12 14:51:59.943354', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1900, 213, 'OK', '2', '2022-05-12 14:59:39.053715', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1901, 227, 'OK', '1', '2022-05-12 15:47:08.595346', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1902, 227, 'OK', '1', '2022-05-12 15:51:52.329257', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1903, 227, 'OK', '1', '2022-05-12 15:55:31.864263', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1904, 49, 'OK', '2', '2022-05-12 16:08:55.494787', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1905, 213, 'OK', '2', '2022-05-12 16:20:32.511529', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1906, 204, 'OK', '1', '2022-05-12 16:21:48.555058', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1907, 203, 'OK', '1', '2022-05-12 16:46:25.500743', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1908, 213, 'OK', '2', '2022-05-13 08:49:09.883195', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1909, 49, 'OK', '2', '2022-05-13 08:53:30.264694', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1910, 46, 'FAIL', '2', '2022-05-13 08:55:11.394762', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1911, 46, 'OK', '2', '2022-05-13 08:55:16.07102', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1912, 213, 'OK', '2', '2022-05-13 08:56:00.901721', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1913, 204, 'OK', '1', '2022-05-13 09:02:06.382597', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1914, 46, 'OK', '2', '2022-05-13 09:19:37.825107', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1915, 203, 'OK', '1', '2022-05-13 09:46:15.538423', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1916, 203, 'FAIL', '1', '2022-05-13 09:56:22.545746', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1917, 203, 'OK', '1', '2022-05-13 09:56:32.759464', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1918, 186, 'OK', '2', '2022-05-13 10:12:26.355524', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1919, 49, 'OK', '2', '2022-05-13 11:09:55.605871', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1920, 203, 'OK', '1', '2022-05-13 11:10:21.922484', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1921, 203, 'OK', '1', '2022-05-13 11:14:39.698347', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1922, 259, 'OK', '1', '2022-05-13 11:15:58.165308', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1923, 213, 'OK', '2', '2022-05-13 11:28:49.845291', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1924, 213, 'OK', '2', '2022-05-13 11:30:43.753161', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1925, 46, 'FAIL', '2', '2022-05-13 13:19:56.54808', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1926, 46, 'OK', '2', '2022-05-13 13:19:59.982513', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1927, 213, 'OK', '2', '2022-05-13 13:39:22.17303', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1928, 46, 'FAIL', '2', '2022-05-13 13:42:43.987312', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1929, 46, 'FAIL', '2', '2022-05-13 13:42:47.813439', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1930, 46, 'OK', '2', '2022-05-13 13:42:51.475512', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1931, 259, 'OK', '1', '2022-05-13 13:47:59.934505', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1932, 203, 'OK', '1', '2022-05-13 14:01:44.514495', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1933, 1, 'OK', '2', '2022-05-13 14:27:17.942036', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1934, 203, 'OK', '1', '2022-05-13 14:54:46.12642', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1935, 203, 'OK', '1', '2022-05-13 14:56:22.291238', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1936, 203, 'OK', '1', '2022-05-13 14:56:38.683059', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1937, 203, 'OK', '1', '2022-05-13 15:11:10.312038', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1938, 203, 'OK', '1', '2022-05-13 15:14:05.438452', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1939, 203, 'OK', '1', '2022-05-13 15:17:11.59924', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1940, 203, 'OK', '1', '2022-05-13 15:48:14.744261', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1941, 203, 'OK', '1', '2022-05-13 15:48:44.025731', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1942, 203, 'OK', '1', '2022-05-13 15:49:14.089224', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1943, 203, 'OK', '1', '2022-05-13 15:56:58.28734', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1944, 203, 'OK', '1', '2022-05-13 16:01:14.353535', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1945, 213, 'OK', '2', '2022-05-13 16:10:37.721667', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1946, 46, 'OK', '2', '2022-05-13 16:30:35.194068', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1947, 213, 'OK', '2', '2022-05-13 16:54:12.958005', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1948, 204, 'OK', '1', '2022-05-13 17:06:20.432457', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1949, 204, 'OK', '1', '2022-05-14 01:01:38.658082', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1950, 204, 'OK', '1', '2022-05-14 01:03:52.990473', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1951, 213, 'OK', '2', '2022-05-14 09:38:57.415287', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1952, 203, 'OK', '1', '2022-05-14 10:38:36.556697', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1953, 213, 'OK', '2', '2022-05-14 12:26:43.961906', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1954, 213, 'OK', '2', '2022-05-14 14:05:00.533906', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1955, 213, 'OK', '2', '2022-05-14 14:24:24.920065', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1956, 213, 'OK', '2', '2022-05-14 15:04:54.652082', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1957, 213, 'OK', '2', '2022-05-14 15:05:51.05769', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1958, 213, 'OK', '2', '2022-05-14 15:57:55.185884', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1959, 213, 'OK', '2', '2022-05-16 08:08:16.56224', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1960, 213, 'OK', '2', '2022-05-16 08:08:18.838081', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1961, 49, 'FAIL', '2', '2022-05-16 08:13:09.257743', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1962, 49, 'OK', '2', '2022-05-16 08:13:14.397604', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1963, 203, 'OK', '1', '2022-05-16 08:28:19.421006', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1964, 204, 'OK', '1', '2022-05-16 08:34:10.722911', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1965, 204, 'OK', '1', '2022-05-16 08:34:44.993311', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1966, 227, 'OK', '1', '2022-05-16 08:42:33.381945', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1967, 1, 'OK', '2', '2022-05-16 08:49:04.510907', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1968, 46, 'FAIL', '2', '2022-05-16 08:59:13.934684', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1969, 46, 'FAIL', '2', '2022-05-16 09:00:42.839572', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1970, 46, 'FAIL', '2', '2022-05-16 09:00:48.01413', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1971, 1, 'OK', '2', '2022-05-16 09:01:30.853229', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1972, 46, 'OK', '2', '2022-05-16 09:02:27.386325', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1973, 213, 'OK', '2', '2022-05-16 09:36:40.463259', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1974, 203, 'OK', '1', '2022-05-16 09:42:24.160059', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1975, 213, 'OK', '2', '2022-05-16 10:25:23.063525', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1976, 227, 'OK', '1', '2022-05-16 10:52:42.774954', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1977, 227, 'OK', '1', '2022-05-16 11:22:29.067251', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1978, 227, 'OK', '1', '2022-05-16 11:30:00.874158', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1979, 46, 'OK', '2', '2022-05-16 11:30:45.03777', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1980, 228, 'OK', '1', '2022-05-16 11:35:19.754721', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1981, 186, 'OK', '2', '2022-05-16 11:36:08.43894', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1982, 228, 'OK', '1', '2022-05-16 11:44:40.039033', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1983, 46, 'OK', '2', '2022-05-16 13:07:23.484594', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1984, 46, 'FAIL', '2', '2022-05-16 13:07:41.296521', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1985, 46, 'OK', '2', '2022-05-16 13:07:46.684776', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1986, 46, 'OK', '2', '2022-05-16 13:08:18.47695', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1987, 46, 'FAIL', '2', '2022-05-16 13:08:51.979894', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1988, 46, 'OK', '2', '2022-05-16 13:08:56.545416', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1989, 46, 'OK', '2', '2022-05-16 13:10:07.208881', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1990, 227, 'OK', '1', '2022-05-16 13:13:20.787055', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1991, 270, 'OK', '1', '2022-05-16 13:19:44.479255', 'Saran0409', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1992, 203, 'OK', '1', '2022-05-16 13:21:02.329559', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1993, 228, 'OK', '1', '2022-05-16 13:23:58.961311', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1994, 228, 'OK', '1', '2022-05-16 13:24:19.282223', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1995, 228, 'FAIL', '1', '2022-05-16 13:24:48.500445', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1996, 228, 'FAIL', '1', '2022-05-16 13:24:55.352495', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1997, 228, 'FAIL', '1', '2022-05-16 13:25:01.457049', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1998, 228, 'OK', '1', '2022-05-16 13:29:28.816852', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (1999, 228, 'OK', '1', '2022-05-16 13:29:56.266793', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2000, 227, 'OK', '1', '2022-05-16 13:30:22.793273', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2001, 228, 'OK', '1', '2022-05-16 13:30:32.939125', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2002, 227, 'OK', '1', '2022-05-16 13:36:22.269989', 'Minh Nhat', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2003, 228, 'OK', '1', '2022-05-16 13:45:31.675165', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2004, 228, 'OK', '1', '2022-05-16 13:48:03.077198', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2005, 269, 'OK', '1', '2022-05-16 13:48:24.718882', 'Sophie Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2006, 269, 'OK', '1', '2022-05-16 13:48:45.209062', 'Sophie Phan', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2007, 203, 'OK', '1', '2022-05-16 13:49:03.729186', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2008, 228, 'OK', '1', '2022-05-16 13:53:42.928628', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2009, 204, 'OK', '1', '2022-05-16 13:56:44.251015', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2010, 203, 'OK', '1', '2022-05-16 14:00:22.137869', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2011, 213, 'OK', '2', '2022-05-16 14:02:26.844981', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2012, 228, 'OK', '1', '2022-05-16 14:32:14.568622', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2013, 213, 'OK', '2', '2022-05-16 14:32:41.12078', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2014, 228, 'OK', '1', '2022-05-16 14:35:11.935164', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2015, 228, 'OK', '1', '2022-05-16 14:36:25.317689', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2016, 228, 'FAIL', '1', '2022-05-16 14:37:46.543128', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2017, 228, 'OK', '1', '2022-05-16 14:37:57.663442', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2018, 259, 'OK', '1', '2022-05-16 14:38:59.015098', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2019, 203, 'OK', '1', '2022-05-16 14:40:18.874168', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2020, 49, 'OK', '2', '2022-05-16 14:54:35.19134', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2021, 213, 'OK', '2', '2022-05-16 15:02:18.44871', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2022, 213, 'OK', '2', '2022-05-16 15:05:22.49032', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2023, 213, 'OK', '2', '2022-05-16 15:07:07.128007', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2024, 228, 'OK', '1', '2022-05-16 15:10:05.411221', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2025, 228, 'OK', '1', '2022-05-16 15:11:14.206242', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2026, 228, 'OK', '1', '2022-05-16 15:12:07.606578', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2027, 46, 'FAIL', '2', '2022-05-16 15:12:38.869212', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2028, 46, 'OK', '2', '2022-05-16 15:12:43.076234', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2029, 1, 'OK', '2', '2022-05-16 15:14:06.112414', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2030, 228, 'OK', '1', '2022-05-16 15:15:41.258751', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2031, 228, 'OK', '1', '2022-05-16 15:17:08.180302', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2032, 228, 'OK', '1', '2022-05-16 15:17:54.974669', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2033, 228, 'OK', '1', '2022-05-16 15:20:39.33006', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2034, 228, 'OK', '1', '2022-05-16 15:21:56.347014', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2035, 49, 'OK', '2', '2022-05-16 15:22:40.127214', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2036, 228, 'OK', '1', '2022-05-16 15:27:45.659081', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2037, 228, 'OK', '1', '2022-05-16 15:28:57.866969', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2038, 228, 'OK', '1', '2022-05-16 15:29:57.23645', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2039, 213, 'OK', '2', '2022-05-16 15:31:00.071072', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2040, 203, 'OK', '1', '2022-05-16 15:34:40.843334', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2041, 213, 'OK', '2', '2022-05-16 15:38:38.325629', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2042, 228, 'OK', '1', '2022-05-16 15:41:05.717513', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2043, 203, 'OK', '1', '2022-05-16 15:41:55.602189', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2044, 186, 'OK', '2', '2022-05-16 15:43:57.471313', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2045, 46, 'OK', '2', '2022-05-16 15:46:11.346149', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2046, 203, 'OK', '1', '2022-05-16 15:48:20.73315', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2047, 46, 'OK', '2', '2022-05-16 15:49:33.779049', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2048, 186, 'OK', '2', '2022-05-16 15:55:25.692186', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2049, 228, 'OK', '1', '2022-05-16 15:57:58.516057', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2050, 186, 'OK', '2', '2022-05-16 15:58:11.829546', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2051, 203, 'OK', '1', '2022-05-16 15:58:16.612695', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2052, 275, 'FAIL', '2', '2022-05-16 15:59:58.751227', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2053, 213, 'OK', '2', '2022-05-16 16:09:51.716431', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2054, 203, 'FAIL', '1', '2022-05-16 16:12:29.845265', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2055, 203, 'OK', '1', '2022-05-16 16:12:41.714054', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2056, 228, 'OK', '1', '2022-05-16 16:25:17.675932', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2057, 186, 'OK', '2', '2022-05-16 16:30:20.255831', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2058, 243, 'OK', '2', '2022-05-16 16:30:46.952264', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2059, 203, 'OK', '1', '2022-05-16 16:37:27.660614', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2060, 186, 'OK', '2', '2022-05-16 16:41:38.988897', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2061, 275, 'OK', '2', '2022-05-16 16:41:50.920971', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2062, 275, 'OK', '2', '2022-05-16 16:42:30.77924', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2063, 275, 'OK', '2', '2022-05-16 16:44:57.216912', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2064, 275, 'OK', '2', '2022-05-16 16:45:22.676077', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2065, 275, 'OK', '2', '2022-05-16 16:48:45.038582', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2066, 275, 'OK', '2', '2022-05-16 16:48:53.326985', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2067, 46, 'FAIL', '2', '2022-05-16 17:17:28.304265', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2068, 46, 'FAIL', '2', '2022-05-16 17:17:34.519963', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2069, 46, 'OK', '2', '2022-05-16 17:17:37.266524', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2070, 275, 'OK', '2', '2022-05-16 17:31:33.499145', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2071, 203, 'OK', '1', '2022-05-16 17:35:59.639155', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2072, 228, 'OK', '1', '2022-05-16 17:48:36.017194', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2073, 204, 'OK', '1', '2022-05-16 20:24:42.557319', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2074, 204, 'OK', '1', '2022-05-16 20:36:51.629467', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2075, 46, 'OK', '2', '2022-05-17 08:22:07.498092', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2076, 46, 'OK', '2', '2022-05-17 08:22:52.785649', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2077, 213, 'OK', '2', '2022-05-17 08:26:18.798626', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2078, 275, 'OK', '2', '2022-05-17 08:32:17.741858', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2079, 204, 'OK', '1', '2022-05-17 08:35:15.776277', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2080, 275, 'OK', '2', '2022-05-17 08:35:45.727539', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2081, 46, 'OK', '2', '2022-05-17 08:35:58.28729', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2082, 228, 'OK', '1', '2022-05-17 08:39:24.828279', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2083, 275, 'OK', '2', '2022-05-17 08:46:06.602767', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2084, 228, 'OK', '1', '2022-05-17 08:59:07.18084', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2085, 228, 'OK', '1', '2022-05-17 09:02:10.697958', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2086, 228, 'OK', '1', '2022-05-17 09:02:50.617426', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2087, 1, 'OK', '2', '2022-05-17 10:10:15.57947', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2088, 46, 'OK', '2', '2022-05-17 10:11:41.383846', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2089, 275, 'OK', '2', '2022-05-17 10:15:36.847206', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2090, 213, 'OK', '2', '2022-05-17 10:26:35.523605', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2091, 46, 'FAIL', '2', '2022-05-17 10:30:32.282266', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2092, 46, 'OK', '2', '2022-05-17 10:30:37.637956', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2093, 213, 'OK', '2', '2022-05-17 10:44:51.753141', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2094, 49, 'OK', '2', '2022-05-17 10:51:40.176148', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2095, 49, 'OK', '2', '2022-05-17 10:57:22.020571', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2096, 213, 'OK', '2', '2022-05-17 10:57:56.593928', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2097, 213, 'OK', '2', '2022-05-17 10:57:58.282451', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2098, 213, 'OK', '2', '2022-05-17 10:58:03.618776', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2099, 213, 'OK', '2', '2022-05-17 10:58:25.784267', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2100, 213, 'OK', '2', '2022-05-17 10:58:27.285289', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2101, 213, 'OK', '2', '2022-05-17 10:58:28.066931', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2102, 213, 'OK', '2', '2022-05-17 10:58:28.67092', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2103, 213, 'OK', '2', '2022-05-17 10:58:29.144853', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2104, 213, 'OK', '2', '2022-05-17 10:58:29.554574', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2105, 213, 'OK', '2', '2022-05-17 10:58:33.494001', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2106, 213, 'OK', '2', '2022-05-17 10:58:41.408681', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2107, 203, 'FAIL', '1', '2022-05-17 10:58:55.332597', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2108, 203, 'OK', '1', '2022-05-17 10:59:31.568337', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2109, 213, 'OK', '2', '2022-05-17 10:59:50.20192', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2110, 213, 'OK', '2', '2022-05-17 11:01:13.235669', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2111, 213, 'OK', '2', '2022-05-17 11:01:39.450627', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2112, 275, 'OK', '2', '2022-05-17 11:03:04.870392', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2113, 275, 'OK', '2', '2022-05-17 11:05:22.488337', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2114, 204, 'OK', '1', '2022-05-17 11:37:44.821708', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2115, 204, 'OK', '1', '2022-05-17 11:40:48.155836', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2116, 1, 'OK', '2', '2022-05-17 11:56:08.811542', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2117, 204, 'OK', '1', '2022-05-17 13:06:46.093777', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2118, 213, 'OK', '2', '2022-05-17 13:10:26.460757', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2119, 203, 'OK', '1', '2022-05-17 13:27:18.950309', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2120, 46, 'OK', '2', '2022-05-17 13:44:13.861663', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2121, 203, 'OK', '1', '2022-05-17 14:01:37.7104', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2122, 46, 'OK', '2', '2022-05-17 14:03:37.427418', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2123, 46, 'OK', '2', '2022-05-17 14:20:50.797203', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2124, 213, 'OK', '2', '2022-05-17 14:34:05.236613', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2125, 275, 'OK', '2', '2022-05-17 14:35:56.962237', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2126, 46, 'OK', '2', '2022-05-17 14:38:05.621482', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2127, 275, 'OK', '2', '2022-05-17 14:40:55.340067', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2128, 275, 'OK', '2', '2022-05-17 14:44:20.088144', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2129, 46, 'FAIL', '2', '2022-05-17 14:50:06.26073', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2130, 46, 'OK', '2', '2022-05-17 14:50:12.353656', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2131, 213, 'OK', '2', '2022-05-17 15:37:29.416607', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2132, 275, 'OK', '2', '2022-05-17 15:44:55.710105', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2133, 275, 'OK', '2', '2022-05-17 16:11:58.823498', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2134, 275, 'OK', '2', '2022-05-17 16:33:27.263942', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2135, 1, 'OK', '2', '2022-05-17 16:36:53.73097', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2136, 1, 'OK', '2', '2022-05-17 17:31:49.838747', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2137, 204, 'OK', '1', '2022-05-17 20:54:13.107204', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2138, 204, 'OK', '1', '2022-05-17 21:02:16.671516', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2139, 49, 'OK', '2', '2022-05-18 09:03:39.753652', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2140, 49, 'OK', '2', '2022-05-18 09:05:59.699803', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2141, 46, 'FAIL', '2', '2022-05-18 09:07:34.431911', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2142, 46, 'OK', '2', '2022-05-18 09:07:38.510115', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2143, 46, 'OK', '2', '2022-05-18 09:09:46.016059', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2144, 46, 'OK', '2', '2022-05-18 09:10:04.392212', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2145, 46, 'FAIL', '2', '2022-05-18 09:10:17.826025', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2146, 46, 'OK', '2', '2022-05-18 09:10:22.217185', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2147, 213, 'OK', '2', '2022-05-18 09:10:50.448727', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2148, 49, 'OK', '2', '2022-05-18 09:12:44.327409', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2149, 46, 'OK', '2', '2022-05-18 09:30:36.629008', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2150, 275, 'OK', '2', '2022-05-18 09:56:35.000486', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2151, 186, 'OK', '2', '2022-05-18 10:25:28.424228', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2152, 1, 'OK', '2', '2022-05-18 10:29:42.106421', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2153, 228, 'OK', '1', '2022-05-18 10:43:02.332539', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2154, 49, 'FAIL', '2', '2022-05-18 10:44:53.543044', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2155, 213, 'OK', '2', '2022-05-18 11:10:18.75588', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2156, 275, 'OK', '2', '2022-05-18 11:36:41.141724', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2157, 204, 'OK', '1', '2022-05-18 11:40:49.643083', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2158, 275, 'OK', '2', '2022-05-18 12:02:48.625645', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2159, 46, 'OK', '2', '2022-05-18 12:29:45.826319', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2160, 275, 'OK', '2', '2022-05-18 12:49:00.612376', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2161, 259, 'FAIL', '1', '2022-05-18 13:07:46.41771', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2162, 259, 'FAIL', '1', '2022-05-18 13:07:54.960356', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2163, 204, 'OK', '1', '2022-05-18 13:20:25.007511', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2164, 259, 'OK', '1', '2022-05-18 13:23:02.772843', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2165, 204, 'OK', '1', '2022-05-18 13:30:39.078585', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2166, 203, 'OK', '1', '2022-05-18 13:47:07.794271', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2167, 259, 'OK', '1', '2022-05-18 13:55:44.203288', 'Tran Cong Tung', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2168, 1, 'FAIL', '2', '2022-05-18 13:57:33.077944', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2169, 213, 'OK', '2', '2022-05-18 13:58:32.006694', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2170, 203, 'FAIL', '1', '2022-05-18 14:37:32.742294', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2171, 203, 'OK', '1', '2022-05-18 14:37:51.879878', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2172, 228, 'OK', '1', '2022-05-18 14:50:57.767056', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2173, 203, 'FAIL', '1', '2022-05-18 15:05:53.743969', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2174, 203, 'OK', '1', '2022-05-18 15:06:10.764598', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2175, 1, 'OK', '2', '2022-05-18 15:07:01.375315', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2176, 228, 'OK', '1', '2022-05-18 15:17:20.242145', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2177, 65, 'OK', '2', '2022-05-18 15:27:56.292014', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2178, 1, 'OK', '2', '2022-05-18 15:38:00.672643', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2179, 228, 'OK', '1', '2022-05-18 15:40:27.726116', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2180, 203, 'OK', '1', '2022-05-18 16:06:35.07553', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2181, 203, 'OK', '1', '2022-05-18 16:08:10.017692', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2182, 204, 'OK', '1', '2022-05-18 16:25:36.543507', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2183, 186, 'OK', '2', '2022-05-18 17:05:04.621278', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2184, 203, 'OK', '1', '2022-05-18 17:07:05.69071', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2185, 204, 'OK', '1', '2022-05-18 17:07:17.662627', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2186, 275, 'OK', '2', '2022-05-18 17:09:23.984475', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2187, 275, 'OK', '2', '2022-05-18 17:09:35.336267', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2188, 46, 'OK', '2', '2022-05-18 17:22:40.28244', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2189, 204, 'OK', '1', '2022-05-18 17:30:13.888594', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2190, 1, 'OK', '2', '2022-05-18 17:46:09.271262', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2191, 46, 'OK', '2', '2022-05-19 08:19:42.946766', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2192, 46, 'OK', '2', '2022-05-19 08:23:47.451798', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2193, 46, 'FAIL', '2', '2022-05-19 08:34:48.7989', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2194, 46, 'FAIL', '2', '2022-05-19 08:34:52.22135', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2195, 46, 'FAIL', '2', '2022-05-19 08:34:52.986617', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2196, 58, 'OK', '2', '2022-05-19 08:36:15.159293', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2197, 55, 'OK', '2', '2022-05-19 08:37:25.323244', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2198, 213, 'OK', '2', '2022-05-19 08:37:45.709519', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2199, 49, 'OK', '2', '2022-05-19 08:37:47.598451', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2200, 49, 'OK', '2', '2022-05-19 08:38:39.568558', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2201, 49, 'FAIL', '2', '2022-05-19 08:39:34.40993', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2202, 49, 'OK', '2', '2022-05-19 08:39:42.758797', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2203, 58, 'FAIL', '2', '2022-05-19 08:40:52.542541', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2204, 58, 'OK', '2', '2022-05-19 08:40:56.878822', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2205, 55, 'OK', '2', '2022-05-19 08:43:17.35905', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2206, 63, 'OK', '2', '2022-05-19 08:44:03.777589', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2207, 58, 'FAIL', '2', '2022-05-19 08:50:08.009759', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2208, 58, 'OK', '2', '2022-05-19 08:50:11.522698', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2209, 204, 'OK', '1', '2022-05-19 08:51:11.817911', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2210, 275, 'OK', '2', '2022-05-19 08:54:03.466365', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2211, 234, 'OK', '1', '2022-05-19 09:22:35.12428', 'thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2212, 228, 'OK', '1', '2022-05-19 09:24:03.548147', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2213, 213, 'OK', '2', '2022-05-19 09:40:20.899342', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2214, 275, 'OK', '2', '2022-05-19 09:40:59.82595', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2215, 275, 'OK', '2', '2022-05-19 09:41:14.664285', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2216, 228, 'OK', '1', '2022-05-19 09:45:50.816028', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2217, 58, 'FAIL', '2', '2022-05-19 09:56:30.77326', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2218, 203, 'OK', '1', '2022-05-19 10:43:26.754201', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2219, 275, 'OK', '2', '2022-05-19 10:53:18.385451', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2220, 275, 'OK', '2', '2022-05-19 11:01:44.135453', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2221, 213, 'OK', '2', '2022-05-19 11:16:52.531557', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2222, 186, 'OK', '2', '2022-05-19 11:37:18.677694', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2223, 58, 'OK', '2', '2022-05-19 13:24:40.964091', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2224, 55, 'FAIL', '2', '2022-05-19 13:24:53.56938', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2225, 55, 'OK', '2', '2022-05-19 13:24:59.347092', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2226, 58, 'OK', '2', '2022-05-19 13:25:35.213207', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2227, 228, 'OK', '1', '2022-05-19 13:34:59.510979', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2228, 228, 'OK', '1', '2022-05-19 13:44:36.317692', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2229, 1, 'OK', '2', '2022-05-19 14:00:07.423637', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2230, 58, 'OK', '2', '2022-05-19 14:15:02.410673', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2231, 55, 'OK', '2', '2022-05-19 14:16:06.352401', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2232, 204, 'OK', '1', '2022-05-19 14:22:58.906548', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2233, 275, 'OK', '2', '2022-05-19 14:29:14.61521', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2234, 65, 'FAIL', '2', '2022-05-19 14:55:30.340159', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2235, 65, 'OK', '2', '2022-05-19 14:55:38.574168', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2236, 1, 'OK', '2', '2022-05-19 14:58:02.517342', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2237, 213, 'OK', '2', '2022-05-19 15:00:48.450424', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2238, 213, 'OK', '2', '2022-05-19 15:03:37.14975', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2239, 203, 'FAIL', '1', '2022-05-19 15:21:04.737398', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2240, 203, 'FAIL', '1', '2022-05-19 15:24:45.979759', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2241, 203, 'OK', '1', '2022-05-19 15:25:16.38864', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2242, 203, 'FAIL', '1', '2022-05-19 15:25:19.859987', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2243, 203, 'OK', '1', '2022-05-19 15:25:43.757701', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2244, 203, 'FAIL', '1', '2022-05-19 15:28:06.270441', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2245, 203, 'OK', '1', '2022-05-19 15:28:15.437656', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2246, 203, 'OK', '1', '2022-05-19 15:28:55.833279', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2247, 213, 'OK', '2', '2022-05-19 15:31:03.875421', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2248, 1, 'OK', '2', '2022-05-19 15:31:39.398118', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2249, 203, 'OK', '1', '2022-05-19 15:53:01.630843', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2250, 275, 'OK', '2', '2022-05-19 16:44:38.174255', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2251, 275, 'OK', '2', '2022-05-19 17:01:23.239726', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2252, 243, 'OK', '2', '2022-05-19 17:03:32.013279', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2253, 243, 'OK', '2', '2022-05-19 17:16:28.238702', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2254, 1, 'OK', '2', '2022-05-19 17:19:58.421154', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2255, 1, 'FAIL', '2', '2022-05-19 17:20:03.562114', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2256, 1, 'OK', '2', '2022-05-19 17:20:08.725252', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2257, 63, 'OK', '2', '2022-05-19 17:20:15.685658', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2258, 63, 'OK', '2', '2022-05-19 17:20:25.602035', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2259, 1, 'OK', '2', '2022-05-19 17:20:45.515948', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2260, 186, 'OK', '2', '2022-05-19 17:21:30.290699', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2261, 43, 'OK', '2', '2022-05-19 17:22:58.434507', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2262, 43, 'OK', '2', '2022-05-19 17:24:33.253012', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2263, 228, 'OK', '1', '2022-05-19 17:25:43.460971', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2264, 1, 'OK', '2', '2022-05-19 17:35:54.428782', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2265, 1, 'OK', '2', '2022-05-19 17:36:00.696174', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2266, 204, 'OK', '1', '2022-05-19 17:42:43.345224', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2267, 228, 'OK', '1', '2022-05-19 17:45:49.100777', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2268, 204, 'OK', '1', '2022-05-19 17:54:09.077892', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2269, 203, 'FAIL', '1', '2022-05-19 17:57:17.6996', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2270, 203, 'OK', '1', '2022-05-19 17:57:24.3099', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2271, 228, 'OK', '1', '2022-05-19 17:57:53.287478', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2272, 228, 'OK', '1', '2022-05-19 18:14:09.065874', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2273, 228, 'OK', '1', '2022-05-19 18:38:57.688065', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2274, 228, 'OK', '1', '2022-05-19 19:00:19.639585', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2275, 213, 'OK', '2', '2022-05-20 08:26:39.964936', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2276, 186, 'OK', '2', '2022-05-20 08:35:38.694231', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2277, 275, 'OK', '2', '2022-05-20 08:36:50.935278', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2278, 186, 'OK', '2', '2022-05-20 08:38:25.071967', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2279, 55, 'OK', '2', '2022-05-20 08:40:39.566656', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2280, 55, 'OK', '2', '2022-05-20 08:41:27.544123', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2281, 65, 'OK', '2', '2022-05-20 08:49:25.100032', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2282, 65, 'OK', '2', '2022-05-20 08:50:14.532896', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2283, 65, 'OK', '2', '2022-05-20 08:50:26.964239', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2284, 1, 'OK', '2', '2022-05-20 08:53:53.392402', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2285, 1, 'OK', '2', '2022-05-20 08:54:33.588785', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2286, 55, 'OK', '2', '2022-05-20 08:55:42.880974', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2287, 275, 'OK', '2', '2022-05-20 08:56:02.552525', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2288, 1, 'OK', '2', '2022-05-20 08:56:12.379164', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2289, 1, 'OK', '2', '2022-05-20 08:58:23.540638', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2290, 1, 'OK', '2', '2022-05-20 09:02:22.478356', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2291, 275, 'OK', '2', '2022-05-20 09:03:30.704614', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2292, 213, 'OK', '2', '2022-05-20 09:08:17.110024', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2293, 1, 'OK', '2', '2022-05-20 09:08:41.488452', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2294, 228, 'OK', '1', '2022-05-20 09:12:45.225815', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2295, 275, 'FAIL', '2', '2022-05-20 09:14:32.290589', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2296, 275, 'OK', '2', '2022-05-20 09:14:57.394132', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2297, 186, 'FAIL', '2', '2022-05-20 09:15:38.762844', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2298, 186, 'OK', '2', '2022-05-20 09:16:55.456502', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2299, 186, 'OK', '2', '2022-05-20 09:19:28.028015', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2300, 186, 'OK', '2', '2022-05-20 09:19:28.030314', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2302, 186, 'OK', '2', '2022-05-20 09:21:15.670339', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2304, 186, 'OK', '2', '2022-05-20 09:23:03.511929', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2301, 186, 'FAIL', '2', '2022-05-20 09:21:04.214212', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2303, 186, 'OK', '2', '2022-05-20 09:22:18.308895', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2305, 55, 'OK', '2', '2022-05-20 09:27:07.633121', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2306, 186, 'OK', '2', '2022-05-20 09:28:04.563447', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2307, 55, 'OK', '2', '2022-05-20 09:31:23.304872', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2308, 55, 'OK', '2', '2022-05-20 09:37:45.503002', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2309, 289, 'FAIL', '1', '2022-05-20 09:40:42.346803', 'Phan Thi Thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2310, 46, 'OK', '2', '2022-05-20 09:47:39.719703', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2311, 203, 'OK', '1', '2022-05-20 09:53:18.326116', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2312, 289, 'OK', '1', '2022-05-20 10:17:56.524983', 'Phan Thi Thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2313, 1, 'OK', '2', '2022-05-20 10:19:49.876661', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2314, 204, 'OK', '1', '2022-05-20 11:16:02.102358', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2315, 1, 'OK', '2', '2022-05-20 13:16:11.689192', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2316, 203, 'OK', '1', '2022-05-20 13:44:08.074786', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2317, 203, 'OK', '1', '2022-05-20 13:44:32.345563', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2318, 186, 'OK', '2', '2022-05-20 13:57:23.702374', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2319, 46, 'OK', '2', '2022-05-20 13:58:30.087897', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2320, 275, 'OK', '2', '2022-05-20 14:00:02.331391', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2321, 275, 'OK', '2', '2022-05-20 14:00:54.391111', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2322, 1, 'OK', '2', '2022-05-20 14:04:45.921593', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2323, 1, 'OK', '2', '2022-05-20 14:10:33.956433', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2324, 43, 'FAIL', '2', '2022-05-20 14:10:37.331761', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2325, 43, 'FAIL', '2', '2022-05-20 14:10:46.286174', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2326, 290, 'FAIL', '2', '2022-05-20 14:15:56.802377', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2327, 290, 'FAIL', '2', '2022-05-20 14:16:05.26273', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2328, 290, 'FAIL', '2', '2022-05-20 14:16:12.543661', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2329, 1, 'OK', '2', '2022-05-20 14:19:27.188244', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2330, 213, 'OK', '2', '2022-05-20 14:21:09.787853', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2331, 291, 'FAIL', '1', '2022-05-20 14:21:59.949111', 'testrm10', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2332, 46, 'OK', '2', '2022-05-20 14:36:38.942749', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2333, 213, 'OK', '2', '2022-05-20 15:29:01.681006', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2334, 289, 'OK', '1', '2022-05-20 16:00:01.05364', 'Phan Thi Thuy', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2335, 213, 'OK', '2', '2022-05-20 16:03:51.628768', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2336, 213, 'OK', '2', '2022-05-20 16:04:53.675319', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2337, 291, 'OK', '1', '2022-05-20 16:34:51.552834', 'testrm10', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2338, 291, 'OK', '1', '2022-05-20 16:36:37.132712', 'testrm10', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2339, 291, 'OK', '1', '2022-05-20 17:01:09.900125', 'testrm10', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2340, 46, 'OK', '2', '2022-05-20 17:01:50.77585', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2341, 228, 'OK', '1', '2022-05-20 17:18:27.942832', 'Royce0904', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2342, 186, 'OK', '2', '2022-05-20 17:20:13.938064', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2343, 46, 'FAIL', '2', '2022-05-23 08:45:00.102203', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2344, 46, 'OK', '2', '2022-05-23 08:45:07.482289', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2345, 46, 'FAIL', '2', '2022-05-23 09:14:23.823237', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2346, 46, 'OK', '2', '2022-05-23 09:14:28.485241', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2347, 213, 'OK', '2', '2022-05-23 09:32:39.889853', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2348, 46, 'OK', '2', '2022-05-23 09:34:28.300369', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2349, 1, 'OK', '2', '2022-05-23 09:35:54.172704', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2350, 1, 'OK', '2', '2022-05-23 09:35:59.087579', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2351, 219, 'OK', '1', '2022-05-23 09:44:12.996797', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2352, 219, 'OK', '1', '2022-05-23 09:45:16.575476', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2353, 219, 'OK', '1', '2022-05-23 09:45:41.75838', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2354, 219, 'OK', '1', '2022-05-23 09:45:57.856202', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2355, 219, 'OK', '1', '2022-05-23 09:49:13.597357', 'Hoang Trong Nho', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2356, 2, 'FAIL', '2', '2022-05-23 09:50:24.630566', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2357, 1, 'OK', '2', '2022-05-23 09:50:32.059399', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2358, 203, 'OK', '1', '2022-05-23 09:51:51.737443', 'test7', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2359, 202, 'OK', '1', '2022-05-23 09:52:30.513257', 'test6', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2360, 58, 'FAIL', '2', '2022-05-23 09:55:38.385272', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2361, 58, 'FAIL', '2', '2022-05-23 09:56:39.86687', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2362, 58, 'FAIL', '2', '2022-05-23 09:56:46.383733', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2363, 213, 'OK', '2', '2022-05-23 10:01:07.077214', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2364, 77, 'OK', '1', '2022-05-23 10:02:25.014241', 'Nguyen van viet anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2365, 1, 'OK', '2', '2022-05-23 10:02:51.437721', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2366, 29, 'OK', '2', '2022-05-23 10:03:05.246944', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2367, 204, 'OK', '1', '2022-05-23 10:09:22.935472', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2368, 1, 'OK', '2', '2022-05-23 10:12:43.845458', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2369, 293, 'OK', '2', '2022-05-23 10:14:59.790724', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2370, 1, 'OK', '2', '2022-05-23 10:16:53.518766', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2371, 186, 'OK', '2', '2022-05-23 10:23:34.517141', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2372, 55, 'OK', '2', '2022-05-23 10:25:19.754726', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2373, 46, 'OK', '2', '2022-05-23 10:30:35.000576', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2374, 204, 'OK', '1', '2022-05-23 10:52:17.13838', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2375, 1, 'OK', '2', '2022-05-23 11:00:19.19476', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2376, 204, 'OK', '1', '2022-05-23 11:02:46.252157', 'test8', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2377, 77, 'OK', '1', '2022-05-23 11:05:39.90625', 'Nguyen van viet anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2378, 77, 'OK', '1', '2022-05-23 11:18:20.712177', 'Nguyen van viet anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2379, 46, 'OK', '2', '2022-05-23 11:25:22.59353', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2380, 1, 'OK', '2', '2022-05-23 11:25:34.317859', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2381, 55, 'FAIL', '2', '2022-05-23 12:20:15.559341', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2382, 55, 'OK', '2', '2022-05-23 12:20:19.959425', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2383, 1, 'OK', '2', '2022-05-23 13:15:47.439945', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2384, 213, 'OK', '2', '2022-05-23 13:32:41.969623', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2385, 46, 'OK', '2', '2022-05-23 13:33:18.999528', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2386, 77, 'OK', '1', '2022-05-23 13:59:07.893805', 'Nguyen van viet anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2387, 1, 'OK', '2', '2022-05-23 14:00:45.553841', 'Nguyen Van Viet Anh', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2388, 29, 'OK', '2', '2022-05-23 14:01:13.55434', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2389, 293, 'OK', '2', '2022-05-23 14:01:28.265361', 'ADMIN', NULL);
INSERT INTO auth_bib.auth_login_log VALUES (2390, 77, 'OK', '1', '2022-05-23 14:07:47.633251', 'Nguyen van viet anh', NULL);


--
-- TOC entry 3094 (class 0 OID 17426)
-- Dependencies: 222
-- Data for Name: auth_ott; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_ott VALUES (1099, '1234', '0321456271', 'VERIFY_NEW_DEVICE', '2022-05-10 10:50:25.940511', 'NOT_OK', 'thuy@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (316, '1234', '0346138098', 'VERIFY_NEW_PHONE', '2022-04-08 16:58:53.429868', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (472, '1234', '0352146757', 'VERIFY_NEW_DEVICE', '2022-04-13 11:19:05.137868', 'OK', 'numm@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (719, '1234', '0961528388', 'VERIFY_NEW_DEVICE', '2022-04-19 11:27:53.370524', 'OK', 'nhoht978@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (319, '1234', '0958624857', 'VERIFY_NEW_PHONE', '2022-04-08 17:24:52.145973', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (320, '1234', '0985627888', 'VERIFY_NEW_PHONE', '2022-04-08 17:31:02.545752', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1232, '1234', '0334527164', 'VERIFY_NEW_PHONE', '2022-05-18 15:15:21.605588', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (446, '1234', '0445263865', 'VERIFY_NEW_DEVICE', '2022-04-12 18:40:16.73118', 'OK', 'oliviaphab@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (449, '1234', '1234567899', 'VERIFY_NEW_PHONE', '2022-04-12 19:08:18.038305', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (290, '1234', '0776543278', 'VERIFY_NEW_PHONE', '2022-04-08 14:57:57.413952', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (450, '1234', '0985290956', 'VERIFY_NEW_PHONE', '2022-04-13 08:55:32.582879', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (451, '1234', '0352416857', 'VERIFY_NEW_DEVICE', '2022-04-13 09:24:25.01549', 'NOT_OK', 'sandy@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (284, '1234', '0344167582', 'VERIFY_NEW_PHONE', '2022-04-08 14:55:40.015089', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1234, '1234', '8992585584', 'VERIFY_NEW_PHONE', '2022-05-18 17:51:45.741114', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (332, '1234', '1234456741', 'VERIFY_NEW_PHONE', '2022-04-12 11:39:29.129139', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (333, '1234', '1231231311', 'VERIFY_NEW_PHONE', '2022-04-12 11:41:42.088871', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (299, '1234', '0374216684', 'VERIFY_NEW_PHONE', '2022-04-08 16:16:07.654644', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (336, '1234', '1231231231', 'VERIFY_NEW_PHONE', '2022-04-12 11:46:42.670295', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (337, '1234', '0123123123', 'VERIFY_NEW_PHONE', '2022-04-12 11:54:31.833645', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (303, '1234', '0654217456', 'VERIFY_NEW_PHONE', '2022-04-08 16:21:42.256795', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (339, '1234', '0123123122', 'VERIFY_NEW_PHONE', '2022-04-12 12:50:59.597784', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (340, '1234', '1233231312', 'VERIFY_NEW_PHONE', '2022-04-12 12:56:58.291732', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (341, '1234', '1232312311', 'VERIFY_NEW_PHONE', '2022-04-12 13:25:55.78255', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (309, '1234', '0912345324', 'VERIFY_NEW_PHONE', '2022-04-08 16:39:14.298351', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (342, '1234', '1231233113', 'VERIFY_NEW_PHONE', '2022-04-12 13:26:59.108886', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (343, '1234', '0123123131', 'VERIFY_NEW_PHONE', '2022-04-12 13:32:30.891803', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (344, '1234', '0365428952', 'VERIFY_NEW_PHONE', '2022-04-12 13:35:11.491767', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (460, '1234', '0124156329', 'VERIFY_NEW_DEVICE', '2022-04-13 10:53:26.990562', 'OK', 'duongtuyen@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (346, '1234', '0225143629', 'VERIFY_NEW_PHONE', '2022-04-12 13:47:12.228062', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (462, '1234', '0412576324', 'VERIFY_NEW_PHONE', '2022-04-13 10:55:38.441226', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (461, '1234', '0124166789', 'VERIFY_NEW_DEVICE', '2022-04-13 10:55:26.148837', 'OK', 'nam1234@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (463, '1234', '0982146827', 'VERIFY_NEW_PHONE', '2022-04-13 10:56:29.54712', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (464, '1234', '0958213474', 'VERIFY_NEW_PHONE', '2022-04-13 10:57:16.45301', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (983, '1234', '0987432658', 'VERIFY_NEW_PHONE', '2022-04-29 15:52:09.798414', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (465, '1234', '0982416574', 'VERIFY_NEW_PHONE', '2022-04-13 10:57:34.852014', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (466, '1234', '0986253656', 'VERIFY_NEW_PHONE', '2022-04-13 10:58:53.520785', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (468, '1234', '0985290986', 'VERIFY_NEW_PHONE', '2022-04-13 11:00:06.549486', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (730, '1234', '0334019685', 'VERIFY_NEW_DEVICE', '2022-04-19 14:27:08.659506', 'NOT_OK', 'pan@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (469, '1234', '0321456872', 'VERIFY_NEW_PHONE', '2022-04-13 11:11:38.825184', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (424, '1234', '0111222333', 'RESET_PASSWORD', '2022-04-12 18:21:41.864597', 'NOT_OK', 'hoang333@mail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (876, '1234', '0124166780', 'VERIFY_NEW_DEVICE', '2022-04-27 11:10:07.893311', 'NOT_OK', 'nam12345@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (877, '1234', '0123443218', 'VERIFY_NEW_DEVICE', '2022-04-27 11:17:41.409191', 'OK', 'testregister@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (475, '1234', '0325146824', 'VERIFY_NEW_PHONE', '2022-04-13 11:23:37.381738', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (495, '1234', '0632178952', 'VERIFY_NEW_PHONE', '2022-04-13 14:06:54.563638', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (660, '1234', '0123456719', 'RESET_PASSWORD', '2022-04-14 17:21:49.70389', 'OK', 'nvva9984@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (477, '1234', '0944586138', 'VERIFY_NEW_DEVICE', '2022-04-13 11:38:56.959709', 'OK', 'binh@cmcglobal.vn', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (479, '1234', '0822556661', 'VERIFY_NEW_PHONE', '2022-04-13 11:47:11.743245', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (496, '1234', '0952213654', 'VERIFY_NEW_PHONE', '2022-04-13 14:07:25.044617', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (481, '1234', '0822556617', 'VERIFY_NEW_PHONE', '2022-04-13 11:55:57.336771', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (663, '1234', '0917417475', 'RESET_PASSWORD', '2022-04-14 17:28:36.947887', 'OK', 'nvva9999@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (671, '1234', '0859632177', 'VERIFY_NEW_PHONE', '2022-04-14 17:44:45.766376', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (946, '1234', '0987583945', 'VERIFY_NEW_PHONE', '2022-04-28 10:42:38.991956', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (616, '1234', '0987648332', 'VERIFY_NEW_PHONE', '2022-04-14 15:14:57.443662', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (534, '1234', '0986521143', 'VERIFY_NEW_PHONE', '2022-04-13 16:06:23.382678', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (601, '1234', '0973424324', 'VERIFY_NEW_PHONE', '2022-04-13 17:47:08.863347', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (948, '1234', '0988954654', 'VERIFY_NEW_PHONE', '2022-04-28 11:22:56.257713', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (494, '1234', '7896541338', 'VERIFY_NEW_DEVICE', '2022-04-13 13:48:06.601286', 'OK', 'test51@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (602, '1234', '0984324232', 'VERIFY_NEW_PHONE', '2022-04-13 17:47:22.259563', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (608, '1234', '0987654454', 'VERIFY_NEW_PHONE', '2022-04-14 14:52:16.393936', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (609, '1234', '0987678433', 'VERIFY_NEW_PHONE', '2022-04-14 15:03:56.851821', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (610, '1234', '0987683432', 'VERIFY_NEW_PHONE', '2022-04-14 15:04:51.137321', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (813, '1234', '0912345688', 'VERIFY_NEW_DEVICE', '2022-04-22 12:31:54.338375', 'OK', 'hoang123@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (612, '1234', '0987452354', 'VERIFY_NEW_PHONE', '2022-04-14 15:12:34.166063', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (618, '1234', '0987667887', 'VERIFY_NEW_PHONE', '2022-04-14 15:18:58.916298', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (620, '1234', '0834654343', 'VERIFY_NEW_PHONE', '2022-04-14 15:20:58.472991', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (683, '1234', '9876543214', 'RESET_PASSWORD', '2022-04-15 11:44:01.093942', 'NOT_OK', 'nvva1234@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (818, '1234', '1234598733', 'VERIFY_NEW_PHONE', '2022-04-25 11:10:45.472476', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (571, '1234', '1234567895', 'VERIFY_NEW_DEVICE', '2022-04-13 16:44:29.104453', 'NOT_OK', 'test2@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (827, '1234', '0987764534', 'VERIFY_NEW_PHONE', '2022-04-25 13:16:53.393585', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (710, '1234', '0987654323', 'VERIFY_NEW_PHONE', '2022-04-19 11:15:07.822254', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (711, '1234', '0974584345', 'VERIFY_NEW_PHONE', '2022-04-19 11:16:30.026069', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (713, '1234', '0987543234', 'VERIFY_NEW_PHONE', '2022-04-19 11:17:30.09819', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (714, '1234', '0987647323', 'VERIFY_NEW_PHONE', '2022-04-19 11:18:21.425945', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (837, '1234', '0978435435', 'VERIFY_NEW_PHONE', '2022-04-25 14:40:46.844793', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1203, '1234', '0334863215', 'VERIFY_NEW_DEVICE', '2022-05-16 13:35:29.811747', 'OK', 'sophie_phan98@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (839, '1234', '1233133334', 'VERIFY_NEW_DEVICE', '2022-04-25 15:55:35.303929', 'NOT_OK', 'nhnam1224@gmail.com', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1204, '1234', '0983365287', 'VERIFY_NEW_DEVICE', '2022-05-16 13:40:35.288444', 'NOT_OK', 'saran0409@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1031, '1234', '0987654321', 'RESET_PASSWORD', '2022-05-05 10:58:47.469837', 'NOT_OK', 'nvva1232@gmail.com', 3, NULL);
INSERT INTO auth_bib.auth_ott VALUES (944, '1234', '0993487534', 'VERIFY_NEW_PHONE', '2022-04-28 10:37:33.01612', 'NOT_OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1173, '1234', '0123321123', 'VERIFY_NEW_PHONE', '2022-05-10 14:00:06.642333', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (947, '1234', '0987483864', 'VERIFY_NEW_PHONE', '2022-04-28 10:43:32.678313', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1205, '1234', '0986532485', 'VERIFY_NEW_DEVICE', '2022-05-16 14:04:35.305629', 'OK', 'test10@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1181, '1234', '0988127327', 'VERIFY_NEW_PHONE', '2022-05-11 16:32:57.43615', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (962, '1234', '0325146014', 'VERIFY_NEW_PHONE', '2022-04-28 12:13:42.78713', 'OK', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1184, '1234', '516858568s', 'VERIFY_NEW_PHONE', '2022-05-11 16:54:02.688229', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1185, '1234', '5168585683', 'VERIFY_NEW_PHONE', '2022-05-11 16:54:09.208428', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1187, '1234', '1236555555', 'VERIFY_NEW_PHONE', '2022-05-11 17:11:00.108739', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1210, '1234', '0334682235', 'VERIFY_NEW_PHONE', '2022-05-18 10:31:36.384191', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1189, '1234', '0984264443', 'VERIFY_NEW_DEVICE', '2022-05-12 16:01:50.323225', 'OK', 'minhnn1@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (971, '1234', '0982563328', 'VERIFY_NEW_DEVICE', '2022-04-29 14:15:22.609456', 'OK', 'saige1109@qa.team', NULL, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1196, '1234', '0912345678', 'VERIFY_NEW_DEVICE', '2022-05-13 18:50:50.494205', 'NOT_OK', 'hoang@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1089, '1234', '9388966886', 'VERIFY_NEW_PHONE', '2022-05-09 17:31:59.770462', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1091, '1234', '3688855966', 'VERIFY_NEW_PHONE', '2022-05-09 17:37:43.241044', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1222, '1234', '0987834524', 'VERIFY_NEW_DEVICE', '2022-05-18 13:23:07.460048', 'NOT_OK', 'tctung@cmcglobal.vn', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1238, '1234', '09854345456', 'VERIFY_NEW_PHONE', '2022-05-19 09:23:49.640146', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1239, '1234', '09876443473', 'VERIFY_NEW_PHONE', '2022-05-19 09:24:01.849935', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1242, '1234', '0987654786867', 'VERIFY_NEW_PHONE', '2022-05-19 10:13:52.831326', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1243, '1234', '094534523645', 'VERIFY_NEW_PHONE', '2022-05-19 10:25:42.618904', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1245, '1234', '0334216758', 'VERIFY_NEW_PHONE', '2022-05-19 13:55:45.44392', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1246, '1234', '03321456789', 'VERIFY_NEW_PHONE', '2022-05-19 13:56:10.685302', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1247, '1234', '0332514678', 'VERIFY_NEW_PHONE', '2022-05-19 17:59:01.434761', 'NOT_OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1249, '1234', '0332514678952', 'VERIFY_NEW_PHONE', '2022-05-19 17:58:54.534068', 'OK', NULL, 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1250, '1234', '0336241859', 'VERIFY_NEW_DEVICE', '2022-05-19 18:28:49.995666', 'OK', 'royce0904@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1254, '1234', '03335462871', 'VERIFY_NEW_DEVICE', '2022-05-19 19:05:51.060803', 'OK', 'hungphan@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1257, '1234', '03356847256', 'VERIFY_NEW_DEVICE', '2022-05-20 09:55:19.035133', 'OK', 'ptthuy@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1258, '1234', '1234567890', 'VERIFY_NEW_DEVICE', '2022-05-20 14:11:58.866765', 'OK', 'test6@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1263, '1234', 'default', 'RESET_PASSWORD', '2022-05-20 14:26:08.08579', 'NOT_OK', 'vitamin252@qa.team', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1266, '1234', '6555555555', 'VERIFY_NEW_DEVICE', '2022-05-20 17:14:05.96766', 'OK', 'testrm10@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1267, '1234', '0961528387', 'VERIFY_NEW_DEVICE', '2022-05-23 09:58:48.318054', 'OK', 'nhoht97@gmail.com', 0, NULL);
INSERT INTO auth_bib.auth_ott VALUES (1268, '1234', '0334165749', 'VERIFY_NEW_DEVICE', '2022-05-23 10:08:47.625062', 'OK', 'nvvanh0907@gmail.com', 0, NULL);


--
-- TOC entry 3088 (class 0 OID 17241)
-- Dependencies: 215
-- Data for Name: auth_password_log; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_password_log VALUES (36, 13, '$2a$10$L6dytFlUO8b9PjU9c1imZeuJ3FxLx7phgyxXq67q9beUFSTu3Y/22', NULL, NULL);
INSERT INTO auth_bib.auth_password_log VALUES (37, 13, '$2a$10$jhdVrntqaukhzmtAu3zJcOnA8mgpJNUmXMMWiS9H4tRxEpc2xWmcu', NULL, NULL);
INSERT INTO auth_bib.auth_password_log VALUES (38, 13, '$2a$10$Rq40Ln0fGeNL62mIARzbZenD2W8CgCZPAT8Tyt16NCLPja5heozBa', NULL, NULL);
INSERT INTO auth_bib.auth_password_log VALUES (39, 13, '$2a$10$pJkS4WaAKBUqP2jOU/AVGe7C7Br1LNWgwx4b3BqxkHxHzm6U3WZ.6', NULL, NULL);
INSERT INTO auth_bib.auth_password_log VALUES (40, 13, '$2a$10$mPVjDkSXyrbfvU.RkLgCgOKHUCKLBbGyVTHznaSUHF3NWXqBZ1Jq2', NULL, NULL);


--
-- TOC entry 3084 (class 0 OID 17217)
-- Dependencies: 211
-- Data for Name: auth_user; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_user VALUES (261, 'default', 'Cuong', 'hamy112@gamil.com', '$2a$10$y4FfVTBlsleTPIlb1U9Wk.Vag80k8dWoGUbCXAz4FF5l7jbyNwm92', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, NULL, '2022-08-05 17:49:25.306386', '2022-05-05 17:49:25.306', NULL, 'ADMIN', NULL, 'Ha My', NULL);
INSERT INTO auth_bib.auth_user VALUES (185, 'default', 'Cuong', 'ptanh5123@gmail.com', '$2a$10$0QK9mPgVw1R7sqRPLs5gWOqY7AOcyog2BbjivC7mrsvMg7wMaoaoS', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-13 11:03:46.137094', '2022-04-13 11:03:46.137', NULL, 'ADMIN', NULL, 'ptanh512', NULL);
INSERT INTO auth_bib.auth_user VALUES (13, 'default', 'Cuong', 'nvva12323@gmail.com', '$2a$10$6hWQefMw9ywj4.14dqrLduvDrsw8xH2ek8ylBi/nR2eauMCq0Owsm', '0334911805', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-07-04 14:09:12.015508', '2022-07-08 08:41:05.223884', '2022-04-04 14:08:30.31', NULL, 'ADMIN', NULL, 'nvva1233121', NULL);
INSERT INTO auth_bib.auth_user VALUES (34, 'default', 'Cuong', 'du11.cmcglobasadsadl@gmail.com', '$2a$10$2W9DmMSVbHExUrH3KyOAzubF8tAMfdWQqYA24x/.J9kr.qWKsJfKK', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 17:13:29.936439', '2022-04-05 17:13:29.936', NULL, 'ADMIN', NULL, 'asdasdasdasdadasdasdsadsa', NULL);
INSERT INTO auth_bib.auth_user VALUES (3, 'default', 'Cuong', 'nvva1234@gmail.com', '$2a$10$98D/JeQufLbJKfmE5IU/dOUXYcLN/9s8froZISWhqri1H8Ube.bCC', '9876543214', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-15 11:14:51.27', '2022-07-15 11:09:21.652795', '2022-04-01 17:10:15.211', NULL, 'ADMIN', NULL, 'nvva0901', NULL);
INSERT INTO auth_bib.auth_user VALUES (31, 'default', 'Cuong', 'nvva09071@gmail.com', '$2a$10$HAmznm7s7YuUKEtLLMOd5ex.gQXxL0AraFCqG.RqMqVsTjUi7ybzC', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-26 12:52:49.498', '2022-07-05 14:57:49.927419', '2022-04-05 14:57:49.927', NULL, 'ADMIN', NULL, 'nvvanhs12', NULL);
INSERT INTO auth_bib.auth_user VALUES (27, 'default', 'Cuong', 'kingtest1@gmail.com', '$2a$10$BrRtTHb8vVAqS3yZ2DOFGemkKixDma7Ft/g/TrfYr1bGWs.N7jDHS', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 14:01:58.916476', '2022-04-05 14:01:58.917', NULL, 'ADMIN', NULL, 'LUFY', NULL);
INSERT INTO auth_bib.auth_user VALUES (183, 'default', 'Cuong', 'nam1221@gmail.com', '$2a$10$BcozubxW39jF0IQ1Rd6pPuNt7f82hNBDgqjFiDThGCfnP5ddYCs.6', '0123321123', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-13 11:01:49.111', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (14, 'default', 'Cuong', 'nvva12336@gmail.com', '$2a$10$fzkTLw0Z.WDan2lewBjW9egziRf.QZ8EqCm5kvXgYmpwr54IEWps.', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-28 16:31:54.991', '2022-07-04 14:09:12.015508', '2022-04-04 14:09:12.015', NULL, 'ADMIN', NULL, 'nvva1231', NULL);
INSERT INTO auth_bib.auth_user VALUES (36, 'default', 'Cuong', 'du11.cmcglobalasdasdasdasd@gmail', '$2a$10$vd4Ix0G3tjihbqgBjajOdeCPaKTzafywUJ1RRnWlWWA/BdusfV4pa', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 17:16:36.893069', '2022-04-05 17:16:36.893', NULL, 'ADMIN', NULL, 'asdasdasdasdasdsdfsdfasdasd', NULL);
INSERT INTO auth_bib.auth_user VALUES (182, 'default', 'Cuong', 'hoang213132132@mail.com', '$2a$10$we98xE/5YGh7q0PPREaAEuGlAMTuGrdIkJZV7x1NEuRBuR6pdhpQi', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-11 15:34:46.089', '2022-07-13 11:01:32.153772', '2022-04-13 11:01:32.153', NULL, 'ADMIN', NULL, 'hoang4343434', NULL);
INSERT INTO auth_bib.auth_user VALUES (12, 'default', 'Hoang Trong Nho', 'nvva1233@gmail.com', '$2a$10$fAZdJZJ.WEP4ItLIHmsI/.UK5kI8/piyRbswmAdPVo2YrYuTTIeeO', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-07-04 14:09:12.015508', '2022-07-04 13:52:52.17872', '2022-04-04 12:21:41.598', NULL, 'ADMIN', NULL, 'nvva0000', NULL);
INSERT INTO auth_bib.auth_user VALUES (91, 'default', 'Hoang Trong Nho', 'payvincent10@icloud.com', 'Ly887cQ0Ga', '38176213', '+91', 'SUPERVISOR', 1, 'ACTIVE', 2, 89, NULL, '2022-07-12 16:25:57.192386', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Payne', NULL);
INSERT INTO auth_bib.auth_user VALUES (15, 'default', 'Hoang Trong Nho', 'nvva123306@gmail.com', '$2a$10$uXI8euiN4LEJZTBZ9Ze0T.UHGVek3rIagDtBUVzlvzJd/TB49Gq1C', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 2, 1, '2022-07-04 14:09:12.015508', '2022-07-04 14:09:21.979762', '2022-04-04 14:09:21.979', NULL, 'ADMIN', NULL, 'nvva131', NULL);
INSERT INTO auth_bib.auth_user VALUES (28, 'default', 'Hoang Trong Nho', 'nvva1d23302@gmail.com', '$2a$10$/lDOL380YezobDEMkyeYf.lY8K9kHpUL1WKGj6mCA4FhZiBl8nQpu', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 14:04:58.891163', '2022-04-05 14:04:58.891', NULL, 'ADMIN', NULL, 'nvvanh12', NULL);
INSERT INTO auth_bib.auth_user VALUES (19, 'default', 'hoang', 'hoang@gmail.com', '$2a$10$Q8j3Ii6KlluVkTOPr6T0jOrDx7RB4Sy2nKpcTAh3YR9Me3siPYXta', '0912345678', '+84', 'SALE_RM', 1, 'ACTIVE', 1, 1, '2022-04-08 10:09:21.015', '2022-07-01 00:00:00', '2022-04-04 16:06:47.846', NULL, 'hoang', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (20, 'default', 'hoang', 'hoang123@gmail.com', '$2a$10$VlDh2LiqglDOEQGDiCSDVeaRHijRAI5JG6Y2NlzdNEumJ4/JXZnvW', '0912345688', '+84', 'SALE_RM', 1, 'INACTIVE', 3, 1, '2022-04-25 10:47:04.029', '2022-07-12 14:21:35.738686', '2022-04-04 16:07:20.899', NULL, 'hoang', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (184, 'default', 'Numm', 'numm@gmail.com', '$2a$10$5vH7pvx.OHzeLh7cPHZvwOL6MiRi4EU52FDZnTE68FUPY8tsxCUGi', '0352146757', '+84', 'SALE_RM', 1, 'ACTIVE', 1, 1, '2022-04-13 11:04:36.237', '2022-07-13 11:03:43.08222', '2022-04-13 11:03:09.832', NULL, 'Numm', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (41, 'default', 'Nguyen Van Viet Anh', 'nam12345@gmail.com', '$2a$10$CgnKRikHWApCdOUXDhmhaOapuQomjmZvxLeZG03Gk96ZQpQ2sn5FW', '0124166780', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2023-04-13 15:54:25.828', '2023-07-13 11:03:43.082', '2022-04-06 11:14:41.467', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (271, 'default', 'Gabin1112', 'gabin-11.12@qa.team', '$2a$10$8a/C2Rabw1EJc/ERZ7ZPi..K2ovxrWDHrZfhF9mOi4NHqRUwK.wQq', '0356849872', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-08-13 14:52:43.56176', '2022-05-11 16:07:09.251', NULL, 'Gabin1112', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (32, 'default', 'Cuong', 'tuananh2404asdasd20@gmail.com', '$2a$10$pL2zfdGF4NOOCi/MC/1BouV8..2CYaYENR/PmrbEWOLhYgVMnxqZe', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 17:10:35.074266', '2022-04-05 17:10:35.074', NULL, 'ADMIN', NULL, 'asdasdasdasdasd', NULL);
INSERT INTO auth_bib.auth_user VALUES (17, 'default', 'Nguyen Van Viet Anh', 'du11.cmcglobal@gmail.com', '$2a$10$pwi8e7j26vM7QVK5we6dKedsK8mHQEL8FhpbCffLQeWGs5h7/9pE.', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 3, 1, '2022-07-04 14:09:12.015508', '2022-07-04 14:19:50.125891', '2022-04-04 14:19:50.125', NULL, 'ADMIN', NULL, 'asdasdasd', NULL);
INSERT INTO auth_bib.auth_user VALUES (33, 'default', 'Cuong', 'du11.cmcglobasadasl@gmail.com', '$2a$10$tW6Y71Evsd6uWRGv41aj.u0yW8WWeCsbCptKMFKRUyLhViFBHXIvG', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 17:11:32.956362', '2022-04-05 17:11:32.956', NULL, 'ADMIN', NULL, 'asdasdasdasdasdadasdsa', NULL);
INSERT INTO auth_bib.auth_user VALUES (187, 'default', 'Cuong', 'rose@gmail.com', '$2a$10$9aEyd.BQ3T0q5hUqT2ovLOrSq8dJr7yGdlpQ5umxCEgk6HeMC4wpS', '0325146758', '+84', 'SUPERVISOR', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-13 11:07:18.134', NULL, 'Rose009876', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (40, 'default', 'Cuong', 'lhlinhddad2@gmail.com', '$2a$10$qXfLmCe/IVU7csj4a6yuGOfQ9EUYOtt0e.8vzPTCSNJDaPVrIK9L6', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-06 10:36:30.040243', '2022-04-06 10:36:30.04', NULL, 'ADMIN', NULL, 'asdasdasdád123', NULL);
INSERT INTO auth_bib.auth_user VALUES (35, 'default', 'Cuong', 'du11.cmcglobalasdasd@gmail', '$2a$10$8xZHBQPTDqdjTXZ983ccN.rHQ3IyjV4DvXH1espva8teBfXNmAMGa', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 17:16:07.051571', '2022-04-05 17:16:07.051', NULL, 'ADMIN', NULL, 'asdasdasdasdasdsdfsdf', NULL);
INSERT INTO auth_bib.auth_user VALUES (26, 'default', 'Cuong', 'nvva123302@gmail.com', '$2a$10$Jhbcc1rUXtgpO1SfIDoLX.Cz8ycfXDgit.gF86/QadzAH6s5fC2SC', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-05 13:21:14.563963', '2022-04-05 13:21:14.564', NULL, 'ADMIN', NULL, 'nvvanh1', NULL);
INSERT INTO auth_bib.auth_user VALUES (16, 'default', 'Cuong', 'kingtest@gmail.com', '$2a$10$LnggfBd0/OdpRc7.YUE.GuK0rOW7wUA01v4/dYLfYc82C08wEAXMC', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-05 15:24:33.598', '2022-07-04 14:11:31.222403', '2022-04-04 14:11:31.222', NULL, 'ADMIN', NULL, 'King', NULL);
INSERT INTO auth_bib.auth_user VALUES (245, 'default', 'Hoang Trong Nho', 'ptanhtest1@gmail.com', '$2a$10$SYmkNiCEcVCPuyli2l7h6.12ZIDwYWXo4TXT0kpJoluT8apvGQFMW', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, '2022-04-29 14:00:11.986', '2022-07-29 11:18:21.269719', '2022-04-29 11:18:21.269', NULL, 'ADMIN', NULL, 'ptanhtest1', NULL);
INSERT INTO auth_bib.auth_user VALUES (225, 'default', 'Nguyen Van Viet Anh', 'admin2222@gmail.com', '$2a$10$AuSKOeOs6AJQbi73WWGBmOTKBPVH7Q9zkJHxsHfXVUsc/1Jon8Era', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-25 08:33:09.771547', '2022-04-25 08:33:09.771', NULL, 'ADMIN', NULL, 'admin2222', NULL);
INSERT INTO auth_bib.auth_user VALUES (2, 'default', 'Cuong', 'nvva1232@gmail.com', '$2a$10$0qsDL1fihfFeP95BwqTlFuTgec1JXvYSg.DiBe93TR8ytY0PaH2zq', '0987654321', NULL, 'ADMIN_CHECKER', 2, 'INACTIVE', 3, 1, '2022-04-27 10:49:04.648', '2022-07-28 15:20:10.013799', '2022-04-01 17:09:24.388', NULL, 'ADMIN', NULL, 'nvva0904', NULL);
INSERT INTO auth_bib.auth_user VALUES (4, 'default', 'Cuong', 'nvva9999@gmail.com', '$2a$10$w3IxpTV3libqceIJ6S5bt.8gIMDGGPlrkQKyDZwv5l2LmtHro2naC', '0917417475', '+91', 'ADMIN_VIEWER', 2, 'ACTIVE', 3, 1, '2022-05-05 14:29:23.094', '2022-07-01 17:11:15.422409', '2022-04-01 17:11:00.922', NULL, 'Nguyen Van Viet Anh', NULL, 'nvva0902', NULL);
INSERT INTO auth_bib.auth_user VALUES (29, 'default', 'Nguyen Van Viet Anh', 'nvva09070@gmail.com', '$2a$10$ZTM.Wjb/Tda/p6ZED8ZkPOFwqScfIsIHM.iOJj0OtCtorLs7qydpu', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, '2022-05-23 14:01:13.506', '2022-07-05 14:05:13.477009', '2022-04-05 14:05:13.477', NULL, 'ADMIN', NULL, 'DLUFY', NULL);
INSERT INTO auth_bib.auth_user VALUES (274, 'default', NULL, 'hoang111111@mail.com', '$2a$10$IiRCLNsxHq7ndFgApZ0V8.Ud/ioy/nG1SIY1UWTO7liIISolsd9zS', '1231231', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-08-16 09:02:21.379118', '2022-05-16 09:02:21.379', NULL, 'ADMIN', NULL, 'Hoang111111', NULL);
INSERT INTO auth_bib.auth_user VALUES (47, 'default', 'Nguyen Van Viet Anh', 'minhvuong@gmail.com', '$2a$10$wbsTTazx2tr38sYFrbp2AOBhcnJKA0E4IqOJOOYCtxFgPDubt71eW', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-07 13:52:44.800112', '2022-04-07 13:52:44.8', NULL, 'ADMIN', NULL, 'minhvuong', NULL);
INSERT INTO auth_bib.auth_user VALUES (62, 'default', 'Nguyen Van Viet Anh', 'ptthuy44@cmcglobal.vn', '$2a$10$PACrTWYGa8R08DA2a24AOO.aB5.2jq.7eiMNhFHXTJGUC2eucEUzK', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-08 08:56:05.114324', '2022-04-08 08:56:05.114', NULL, 'ADMIN', NULL, 'nvva0907d@gmail.com', NULL);
INSERT INTO auth_bib.auth_user VALUES (44, 'default', 'Nguyen Van Viet Anh', 'namnh18025@gmail.com', '$2a$10$gm9yVUeyuIWYHPUD12zwGe6ydoG9NksP4IFIFMsOAr/kU3qRI1RHq', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-07 10:52:07.381421', '2022-04-07 10:52:07.381', NULL, 'ADMIN', NULL, 'nvva09072@gmail.com', NULL);
INSERT INTO auth_bib.auth_user VALUES (237, 'default', 'Nguyen Van Viet Anh', 'salmon@qa.team', '$2a$10$sXPAV4tX2t3R7sAulzTTSuQIY1fg3isPjq94NJikBDfayzfh7fC5i', 'default', NULL, 'ADMIN_CHECKER', 2, 'INACTIVE', 0, 1, '2022-04-28 15:04:03.897', '2022-07-28 15:03:26.059117', '2022-04-28 15:03:26.059', NULL, 'ADMIN', NULL, 'Salmon', NULL);
INSERT INTO auth_bib.auth_user VALUES (50, 'default', 'Nguyen Van Viet Anh', 'du11testing1@gmail.com', '$2a$10$6wcStjlyQfy.meFhUovIVOMRSYTlNHaN9yzZNLISnsWOeAf0BTtLK', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-07 14:28:06.546557', '2022-04-07 14:28:06.546', NULL, 'ADMIN', NULL, 'testing1', NULL);
INSERT INTO auth_bib.auth_user VALUES (45, 'default', 'Nguyen Van Viet Anh', 'duongtuyen@gmail.com', '$2a$10$ce3a3hPUr7K07opCs8mqReGOjMI2GOncPG33e5Xks9Eh49dv6qVDK', '0124156329', '+91', 'SUPERVISOR', 1, 'INACTIVE', 3, 1, '2022-04-13 10:44:20.989', '2022-07-12 18:21:56.869204', '2022-04-07 11:43:07.347', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (246, 'default', 'Nguyen Van Viet Anh', 'huong@gamil.com', '$2a$10$PV8RZ4MM4Pq2cyck7k8HPO/43gzJiy8E4L4ZtStUnVlbXOeb.ApN2', '0983211058', '+84', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-29 14:03:02.685', NULL, 'Huong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (60, 'default', 'Nguyen Van Viet Anh', 'sandy@gmail.com', '$2a$10$yO9cN1Rnt4jFjqQF.ReVuuZjPmIh19KP3YiELplbxYM7iQaXLx6lW', '0352416857', '+84', 'SALE_RM', 1, 'ACTIVE', 1, 1, '2022-04-12 09:41:51.081', '2022-07-07 17:05:19.915574', '2022-04-07 17:03:01.984', NULL, 'Sandy', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (69, 'default', 'Nguyen Van Viet Anh', 'test@masd.cim', '$2a$10$Hv4QwAZ6ER8msj4wKLF01.2J4qRQujiuckULJod1KVx6L126io.f.', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-08 13:32:28.396793', '2022-04-08 13:32:28.396', NULL, 'ADMIN', NULL, 'test', NULL);
INSERT INTO auth_bib.auth_user VALUES (49, 'default', 'Nguyen Van Viet Anh', 'thang123@gmail.com', '$2a$10$16F6Dpde4g780V59vsHSDOnyXSn39.GXYMkCqvwel2fuqFU9.UhQy', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-19 08:39:42.758', '2022-07-07 14:23:32.221223', '2022-04-07 14:23:32.221', NULL, 'ADMIN', NULL, 'thang', NULL);
INSERT INTO auth_bib.auth_user VALUES (52, 'default', 'Nguyen Van Viet Anh', 'cyndy_1@gmail.com', '$2a$10$FhwlVaw3zuUzk9NcnKF8v.UW8GsdMHvQ2vXziPICoWe8WOctXIprW', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-07 14:57:46.687791', '2022-04-07 14:57:46.687', NULL, 'ADMIN', NULL, 'Cyndy', NULL);
INSERT INTO auth_bib.auth_user VALUES (235, 'default', 'Nguyen Van Viet Anh', 'vuonghau@qa.team', '$2a$10$XUOWbTAorvwxU.ax3z.i6.7hs79/2G9HjeQBPImthUVctaH.AULeG', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-29 08:57:09.314', '2022-07-28 14:43:14.589519', '2022-04-28 14:43:14.589', NULL, 'ADMIN', NULL, 'Vuong Hau', NULL);
INSERT INTO auth_bib.auth_user VALUES (54, 'default', 'Nguyen Van Viet Anh', 'ptanh5678@gmail.com', '$2a$10$QIlIbc5HHe/JKXOanrDikOI3fmi20fX9Js81rQQn3rGtiACubV85K', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-04-08 08:58:51.526', '2022-07-07 15:40:13.17135', '2022-04-07 15:40:13.171', NULL, 'ADMIN', NULL, '123abc', NULL);
INSERT INTO auth_bib.auth_user VALUES (57, 'default', 'hahoangminh', 'hahoangminh@gmail.com', '$2a$10$u1uugsMclCviDcCYBTDGkO/ZSX2cLCnKjG7VitCdMMnIYtb0fO6/W', '0776548735', '+84', 'SALE_RM', 1, 'ACTIVE', 1, 0, '2022-04-08 10:11:43.289', '2022-07-08 08:57:51.496543', '2022-04-07 16:33:34.347', NULL, 'hahoangminh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (53, 'default', 'Doan Duc Cuong', 'Cuong@gmail.com', '$2a$10$VjE.tJ2bU21f0rwGYpL9je9JB5xbpaksiLuISx4BXvkZczIhBJKxS', '0987654321', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-07 15:26:59.363', NULL, 'Doan Duc Cuong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (66, 'default', 'Hoang P333', 'hoang333@mail.com', '$2a$10$EaCzE.Wv6njoYR3.mUxGc.kfoc7/hkqWyIJ2qL6s0R1yE3v9pxn62', '0111222333', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-08 16:43:14.925', '2022-07-08 16:41:22.060381', '2022-04-08 11:01:26.651', NULL, 'Hoang P333', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (42, 'default', 'Nguyen Van Viet Anh', 'nhnam1224@gmail.com', '$2a$10$6lx4MILYKVoTRH2mxW0MG.1InvCzqrFFBUoCNANjQFMGjQNVceLhC', '1233133334', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-08 14:59:24.408', '2022-07-05 13:21:14.563963', '2022-04-06 15:37:20.984', NULL, 'Nguyen Van', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (220, 'default', 'Hoang Trong Nho Supervisor', 'nhoht978@gmail.com', '$2a$10$BWeaJVqnc6XsPP6plUfXgOJU9XeIgs3eKJLUyPwJMI8z1JXV1ZO72', '0961528388', '+91', 'ADMIN_MAKER', 1, 'ACTIVE', 0, 2, '2022-05-05 15:04:59.215', '2022-07-18 10:05:06.048599', '2022-04-19 11:10:13.406', NULL, 'Hoang Trong Nho Supervisor', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (59, 'default', 'Olivia Phan', 'oliviaphab@gmail.com', '$2a$10$hc5ED7GZwUHGVShsAPp3K.DzDtpYayLeQqDEIKqhGjzZ.BT0us7cC', '0445263865', '+84', 'SALE_RM', 1, 'INACTIVE', 0, 1, '2022-04-01 18:29:40.133', '2022-04-07 16:54:49.388', '2022-01-07 16:54:38.776', NULL, 'Olivia Phan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (272, 'default', 'Nguyen Van Viet Anh', 'luca@qa.team', '$2a$10$AHjFii9yoM0SfMNY1CZ/BuxbH5Xbcx6eiEs1RjEM1VZxQuPw4TSQi', '0346852426', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-08-16 09:45:02.423306', '2022-05-11 16:09:37.88', NULL, 'Luca', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (56, 'default', 'Doan Duc Cuong	', 'Cuong1234@gmail.com', '$2a$10$ZFXYyJGcbkPAVWy58d8WKuKpiVNHto553pGF2XW0tFvFahtGLj2MK', '3333333333', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-07 15:48:55.569', NULL, 'Doan Duc Cuong	', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (67, 'default', 'Doan Duc Cuong', 'cuong12cc12@gmail.com', '$2a$10$k68MkzVDNdWQ5i9yi.0oV.2uDRjq3mOFA2hwnciV7h901X.EMMJVS', '0856699825', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 11:31:49.139', NULL, 'Doan Duc Cuong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (269, 'default', 'Sophie Phan', 'sophie_phan98@qa.team', '$2a$10$j518FfgSqT2zs937wtx5GOUgzLfaesNrVtQwJMLOwhgNT9OnPFaO2', '0334863215', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-05-16 13:48:45.208', '2022-08-11 16:14:30.082069', '2022-05-11 16:01:13.644', NULL, 'Sophie Phan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (76, 'default', 'Nguyen Van Viet Anh', 'tung123321@gmail.com', '$2a$10$cXszMfOEoSkyQ5cGbmuDbeeU7pjP2pAJMn5ppVbiirGGTLHdPxNma', '0123321123', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 16:38:29.198', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (88, 'default', 'Justin Castillo', 'castillojustin@mail.com', 'b3nLichFno', '20921210', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 741, NULL, '2022-05-30 23:32:37', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Castillo', NULL);
INSERT INTO auth_bib.auth_user VALUES (89, 'default', 'Marjorie Wilson', 'marjorie10@gmail.com', 'hgOTTTXUuE', '75355989', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 429, NULL, '2022-05-10 06:07:49', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Wilson', NULL);
INSERT INTO auth_bib.auth_user VALUES (249, 'default', 'Kirana', 'kirana@gmail.com', '$2a$10$qdGG2KG.ia5ByLRN1u4KE.q1rMtQS/Z6.s4TwzEfEOxumoJFJuFEq', '0354682219', '+84', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-29 14:20:20.954', NULL, 'Kirana', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (84, 'default', 'Arthur Romero', 'fdf@gmail.com', '$2a$10$7ZeaLmXa.LGAwki1PBfQQuaWZpwpKQCnhuxGFwa7UMF4erWb/mU9m', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-12 15:30:17.820326', '2022-04-12 15:30:17.82', NULL, 'ADMIN', NULL, 'fdfd', NULL);
INSERT INTO auth_bib.auth_user VALUES (236, 'default', 'Arthur Romero', 'phamhuy1212d@gmail.com', '$2a$10$CZn5n7d3k6LifHSb0oHP5eYk0vTKCyZnb6vmribNKGYyOV0nUYsa6', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-28 15:02:36.62069', '2022-04-28 15:02:36.621', NULL, 'ADMIN', NULL, 'phamhuy1212d@gmail.com', NULL);
INSERT INTO auth_bib.auth_user VALUES (85, 'default', 'Arthur Romero', 'arthur2@gmail.com', 'ZCpnaePwyb', '54691681', '+91', 'SALE_RM', 1, 'REJECTED', 1, 344, NULL, '2022-07-14 00:49:34', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Romero', NULL);
INSERT INTO auth_bib.auth_user VALUES (86, 'default', 'Juan Morris', 'morrisj1@mail.com', '20SE1Bma7g', '02893718', '+91', 'SALE_RM', 1, 'REJECTED', 1, 219, NULL, '2022-06-11 17:12:35', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Morris', NULL);
INSERT INTO auth_bib.auth_user VALUES (81, 'default', 'Nguyen Van Viet Anh', 'nvvas1d2330s2@gmail.com', '$2a$10$loh.9zSf5Mwj1b6jMwvsserkIa7FgQk84Uk.VpAbtnG3MuhWEv1UC', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-12 13:41:22.70065', '2022-04-12 13:41:22.701', NULL, 'ADMIN', NULL, 'nvvanhs1s2', NULL);
INSERT INTO auth_bib.auth_user VALUES (82, 'default', 'Nguyen Van Viet Anh', 'nvvfd2330s2@gmail.com', '$2a$10$s1Trmddty.zcJF89MlRaRus34AgkKGMTKWhODECSFiJoiOQBe1Xp6', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-12 13:49:22.583943', '2022-04-12 13:49:22.584', NULL, 'ADMIN', NULL, 'nvvanhs11s2', NULL);
INSERT INTO auth_bib.auth_user VALUES (276, 'default', NULL, 'nguyenvannamptit123@gmail.com', '$2a$10$N99WMu.Ia/tQd9EWgNsUNuhCVTvm1wAI2dlupq.TEx2/2g0wQ8XDW', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-17 14:34:25.375', '2022-08-17 14:34:03.093231', '2022-05-17 14:34:03.095', NULL, 'ADMIN', NULL, 'nvnam6', NULL);
INSERT INTO auth_bib.auth_user VALUES (43, 'default', 'Nguyen Van Viet Anh', 'hoang222@email.com', '$2a$10$dO9gjGnAJGX6jI3Bb8aj7.KRhvhBidrLUF0RqDWQ3RIfhrydqyLl.', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 2, 1, '2022-05-19 17:24:33.251', '2022-07-07 09:15:04.122586', '2022-04-07 09:15:04.122', NULL, 'ADMIN', NULL, 'Hoang 222', NULL);
INSERT INTO auth_bib.auth_user VALUES (79, 'default', 'DoanDucCuong', 'Cuong12345@gmail.com', '$2a$10$g2bBhUmRj2OqoAS76kI34ur2RS1vSOqoss91P/6ILpe2QazBZ8CO.', '1234456741', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-12 11:24:36.651', NULL, 'DoanDucCuong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (83, 'default', 'Nguyen Van Viet Anh', 'nvvfd30s2@gmail.com', '$2a$10$dAGTJDX8DAWDep9lrnpI3Ok1az5HQZH0YDlIdzNndiK4uNgMGi8Vu', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-12 13:49:57.882579', '2022-04-12 13:49:57.882', NULL, 'ADMIN', NULL, 'nvvanhsqq11s2', NULL);
INSERT INTO auth_bib.auth_user VALUES (226, 'default', 'Nhat Minh', 'minhnn@gmail.com', '$2a$10$WU2/L.9upRWs.D6byTuNeOp7wpXLGIggSgJpC3.9sbh8I513m1uMi', '0984264443', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-05-11 11:24:21.965', '2022-07-25 11:27:13.799672', '2022-04-25 11:21:42.097', NULL, 'Nhat Minh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (90, 'default', 'Joanne Gibson', 'jgibson03@gmail.com', 'rGH1yDpHfz', '72328909', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 93, NULL, '2022-04-30 11:02:06', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Gibson', NULL);
INSERT INTO auth_bib.auth_user VALUES (248, 'default', 'Bulan', 'bulan@gmail.com', '$2a$10$G7pNylB0XGIe1wNKM5mobeIl0QeZTB4KKqKUdcaL3NhF6b400CU86', '0325614475', '+84', 'SALE_RM', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-29 14:19:17.445', NULL, 'Bulan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (64, 'default', 'Arthur Romero', 'ptanhviewer@gmail.com', '$2a$10$qWhbBXe/H/nliebRRwjcyOKg41R8KdC176ZQJY6vCXEB22zsCAVdK', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 1, 1, '2022-04-08 10:51:01.914', '2022-07-08 10:40:39.142847', '2022-04-08 10:40:39.142', NULL, 'ADMIN', NULL, 'ptanhviewonly1', NULL);
INSERT INTO auth_bib.auth_user VALUES (75, 'default', 'Yamme', 'yamme@qa.team', '$2a$10$yNfssSE42ncgBXKLLm6In.EdXpnY48ViPXAo13dRInRrNlfC5hA3a', '0374216684', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-08 17:03:33.416', '2022-07-08 16:08:32.622093', '2022-04-08 16:02:30.479', NULL, 'Yamme', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (227, 'default', 'Minh Nhat', 'minhnn1@gmail.com', '$2a$10$p4eRSy/oAiq3RXOJwwGqBeUe4H8QEgQTy0YFMQKk1IpZSFEGqwk1O', '0984264443', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-16 13:36:22.268', '2022-07-25 11:27:12.331657', '2022-04-25 11:22:38.679', NULL, 'Minh Nhat', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (78, 'default', 'Tran Cong Tung', 'eoifjoewj@gmail.com', '$2a$10$YJmlZaQc6AFply0G9AMhZuCy7pB8uDiov5x48BRIDKJMPIuIi5F66', '0985627888', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-07-12 16:40:15.555025', '2022-04-08 17:16:17.21', NULL, 'Tran Cong Tung', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (188, 'default', 'brian ha', 'binh@cmcglobal.vn', '$2a$10$n3WJztkj9NWOb3T.ugT0eeKPTOsx2n4EdBBfR5DDQkmZ/G.xLlgga', '0944586138', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-13 11:24:49', '2022-07-13 11:22:44.231407', '2022-04-13 11:19:09.222', NULL, 'brian ha', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (221, 'default', 'Nguyen Van Viet Anh', 'vn1234@gmail.com', '$2a$10$CQTElXBVjKmk5jRw4.8vneuUo/oOEh.Mj0FY0FsWBwidORKlylMq.', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-07-21 14:41:28.758638', '2022-04-21 12:03:54.494', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (80, 'default', 'Cuong@gmail.com', 'Cuong23@gmail.com', '$2a$10$AnW.O/jwNqWNP4dQQH0zAOGST5lzaz1TseGk5KYDm1XBRhc6O8X96', '1231233113', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-07-21 14:45:18.684157', '2022-04-12 13:12:46.906', NULL, 'Cuong@gmail.com', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (87, 'default', 'Jamie Reynolds', 'reynoldsja@hotmail.com', 'HVMDJCkiOo', '63436955', '+91', 'SALE_RM', 1, 'ACTIVE', 2, 278, NULL, '2022-07-21 14:45:23.784378', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Reynolds', NULL);
INSERT INTO auth_bib.auth_user VALUES (222, 'default', 'Arthur Romero', 'admin9998@gmail.com', '$2a$10$idt.GWNG8gvauJwRYE1sa.ucAvGXo1gwaeSVh/ihRwUJDjPpbVrky', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-22 09:30:55.687', '2022-07-22 09:26:03.373106', '2022-04-22 09:26:03.374', NULL, 'ADMIN', NULL, 'admin9999', NULL);
INSERT INTO auth_bib.auth_user VALUES (281, 'default', 'Monster', 'monster@qa.team', '$2a$10$TF6ml8Jlgqobx6uLDK5QZujkdGZBBFgT15.QFtZCO5KjPbt314Fhy', '0624417985', '+84', 'SALE_RM', 1, 'REJECTED', 0, 64, NULL, '1900-01-21 00:00:00', '2022-05-18 10:30:48.377', NULL, 'Monster', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (280, 'default', 'Tinna', 'tinna@qa.team', '$2a$10$ijSMWWcmrCXxVs0PwDBKPeqNe83RaMbBFovwWAX7TWO9VkS.tSuBi', '0982535774', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-05-18 10:29:07.06', NULL, 'Tinna', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (279, 'default', 'Poat', 'poat@qa.teqm', '$2a$10$ky19D/8SUpsoptuhjVk7vO6P4F7aRUCq2u0J.N4K3cCt8WLN5qXnq', '0982146565', '+84', 'SUPERVISOR', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-05-18 10:27:37.085', NULL, 'Poat', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (190, 'default', 'Arthur Romero', 'christine1@mail.com', '$2a$10$eguvJgSD69H2OWXOPUMpg.8SbjBtS.UgUiYwJccMqBFAAmFf4DXju', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-13 11:47:50.544449', '2022-04-13 11:47:50.544', NULL, 'ADMIN', NULL, 'christine', NULL);
INSERT INTO auth_bib.auth_user VALUES (278, 'default', 'Hatthan', 'hatthan@qa.team', '$2a$10$fpBbt6cQz02s/iWkSPtYUuzK0zCdvnEohsrbF7HMKpf.Xe0YjjurG', '0629857746', '+84', 'SALE_RM', 1, 'REJECTED', 0, 86, NULL, '1900-01-21 00:00:00', '2022-05-18 10:25:43.006', NULL, 'Hatthan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (251, 'default', 'Arthur Romero', 'nvva09092@gmail.com', '$2a$10$y.TyxVuA5adtdQo86aGgFuQS5zqYO2DkdNtJIPKzKwh2gJwxn51fW', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 2, NULL, '2022-08-18 15:57:23.368506', '2022-04-29 15:23:00.106', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (129, 'default', 'Arthur Romero', 'rkelly@mail.com', 'EmJPClXDxs', '56656888', '+91', 'SALE_RM', 1, 'REJECTED', 2, 677, NULL, '1900-01-21 00:00:00', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Kelly', NULL);
INSERT INTO auth_bib.auth_user VALUES (238, 'default', 'Arthur Romero', 'kingtest@cmc.com', '$2a$10$SHh4x4ILwHm0ECwSZP1W2udbj2yky4ksG1rqp2u2N2zIWGXYlrJVW', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, '2022-04-29 10:04:37.463', '2022-07-28 15:29:41.635429', '2022-04-28 15:29:41.635', NULL, 'ADMIN', NULL, 'KingLuxi', NULL);
INSERT INTO auth_bib.auth_user VALUES (273, 'default', 'Arthur Romero', 'cuong123@gmail.com', '$2a$10$MoA.CevQSGPZym7VFS1jmemnD/DvRRUcE5wI9O2Kt9MgN7WnMwJTC', '0985553852', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 64, NULL, '2022-08-13 14:51:58.817632', '2022-05-11 16:40:56.469', NULL, 'DOan Duc Cuong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (277, 'default', 'Vanca', 'vanca@qa.team', '$2a$10$3QVUZR/zlpoQaaRovjeAEOgcYzz46pCBY.6HExrNe8Ms4982zITq6', '0335256186', '+84', 'SUPERVISOR', 1, 'REJECTED', 0, 86, NULL, '1900-01-21 00:00:00', '2022-05-18 10:21:04.243', NULL, 'Vanca', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (250, 'default', 'Arthur Romero', 'nvva09091@gmail.com', '$2a$10$7/QkdERwM44iGt5vNWsMvunzvIcZxLhVww3lgQ7GSwizGIP53eTsa', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-08-18 17:00:38.823407', '2022-04-29 15:22:23.738', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (189, 'default', 'Christine', 'christine@mail.com', '$2a$10$Cp0vtL3joZAW3tv7zAqznuIadWmQBQ2JdEwh267zwBN819ILy20.S', '0822556618', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-07-13 11:55:49.008858', '2022-04-13 11:40:14.378', NULL, 'Christine', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (97, 'default', 'Tina Stewart', 'tis@yahoo.com', 'oQ4tZUSs31', '26038452', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 46, NULL, '2022-07-13 13:36:01.743759', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Stewart', NULL);
INSERT INTO auth_bib.auth_user VALUES (118, 'default', 'Judy Green', 'jgreen@gmail.com', 'rPNzjciIYO', '31438018', '+91', 'SALE_RM', 1, 'ACTIVE', 2, 617, NULL, '2022-07-15 17:12:15.163006', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Green', NULL);
INSERT INTO auth_bib.auth_user VALUES (105, 'default', 'Melissa Cooper', 'melisc913@hotmail.com', 'R7ol7TyzzO', '25148801', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 427, NULL, '2022-07-21 14:45:26.803426', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Cooper', NULL);
INSERT INTO auth_bib.auth_user VALUES (122, 'default', 'Christine Mendoza', 'mendoza1983@gmail.com', 'sgZGK2wXN5', '48253046', '+91', 'SALE_RM', 1, 'ACTIVE', 2, 669, NULL, '2022-07-21 14:47:34.40657', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Mendoza', NULL);
INSERT INTO auth_bib.auth_user VALUES (98, 'default', 'Frank Hunter', 'hfrank@outlook.com', 'rhzeLans7r', '04734250', '+91', 'SALE_RM', 1, 'REJECTED', 0, 381, NULL, '2022-07-09 19:05:13', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Hunter', NULL);
INSERT INTO auth_bib.auth_user VALUES (101, 'default', 'Martin Reed', 'martinreed4@icloud.com', 'cQ1NX1PDcy', '55005299', '+91', 'SALE_RM', 1, 'REJECTED', 1, 541, NULL, '2022-05-23 02:52:09', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Reed', NULL);
INSERT INTO auth_bib.auth_user VALUES (102, 'default', 'Eric Jimenez', 'jimeeric52@gmail.com', 'ZwrnuRr2fj', '26302572', '+91', 'SALE_RM', 1, 'REJECTED', 2, 172, NULL, '2022-06-26 08:05:34', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Jimenez', NULL);
INSERT INTO auth_bib.auth_user VALUES (112, 'default', 'Juan Johnson', 'johnsjuan9@icloud.com', 'oCpJrJwMDz', '20487634', '+91', 'SALE_RM', 1, 'REJECTED', 2, 916, NULL, '2022-07-11 13:28:43', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Johnson', NULL);
INSERT INTO auth_bib.auth_user VALUES (114, 'default', 'Timothy Guzman', 'guzmantimot@yahoo.com', 'FUJgOlHP32', '07763202', '+91', 'SALE_RM', 1, 'REJECTED', 1, 5, NULL, '2022-05-07 07:16:42', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Guzman', NULL);
INSERT INTO auth_bib.auth_user VALUES (115, 'default', 'Dorothy Powell', 'powell405@mail.com', 'BMOBrc4EQm', '24974881', '+91', 'SALE_RM', 1, 'REJECTED', 1, 877, NULL, '2022-07-05 17:06:47', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Powell', NULL);
INSERT INTO auth_bib.auth_user VALUES (247, 'default', 'Caro', 'caro@gmail.com', '$2a$10$Hoji6.SeRN5LPVJlVUb/DuUfoOqeNxRqHEMiUK1QSlooTqp.r5YV2', '0334013350', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-08-19 16:20:00.816991', '2022-04-29 14:17:51.03', NULL, 'Caro', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (46, 'default', 'Arthur Romero', 'ptanh5@gmail.com', '$2a$10$jMCVg0q56Ah8gJy2dtTOJ.uZFXgrb4EQ35/9kApoFpd/pZGaDiBkq', '123123123', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-23 13:33:18.999', '2022-08-19 08:35:14.511249', '2022-04-07 13:10:13.982', NULL, 'ADMIN', NULL, 'ptanh5', NULL);
INSERT INTO auth_bib.auth_user VALUES (77, 'default', 'Nguyen van viet anh', 'nvvanh0907@gmail.com', '$2a$10$b4diFBQ6//Z2FnSB5YJndO4fE4rFPQ7s1edDPRIJB5t.PvrDGtXCe', '0334165749', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-23 14:07:47.581', '2023-01-21 00:00:00', '2022-04-08 16:53:21.046', NULL, 'Nguyen van viet anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (121, 'default', 'Florence Meyer', 'florencemeyer@mail.com', 'm7xwRYD6gv', '86500301', '+91', 'SALE_RM', 1, 'REJECTED', 0, 24, NULL, '2022-05-17 00:48:10', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Meyer', NULL);
INSERT INTO auth_bib.auth_user VALUES (124, 'default', 'April Simmons', 'aps@outlook.com', 'pifAEyYE8v', '73984247', '+91', 'SALE_RM', 1, 'PENDING', 2, 130, NULL, '2022-07-12 11:27:50', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Simmons', NULL);
INSERT INTO auth_bib.auth_user VALUES (126, 'default', 'Melissa Carter', 'cartermelissa@gmail.com', 'UZYYkzxYJ5', '13686141', '+91', 'SALE_RM', 1, 'REJECTED', 1, 304, NULL, '2022-06-03 06:37:15', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Carter', NULL);
INSERT INTO auth_bib.auth_user VALUES (128, 'default', 'Andrea Cook', 'andreacook@outlook.com', 'H0QMozISf6', '32062200', '+91', 'SALE_RM', 1, 'REJECTED', 1, 460, NULL, '2022-06-22 12:51:01', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Cook', NULL);
INSERT INTO auth_bib.auth_user VALUES (132, 'default', 'Miguel Wright', 'wrm1954@mail.com', 'RkxYNmG75X', '33551390', '+91', 'SALE_RM', 1, 'PENDING', 1, 280, NULL, '2022-05-29 03:41:56', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Wright', NULL);
INSERT INTO auth_bib.auth_user VALUES (133, 'default', 'William Morris', 'willimorris86@icloud.com', 'tzauQqZoXZ', '34168555', '+91', 'SALE_RM', 1, 'REJECTED', 0, 480, NULL, '2022-06-08 22:17:14', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Morris', NULL);
INSERT INTO auth_bib.auth_user VALUES (143, 'default', 'Barry Diaz', 'diaz60@gmail.com', 'caAX7rXlbu', '39000046', '+91', 'SALE_RM', 1, 'REJECTED', 0, 101, NULL, '2022-06-03 20:54:52', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Diaz', NULL);
INSERT INTO auth_bib.auth_user VALUES (253, 'default', 'Nguyen Van Viet Anh', 'nvva0909123@gmail.com', '$2a$10$G6VKWL4ktfCVaaJgR5azT.gtR//VZ6omG6hGr9NlEu4P1.wabYPwG', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, NULL, '2022-08-18 15:47:13.20332', '2022-04-29 15:25:13.027', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (194, 'default', 'test4', 'test4@gmail.com', '$2a$10$7P9hY6BAYv8/XPqL.jG9JuQcaoWzIz1JisEyIYuscyPsMulL9JHmO', '1234567890', '+91', 'SALE_RM', 1, 'INACTIVE', 3, 1, '2022-04-13 16:54:01.112', '2022-07-13 13:26:46.441024', '2022-04-13 13:18:43.299', NULL, 'test4', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (262, 'default', 'Nguyen Van Viet Anh', 'nvva9559@gmail.com', '$2a$10$rTT5ANhYG6LW4p469gOt8.kCHae0XwMtv7fQ9JREYGkiNq8gtcYZ.', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, '2022-05-06 10:22:11.096', '2022-08-06 15:06:01.267423', '2022-05-06 10:18:02.87', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (252, 'default', 'Nguyen Van Viet Anh', 'nvva0909p@gmail.com', '$2a$10$Qz2EEBgEdN5R9ah2cxHmV.8bH5k5nunKS.osPoFi.Iu3xGxtiMUHO', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 2, NULL, '2022-08-19 08:27:15.886363', '2022-04-29 15:24:39.174', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (223, 'default', 'Nguyen Van Viet Anh', 'vn1234d@gmail.com', '$2a$10$pkT1yfkvE8NK4uLsYY81zeqtLx1Cu1VzpOXZCag/poYmsRuxsM7/.', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-04-22 09:32:14.466', '2022-07-22 09:31:20.215309', '2022-04-22 09:30:44.198', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (155, 'default', 'Juanita Jackson', 'juanitaj@outlook.com', 'tYgtyEkkZC', '43683614', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 214, NULL, '2022-06-17 22:48:52', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Jackson', NULL);
INSERT INTO auth_bib.auth_user VALUES (195, 'default', 'test51', 'test51@gmail.com', '$2a$10$SIy6B6YFokhqviepwWDi7.Ubo.WymKYwp3Oz5M0mPtzEyO1tGIqZm', '7896541338', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-13 15:00:36.473', '2022-07-13 13:19:33.454', '2022-04-13 13:19:33.454', NULL, 'test51', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (164, 'default', 'Sherry Ferguson', 'ferguson716@gmail.com', '1k4bd2De1L', '48812128', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 374, NULL, '2022-06-21 02:57:14', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ferguson', NULL);
INSERT INTO auth_bib.auth_user VALUES (193, 'default', 'test3', 'test3@gmail.com', '$2a$10$ludD1KSITugfPDkYwvXtq.U7I6LoK5VEw0Pr6q76DD/rzE7k7usdK', '1234567890', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-14 11:30:16.572', '2022-07-13 13:26:57.067323', '2022-04-13 13:18:23.862', NULL, 'test3', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (166, 'default', 'Brenda Mills', 'millsbrenda11@gmail.com', '5lJpktPogS', '34455979', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 925, NULL, '2022-07-12 10:54:01', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Mills', NULL);
INSERT INTO auth_bib.auth_user VALUES (170, 'default', 'Shawn Johnson', 'johnsonshawn3@gmail.com', 'e9p3gncQjQ', '27047363', '+91', 'SALE_RM', 1, 'REJECTED', 1, 784, NULL, '1900-01-21 00:00:00', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Johnson', NULL);
INSERT INTO auth_bib.auth_user VALUES (192, 'default', 'test2', 'test2@gmail.com', '$2a$10$N4m3z7oE6/JF4xsm3nIpvuJ/99xyU/vmy7Rf8glGxaKuSTRC0F2.G', '1234567890', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-18 10:54:55.055', '2022-07-13 13:27:06.625386', '2022-04-13 13:17:58.599', NULL, 'test2', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (191, 'default', 'test1', 'test1@gmail.com', '$2a$10$DR8ma.vC2bTprNzWrzgur.qVJ/D1NvxSMm.5kZ53I8zBzrcwKtjd2', '1234567895', '+91', 'SALE_RM', 1, 'INACTIVE', 3, 1, NULL, '2022-07-13 13:26:36.785019', '2022-04-13 13:17:35.092', NULL, 'test1', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (229, 'default', 'Saige1109', 'saige1109@qa.team', '$2a$10$4hHgutY4AgfawCvFdTki3ua22HEQCoTaujhn9ax7dCPS.pS46/VmG', '0982563328', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-04-29 14:00:51.71', '2022-07-25 14:19:19.478093', '2022-04-25 14:13:16.283', NULL, 'Saige1109', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (239, 'default', 'Arthur Romero', 'liam@gmail.com', '$2a$10$N8gqxAoRt7kQG91oxR1MNO8Xa9TnxSP4E3a4WUAhJjNte1cwdykvO', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, '2022-04-29 11:29:43.461', '2022-07-28 16:07:25.407998', '2022-04-28 16:07:25.408', NULL, 'ADMIN', NULL, 'LIAM', NULL);
INSERT INTO auth_bib.auth_user VALUES (149, 'default', 'Eleanor Patel', 'epatel6@gmail.com', '5nQEPnFpdz', '55324900', '+91', 'SALE_RM', 1, 'REJECTED', 1, 522, NULL, '2022-07-22 05:03:54', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Patel', NULL);
INSERT INTO auth_bib.auth_user VALUES (151, 'default', 'William Ford', 'wfo1@icloud.com', '2Lnq2srENO', '83609927', '+91', 'SALE_RM', 1, 'PENDING', 1, 239, NULL, '2022-06-13 15:48:56', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ford', NULL);
INSERT INTO auth_bib.auth_user VALUES (158, 'default', 'Frank Hernandez', 'hfrank@outlook.com', 'xhtn0lxXGf', '30474354', '+91', 'SALE_RM', 1, 'PENDING', 2, 379, NULL, '2022-06-23 21:39:33', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Hernandez', NULL);
INSERT INTO auth_bib.auth_user VALUES (161, 'default', 'Keith Porter', 'keithporter@gmail.com', 'Hs95l6oXDB', '03665072', '+91', 'SALE_RM', 1, 'REJECTED', 1, 265, NULL, '2022-05-26 11:26:21', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Porter', NULL);
INSERT INTO auth_bib.auth_user VALUES (163, 'default', 'Sean Morgan', 'seanmorgan1963@gmail.com', 'WTJfyS72Jm', '48703427', '+91', 'SALE_RM', 1, 'REJECTED', 1, 389, NULL, '2022-05-16 01:42:08', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Morgan', NULL);
INSERT INTO auth_bib.auth_user VALUES (167, 'default', 'Nancy Guzman', 'nancy129@outlook.com', 'oeIdzehAMX', '71463679', '+91', 'SALE_RM', 1, 'PENDING', 1, 518, NULL, '2022-05-02 17:39:01', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Guzman', NULL);
INSERT INTO auth_bib.auth_user VALUES (169, 'default', 'Annie Long', 'annielon@gmail.com', 'JKKUSJ5ttO', '64680768', '+91', 'SALE_RM', 1, 'REJECTED', 0, 41, NULL, '2022-07-17 06:14:20', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Long', NULL);
INSERT INTO auth_bib.auth_user VALUES (230, 'default', 'Tamia_Scott098', 'tamia098@qa.team', '$2a$10$vgTFEQtAdAs.HqDS5RxgmOU65Ct6J5N1AigIQolJKlJYSvr52yRxq', '0325614487', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-25 14:15:04.885', NULL, 'Tamia_Scott098', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (199, 'default', 'There are three hamme girls and they are drinking coffee in Starbuck Look at! One girl stand up and leave seat, she want to go wc, don''t she? I regret', 'hammegirl@gmail.com', '$2a$10$wzA4nH.46y4cH868vzC5t.p6lFTku08DaU4e31WpqGTKUgr0qql8i', '0325614772', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-07-18 12:58:39.791495', '2022-04-13 15:23:47.86', NULL, 'There are three hamme girls and they are drinking coffee in Starbuck Look at! One girl stand up and leave seat, she want to go wc, don''t she? I regret', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (270, 'default', 'Saran0409', 'saran0409@qa.team', '$2a$10$J6u8.1iBT9cWbbgd0Gb1kuE/CyQV1IMYEEu9Nx00TOBNKt5QPPhd6', '0983365287', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-16 13:19:44.478', '2022-08-11 16:14:38.387352', '2022-05-11 16:03:56.545', NULL, 'Saran0409', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (263, 'default', 'tuyen rm', 'tuyenrm@gmail.com', '$2a$10$VI51JVvv.lGTRj2tdOUjPeEc9QPh/aCyW7js9UoE0r6o6f4Di1YIq', '0986532715', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-08-18 15:38:19.287685', '2022-05-06 10:24:41.716', NULL, 'tuyen rm', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (254, 'default', 'Nguyen Van Viet Anh', 'nvva09091d23@gmail.com', '$2a$10$Nm92G11Uum.Scp8gOKj5CeAa2Zx7iv4/IHRf4Em8MULfQ9XYroIR6', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, NULL, '2022-08-18 15:41:32.78233', '2022-04-29 15:29:24.766', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (18, 'default', 'Nguyen Van Viet Anh', 'nvva9994@gmail.com', '$2a$10$1maULaRZtx6WnV5FMD1LCOd8JeCOSxDI8KptMwomjSNIAF/nESgbu', '0124156416', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 1, '2022-04-12 18:17:39.655', '2022-07-28 17:10:55.131952', '2022-04-04 15:48:33.026', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (240, 'default', 'Arthur Romero', 'admin222s2@gmail.com', '$2a$10$4vqZ/1Fk/pJc5UAHbZQfqu.hWK1I9BxV5xqW6LN/E2KSoxWHPUiiu', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-28 16:33:15.115296', '2022-04-28 16:33:15.115', NULL, 'ADMIN', NULL, 'admin2s222', NULL);
INSERT INTO auth_bib.auth_user VALUES (242, 'default', 'Arthur Romero', 'admin245d2@gmail.com', '$2a$10$0poNOLSbf/Lf.zJVWOUK1uFuYbkq./mJV4HiSZabYRvgcIF37H83u', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-28 16:35:07.466261', '2022-04-28 16:35:07.466', NULL, 'ADMIN', NULL, 'admin542d2', NULL);
INSERT INTO auth_bib.auth_user VALUES (55, 'default', 'Nguyen Van Viet Anh', 'ptanh56@gmail.com', '$2a$10$eoe1lJzC/FUUVDiEj/1o6urQdMb/lRXLSbHIMO.RI.iB2mib2W.tm', '123123123', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-23 12:20:19.958', '2022-07-07 15:48:50.790528', '2022-04-07 15:48:50.79', NULL, 'ADMIN', NULL, 'ptanh56', NULL);
INSERT INTO auth_bib.auth_user VALUES (241, 'default', 'Arthur Romero', 'admin2452@gmail.com', '$2a$10$ZM4QGz9uJsS8qZ/C/giieuX.emlfeK4zVxblN2x2L6YlF.iZZlBw6', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-28 17:08:15.095', '2022-07-28 16:33:42.835034', '2022-04-28 16:33:42.835', NULL, 'ADMIN', NULL, 'admin5422', NULL);
INSERT INTO auth_bib.auth_user VALUES (200, 'default', 'Trinh Kim Lien', 'trinhkimlien1109@hotmail.com', '$2a$10$RVU0XKLuyJVK3o68Qlk84u0.DiZChurdlW0ZzWciegKFf7WmFuWeO', '0321457864', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-13 15:41:06.442', NULL, 'Trinh Kim Lien', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (231, 'default', 'Tony-Pham-2804', 'tonypham2804@qa.team', '$2a$10$9HcxwfwqIlwZaTix3iX2luB4W0TRSBTzq4yhdBgDFkgikBkTBchE2', '0352468985', '+84', 'SUPERVISOR', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-25 14:17:20.82', NULL, 'Tony-Pham-2804', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (264, 'default', 'testrrm1', 'testrm@hmsil.com', '$2a$10$botmhSphXP.JmE0wT/QsUOo8mows5h7BfltZS974Hoa7cfdlTKUve', '8888888888', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-08-06 10:41:16.464693', '2022-05-06 10:26:43.422', NULL, 'testrrm1', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (255, 'default', 'test8', 'test83@gmail.com', '$2a$10$mrhGl5k3p0xDOxpeQXXhLut.qPAKXMbbF5dMR8FLkG1MAX7gPBVwu', '1234567890', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, NULL, '2022-07-29 15:32:59.704866', '2022-04-29 15:32:44.277', NULL, 'test8', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (256, 'default', 'test8', 'test833@gmail.com', '$2a$10$dfldTW4n.jmfWpXEnHNb3O.cq4AQrG6Jk0/CNnassm/fh26GV4srC', '1234567890', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, NULL, '2022-08-06 10:42:00.548751', '2022-04-29 16:49:20.706', NULL, 'test8', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (232, 'default', 'test5', 'ptanh17@gmail.com', '$2a$10$i5dwE3zIAUesggXkw6G0QOi9qnb3eh.uEThyHAVWtL/a5o1vSgGNm', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-07-27 10:21:03.942751', '2022-04-27 10:21:03.942', NULL, 'ADMIN', NULL, 'ptanh17', NULL);
INSERT INTO auth_bib.auth_user VALUES (244, 'default', 'test5', 'dalih@gmail.com', '$2a$10$.EecEXTQeATNcKTrNmuvjearF9PvMc25ECLf9kc71j6yDu83yLVfe', 'default', NULL, 'ADMIN_MAKER', 2, 'INACTIVE', 0, 1, '2022-04-28 16:55:59.465', '2022-07-28 16:55:47.895014', '2022-04-28 16:55:47.895', NULL, 'ADMIN', NULL, 'Dalih', NULL);
INSERT INTO auth_bib.auth_user VALUES (201, 'default', 'test5', 'test5@gmail.com', '$2a$10$ytXUIVVJgVWpRJYiNk57U.mrJ2aKI0J2Hw8P7tPDcCmCqa7C6Bvwu', '1234567890', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 1, NULL, '2022-07-13 16:59:46.887852', '2022-04-13 16:57:49.522', NULL, 'test5', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (257, 'default', 'test8', 'test8133@gmail.com', '$2a$10$IyFQK9Oh8Ao4yw1oGouU8O5hIY1eEkN/UXrU0RhfEVPOkccAUOt5.', '1234567890', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 6, NULL, '1900-01-21 00:00:00', '2022-04-29 16:51:07.607', NULL, 'test8', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (233, 'default', 'test5', 'ptanh234@gmail.com', '$2a$10$oxMqOad1.jRVj/mfjflqgeQJMT8yHsmXCkBz5wJZUl5pofviHQo4S', 'default', NULL, 'ADMIN_VIEWER', 2, 'INACTIVE', 0, 1, NULL, '2022-07-27 10:40:53.203033', '2022-04-27 10:40:53.203', NULL, 'ADMIN', NULL, 'ptanh234', NULL);
INSERT INTO auth_bib.auth_user VALUES (205, 'default', 'test5', 'pqhuy3@gmail.com', '$2a$10$mvNWG9pamjiUv4j5LLC7GOEcY7SCFqi2iOxPRSI2a27/J.s2lz7Wy', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-04-29 09:25:59.145', '2022-07-14 14:06:30.396173', '2022-04-14 14:06:30.396', NULL, 'ADMIN', NULL, 'pqhuy3', NULL);
INSERT INTO auth_bib.auth_user VALUES (206, 'default', 'test5', 'huy@gmail.com', '$2a$10$Ptv/R1mxs5SB8ffsNPAdVu1i4X6DqWaTVRkSMu8.5Imoy0JLosrCy', 'default', NULL, 'SUPER_ADMIN', 2, 'INACTIVE', 0, 1, NULL, '2022-07-14 14:13:43.120961', '2022-04-14 14:13:43.121', NULL, 'ADMIN', NULL, 'huy123456', NULL);
INSERT INTO auth_bib.auth_user VALUES (21, 'default', 'ok', 'hoang111@gmail.com', '$2a$10$9ngiI87DZki3.pqAbb930.KDNuUiSFPUyqDCyPY53/jpiYWFgQPwK', '0912345677', '+84', 'SALE_RM', 1, 'ACTIVE', 1, 2, '2022-07-04 14:09:12.015508', '2022-07-05 17:59:31.376458', '2022-04-04 16:09:14.626', NULL, 'hoang', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (119, 'default', 'Sarah Woods', 'sarahwo1988@gmail.com', 'QlSlojWAhu', '49630875', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 236, NULL, '2022-05-17 01:50:46', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Woods', NULL);
INSERT INTO auth_bib.auth_user VALUES (131, 'default', 'Patrick Edwards', 'edwap6@gmail.com', 'KJmCZYtTzW', '44803363', '+91', 'SALE_RM', 1, 'ACTIVE', 1, 220, NULL, '2022-05-04 21:46:47', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Edwards', NULL);
INSERT INTO auth_bib.auth_user VALUES (30, 'default', 'Nguyen Van Viet Anh', 'nvva998ddsf@gmail.com', '$2a$10$96WIuMy23lWfyYlLVdokhezEbjgT9d3r0POa7HYX7itB..1AejDBi', '0124156729', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-07-05 14:51:43.890706', '2022-04-05 14:12:25.724', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (23, 'default', 'Nguyen Van Viet Anh', 'nvva998@gmail.com', '$2a$10$sZiMwase6BDfE72mcdC08ui9sQ2T/7A5p/4G5GFKesQ/xxJ72IA4u', '0123456729', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-07-04 14:09:12.015508', '2022-07-05 17:04:26.382601', '2022-04-05 09:43:19.595', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (24, 'default', 'Nguyen Van Viet Anh', 'nvva998dsf@gmail.com', '$2a$10$iDqoJ6WxBw3ID5Yw8semSeykvwYhPfh/FcK0CG30ctvA2GDz0dS.q', '0123156729', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-04-07 16:19:43.945', '2022-07-05 10:43:11.354178', '2022-04-05 09:44:51.256', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (95, 'default', 'Ray Turner', 'rayturner@gmail.com', 'pREDuNtXlK', '35554156', '+91', 'SUPERVISOR', 1, 'ACTIVE', 2, 569, NULL, '2022-05-01 13:38:50', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Turner', NULL);
INSERT INTO auth_bib.auth_user VALUES (99, 'default', 'Bernard Gibson', 'gibsob98@gmail.com', '1lF1O2Vhnk', '03552538', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 624, NULL, '2022-04-30 20:20:01', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Gibson', NULL);
INSERT INTO auth_bib.auth_user VALUES (109, 'default', 'Sharon Murray', 'smurray41@mail.com', 'EVqA2U78WU', '63481886', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 503, NULL, '2022-06-01 05:54:49', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Murray', NULL);
INSERT INTO auth_bib.auth_user VALUES (111, 'default', 'Jason Rivera', 'jasonri2006@hotmail.com', 'DELEVFwG2L', '28931665', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 233, NULL, '2022-07-27 06:08:04', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Rivera', NULL);
INSERT INTO auth_bib.auth_user VALUES (123, 'default', 'Daniel Green', 'green1@yahoo.com', '7fQ6urhtae', '39734340', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 847, NULL, '2022-07-23 03:41:37', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Green', NULL);
INSERT INTO auth_bib.auth_user VALUES (127, 'default', 'Jean King', 'kingjean@mail.com', 'Ynxp1adVa2', '02825057', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 576, NULL, '2022-05-20 20:45:42', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'King', NULL);
INSERT INTO auth_bib.auth_user VALUES (107, 'default', 'Janet Gomez', 'gomjanet@outlook.com', 'OeILc2j907', '53408691', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 97, NULL, '2022-07-27 10:22:07.144922', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Gomez', NULL);
INSERT INTO auth_bib.auth_user VALUES (74, 'default', 'Nguyen Van Viet Anh', 'testregister120@gmail.com', '$2a$10$YuLiKkWmBLy6rHueuSkzzOwK/ADuSr6sYDyCACkTzkl5isV/uqR5O', '0123443218', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-07-27 12:18:42.442059', '2022-04-08 14:34:36.072', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (207, 'default', 'test5', 'huy1212@gmail.com', '$2a$10$HRdxQ52LqjYEhBryKh6OD.zxmMsXggJZGpt38TnPeZauK4EPpM/x.', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-14 14:47:54.483808', '2022-04-14 14:47:54.483', NULL, 'ADMIN', NULL, 'huy1', NULL);
INSERT INTO auth_bib.auth_user VALUES (258, 'default', 'test8', 'test81337@gmail.com', '$2a$10$PVAgyYtAtPyUeEvY7vbX0uhi07x5ZSpZojcJREEGJoAep3bLig8y6', '1234567890', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 6, NULL, '2022-08-06 10:41:28.799356', '2022-04-29 16:52:13.23', NULL, 'test8', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (48, 'default', 'test5', 'du111testing@gmail.com', '$2a$10$aWqFpBmUjTNdCKYiRuLM1uMmJo9cqZnRCay0JEltutqDX5m..TKZy', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-07-07 14:22:16.444924', '2022-04-07 14:22:16.445', NULL, 'ADMIN', NULL, 'testing', NULL);
INSERT INTO auth_bib.auth_user VALUES (72, 'default', 'Nguyen Van Viet Anh', 'testregister@gmail.com', '$2a$10$w3IxpTV3libqceIJ6S5bt.8gIMDGGPlrkQKyDZwv5l2LmtHro2naC', '0123443218', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-04-28 16:11:48.943', '2023-01-21 00:00:00', '2022-04-08 14:30:27.712', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (224, 'default', 'Nguyen Van Viet Anh', 'nvva0909@gmail.com', '$2a$10$2qCUv2V6gUdv9RvoxoEN4Oa8oyNqM1keMQn8v0s8EMBBmenceLpWi', '0123321123', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 20, '2022-04-27 11:00:03.519', '2022-08-23 10:34:27.65974', '2022-04-25 08:26:19.124', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (203, 'default', 'test7', 'test7@gmail.com', '$2a$10$n7ZD.oNRHT8kQhMHB/uqzOwQiU12X4sGSgzMd6vEWpmkTvE7qRudu', '1234567890', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-23 09:51:51.736', '2022-07-13 16:59:43.786002', '2022-04-13 16:58:56.617', NULL, 'test7', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (204, 'default', 'test5', 'test8@gmail.com', '$2a$10$8an1jHAhQEc05xmTgS73j.o1Es8RZpjQ./swMs47/NJgoLgX1JwkW', '1234567890', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-05-23 11:02:46.23', '2022-07-13 16:59:41.760703', '2022-04-13 16:59:20.907', NULL, 'test8', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (202, 'default', 'test6', 'test6@gmail.com', '$2a$10$5K2IzXJZltjF1fhvqlsHxOGgtmOOmMGYEPwyiY2aOdytsGGg7Gx3K', '1234567890', '+91', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-23 09:52:30.512', '2022-07-13 16:59:45.347503', '2022-04-13 16:58:27.059', NULL, 'test6', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (243, 'default', 'test5', 'winnie@qa.team', '$2a$10$e0rFDZ.XGUQG4BoSQ3dqBuPXCdZY3cq6zl2PlOLKejEXwCnIsK2ze', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-05-19 17:16:28.157', '2022-07-28 16:45:52.649106', '2022-04-28 16:45:52.649', NULL, 'ADMIN', NULL, 'Winnie', NULL);
INSERT INTO auth_bib.auth_user VALUES (63, 'default', 'test5', 'ptanhmaker@gmail.com', '$2a$10$GdCYpLWbYo5ZPDUvyMfsWuQA3nWYwvID2mTONFonsS7PP2c9y6cRu', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-05-19 17:20:25.619', '2022-07-08 08:59:18.292367', '2022-04-08 08:59:18.292', NULL, 'ADMIN', NULL, 'ptanhmaker', NULL);
INSERT INTO auth_bib.auth_user VALUES (208, 'default', 'tuyen', 'tuyen@gmail.com', '$2a$10$Z6Guh5j4k86AOvmwgvfnm.oGIHAzONEih9EP1J/xKLAM4eS.kU1US', '0852369741', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-15 11:17:06.006', NULL, 'tuyen', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (259, 'default', 'Tran Cong Tung', 'tctung@cmcglobal.vn', '$2a$10$Ar/hNTsZU3tDZYQmA.zNZeDiPGqzwlbZxT9.UZHbvIpl5oFGbZ3Am', '0987834524', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-18 13:55:44.202', '2022-08-04 09:13:17.38243', '2022-05-04 09:09:11.055', NULL, 'Tran Cong Tung', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (265, 'default', 'Nguyen Van A', 'tctung1@cmcglobal.vn', '$2a$10$8fuKoss45tKlXn851M4IrOydMoh3G2sDGOTQZAxRpSdYRkpG/NFhS', '0987435332', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-08-09 11:18:35.39224', '2022-05-06 11:13:02.783', NULL, 'Nguyen Van A', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (266, 'default', 'Nguyen Van B', 'test1997@gmail.com', '$2a$10$TkHr18AJ0echzY5AFZhCm.WhPqsA8hHK4R/eSoj77ivfLqDzemeTa', '0973453439', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-05-06 14:17:05.683', NULL, 'Nguyen Van B', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (209, 'default', 'test5', 'test9@gmail.com', '$2a$10$OzhNrqm8toO6VvjEFqSl4.xqUs01kQ56rkZLIXcZTVfHVr8Om9cwy', 'default', NULL, 'SUPER_ADMIN', 2, 'INACTIVE', 3, 1, '2022-04-15 14:03:53.73', '2022-07-15 13:24:52.168873', '2022-04-15 13:24:52.168', NULL, 'ADMIN', NULL, 'test9', NULL);
INSERT INTO auth_bib.auth_user VALUES (260, 'default', 'Wen Lily', 'lilywen@qa.team', '$2a$10$yEkS/lDbsbQjeuZdFWEbVuTM4R/TEdbmhdSGyVXdUZ1M9CntLQQZu', '0334625589', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, NULL, '2022-08-18 15:47:28.487134', '2022-05-04 14:39:23.004', NULL, 'Wen Lily', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (211, 'default', 'test11', 'test11@gmail.com', '$2a$10$j4p1XEIOhLYE.ZnZbz8cIOSH.EXymKHGvgAfvc1slk9XMRu3/owVi', '0896535886', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-15 14:10:37.801', NULL, 'test11', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (267, 'default', 'test5', 'admin1@gmail.com', '$2a$10$qwECQ1eV6oFS3Hz4FQvP..m8RQaeWuYbIuVrRI7BqLwhFHppXbyqy', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-08-06 14:46:35.274023', '2022-05-06 14:46:35.274', NULL, 'ADMIN', NULL, 'admine 1', NULL);
INSERT INTO auth_bib.auth_user VALUES (212, 'default', 'test12', 'test12@gmail.com', '$2a$10$gH7T.9.WBeWpgo.DJELNsOHpAhc6TI9A.1t3/9ut8kexzCtzy2AKy', '8996532889', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, NULL, '2022-07-15 14:16:17.291683', '2022-04-15 14:15:41.895', NULL, 'test12', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (210, 'default', 'test10', 'test10@gmail.com', '$2a$10$1bNTpn4OTBokklS.nJgYE.937q3QmpfRGjy10rHavjX1tOMy.dvxu', '0986532485', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-16 13:49:45.319', '2022-07-15 14:09:40.195558', '2022-04-15 14:07:57.43', NULL, 'test10', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (39, 'default', 'Nguyen Van Viet Anh', 'nam1234@gmail.com', '$2a$10$c77lIp51/bVkwwczhUQequyTrffLTSq1CvqOD6ILt8tD/iNGo70WC', '0124166789', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-04-13 10:42:11.141', '2022-07-08 13:49:47.685562', '2022-04-06 09:31:59.748', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (268, 'default', 'test5', 'admin245zd2@gmail.com', '$2a$10$45xv70jLmb8uhBH4Nu7UZehqV4QIvG4uz035apby9LnXFTxBTdqX.', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, NULL, '2022-08-06 15:06:14.817587', '2022-05-06 15:06:14.817', NULL, 'ADMIN', NULL, 'admin54z2d2', NULL);
INSERT INTO auth_bib.auth_user VALUES (92, 'default', 'Juanita Cox', 'cjuanita7@hotmail.com', 'x1Alk3X00o', '69559228', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 639, NULL, '2022-07-25 22:55:42', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Cox', NULL);
INSERT INTO auth_bib.auth_user VALUES (93, 'default', 'Christina White', 'cwhit422@hotmail.com', 'xa140EQ7Hf', '67447246', '+91', 'SUPERVISOR', 1, 'PENDING', 1, 941, NULL, '2022-06-24 16:39:31', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'White', NULL);
INSERT INTO auth_bib.auth_user VALUES (71, 'default', 'Nguyen Van Viet Anh', 'testregis1@gmail.com', '$2a$10$sQYlM6BDN82X2.vTE9pJJOPkgoKtqR3A0FVIelJ8XIzD3LkWI4kz2', '0123443219', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 14:27:36.524', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (38, 'default', 'Nguyen Van Viet Anh', 'nvva998sdsf@gmail.com', '$2a$10$9f4IHZ3sALdTqaDazL8hUuJ6xhnzv.uIIOviv0i57oHVRhebUHxH6', '0124166729', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-06 08:53:11.425', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (70, 'default', 'Nguyen Van Viet Anh', 'testregis@gmail.com', '$2a$10$9lDfWD6KaAeCp80JXLkbg.z2Qa4IpbEcMBkgH0tt0Kk1517QzVaRq', '0123443219', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 14:27:18.903', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (73, 'default', 'Nguyen Van Viet Anh', 'testregister10@gmail.com', '$2a$10$3mlesW8xYUc5vbcRK2bhv.Eq.jaYo2KWyDiDakK4Oe6snaJ83Ceu2', '0123443218', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 14:33:55.676', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (96, 'default', 'Jesus Jimenez', 'jesusjime@hotmail.com', 'uCsiRLmDwk', '56550452', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 579, NULL, '2022-05-23 11:19:16', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Jimenez', NULL);
INSERT INTO auth_bib.auth_user VALUES (100, 'default', 'Shirley Henry', 'henrsh04@gmail.com', 'Dblvm3MtQw', '68627904', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 280, NULL, '2022-07-14 21:07:04', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Henry', NULL);
INSERT INTO auth_bib.auth_user VALUES (108, 'default', 'Marcus Murphy', 'marmurp@gmail.com', 'PMPzS0KCkp', '64696465', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 507, NULL, '2022-07-27 18:42:46', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Murphy', NULL);
INSERT INTO auth_bib.auth_user VALUES (110, 'default', 'Wayne Freeman', 'freemanwayne@icloud.com', 'ovR5Tm66Vy', '12120865', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 961, NULL, '2022-05-31 19:23:16', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Freeman', NULL);
INSERT INTO auth_bib.auth_user VALUES (113, 'default', 'James Bailey', 'jamesbailey@yahoo.com', 'vW8IdcmNR3', '59829739', '+91', 'SUPERVISOR', 1, 'PENDING', 2, 765, NULL, '2022-05-26 09:40:07', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Bailey', NULL);
INSERT INTO auth_bib.auth_user VALUES (116, 'default', 'Ruby Hayes', 'hayesr@gmail.com', '8009p8sbqS', '41181053', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 498, NULL, '2022-06-08 11:05:19', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Hayes', NULL);
INSERT INTO auth_bib.auth_user VALUES (117, 'default', 'Roger Alexander', 'alexanderroge@mail.com', 'ZPT9wtFZf9', '28524622', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 860, NULL, '2022-07-30 10:03:31', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Alexander', NULL);
INSERT INTO auth_bib.auth_user VALUES (125, 'default', 'Jane Kim', 'kimjane@outlook.com', 'EEvkMYPF8K', '23726100', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 450, NULL, '2022-05-18 21:38:47', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Kim', NULL);
INSERT INTO auth_bib.auth_user VALUES (130, 'default', 'Ray Jones', 'jonera416@outlook.com', 'IFEiecaxQa', '89701901', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 779, NULL, '2022-05-04 06:24:15', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Jones', NULL);
INSERT INTO auth_bib.auth_user VALUES (134, 'default', 'Julie Weaver', 'weavejulie@yahoo.com', '6udUIEZdil', '66418312', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 573, NULL, '2022-07-02 12:46:28', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Weaver', NULL);
INSERT INTO auth_bib.auth_user VALUES (135, 'default', 'Tracy Ellis', 'trae@gmail.com', 'yalSr6wXmh', '22152368', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 751, NULL, '2022-06-08 19:59:39', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ellis', NULL);
INSERT INTO auth_bib.auth_user VALUES (136, 'default', 'Henry Campbell', 'henrycamp@gmail.com', '4ym84Gl31C', '42961667', '+91', 'SUPERVISOR', 1, 'PENDING', 2, 880, NULL, '2022-07-21 22:23:45', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Campbell', NULL);
INSERT INTO auth_bib.auth_user VALUES (137, 'default', 'Luis Rice', 'riluis@icloud.com', 'YZlVCULjAl', '38311348', '+91', 'SUPERVISOR', 1, 'PENDING', 2, 878, NULL, '2022-07-14 14:04:44', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Rice', NULL);
INSERT INTO auth_bib.auth_user VALUES (138, 'default', 'Shannon Marshall', 'marshallsha01@outlook.com', 'FgYOUExSTT', '11660169', '+91', 'SUPERVISOR', 1, 'PENDING', 1, 261, NULL, '2022-07-15 11:05:04', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Marshall', NULL);
INSERT INTO auth_bib.auth_user VALUES (139, 'default', 'Fred Ellis', 'frede2019@icloud.com', 'NwJLEjGQGk', '28772637', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 544, NULL, '2022-05-30 15:41:32', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ellis', NULL);
INSERT INTO auth_bib.auth_user VALUES (140, 'default', 'Helen Ramos', 'heramos603@gmail.com', 'lBiL2QDtS6', '19104224', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 112, NULL, '2022-07-31 01:54:55', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ramos', NULL);
INSERT INTO auth_bib.auth_user VALUES (141, 'default', 'Janice Martinez', 'jamartinez@icloud.com', 'vl8BmdFUKy', '68189261', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 193, NULL, '2022-07-20 13:27:18', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Martinez', NULL);
INSERT INTO auth_bib.auth_user VALUES (142, 'default', 'Antonio Cook', 'cookanto@icloud.com', 'cU0L0hvN0m', '34615459', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 79, NULL, '2022-05-09 22:31:26', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Cook', NULL);
INSERT INTO auth_bib.auth_user VALUES (120, 'default', 'Willie Alvarez', 'awilli10@outlook.com', 'Azq2N99t5U', '57163646', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 923, NULL, '1900-01-21 00:00:00', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Alvarez', NULL);
INSERT INTO auth_bib.auth_user VALUES (104, 'default', 'Rhonda Aguilar', 'rhondaaguil614@icloud.com', 'gAQH8yLIjs', '44587130', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 349, NULL, '2022-07-27 09:54:37.20257', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Aguilar', NULL);
INSERT INTO auth_bib.auth_user VALUES (106, 'default', 'Gary Porter', 'portgary@icloud.com', 'Xe6nPHcwKh', '98989836', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 906, NULL, '2022-07-27 09:54:39.93989', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Porter', NULL);
INSERT INTO auth_bib.auth_user VALUES (103, 'default', 'Diana Soto', 'sotod@outlook.com', 'DrSZa78EbP', '62119108', '+91', 'SUPERVISOR', 1, 'ACTIVE', 2, 188, NULL, '2022-06-03 07:20:49', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Soto', NULL);
INSERT INTO auth_bib.auth_user VALUES (146, 'default', 'Jason Mitchell', 'mjason72@mail.com', 'Ly8tAyD2ad', '92257304', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 380, NULL, '2022-05-11 00:55:31', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Mitchell', NULL);
INSERT INTO auth_bib.auth_user VALUES (150, 'default', 'Ernest Wagner', 'ernewagn8@mail.com', '0lvtgJF6br', '58333707', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 576, NULL, '2022-06-11 23:09:10', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Wagner', NULL);
INSERT INTO auth_bib.auth_user VALUES (154, 'default', 'Alexander Ortiz', 'alexander102@icloud.com', 'm6jZ8cbn4V', '56672435', '+91', 'SUPERVISOR', 1, 'REJECTED', 0, 197, NULL, '2022-05-09 07:08:58', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ortiz', NULL);
INSERT INTO auth_bib.auth_user VALUES (157, 'default', 'Kenneth Williams', 'willkenne419@gmail.com', 'TfwEyfWOLL', '68760767', '+91', 'SUPERVISOR', 1, 'PENDING', 1, 377, NULL, '2022-07-19 15:46:28', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Williams', NULL);
INSERT INTO auth_bib.auth_user VALUES (159, 'default', 'Kevin Kim', 'kimkevin406@icloud.com', 'oacq5WwQBQ', '28251231', '+91', 'SUPERVISOR', 1, 'PENDING', 0, 936, NULL, '2022-06-17 13:37:25', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Kim', NULL);
INSERT INTO auth_bib.auth_user VALUES (160, 'default', 'Susan Tran', 'susan43@gmail.com', 'ryPFgs2vbZ', '78953330', '+91', 'SUPERVISOR', 1, 'REJECTED', 2, 936, NULL, '2022-07-16 01:49:25', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Tran', NULL);
INSERT INTO auth_bib.auth_user VALUES (162, 'default', 'Kathryn Bell', 'kathrynbell@icloud.com', 'G9zEYx6LYm', '74215388', '+91', 'SUPERVISOR', 1, 'PENDING', 1, 1001, NULL, '2022-07-12 16:54:50', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Bell', NULL);
INSERT INTO auth_bib.auth_user VALUES (165, 'default', 'test5', 'howg99@gmail.com', 'gnjKuDWAU2', '53067806', '+91', 'SUPERVISOR', 1, 'PENDING', 1, 819, NULL, '2022-05-11 23:58:56', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Howard', NULL);
INSERT INTO auth_bib.auth_user VALUES (168, 'default', 'test5', 'donmurp2@outlook.com', 'gQya4vDfCC', '24125691', '+91', 'SUPERVISOR', 1, 'REJECTED', 1, 772, NULL, '2022-05-15 08:26:16', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Murphy', NULL);
INSERT INTO auth_bib.auth_user VALUES (144, 'default', 'test5', 'paul00@outlook.com', 'nABaJOdkdg', '87070750', '+91', 'SUPERVISOR', 1, 'ACTIVE', 0, 849, NULL, '2022-06-10 07:34:01', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Marshall', NULL);
INSERT INTO auth_bib.auth_user VALUES (214, 'default', 'test5', 'minhukdong@gmail.com', '$2a$10$WBjC.WSjNMabLmntcdlRQOuemGcmvDToJ1Zz439jcW7CQGLvjphk6', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-04-15 15:02:24.608', '2022-07-15 14:58:54.309256', '2022-04-15 14:58:54.309', NULL, 'ADMIN', NULL, 'Min Huk Dong', NULL);
INSERT INTO auth_bib.auth_user VALUES (145, 'default', 'test5', 'narodriguez@outlook.com', 'Oo1r9mCAo0', '07354390', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 853, NULL, '2022-05-07 07:20:35', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Rodriguez', NULL);
INSERT INTO auth_bib.auth_user VALUES (147, 'default', 'test5', 'simpson41@yahoo.com', 'tRYLJsdjPv', '96060133', '+91', 'SUPERVISOR', 1, 'ACTIVE', 3, 135, NULL, '2022-06-24 10:29:10', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Simpson', NULL);
INSERT INTO auth_bib.auth_user VALUES (215, 'default', 'test5', 'Addyson@gmail.com', '$2a$10$J69ldRW3gK/MzJRQXvegSOLw.wAtYjft3cPePYQE2BEDvJVMXL/HS', 'default', NULL, 'ADMIN_CHECKER', 2, 'INACTIVE', 0, 1, NULL, '2022-07-15 15:05:21.577057', '2022-04-15 15:05:21.577', NULL, 'ADMIN', NULL, 'Addyson', NULL);
INSERT INTO auth_bib.auth_user VALUES (148, 'default', 'test5', 'henryalexander2008@outlook.com', 't35DCvzN8M', '29201331', '+91', 'SUPERVISOR', 1, 'ACTIVE', 2, 404, NULL, '2022-05-19 02:29:59', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Henry', NULL);
INSERT INTO auth_bib.auth_user VALUES (152, 'default', 'test5', 'billyromero61@yahoo.com', '9XvToZtA9H', '58258594', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 709, NULL, '2022-07-22 04:09:43', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Romero', NULL);
INSERT INTO auth_bib.auth_user VALUES (153, 'default', 'test5', 'dannperez411@outlook.com', 'teDShLZoZr', '21789825', '+91', 'SUPERVISOR', 1, 'ACTIVE', 1, 748, NULL, '2022-06-05 01:41:04', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Perez', NULL);
INSERT INTO auth_bib.auth_user VALUES (156, 'default', 'test5', 'charllewis2@gmail.com', 'VVR2MjSAuy', '63838909', '+91', 'SUPERVISOR', 1, 'ACTIVE', 2, 512, NULL, '2022-05-07 07:58:13', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Lewis', NULL);
INSERT INTO auth_bib.auth_user VALUES (216, 'default', 'test5', 'annabelle@gmail.com', '$2a$10$7GMtNRsSTmpngUcOnyKaJuFD80eiJ.zT8RULn1/7.ZZly19p7asXO', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, '2022-04-15 15:12:16.196', '2022-07-15 15:12:05.562719', '2022-04-15 15:12:05.562', NULL, 'ADMIN', NULL, 'Annabelle', NULL);
INSERT INTO auth_bib.auth_user VALUES (217, 'default', 'test5', 'arthur@gmail.com', '$2a$10$ujN5SuQBHUKP1RVTzy9cQO/BHyjxKh9zVE6lcwVI82BP9QHwJQDvO', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, '2022-04-15 15:15:38.038', '2022-07-15 15:15:16.173324', '2022-04-15 15:15:16.173', NULL, 'ADMIN', NULL, 'Kingtest', NULL);
INSERT INTO auth_bib.auth_user VALUES (218, 'default', 'test5', 'pqhuy@gmail.com', '$2a$10$lxp2WD8EmKaTcuVF/cuB0O0lz637QuvQuFWBfjSm4aRrPyTrF.3FG', 'default', NULL, 'ADMIN_MAKER', 2, 'INACTIVE', 0, 1, NULL, '2022-07-18 10:05:06.048599', '2022-04-18 10:05:06.048', NULL, 'ADMIN', NULL, 'phamhuy1212@gmail.com', NULL);
INSERT INTO auth_bib.auth_user VALUES (51, 'default', 'Phanthuy', 'cyndy@gmail.com', '$2a$10$NvmRDdgt.xjs7.AFGfvufOTdhS7YB9JprA8gK/sfB38/ckrplW1ma', '0988754310', '+84', 'SALE_RM', 1, 'INACTIVE', 5, 1, NULL, '2022-07-07 15:37:26.871405', '2022-04-07 14:52:21.524', NULL, 'Phanthuy', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (37, 'default', 'Hoang 111', 'hoang222@gmail.com', '$2a$10$G5KikGGN4xx5P9s.SuRVZuZK/tG86.Bad38CgPAvp.Grw0BBNlPpC', '0123456789', '+84', 'SALE_RM', 1, 'ACTIVE', 2, 1, NULL, '2022-07-07 09:14:18.716572', '2022-04-05 17:51:22.577', NULL, 'Hoang 111', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (61, 'default', 'pan', 'pan@gmail.com', '$2a$10$7Jy3QdapSeQ8FfpvtGvuq.WhUTkTFiOwSKSfxoQq6csCg4eqLXfyK', '0334019685', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-25 13:30:10.568', '2023-07-07 17:15:51.370735', '2022-04-07 17:15:33.376', NULL, 'pan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (25, 'default', 'Linh le', 'lhlinh3@gmail.com', '$2a$10$ab.MjIdl94UveJxfNUuNOeSBDMyUq02pYcpKvJpysCu7A5M7xCwoO', '1234567899', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-04-12 12:10:30.983', '2022-07-05 13:23:19.661808', '2022-04-05 13:13:31.391', NULL, 'Linh le', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (94, 'default', 'Rita Ryan', 'ryanrit@gmail.com', 'UPtjHqSzWn', '42490780', '+91', 'SALE_RM', 1, 'ACTIVE', 2, 572, NULL, '2022-06-28 12:08:15', '2022-04-12 09:08:48.654022', NULL, NULL, NULL, 'Ryan', NULL);
INSERT INTO auth_bib.auth_user VALUES (68, 'default', 'Doan Duc Cuong', 'Cuong12@gmail.com', '$2a$10$IY38fC1UHVowV4/57uOu0.w4pryWjzeEua0uIjpw1jksO0XS722w2', '1231231313', '+84', 'SALE_RM', 1, 'REJECTED', 0, 1, NULL, '1900-01-21 00:00:00', '2022-04-08 12:41:26.656', NULL, 'Doan Duc Cuong', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (234, 'default', 'Cuong', 'thuy@qa.team', '$2a$10$YbJnZCdlXmJuwHeD2waxee5lEYueV3LmFkhmz3/BLc8/a7wZHXC4K', '0321456271', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-19 09:22:35.165', '2022-07-28 12:07:51.591818', '2022-04-28 12:06:39.531', NULL, 'thuy', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (65, 'default', 'Arthur Romero', 'ptanhchecker@gmail.com', '$2a$10$JbNGiff/Pmq.9.JPJziq.e5uwhsduhb7z84BK0w.129I8Ewf.L6P.', 'default', NULL, 'ADMIN_CHECKER', 2, 'ACTIVE', 0, 1, '2022-05-20 08:50:26.935', '2022-07-08 10:41:01.499653', '2022-04-08 10:41:01.499', NULL, 'ADMIN', NULL, 'ptanhchecker', NULL);
INSERT INTO auth_bib.auth_user VALUES (213, 'default', 'test5', 'admin9999@gmail.com', '$2a$10$w3IxpTV3libqceIJ6S5bt.8gIMDGGPlrkQKyDZwv5l2LmtHro2naC', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-23 13:32:41.968', '2022-07-15 14:55:26.098793', '2022-04-15 14:55:26.098', NULL, 'ADMIN', NULL, 'admin99988', NULL);
INSERT INTO auth_bib.auth_user VALUES (283, 'default', NULL, 'smithqueen@gmail.com', '$2a$10$RQ0ToCxI9KfpfBJke.EUBeYUsQRJeTK.h7d9r8N.jIPJGuD99jDxe', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-08-19 17:04:08.194151', '2022-05-19 17:04:08.194', NULL, 'ADMIN', NULL, 'Smith Queen', NULL);
INSERT INTO auth_bib.auth_user VALUES (285, 'default', 'Vuong Hau', 'vuonghau111@qa.team', '$2a$10$N5h3Tc6jeWwZ0k9CFAV7tOWRSD/gYVbeex8NKATyGxdleSCEi9rg.', '06252487365', '+84', 'SUPERVISOR', 1, 'PENDING', 0, 1, NULL, '1900-01-21 00:00:00', '2022-05-19 18:46:56.145', NULL, 'Vuong Hau', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (287, 'default', 'wefewf', 'ewfewf@gmail.com', '$2a$10$Hgvnipw0WGrkk3Z7buGT3.r3MOUgEbt4YeeY1VStTw/pKtktwdGhW', '0890345435', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 103, NULL, '2022-08-23 09:17:19.256414', '2022-05-19 18:54:11.394', NULL, 'wefewf', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (284, 'default', 'Hung Phan', 'hungphan@qa.team', '$2a$10$VJ1MjmkHSfCtOwhlSsTOC.GMPTEIoJg9EiYVFrqnXPYHggILNpFX6', '03335462871', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-05-19 18:51:11.451', '2022-08-19 18:50:29.803078', '2022-05-19 18:45:14.236', NULL, 'Hung Phan', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (286, 'default', 'efrsgersgre', 'jweje123@gmail.com', '$2a$10$tiSZsCvQyuCQOTx9FXQXduMI4EfGhTnaRJUCD8xQwa5SZFu9ShPla', '09884352343', '+84', 'SALE_RM', 1, 'PENDING', 0, 86, NULL, '1900-01-21 00:00:00', '2022-05-19 18:51:02.655', NULL, 'efrsgersgre', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (228, 'default', 'Royce0904', 'royce0904@qa.team', '$2a$10$okQMpBBiCyaRXWWLJ.0BWuT5//zP0boPitUl1TWj0r0HSyPJE/bMS', '0336241859', '+84', 'SALE_RM', 1, 'ACTIVE', 0, 1, '2022-05-20 17:18:27.899', '2022-07-28 11:35:07.68269', '2022-04-25 14:11:48.297', NULL, 'Royce0904', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (1, 'default', 'Nguyen Van Viet Anh', 'nvva0907@gmail.com', '$2a$10$lsLEr.MIrzI/x9m/F9vNqObq5LH4NNG4DQbeRS4/QAgq2snf8ryFC', 'default', '+91', 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-23 14:00:45.489', '2022-08-10 13:42:40.595175', '2022-04-01 17:07:35.606', NULL, 'Nguyen Van Viet Anh', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (282, 'default', NULL, 'ghost2@gmail.com', '$2a$10$rDtpjPlAzVC6sZZKgivaiOg1Rm3tNRP6lNllcw.0MDzfZK2sWLGGS', 'default', NULL, 'SUPER_ADMIN', 2, 'INACTIVE', 0, 1, NULL, '2022-08-19 17:02:15.299514', '2022-05-19 17:02:15.299', NULL, 'ADMIN', NULL, 'Ghost', NULL);
INSERT INTO auth_bib.auth_user VALUES (275, 'default', NULL, 'thuy121@gmail.com', '$2a$10$Mg4HrGM1j.9lL2qbZm53Je3ckJeRLKdxdTjqbYU8zGPe78Z975RXe', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-20 14:00:54.332', '2022-08-16 15:59:19.480849', '2022-05-16 15:59:19.48', NULL, 'ADMIN', NULL, 'Phan Thuy', NULL);
INSERT INTO auth_bib.auth_user VALUES (58, 'default', 'Nguyen Van Viet Anh', 'ptanh567@gmail.com', '$2a$10$GXPraiOB3vtjRct8/qXd.u8BrydTF5DMBxAgLj8F70XfW9scxS/H6', '0981084212', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 3, 1, '2022-05-19 14:15:02.409', '2022-08-19 08:36:08.182461', '2022-04-07 16:51:48.622', NULL, 'ADMIN', NULL, 'ptanh5123', NULL);
INSERT INTO auth_bib.auth_user VALUES (186, 'default', 'JKSDFHGJSHDF', 'challote@gmail.com', '$2a$10$sZr2HichbEBE9Dfoxdh/pOpyQi9AN/CyI9kXbJhRF3CjRz9evbPLm', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-23 10:23:34.516', '2022-07-13 11:05:15.985898', '2022-04-13 11:05:15.985', NULL, 'ADMIN', NULL, 'Challote', NULL);
INSERT INTO auth_bib.auth_user VALUES (219, 'default', 'Hoang Trong Nho', 'nhoht97@gmail.com', '$2a$10$RrkHpikunsqreLeMbuDxC.Mlcs4lRuroLK.FMyFcza1b9JDG0Oro2', '0961528387', '+91', 'SALE_RM', 1, 'INACTIVE', 0, 2, '2022-05-23 09:49:13.549', '2022-07-18 10:05:06.048599', '2022-04-19 10:59:26.174', NULL, 'Hoang Trong Nho', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (289, 'default', 'Phan Thi Thuy', 'ptthuy@qa.team', '$2a$10$J0YIFk8P6b5BkIMM34hG6.ZalqRX/MoxQpWgEhETNnaFOP40DZNnO', '03356847256', '+84', 'SUPERVISOR', 1, 'ACTIVE', 0, 1, '2022-05-20 16:00:01.004', '2022-08-20 09:40:12.579302', '2022-05-20 09:39:32.487', NULL, 'Phan Thi Thuy', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (293, 'default', NULL, 'adminviewer@gmail.com', '$2a$10$bS5xf1zZD2MHVdxvWWW2oewSQx2sojDMcue2vahwAPKQtJBRMqXDG', 'default', NULL, 'ADMIN_VIEWER', 2, 'ACTIVE', 0, 1, '2022-05-23 14:01:28.217', '2022-08-23 09:58:09.384777', '2022-05-23 09:58:09.384', NULL, 'ADMIN', NULL, 'adminviewer', NULL);
INSERT INTO auth_bib.auth_user VALUES (292, 'default', NULL, 'ptanh@gmail.com', '$2a$10$.8G9Z4wlAsGl3IARyOsL/eq28oS15hyKJPS7Ov5njaXcO3jF4LJZ2', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, NULL, '2022-08-23 09:15:25.299628', '2022-05-23 09:15:25.299', NULL, 'ADMIN', NULL, 'ptanh678', NULL);
INSERT INTO auth_bib.auth_user VALUES (291, 'default', 'testrm10', 'testrm10@gmail.com', '$2a$10$m.3Ie2kreGvrnlstb9JqNesmsFeElD8hW9Gu/2GyF2Kx76eUANNP.', '6555555555', '+84', 'SALE_RM', 1, 'INACTIVE', 0, 64, '2022-05-20 17:01:09.899', '2022-08-20 14:21:33.703069', '2022-05-20 14:21:06.354', NULL, 'testrm10', NULL, NULL, NULL);
INSERT INTO auth_bib.auth_user VALUES (288, 'default', NULL, 'ptanh1000@gmail.com', '$2a$10$BVAIh89NrA4IPZvlDfCK..sX2rcqVLtZZIfLSdpC2ZNY.WUoYcY7a', 'default', NULL, 'SUPER_ADMIN', 2, 'ACTIVE', 0, 1, '2022-05-20 09:13:23.85', '2022-08-20 09:12:51.933484', '2022-05-20 09:12:51.933', NULL, 'ADMIN', NULL, 'sdfdsdfsdfsdfsdf', NULL);
INSERT INTO auth_bib.auth_user VALUES (290, 'default', NULL, 'vitamin252@qa.team', '$2a$10$ahQVMLhjSwZK3bYGSXyaKOS50f8Z9yKOn3Htw9UZvwrPH6uY5NaJS', 'default', NULL, 'SUPER_ADMIN', 2, 'INACTIVE', 3, 1, '2022-05-20 14:05:21.16', '2022-08-20 14:04:51.301017', '2022-05-20 14:04:51.302', NULL, 'ADMIN', NULL, 'Vitamin', NULL);
INSERT INTO auth_bib.auth_user VALUES (294, 'default', NULL, 'adminmaker@gmail.com', '$2a$10$YMc126KdZmBN8XmaAI8UhOM8LIrhthzGZK9ls.murW/qoY6z3cuF6', 'default', NULL, 'ADMIN_MAKER', 2, 'ACTIVE', 0, 1, '2022-05-23 09:59:25.34', '2022-08-23 09:59:19.051351', '2022-05-23 09:59:19.051', NULL, 'ADMIN', NULL, 'adminmaker', NULL);


--
-- TOC entry 3092 (class 0 OID 17266)
-- Dependencies: 219
-- Data for Name: auth_user_action_log; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_user_action_log VALUES (3, 219, 0, NULL, NULL, NULL, NULL, 'RESET_PASSWORD', 1, '2022-05-10 11:23:00.857');


--
-- TOC entry 3099 (class 0 OID 20646)
-- Dependencies: 241
-- Data for Name: auth_user_log_action; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.auth_user_log_action VALUES (5, 213, 9, '2022-05-09 14:50:53.994', 'RESET_PASSWORD');


--
-- TOC entry 3096 (class 0 OID 17570)
-- Dependencies: 228
-- Data for Name: device_info; Type: TABLE DATA; Schema: auth_bib; Owner: postgres
--

INSERT INTO auth_bib.device_info VALUES (29, 'OK', 66, NULL, NULL, NULL, NULL, 'ip9');
INSERT INTO auth_bib.device_info VALUES (30, 'OK', 66, NULL, NULL, NULL, NULL, 'ip11');
INSERT INTO auth_bib.device_info VALUES (31, 'OK', 66, NULL, NULL, NULL, NULL, 'ip12');
INSERT INTO auth_bib.device_info VALUES (32, 'OK', 39, NULL, NULL, NULL, NULL, 'ip12');
INSERT INTO auth_bib.device_info VALUES (33, 'OK', 22, NULL, NULL, NULL, NULL, 'ip12');
INSERT INTO auth_bib.device_info VALUES (34, 'OK', 18, NULL, NULL, NULL, NULL, 'ip153');
INSERT INTO auth_bib.device_info VALUES (35, 'OK', 18, NULL, NULL, NULL, NULL, 'ip15');
INSERT INTO auth_bib.device_info VALUES (36, 'OK', 18, NULL, NULL, NULL, NULL, 'dfgdgdfgdfgdfgdfgdfgdgdfgdfg');
INSERT INTO auth_bib.device_info VALUES (37, 'OK', 20, NULL, NULL, NULL, NULL, 'dfgdgdfgdfgdfgdfgdfgdgdfgdfg');
INSERT INTO auth_bib.device_info VALUES (38, 'OK', 20, NULL, NULL, NULL, NULL, 'a31deca91f977d4c');
INSERT INTO auth_bib.device_info VALUES (39, 'OK', 18, NULL, NULL, NULL, NULL, '4c941dfd202d11b3');
INSERT INTO auth_bib.device_info VALUES (40, 'OK', 59, NULL, NULL, NULL, NULL, 'd8435cb7d7bbc89c');
INSERT INTO auth_bib.device_info VALUES (41, 'OK', 45, NULL, NULL, NULL, NULL, '113192a68c85ff3d');
INSERT INTO auth_bib.device_info VALUES (42, 'OK', 39, NULL, NULL, NULL, NULL, 'ip15');
INSERT INTO auth_bib.device_info VALUES (43, 'OK', 184, NULL, NULL, NULL, NULL, 'd8435cb7d7bbc89c');
INSERT INTO auth_bib.device_info VALUES (45, 'OK', 188, NULL, NULL, NULL, NULL, 'd8435cb7d7bbc89c');
INSERT INTO auth_bib.device_info VALUES (46, 'OK', 195, NULL, NULL, NULL, NULL, '113192a68c85ff3d');
INSERT INTO auth_bib.device_info VALUES (47, 'OK', 41, NULL, NULL, NULL, NULL, 'ip15');
INSERT INTO auth_bib.device_info VALUES (48, 'OK', 19, NULL, NULL, NULL, NULL, 'ip12');
INSERT INTO auth_bib.device_info VALUES (49, 'OK', 192, NULL, NULL, NULL, NULL, 'ip15');
INSERT INTO auth_bib.device_info VALUES (50, 'OK', 192, NULL, NULL, NULL, NULL, 'ip17');
INSERT INTO auth_bib.device_info VALUES (51, 'OK', 22, NULL, NULL, NULL, NULL, 'k13');
INSERT INTO auth_bib.device_info VALUES (52, 'OK', 192, NULL, NULL, NULL, NULL, 'k13');
INSERT INTO auth_bib.device_info VALUES (53, 'OK', 193, NULL, NULL, NULL, NULL, 'k1');
INSERT INTO auth_bib.device_info VALUES (54, 'OK', 194, NULL, NULL, NULL, NULL, '113192a68c85ff3d');
INSERT INTO auth_bib.device_info VALUES (55, 'OK', 194, NULL, NULL, NULL, NULL, 'a31deca91f977d4c');
INSERT INTO auth_bib.device_info VALUES (56, 'OK', 193, NULL, NULL, NULL, NULL, 'a31deca91f977d4c');
INSERT INTO auth_bib.device_info VALUES (57, 'OK', 192, NULL, NULL, NULL, NULL, '113192a68c85ff3d');
INSERT INTO auth_bib.device_info VALUES (58, 'OK', 193, NULL, NULL, NULL, NULL, '113192a68c85ff3d');
INSERT INTO auth_bib.device_info VALUES (59, 'OK', 204, NULL, NULL, NULL, NULL, 'a31deca91f977d4c');
INSERT INTO auth_bib.device_info VALUES (60, 'OK', 219, NULL, NULL, NULL, NULL, 'ipx');
INSERT INTO auth_bib.device_info VALUES (61, 'OK', 220, NULL, NULL, NULL, NULL, 'ipmax');
INSERT INTO auth_bib.device_info VALUES (62, 'OK', 20, NULL, NULL, NULL, NULL, 'b2e4e4e7513df1f7');
INSERT INTO auth_bib.device_info VALUES (44, 'OK', 61, NULL, NULL, NULL, NULL, 'iphone9');
INSERT INTO auth_bib.device_info VALUES (63, 'OK', 20, NULL, NULL, NULL, NULL, '560bc3098f5488e1');
INSERT INTO auth_bib.device_info VALUES (64, 'OK', 20, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (65, 'OK', 223, NULL, NULL, NULL, NULL, 'pc');
INSERT INTO auth_bib.device_info VALUES (66, 'OK', 204, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (67, 'OK', 20, NULL, NULL, NULL, NULL, '0b810b9174adb554');
INSERT INTO auth_bib.device_info VALUES (68, 'OK', 224, NULL, NULL, NULL, NULL, 'pc1');
INSERT INTO auth_bib.device_info VALUES (69, 'OK', 227, NULL, NULL, NULL, NULL, '560bc3098f5488e1');
INSERT INTO auth_bib.device_info VALUES (70, 'OK', 204, NULL, NULL, NULL, NULL, '0b810b9174adb554');
INSERT INTO auth_bib.device_info VALUES (71, 'OK', 226, NULL, NULL, NULL, NULL, '15f2d42843a2f4ed');
INSERT INTO auth_bib.device_info VALUES (72, 'OK', 203, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (73, 'OK', 228, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (74, 'OK', 204, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (75, 'OK', 204, NULL, NULL, NULL, NULL, 'e7d50a93931d4404');
INSERT INTO auth_bib.device_info VALUES (76, 'OK', 224, NULL, NULL, NULL, NULL, 'iphone7');
INSERT INTO auth_bib.device_info VALUES (77, 'OK', 224, NULL, NULL, NULL, NULL, 'iphone9');
INSERT INTO auth_bib.device_info VALUES (78, 'OK', 224, NULL, NULL, NULL, NULL, 'iphone10');
INSERT INTO auth_bib.device_info VALUES (79, 'OK', 224, NULL, NULL, NULL, NULL, 'iphone8');
INSERT INTO auth_bib.device_info VALUES (80, 'OK', 224, NULL, NULL, NULL, NULL, 'iphone20');
INSERT INTO auth_bib.device_info VALUES (81, 'OK', 72, NULL, NULL, NULL, NULL, 'iphone8');
INSERT INTO auth_bib.device_info VALUES (82, 'OK', 203, NULL, NULL, NULL, NULL, 'e7d50a93931d4404');
INSERT INTO auth_bib.device_info VALUES (83, 'OK', 203, NULL, NULL, NULL, NULL, '9a53e636b26ec835');
INSERT INTO auth_bib.device_info VALUES (84, 'OK', 229, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (85, 'OK', 234, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (86, 'OK', 228, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (87, 'OK', 259, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (88, 'OK', 259, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (89, 'OK', 262, NULL, NULL, NULL, NULL, 'pc111');
INSERT INTO auth_bib.device_info VALUES (90, 'OK', 203, NULL, NULL, NULL, NULL, 'a843ec058ea5a48f');
INSERT INTO auth_bib.device_info VALUES (91, 'OK', 228, NULL, NULL, NULL, NULL, '2bb99234041dfaa9');
INSERT INTO auth_bib.device_info VALUES (92, 'OK', 203, NULL, NULL, NULL, NULL, 'e444c64a0f0818ae');
INSERT INTO auth_bib.device_info VALUES (93, 'OK', 227, NULL, NULL, NULL, NULL, '15f2d42843a2f4ed');
INSERT INTO auth_bib.device_info VALUES (94, 'OK', 269, NULL, NULL, NULL, NULL, '2bb99234041dfaa9');
INSERT INTO auth_bib.device_info VALUES (95, 'OK', 270, NULL, NULL, NULL, NULL, '2bb99234041dfaa9');
INSERT INTO auth_bib.device_info VALUES (96, 'OK', 270, NULL, NULL, NULL, NULL, '0b810b9174adb554');
INSERT INTO auth_bib.device_info VALUES (97, 'OK', 201, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (98, 'OK', 227, NULL, NULL, NULL, NULL, '970bc223eacbae65');
INSERT INTO auth_bib.device_info VALUES (99, 'OK', 204, NULL, NULL, NULL, NULL, 'a843ec058ea5a48f');
INSERT INTO auth_bib.device_info VALUES (100, 'OK', 204, NULL, NULL, NULL, NULL, '04d81d3bcae59be8');
INSERT INTO auth_bib.device_info VALUES (101, 'OK', 270, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (102, 'OK', 269, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (103, 'OK', 210, NULL, NULL, NULL, NULL, '50f4299c73af4904');
INSERT INTO auth_bib.device_info VALUES (104, 'OK', 203, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (105, 'OK', 203, NULL, NULL, NULL, NULL, '970bc223eacbae65');
INSERT INTO auth_bib.device_info VALUES (106, 'OK', 203, NULL, NULL, NULL, NULL, '4c941dfd202d11b3');
INSERT INTO auth_bib.device_info VALUES (107, 'OK', 204, NULL, NULL, NULL, NULL, '04e39992994e34e7');
INSERT INTO auth_bib.device_info VALUES (108, 'OK', 228, NULL, NULL, NULL, NULL, '1129b9423826cf51');
INSERT INTO auth_bib.device_info VALUES (109, 'OK', 203, NULL, NULL, NULL, NULL, '0f19b896bfaaea33');
INSERT INTO auth_bib.device_info VALUES (110, 'OK', 228, NULL, NULL, NULL, NULL, '0f19b896bfaaea33');
INSERT INTO auth_bib.device_info VALUES (111, 'OK', 284, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (112, 'OK', 289, NULL, NULL, NULL, NULL, '479276182e9f070d');
INSERT INTO auth_bib.device_info VALUES (113, 'OK', 202, NULL, NULL, NULL, NULL, 'e7d50a93931d4404');
INSERT INTO auth_bib.device_info VALUES (114, 'OK', 291, NULL, NULL, NULL, NULL, 'e7d50a93931d4404');
INSERT INTO auth_bib.device_info VALUES (115, 'OK', 291, NULL, NULL, NULL, NULL, '9a53e636b26ec835');
INSERT INTO auth_bib.device_info VALUES (116, 'OK', 219, NULL, NULL, NULL, NULL, 'pc');
INSERT INTO auth_bib.device_info VALUES (117, 'OK', 77, NULL, NULL, NULL, NULL, 'pc');


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_company_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_company_id_seq', 106, true);


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_login_log_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_login_log_id_seq', 2390, true);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_ott_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_ott_id_seq', 1268, true);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_password_log_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_password_log_id_seq', 40, true);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_user_action_log_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_user_action_log_id_seq', 3, true);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_user_id_seq', 296, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 240
-- Name: auth_user_log_action_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.auth_user_log_action_id_seq', 5, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 227
-- Name: device_info_id_seq; Type: SEQUENCE SET; Schema: auth_bib; Owner: postgres
--

SELECT pg_catalog.setval('auth_bib.device_info_id_seq', 117, true);


--
-- TOC entry 2950 (class 2606 OID 17607)
-- Name: auth_company_copy1 auth_company_copy1_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_company_copy1
    ADD CONSTRAINT auth_company_copy1_pkey PRIMARY KEY (id);


--
-- TOC entry 2935 (class 2606 OID 17238)
-- Name: auth_company auth_company_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_company
    ADD CONSTRAINT auth_company_pkey PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 17263)
-- Name: auth_login_log auth_login_log_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_login_log
    ADD CONSTRAINT auth_login_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 17435)
-- Name: auth_ott auth_ott_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_ott
    ADD CONSTRAINT auth_ott_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 17250)
-- Name: auth_password_log auth_password_log_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_password_log
    ADD CONSTRAINT auth_password_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 17252)
-- Name: auth_password_log auth_password_log_pwd_hash_key; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_password_log
    ADD CONSTRAINT auth_password_log_pwd_hash_key UNIQUE (pwd_hash);


--
-- TOC entry 2952 (class 2606 OID 20652)
-- Name: auth_user_log_action auth_user_log_action_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user_log_action
    ADD CONSTRAINT auth_user_log_action_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2933 (class 2606 OID 17227)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 17578)
-- Name: device_info device_info_pkey; Type: CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.device_info
    ADD CONSTRAINT device_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 1259 OID 17312)
-- Name: auth_login_log_user_id_idx; Type: INDEX; Schema: auth_bib; Owner: postgres
--

CREATE INDEX auth_login_log_user_id_idx ON auth_bib.auth_login_log USING btree (user_id);


--
-- TOC entry 2940 (class 1259 OID 17311)
-- Name: auth_password_log_user_id_idx; Type: INDEX; Schema: auth_bib; Owner: postgres
--

CREATE INDEX auth_password_log_user_id_idx ON auth_bib.auth_password_log USING btree (user_id);


--
-- TOC entry 2944 (class 1259 OID 17313)
-- Name: auth_user_action_log_user_id_entity_id_idx; Type: INDEX; Schema: auth_bib; Owner: postgres
--

CREATE INDEX auth_user_action_log_user_id_entity_id_idx ON auth_bib.auth_user_action_log USING btree (user_id, entity_id);


--
-- TOC entry 2956 (class 2620 OID 17480)
-- Name: auth_user auth_login_log_trigger; Type: TRIGGER; Schema: auth_bib; Owner: postgres
--

CREATE TRIGGER auth_login_log_trigger AFTER UPDATE ON auth_bib.auth_user FOR EACH ROW EXECUTE FUNCTION public.auth_login_log_function();


--
-- TOC entry 2954 (class 2606 OID 17301)
-- Name: auth_login_log auth_login_log_user_id_fkey; Type: FK CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_login_log
    ADD CONSTRAINT auth_login_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_bib.auth_user(id);


--
-- TOC entry 2953 (class 2606 OID 17296)
-- Name: auth_password_log auth_password_log_user_id_fkey; Type: FK CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_password_log
    ADD CONSTRAINT auth_password_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_bib.auth_user(id);


--
-- TOC entry 2955 (class 2606 OID 17306)
-- Name: auth_user_action_log auth_user_action_log_user_id_fkey; Type: FK CONSTRAINT; Schema: auth_bib; Owner: postgres
--

ALTER TABLE ONLY auth_bib.auth_user_action_log
    ADD CONSTRAINT auth_user_action_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_bib.auth_user(id);


-- Completed on 2022-05-23 14:08:04

--
-- PostgreSQL database dump complete
--

