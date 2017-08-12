--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: storage_deliverymanagement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_deliverymanagement (
    id integer NOT NULL,
    "formNum_de" character varying(20) NOT NULL,
    operator_de character varying(10) NOT NULL,
    "deliveryDate" date,
    reason character varying(15) NOT NULL,
    department character varying(15) NOT NULL,
    type character varying(10) NOT NULL,
    storageroom character varying(10) NOT NULL,
    manager character varying(10) NOT NULL,
    "materialName" character varying(20) NOT NULL,
    "modelNum" character varying(20) NOT NULL,
    "storoomNum" character varying(20) NOT NULL,
    "deliveryState" character varying(10) NOT NULL,
    "deliveryNum" integer,
    "returnDemand" character varying(10) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_deliverymanagement OWNER TO postgres;

--
-- Name: storage_deliverymanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_deliverymanagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_deliverymanagement_id_seq OWNER TO postgres;

--
-- Name: storage_deliverymanagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_deliverymanagement_id_seq OWNED BY storage_deliverymanagement.id;


--
-- Name: storage_entrymanagement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_entrymanagement (
    id integer NOT NULL,
    "formNum_en" character varying(20) NOT NULL,
    operator_en character varying(10) NOT NULL,
    "entryDate_en" date,
    source character varying(15) NOT NULL,
    department_en character varying(15) NOT NULL,
    type character varying(10) NOT NULL,
    storageroom character varying(10) NOT NULL,
    manager character varying(10) NOT NULL,
    "materialName" character varying(20) NOT NULL,
    "modelNum" character varying(20) NOT NULL,
    "serialNum" character varying(20) NOT NULL,
    "storoomNum_en" character varying(20) NOT NULL,
    "entryNum" integer,
    remarks text NOT NULL
);


ALTER TABLE storage_entrymanagement OWNER TO postgres;

--
-- Name: storage_entrymanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_entrymanagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_entrymanagement_id_seq OWNER TO postgres;

--
-- Name: storage_entrymanagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_entrymanagement_id_seq OWNED BY storage_entrymanagement.id;


--
-- Name: storage_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_materials (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(10) NOT NULL,
    "modelNum" character varying(20) NOT NULL,
    "storoomNum" character varying(20) NOT NULL,
    state character varying(10) NOT NULL,
    number integer,
    location character varying(10) NOT NULL,
    department character varying(10) NOT NULL,
    "meteringNum" character varying(20) NOT NULL,
    "usefulLife" date,
    "serialNum" character varying(20) NOT NULL,
    "countingUnit" character varying(5) NOT NULL,
    "coreNum" integer,
    measurement character varying(5) NOT NULL,
    "mountingNum" character varying(20) NOT NULL,
    threshold integer,
    remarks text NOT NULL
);


ALTER TABLE storage_materials OWNER TO postgres;

--
-- Name: storage_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_materials_id_seq OWNER TO postgres;

--
-- Name: storage_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_materials_id_seq OWNED BY storage_materials.id;


--
-- Name: storage_materialtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_materialtype (
    id integer NOT NULL,
    "matType" character varying(10) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_materialtype OWNER TO postgres;

--
-- Name: storage_materialtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_materialtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_materialtype_id_seq OWNER TO postgres;

--
-- Name: storage_materialtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_materialtype_id_seq OWNED BY storage_materialtype.id;


--
-- Name: storage_returnmanagement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_returnmanagement (
    id integer NOT NULL,
    "formNum_de" character varying(20) NOT NULL,
    operator_re character varying(10) NOT NULL,
    "deliveryDate" date,
    "returnDate" date,
    type character varying(10) NOT NULL,
    storageroom character varying(10) NOT NULL,
    manager character varying(10) NOT NULL,
    "materialName" character varying(20) NOT NULL,
    "modelNum" character varying(20) NOT NULL,
    "storoomNum" character varying(20) NOT NULL,
    "returnState" character varying(10) NOT NULL,
    "attachState" character varying(10) NOT NULL,
    "returnNum" integer,
    remarks text NOT NULL
);


ALTER TABLE storage_returnmanagement OWNER TO postgres;

--
-- Name: storage_returnmanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_returnmanagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_returnmanagement_id_seq OWNER TO postgres;

--
-- Name: storage_returnmanagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_returnmanagement_id_seq OWNED BY storage_returnmanagement.id;


--
-- Name: storage_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_staff (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    "jobNum" character varying(10) NOT NULL,
    department character varying(10) NOT NULL,
    email character varying(254) NOT NULL,
    tel character varying(15) NOT NULL,
    password character varying(15) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_staff OWNER TO postgres;

--
-- Name: storage_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_staff_id_seq OWNER TO postgres;

--
-- Name: storage_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_staff_id_seq OWNED BY storage_staff.id;


--
-- Name: storage_storagelocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_storagelocation (
    id integer NOT NULL,
    location character varying(60) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_storagelocation OWNER TO postgres;

--
-- Name: storage_storagelocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_storagelocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_storagelocation_id_seq OWNER TO postgres;

--
-- Name: storage_storagelocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_storagelocation_id_seq OWNED BY storage_storagelocation.id;


--
-- Name: storage_storageregion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_storageregion (
    id integer NOT NULL,
    region character varying(10) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_storageregion OWNER TO postgres;

--
-- Name: storage_storageregion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_storageregion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_storageregion_id_seq OWNER TO postgres;

--
-- Name: storage_storageregion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_storageregion_id_seq OWNED BY storage_storageregion.id;


--
-- Name: storage_storagestate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE storage_storagestate (
    id integer NOT NULL,
    "storState" character varying(10) NOT NULL,
    remarks text NOT NULL
);


ALTER TABLE storage_storagestate OWNER TO postgres;

--
-- Name: storage_storagestate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE storage_storagestate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE storage_storagestate_id_seq OWNER TO postgres;

--
-- Name: storage_storagestate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE storage_storagestate_id_seq OWNED BY storage_storagestate.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: storage_deliverymanagement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_deliverymanagement ALTER COLUMN id SET DEFAULT nextval('storage_deliverymanagement_id_seq'::regclass);


--
-- Name: storage_entrymanagement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_entrymanagement ALTER COLUMN id SET DEFAULT nextval('storage_entrymanagement_id_seq'::regclass);


--
-- Name: storage_materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_materials ALTER COLUMN id SET DEFAULT nextval('storage_materials_id_seq'::regclass);


--
-- Name: storage_materialtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_materialtype ALTER COLUMN id SET DEFAULT nextval('storage_materialtype_id_seq'::regclass);


--
-- Name: storage_returnmanagement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_returnmanagement ALTER COLUMN id SET DEFAULT nextval('storage_returnmanagement_id_seq'::regclass);


--
-- Name: storage_staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_staff ALTER COLUMN id SET DEFAULT nextval('storage_staff_id_seq'::regclass);


--
-- Name: storage_storagelocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storagelocation ALTER COLUMN id SET DEFAULT nextval('storage_storagelocation_id_seq'::regclass);


--
-- Name: storage_storageregion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storageregion ALTER COLUMN id SET DEFAULT nextval('storage_storageregion_id_seq'::regclass);


--
-- Name: storage_storagestate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storagestate ALTER COLUMN id SET DEFAULT nextval('storage_storagestate_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add materials	7	add_materials
20	Can change materials	7	change_materials
21	Can delete materials	7	delete_materials
22	Can add storage state	8	add_storagestate
23	Can change storage state	8	change_storagestate
24	Can delete storage state	8	delete_storagestate
25	Can add storage region	9	add_storageregion
26	Can change storage region	9	change_storageregion
27	Can delete storage region	9	delete_storageregion
28	Can add storage location	10	add_storagelocation
29	Can change storage location	10	change_storagelocation
30	Can delete storage location	10	delete_storagelocation
31	Can add delivery management	11	add_deliverymanagement
32	Can change delivery management	11	change_deliverymanagement
33	Can delete delivery management	11	delete_deliverymanagement
34	Can add staff	12	add_staff
35	Can change staff	12	change_staff
36	Can delete staff	12	delete_staff
37	Can add return management	13	add_returnmanagement
38	Can change return management	13	change_returnmanagement
39	Can delete return management	13	delete_returnmanagement
40	Can add material type	14	add_materialtype
41	Can change material type	14	change_materialtype
42	Can delete material type	14	delete_materialtype
43	Can add entry management	15	add_entrymanagement
44	Can change entry management	15	change_entrymanagement
45	Can delete entry management	15	delete_entrymanagement
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	group
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	storage	materials
8	storage	storagestate
9	storage	storageregion
10	storage	storagelocation
11	storage	deliverymanagement
12	storage	staff
13	storage	returnmanagement
14	storage	materialtype
15	storage	entrymanagement
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-08-12 10:46:04.96582+08
2	auth	0001_initial	2017-08-12 10:46:06.19339+08
3	admin	0001_initial	2017-08-12 10:46:06.407793+08
4	admin	0002_logentry_remove_auto_add	2017-08-12 10:46:06.422835+08
5	contenttypes	0002_remove_content_type_name	2017-08-12 10:46:06.535336+08
6	auth	0002_alter_permission_name_max_length	2017-08-12 10:46:06.590055+08
7	auth	0003_alter_user_email_max_length	2017-08-12 10:46:06.647752+08
8	auth	0004_alter_user_username_opts	2017-08-12 10:46:06.677796+08
9	auth	0005_alter_user_last_login_null	2017-08-12 10:46:06.704963+08
10	auth	0006_require_contenttypes_0002	2017-08-12 10:46:06.713945+08
11	auth	0007_alter_validators_add_error_messages	2017-08-12 10:46:06.730988+08
12	auth	0008_alter_user_username_max_length	2017-08-12 10:46:06.88957+08
13	sessions	0001_initial	2017-08-12 10:46:07.032291+08
14	storage	0001_initial	2017-08-12 10:46:07.861499+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: storage_deliverymanagement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_deliverymanagement (id, "formNum_de", operator_de, "deliveryDate", reason, department, type, storageroom, manager, "materialName", "modelNum", "storoomNum", "deliveryState", "deliveryNum", "returnDemand", remarks) FROM stdin;
\.


--
-- Name: storage_deliverymanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_deliverymanagement_id_seq', 1, false);


--
-- Data for Name: storage_entrymanagement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_entrymanagement (id, "formNum_en", operator_en, "entryDate_en", source, department_en, type, storageroom, manager, "materialName", "modelNum", "serialNum", "storoomNum_en", "entryNum", remarks) FROM stdin;
\.


--
-- Name: storage_entrymanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_entrymanagement_id_seq', 1, false);


--
-- Data for Name: storage_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_materials (id, name, type, "modelNum", "storoomNum", state, number, location, department, "meteringNum", "usefulLife", "serialNum", "countingUnit", "coreNum", measurement, "mountingNum", threshold, remarks) FROM stdin;
1	CO浓度传感器	机载测试设备	CWH-3011A1	I-STE-16-0010	出库	1	2楼专用测试设备柜			\N			\N			\N	
2	锦纶丝护套	一般耗材	直径12mm			2500	2楼库房货架			\N			\N			\N	
3	插座	电连接器	XKE			20	2楼库房货架			\N			\N			\N	
4	十字槽盘头螺钉	改装标准件	M5*16			50	7楼库房紧固件柜			\N			\N			\N	
5	逃生设备架	非标件		M-SEE-17-0016	出库	1	2楼库房			\N			\N			\N	
6	信号线缆	成品线缆		M-OTH-15-0006	在库	1	7楼货架3#A层			\N			\N			\N	
\.


--
-- Name: storage_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_materials_id_seq', 6, true);


--
-- Data for Name: storage_materialtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_materialtype (id, "matType", remarks) FROM stdin;
1	通用测试设备	
2	机载测试设备	
3	改装装机设备	
4	一般耗材	
5	电连接器	
6	改装标准件	
7	非标件	
8	成品线缆	
9	系统物资	
\.


--
-- Name: storage_materialtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_materialtype_id_seq', 9, true);


--
-- Data for Name: storage_returnmanagement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_returnmanagement (id, "formNum_de", operator_re, "deliveryDate", "returnDate", type, storageroom, manager, "materialName", "modelNum", "storoomNum", "returnState", "attachState", "returnNum", remarks) FROM stdin;
\.


--
-- Name: storage_returnmanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_returnmanagement_id_seq', 1, false);


--
-- Data for Name: storage_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_staff (id, name, "jobNum", department, email, tel, password, remarks) FROM stdin;
1	张三	1111	机载测试	1111@163.com	11111111111	12345	
2	李四	1112	机载测试	1112@163.com	11111111112	12345	
3	王五	1113	机载测试	1113@163.com	11111111113	12345	
\.


--
-- Name: storage_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_staff_id_seq', 3, true);


--
-- Data for Name: storage_storagelocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_storagelocation (id, location, remarks) FROM stdin;
\.


--
-- Name: storage_storagelocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_storagelocation_id_seq', 1, false);


--
-- Data for Name: storage_storageregion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_storageregion (id, region, remarks) FROM stdin;
1	龙华	
2	浦东	
3	大场	
\.


--
-- Name: storage_storageregion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_storageregion_id_seq', 3, true);


--
-- Data for Name: storage_storagestate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY storage_storagestate (id, "storState", remarks) FROM stdin;
1	在库	
2	出库	
3	送校	
4	故障	
5	停用	
\.


--
-- Name: storage_storagestate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('storage_storagestate_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: storage_deliverymanagement storage_deliverymanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_deliverymanagement
    ADD CONSTRAINT storage_deliverymanagement_pkey PRIMARY KEY (id);


--
-- Name: storage_entrymanagement storage_entrymanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_entrymanagement
    ADD CONSTRAINT storage_entrymanagement_pkey PRIMARY KEY (id);


--
-- Name: storage_materials storage_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_materials
    ADD CONSTRAINT storage_materials_pkey PRIMARY KEY (id);


--
-- Name: storage_materialtype storage_materialtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_materialtype
    ADD CONSTRAINT storage_materialtype_pkey PRIMARY KEY (id);


--
-- Name: storage_returnmanagement storage_returnmanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_returnmanagement
    ADD CONSTRAINT storage_returnmanagement_pkey PRIMARY KEY (id);


--
-- Name: storage_staff storage_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_staff
    ADD CONSTRAINT storage_staff_pkey PRIMARY KEY (id);


--
-- Name: storage_storagelocation storage_storagelocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storagelocation
    ADD CONSTRAINT storage_storagelocation_pkey PRIMARY KEY (id);


--
-- Name: storage_storageregion storage_storageregion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storageregion
    ADD CONSTRAINT storage_storageregion_pkey PRIMARY KEY (id);


--
-- Name: storage_storagestate storage_storagestate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY storage_storagestate
    ADD CONSTRAINT storage_storagestate_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

