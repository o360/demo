--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-1.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-1.pgdg100+1)

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    name character varying(1024) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    role smallint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    gender smallint,
    is_deleted boolean DEFAULT false NOT NULL,
    timezone character varying(1024) DEFAULT 'Z'::character varying NOT NULL,
    terms_approved boolean DEFAULT false NOT NULL,
    picture_name character varying(1024) DEFAULT NULL::character varying
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: active_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_project (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    forms_on_same_page boolean NOT NULL,
    can_revote boolean NOT NULL,
    is_anonymous boolean NOT NULL,
    machine_name character varying(1024) NOT NULL,
    parent_project_id bigint
);


ALTER TABLE public.active_project OWNER TO postgres;

--
-- Name: active_project_auditor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_project_auditor (
    active_project_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.active_project_auditor OWNER TO postgres;

--
-- Name: active_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_project_id_seq OWNER TO postgres;

--
-- Name: active_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_project_id_seq OWNED BY public.active_project.id;


--
-- Name: competence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competence (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    kind smallint DEFAULT 0 NOT NULL,
    machine_name character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.competence OWNER TO postgres;

--
-- Name: competence_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competence_group (
    id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    kind smallint DEFAULT 0 NOT NULL,
    machine_name character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.competence_group OWNER TO postgres;

--
-- Name: competence_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.competence_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competence_group_id_seq OWNER TO postgres;

--
-- Name: competence_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.competence_group_id_seq OWNED BY public.competence_group.id;


--
-- Name: competence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.competence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competence_id_seq OWNER TO postgres;

--
-- Name: competence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.competence_id_seq OWNED BY public.competence.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    is_preparing boolean DEFAULT false NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_form_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_form_mapping (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    form_template_id bigint NOT NULL,
    form_freezed_id bigint NOT NULL
);


ALTER TABLE public.event_form_mapping OWNER TO postgres;

--
-- Name: event_form_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_form_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_form_mapping_id_seq OWNER TO postgres;

--
-- Name: event_form_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_form_mapping_id_seq OWNED BY public.event_form_mapping.id;


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_job (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    "time" timestamp without time zone NOT NULL,
    status smallint NOT NULL,
    notification_kind smallint,
    notification_recipient_kind smallint,
    job_type smallint NOT NULL
);


ALTER TABLE public.event_job OWNER TO postgres;

--
-- Name: event_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_job_id_seq OWNER TO postgres;

--
-- Name: event_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_job_id_seq OWNED BY public.event_job.id;


--
-- Name: event_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_notification (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    "time" timestamp without time zone NOT NULL,
    kind smallint NOT NULL,
    recipient_kind smallint NOT NULL
);


ALTER TABLE public.event_notification OWNER TO postgres;

--
-- Name: event_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_notification_id_seq OWNER TO postgres;

--
-- Name: event_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_notification_id_seq OWNED BY public.event_notification.id;


--
-- Name: event_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_project (
    event_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.event_project OWNER TO postgres;

--
-- Name: form; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form (
    id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    kind smallint DEFAULT 0 NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    show_in_aggregation boolean DEFAULT true NOT NULL,
    machine_name character varying NOT NULL
);


ALTER TABLE public.form OWNER TO postgres;

--
-- Name: form_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_answer (
    id bigint NOT NULL,
    user_from_id bigint NOT NULL,
    user_to_id bigint,
    form_id bigint NOT NULL,
    is_anonymous boolean DEFAULT false NOT NULL,
    active_project_id bigint NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    can_skip boolean DEFAULT true NOT NULL
);


ALTER TABLE public.form_answer OWNER TO postgres;

--
-- Name: form_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_answer_id_seq OWNER TO postgres;

--
-- Name: form_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_answer_id_seq OWNED BY public.form_answer.id;


--
-- Name: form_element; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_element (
    id bigint NOT NULL,
    form_id bigint NOT NULL,
    kind smallint NOT NULL,
    caption character varying(1024) NOT NULL,
    required boolean NOT NULL,
    ord integer NOT NULL,
    machine_name character varying DEFAULT ''::character varying NOT NULL,
    hint character varying
);


ALTER TABLE public.form_element OWNER TO postgres;

--
-- Name: form_element_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_element_answer (
    id bigint NOT NULL,
    answer_id bigint NOT NULL,
    form_element_id bigint NOT NULL,
    text character varying,
    comment character varying
);


ALTER TABLE public.form_element_answer OWNER TO postgres;

--
-- Name: form_element_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_element_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_element_answer_id_seq OWNER TO postgres;

--
-- Name: form_element_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_element_answer_id_seq OWNED BY public.form_element_answer.id;


--
-- Name: form_element_answer_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_element_answer_value (
    id bigint NOT NULL,
    answer_element_id bigint NOT NULL,
    form_element_value_id bigint NOT NULL
);


ALTER TABLE public.form_element_answer_value OWNER TO postgres;

--
-- Name: form_element_answer_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_element_answer_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_element_answer_value_id_seq OWNER TO postgres;

--
-- Name: form_element_answer_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_element_answer_value_id_seq OWNED BY public.form_element_answer_value.id;


--
-- Name: form_element_competence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_element_competence (
    element_id bigint NOT NULL,
    competence_id bigint NOT NULL,
    factor numeric NOT NULL
);


ALTER TABLE public.form_element_competence OWNER TO postgres;

--
-- Name: form_element_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_element_id_seq OWNER TO postgres;

--
-- Name: form_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_element_id_seq OWNED BY public.form_element.id;


--
-- Name: form_element_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_element_value (
    id bigint NOT NULL,
    element_id bigint NOT NULL,
    caption character varying(1024) NOT NULL,
    ord integer NOT NULL,
    competence_weight numeric
);


ALTER TABLE public.form_element_value OWNER TO postgres;

--
-- Name: form_element_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_element_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_element_value_id_seq OWNER TO postgres;

--
-- Name: form_element_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_element_value_id_seq OWNED BY public.form_element_value.id;


--
-- Name: form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_id_seq OWNER TO postgres;

--
-- Name: form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_id_seq OWNED BY public.form.id;


--
-- Name: invite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite (
    id bigint NOT NULL,
    code character varying(1024) NOT NULL,
    email character varying(255) NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    activation_time timestamp without time zone
);


ALTER TABLE public.invite OWNER TO postgres;

--
-- Name: invite_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invite_group (
    invite_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.invite_group OWNER TO postgres;

--
-- Name: invite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invite_id_seq OWNER TO postgres;

--
-- Name: invite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invite_id_seq OWNED BY public.invite.id;


--
-- Name: orgstructure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orgstructure (
    id bigint NOT NULL,
    parent_id bigint,
    name character varying(1024) NOT NULL
);


ALTER TABLE public.orgstructure OWNER TO postgres;

--
-- Name: orgstructure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orgstructure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orgstructure_id_seq OWNER TO postgres;

--
-- Name: orgstructure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orgstructure_id_seq OWNED BY public.orgstructure.id;


--
-- Name: orgstructure_level_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.orgstructure_level_view AS
 WITH RECURSIVE t(id, lvl) AS (
         SELECT g.id,
            0 AS lvl
           FROM public.orgstructure g
        UNION ALL
         SELECT gc.id,
            (t_1.lvl + 1)
           FROM (t t_1
             JOIN public.orgstructure gc ON ((gc.parent_id = t_1.id)))
        )
 SELECT t.id AS group_id,
    max(t.lvl) AS lvl
   FROM t
  GROUP BY t.id;


ALTER TABLE public.orgstructure_level_view OWNER TO postgres;

--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    group_auditor_id bigint NOT NULL,
    forms_on_same_page boolean DEFAULT false NOT NULL,
    can_revote boolean DEFAULT true NOT NULL,
    is_anonymous boolean DEFAULT false NOT NULL,
    machine_name character varying NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_email_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_email_template (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    template_id bigint NOT NULL,
    kind smallint NOT NULL,
    recipient_kind smallint NOT NULL
);


ALTER TABLE public.project_email_template OWNER TO postgres;

--
-- Name: project_email_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_email_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_email_template_id_seq OWNER TO postgres;

--
-- Name: project_email_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_email_template_id_seq OWNED BY public.project_email_template.id;


--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relation (
    project_id bigint NOT NULL,
    group_from_id bigint NOT NULL,
    group_to_id bigint,
    form_id bigint NOT NULL,
    kind smallint DEFAULT 0 NOT NULL,
    id bigint NOT NULL,
    can_self_vote boolean DEFAULT false NOT NULL,
    can_skip_answers boolean DEFAULT true NOT NULL
);


ALTER TABLE public.relation OWNER TO postgres;

--
-- Name: relation_email_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relation_email_template (
    id bigint NOT NULL,
    relation_id bigint NOT NULL,
    template_id bigint NOT NULL,
    kind smallint NOT NULL,
    recipient_kind smallint NOT NULL
);


ALTER TABLE public.relation_email_template OWNER TO postgres;

--
-- Name: relation_email_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relation_email_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_email_template_id_seq OWNER TO postgres;

--
-- Name: relation_email_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relation_email_template_id_seq OWNED BY public.relation_email_template.id;


--
-- Name: relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_id_seq OWNER TO postgres;

--
-- Name: relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relation_id_seq OWNED BY public.relation.id;


--
-- Name: schema_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_version (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version OWNER TO postgres;

--
-- Name: template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template (
    id bigint NOT NULL,
    name character varying(1024) NOT NULL,
    subject character varying NOT NULL,
    body character varying NOT NULL,
    kind smallint NOT NULL,
    recipient_kind smallint NOT NULL
);


ALTER TABLE public.template OWNER TO postgres;

--
-- Name: template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_id_seq OWNER TO postgres;

--
-- Name: template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.template_id_seq OWNED BY public.template.id;


--
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group (
    user_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.user_group OWNER TO postgres;

--
-- Name: user_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_login (
    user_id bigint NOT NULL,
    provider_id character varying(255) NOT NULL,
    provider_key character varying(1024) NOT NULL
);


ALTER TABLE public.user_login OWNER TO postgres;

--
-- Name: user_meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_meta (
    user_id bigint NOT NULL,
    gdrive_folder_id character varying
);


ALTER TABLE public.user_meta OWNER TO postgres;

--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: active_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project ALTER COLUMN id SET DEFAULT nextval('public.active_project_id_seq'::regclass);


--
-- Name: competence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence ALTER COLUMN id SET DEFAULT nextval('public.competence_id_seq'::regclass);


--
-- Name: competence_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence_group ALTER COLUMN id SET DEFAULT nextval('public.competence_group_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_form_mapping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_form_mapping ALTER COLUMN id SET DEFAULT nextval('public.event_form_mapping_id_seq'::regclass);


--
-- Name: event_job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_job ALTER COLUMN id SET DEFAULT nextval('public.event_job_id_seq'::regclass);


--
-- Name: event_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_notification ALTER COLUMN id SET DEFAULT nextval('public.event_notification_id_seq'::regclass);


--
-- Name: form id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form ALTER COLUMN id SET DEFAULT nextval('public.form_id_seq'::regclass);


--
-- Name: form_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_answer ALTER COLUMN id SET DEFAULT nextval('public.form_answer_id_seq'::regclass);


--
-- Name: form_element id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element ALTER COLUMN id SET DEFAULT nextval('public.form_element_id_seq'::regclass);


--
-- Name: form_element_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer ALTER COLUMN id SET DEFAULT nextval('public.form_element_answer_id_seq'::regclass);


--
-- Name: form_element_answer_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer_value ALTER COLUMN id SET DEFAULT nextval('public.form_element_answer_value_id_seq'::regclass);


--
-- Name: form_element_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_value ALTER COLUMN id SET DEFAULT nextval('public.form_element_value_id_seq'::regclass);


--
-- Name: invite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite ALTER COLUMN id SET DEFAULT nextval('public.invite_id_seq'::regclass);


--
-- Name: orgstructure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orgstructure ALTER COLUMN id SET DEFAULT nextval('public.orgstructure_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: project_email_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_email_template ALTER COLUMN id SET DEFAULT nextval('public.project_email_template_id_seq'::regclass);


--
-- Name: relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation ALTER COLUMN id SET DEFAULT nextval('public.relation_id_seq'::regclass);


--
-- Name: relation_email_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation_email_template ALTER COLUMN id SET DEFAULT nextval('public.relation_email_template_id_seq'::regclass);


--
-- Name: template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template ALTER COLUMN id SET DEFAULT nextval('public.template_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, name, email, role, status, gender, is_deleted, timezone, terms_approved, picture_name) FROM stdin;
\.


--
-- Data for Name: active_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_project (id, event_id, name, description, forms_on_same_page, can_revote, is_anonymous, machine_name, parent_project_id) FROM stdin;
\.


--
-- Data for Name: active_project_auditor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_project_auditor (active_project_id, user_id) FROM stdin;
\.


--
-- Data for Name: competence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competence (id, group_id, name, description, kind, machine_name) FROM stdin;
\.


--
-- Data for Name: competence_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competence_group (id, name, description, kind, machine_name) FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, start_time, end_time, description, is_preparing) FROM stdin;
\.


--
-- Data for Name: event_form_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_form_mapping (id, event_id, form_template_id, form_freezed_id) FROM stdin;
\.


--
-- Data for Name: event_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_job (id, event_id, "time", status, notification_kind, notification_recipient_kind, job_type) FROM stdin;
\.


--
-- Data for Name: event_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_notification (id, event_id, "time", kind, recipient_kind) FROM stdin;
\.


--
-- Data for Name: event_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_project (event_id, project_id) FROM stdin;
\.


--
-- Data for Name: form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form (id, name, kind, is_deleted, show_in_aggregation, machine_name) FROM stdin;
1	Оценка инженеров	0	f	t	b7bc7d93-1d67-4881-b66c-a49596caf9d3
3	Оценка всех	0	f	t	4d5c282b-7c94-41b1-99e3-18b19b272d40
4	Опрос	0	f	t	97842b2f-5d5e-42f2-8333-232b5c9a3d5e
2	Оценка менеджеров	0	f	t	dbfe0ee4-d5d0-4fcd-bd05-a669e1257682
\.


--
-- Data for Name: form_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_answer (id, user_from_id, user_to_id, form_id, is_anonymous, active_project_id, status, can_skip) FROM stdin;
\.


--
-- Data for Name: form_element; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_element (id, form_id, kind, caption, required, ord, machine_name, hint) FROM stdin;
10	1	4	Я могу положиться на коллегу	t	0	6dde60f5-297b-4c4c-a243-44f1a62ed38a	\N
11	1	4	Я ощущаю потребность в проверке/контроле качества работы коллеги	t	1	37ca523d-c3d5-41d9-b142-b46224e0ab5c	\N
12	1	4	Коллега помогает команде работать эффективнее	t	2	0f850178-3817-4ff7-bbe5-710fadb40c44	\N
13	1	4	Коллега отвлекается от работы	t	3	e0fb675f-3d8a-417f-a98b-6210dd623ba2	\N
14	1	4	Как вы можете оценить скорость работы коллеги?	t	4	be4ec08b-3fc3-4a75-90a7-4b65106bea57	\N
15	1	4	Коллега соблюдает дисциплину	t	5	e955289f-808e-4be3-b49f-4725673da19b	\N
16	1	1	Комментарий к работе коллеги	f	6	0d9853f9-0395-4c6c-b6ed-22074a46927b	\N
27	3	4	Я доволен работой коллеги	f	0	a0efb6a9-93c7-4e2b-a7b9-a71d7fbabd52	\N
28	3	4	За предыдущие 6 месяцев коллега отвечал на мою просьбу/вопрос	f	1	6b9e03ef-2acd-4079-8e74-6a0a521397a4	\N
29	3	4	Коллега мешает работать, нарушает дисциплину	f	2	2d5f445f-c4d8-42b3-9912-660c2392f5b7	\N
30	3	1	Хочется отметить в работе коллеги	f	3	db4ed429-dfdc-421c-a379-6c66beb0c1a5	\N
31	3	1	Есть замечания к работе коллеги	f	4	3db47371-5928-42a1-a0ae-9d6d2fba3c28	\N
44	4	4	Вы довольны своим рабочим местом?	t	0	512b75a2-5676-4ce4-981f-5ebfa8d63192	\N
45	4	4	Вы довольны своим компьютером/монитором?	t	1	875f6922-4591-4387-9acd-18b951822b91	\N
46	4	4	Вы довольны условиями, в которых работаете?	t	2	4c012659-0b1a-4b5d-b709-bae565ad22e3	\N
47	4	4	Вас устраивает уровень чистоты и порядка в офисе?	t	3	5f3e6cf1-c089-42b9-9c40-de2fa7cbd695	\N
48	4	4	Вы довольны программой развития и карьерным треком, который предлагает вам компания?	t	4	cf9798a8-f0e8-4f30-89f1-5c15c797a006	\N
49	4	4	Вы довольны своей заработной платой?	t	5	c6ccab49-cd58-4b48-a5d3-a7ac6bba7fd4	\N
50	4	4	Вам нравится проект, в котором вы работаете?	t	6	31b62f04-14d6-40b6-ba1e-224f2b4840df	\N
51	4	4	За последние полгода сложность поручаемых вам задач увеличивалась?	t	7	2eb1f8f6-9d8b-4937-86f2-8aec7d4f0360	\N
52	4	4	Была ли у вас возможность учиться новому за последние полгода?	t	8	06d6857a-5211-49d1-a7b4-ead91d29d0c4	\N
53	4	4	Произошли ли какие-либо положительные изменения в компании за последние 3 месяца?	t	9	2010f15e-66e3-4275-9f28-0c06bbae0c8b	\N
54	4	4	Дает ли вам ваш руководитель развернутую обратную связь по вашей работе? Как часто?	t	10	1f877c1a-00cb-4a2b-959f-af056c383acf	\N
55	4	1	Есть ли какие-то трудности, с которыми вы сталкиваетесь в работе? Опишите их, пожалуйста	f	11	a5e5b8bb-1ac9-4094-9150-e59bab83b964	Это может быть что-то из условий работы в офисе, отношений с коллегами/заказчиком, правил/политики компании, и так далее
56	4	1	Если вы хотели бы что-то сказать/предложить/спросить, но не нашли в оценке места для своего комментария, то напишите это здесь	f	12	cbfb2c42-2968-46bd-b241-219836e01f51	\N
57	2	4	Менеджер отстаивает интересы команды перед клиентом	t	0	f15b5746-eac3-471b-b970-d25a306e2ff3	\N
58	2	4	Менеджер отстаивает интересы клиента перед командой	t	1	4a36a69a-453d-4b51-b58d-b4bdcfce9009	\N
59	2	4	Оцените уровень стресса при работе над текущим проектом с данным менеджером	t	2	2b2757a0-3b4b-428f-b71f-4c219b95061e	\N
60	2	4	Менеджер глубоко погружается в задачи, пытается дойти до сути вещей	t	3	4a899e28-3386-472a-9386-642d7894de72	\N
61	2	4	Менеджер относится к коллегам справедливо	t	4	74c6753e-e7d6-49d0-9304-27ac88c47339	\N
62	2	4	Менеджер отмечает успехи команды внутри команды	t	5	bd822d8f-e66b-4e78-8894-015a1418e2b5	\N
63	2	4	Менеджер отмечает успехи команды перед компанией	t	6	26bf6c0d-1e1c-4073-a886-e96a244b828d	\N
64	2	4	Случается ли, что менеджер оставил какой-то вопрос без внимания или не смог его решить?	t	7	b7b3ee9f-bec4-4e96-9c42-b1fe0b289215	\N
65	2	4	Можете ли вы сказать, что работа по проекту хорошо организована	t	8	bd86144f-96e3-4b23-ac75-3bdf58e3fe94	\N
66	2	1	Комментарий к работе коллеги	f	9	16be10e7-5813-490b-bdc7-e90a6a343864	\N
\.


--
-- Data for Name: form_element_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_element_answer (id, answer_id, form_element_id, text, comment) FROM stdin;
\.


--
-- Data for Name: form_element_answer_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_element_answer_value (id, answer_element_id, form_element_value_id) FROM stdin;
\.


--
-- Data for Name: form_element_competence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_element_competence (element_id, competence_id, factor) FROM stdin;
\.


--
-- Data for Name: form_element_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_element_value (id, element_id, caption, ord, competence_weight) FROM stdin;
37	10	Да	0	\N
38	10	Нет	1	\N
39	10	Не во всех вопросах	2	\N
40	10	Ничего не могу сказать	3	\N
41	11	Всегда	0	\N
42	11	Периодически	1	\N
43	11	Контроль не требуется	2	\N
44	11	Ничего не могу сказать	3	\N
45	12	Всегда	0	\N
46	12	Периодически	1	\N
47	12	Никогда	2	\N
48	12	Ничего не могу сказать	3	\N
49	13	Всегда	0	\N
50	13	Периодически	1	\N
51	13	Никогда	2	\N
52	13	Ничего не могу сказать	3	\N
53	14	Согласно графику	0	\N
54	14	Опережая график	1	\N
55	14	С отставанием от графика	2	\N
56	14	Ничего не могу сказать	3	\N
57	15	Да	0	\N
58	15	Не всегда	1	\N
59	15	Нет, ставит перед фактом	2	\N
60	15	Часто опаздывает	3	\N
97	27	Да	0	\N
98	27	Нет	1	\N
99	27	Ничего не могу сказать	2	\N
100	27	Мы не взаимодействуем	3	\N
101	28	Всегда, когда у него было время	0	\N
102	28	Было по-разному	1	\N
103	28	Мы не взаимодействовали	2	\N
104	28	Отказывался помочь	3	\N
105	29	Никогда	0	\N
106	29	Редко	1	\N
107	29	Часто	2	\N
108	29	Всегда	3	\N
144	44	Да	0	\N
145	44	Нет	1	\N
146	44	В средней степени	2	\N
147	45	Да	0	\N
148	45	Нет	1	\N
149	45	В средней степени	2	\N
150	46	Да	0	\N
151	46	Нет	1	\N
152	46	В средней степени	2	\N
153	47	Да	0	\N
154	47	Нет	1	\N
155	47	В средней степени	2	\N
156	47	Бывает по-разному	3	\N
157	48	Да	0	\N
158	48	Нет	1	\N
159	48	В средней степени	2	\N
160	48	У моей должности нет программы развития	3	\N
161	49	Да	0	\N
162	49	Нет	1	\N
163	49	В средней степени	2	\N
164	50	Да	0	\N
165	50	Нет	1	\N
166	50	В средней степени	2	\N
167	50	Хочу в другой проект	3	\N
168	51	Да	0	\N
169	51	Нет	1	\N
170	52	Да	0	\N
171	52	Нет	1	\N
172	53	Да	0	\N
173	53	Нет	1	\N
174	53	Затрудняюсь ответить	2	\N
175	54	Нет, не было ни разу	0	\N
176	54	Да, периодически	1	\N
177	54	Редко	2	\N
178	54	Часто	3	\N
179	57	Да	0	\N
180	57	Нет	1	\N
181	57	Бывает по-разному	2	\N
182	57	Ничего не могу сказать	3	\N
183	58	Да	0	\N
184	58	Нет	1	\N
185	58	Бывает по-разному	2	\N
186	58	Ничего не могу сказать	3	\N
187	59	Нулевой	0	\N
188	59	Низкий	1	\N
189	59	Средний	2	\N
190	59	Высокий	3	\N
191	60	Всегда	0	\N
192	60	Часто	1	\N
193	60	Никогда	2	\N
194	60	Ничего не могу сказать	3	\N
195	61	Всегда	0	\N
196	61	Часто	1	\N
197	61	Иногда	2	\N
198	61	Никогда	3	\N
199	61	Ничего не могу сказать	4	\N
200	62	Всегда	0	\N
201	62	Часто	1	\N
202	62	Иногда	2	\N
203	62	Никогда	3	\N
204	63	Всегда	0	\N
205	63	Часто	1	\N
206	63	Иногда	2	\N
207	63	Никогда	3	\N
208	63	Ничего не могу сказать	4	\N
209	64	Да	0	\N
210	64	Нет	1	\N
211	64	Часто	2	\N
212	64	Редко	3	\N
213	65	Да	0	\N
214	65	Нет	1	\N
215	65	Частично	2	\N
\.


--
-- Data for Name: invite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invite (id, code, email, creation_time, activation_time) FROM stdin;
\.


--
-- Data for Name: invite_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invite_group (invite_id, group_id) FROM stdin;
\.


--
-- Data for Name: orgstructure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orgstructure (id, parent_id, name) FROM stdin;
1	\N	Все
2	\N	Менеджеры
3	\N	Инженеры
4	\N	HR
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, name, description, group_auditor_id, forms_on_same_page, can_revote, is_anonymous, machine_name) FROM stdin;
1	ERP-система для Acme Corp	\N	4	f	t	f	6ee08123-8b3b-4105-895a-fd5c73a51628
\.


--
-- Data for Name: project_email_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_email_template (id, project_id, template_id, kind, recipient_kind) FROM stdin;
\.


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relation (project_id, group_from_id, group_to_id, form_id, kind, id, can_self_vote, can_skip_answers) FROM stdin;
1	2	3	1	0	1	f	f
1	3	2	2	0	2	f	f
1	1	1	3	0	3	f	f
1	1	\N	4	1	4	f	f
\.


--
-- Data for Name: relation_email_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relation_email_template (id, relation_id, template_id, kind, recipient_kind) FROM stdin;
\.


--
-- Data for Name: schema_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_version (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	2017.03.27.11.03	initial	SQL	public/V2017.03.27.11.03__initial.sql	122275141	postgres	2020-03-16 01:05:50.471501	8	t
2	2017.03.28.14.04	create user tables	SQL	public/V2017.03.28.14.04__create_user_tables.sql	431038357	postgres	2020-03-16 01:05:50.514831	21	t
3	2017.04.07.14.21	create orgstructure table	SQL	public/V2017.04.07.14.21__create_orgstructure_table.sql	-998111161	postgres	2020-03-16 01:05:50.551162	19	t
4	2017.04.12.11.26	create user group table	SQL	public/V2017.04.12.11.26__create_user_group_table.sql	379568252	postgres	2020-03-16 01:05:50.576616	9	t
5	2017.04.18.09.09	create form table	SQL	public/V2017.04.18.09.09__create_form_table.sql	-1037887201	postgres	2020-03-16 01:05:50.703244	35	t
6	2017.04.20.10.27	create project tables	SQL	public/V2017.04.20.10.27__create_project_tables.sql	1738548389	postgres	2020-03-16 01:05:50.736418	17	t
7	2017.04.24.09.00	alter user table	SQL	public/V2017.04.24.09.00__alter_user_table.sql	-1009043277	postgres	2020-03-16 01:05:50.753883	5	t
8	2017.04.25.13.32	alter relation table	SQL	public/V2017.04.25.13.32__alter_relation_table.sql	-1955299458	postgres	2020-03-16 01:05:50.798325	26	t
9	2017.04.27.13.39	create event tables	SQL	public/V2017.04.27.13.39__create_event_tables.sql	285067673	postgres	2020-03-16 01:05:50.846923	35	t
10	2017.05.03.10.14	create template table	SQL	public/V2017.05.03.10.14__create_template_table.sql	407726913	postgres	2020-03-16 01:05:50.883835	22	t
11	2017.05.04.16.16	create template binding tables	SQL	public/V2017.05.04.16.16__create_template_binding_tables.sql	-1398200496	postgres	2020-03-16 01:05:50.92693	25	t
12	2017.05.11.17.32	alter form tables	SQL	public/V2017.05.11.17.32__alter_form_tables.sql	1236054778	postgres	2020-03-16 01:05:50.95143	8	t
13	2017.05.15.09.38	add cascade delete	SQL	public/V2017.05.15.09.38__add_cascade_delete.sql	-595969566	postgres	2020-03-16 01:05:50.977186	12	t
14	2017.05.16.16.55	create form mapping table	SQL	public/V2017.05.16.16.55__create_form_mapping_table.sql	2049313330	postgres	2020-03-16 01:05:50.999708	11	t
15	2017.05.17.13.19	create answer tables	SQL	public/V2017.05.17.13.19__create_answer_tables.sql	-1035485161	postgres	2020-03-16 01:05:51.033113	24	t
16	2017.05.23.14.16	create usermeta table	SQL	public/V2017.05.23.14.16__create_usermeta_table.sql	1521596416	postgres	2020-03-16 01:05:51.059771	13	t
17	2017.05.24.08.52	cascade delete groups	SQL	public/V2017.05.24.08.52__cascade_delete_groups.sql	1963629015	postgres	2020-03-16 01:05:51.083793	7	t
18	2017.05.26.13.37	alter account table	SQL	public/V2017.05.26.13.37__alter_account_table.sql	1746295368	postgres	2020-03-16 01:05:51.099032	5	t
19	2017.05.29.15.04	alter form table	SQL	public/V2017.05.29.15.04__alter_form_table.sql	-824214127	postgres	2020-03-16 01:05:51.113408	6	t
20	2017.05.30.14.04	alter group project	SQL	public/V2017.05.30.14.04__alter_group_project.sql	-937989497	postgres	2020-03-16 01:05:51.131634	9	t
21	2017.05.31.09.58	alter account table	SQL	public/V2017.05.31.09.58__alter_account_table.sql	-480459974	postgres	2020-03-16 01:05:51.14413	3	t
22	2017.06.01.11.02	create eventjob table	SQL	public/V2017.06.01.11.02__create_eventjob_table.sql	-1092087599	postgres	2020-03-16 01:05:51.167645	14	t
23	2017.06.01.14.30	alter answer table	SQL	public/V2017.06.01.14.30__alter_answer_table.sql	-427302792	postgres	2020-03-16 01:05:51.188186	9	t
24	2017.06.07.13.15	alter form table	SQL	public/V2017.06.07.13.15__alter_form_table.sql	1506489954	postgres	2020-03-16 01:05:51.202333	4	t
25	2017.06.07.14.50	alter project table	SQL	public/V2017.06.07.14.50__alter_project_table.sql	-1472825571	postgres	2020-03-16 01:05:51.217424	4	t
26	2017.06.09.10.20	alter event project tables	SQL	public/V2017.06.09.10.20__alter_event_project_tables.sql	1437963120	postgres	2020-03-16 01:05:51.2325	4	t
27	2017.06.17.12.24	create orglevel view	SQL	public/V2017.06.17.12.24__create_orglevel_view.sql	1842334558	postgres	2020-03-16 01:05:51.248949	7	t
28	2017.07.13.17.50	alter project table	SQL	public/V2017.07.13.17.50__alter_project_table.sql	1388139769	postgres	2020-03-16 01:05:51.261299	3	t
29	2017.07.13.19.20	alter users timezones	SQL	public/V2017.07.13.19.20__alter_users_timezones.sql	1598043344	postgres	2020-03-16 01:05:51.27426	2	t
30	2017.07.18.17.28	alter formanswer table	SQL	public/V2017.07.18.17.28__alter_formanswer_table.sql	-1960925546	postgres	2020-03-16 01:05:51.286996	3	t
31	2017.07.31.17.10	add machine names	SQL	public/V2017.07.31.17.10__add_machine_names.sql	7807300	postgres	2020-03-16 01:05:51.309576	13	t
32	2017.07.31.18.10	alter account table	SQL	public/V2017.07.31.18.10__alter_account_table.sql	788877935	postgres	2020-03-16 01:05:51.321585	3	t
33	2017.07.31.18.30	alter relation table	SQL	public/V2017.07.31.18.30__alter_relation_table.sql	-2043994671	postgres	2020-03-16 01:05:51.334164	3	t
34	2017.08.09.17.50	create invite tables	SQL	public/V2017.08.09.17.50__create_invite_tables.sql	-2107269563	postgres	2020-03-16 01:05:51.364521	22	t
35	2017.08.17.17.30	alter account table	SQL	public/V2017.08.17.17.30__alter_account_table.sql	1500053208	postgres	2020-03-16 01:05:51.37501	3	t
36	2017.09.07.10.00	alter account table	SQL	public/V2017.09.07.10.00__alter_account_table.sql	1368830970	postgres	2020-03-16 01:05:51.38546	3	t
37	2017.09.08.15.00	alter element answer table	SQL	public/V2017.09.08.15.00__alter_element_answer_table.sql	-443895603	postgres	2020-03-16 01:05:51.396984	3	t
38	2017.09.12.13.00	active entities	SQL	public/V2017.09.12.13.00__active_entities.sql	344650095	postgres	2020-03-16 01:05:51.428096	22	t
39	2017.09.14.11.00	alter active project auditor	SQL	public/V2017.09.14.11.00__alter_active_project_auditor.sql	798477966	postgres	2020-03-16 01:05:51.439113	3	t
40	2017.09.14.12.00	add skip ability	SQL	public/V2017.09.14.12.00__add_skip_ability.sql	1258640975	postgres	2020-03-16 01:05:51.449442	3	t
41	2017.09.15.15.00	alter event table	SQL	public/V2017.09.15.15.00__alter_event_table.sql	1464895634	postgres	2020-03-16 01:05:51.458794	2	t
42	2017.09.18.12.30	create competence tables	SQL	public/V2017.09.18.12.30__create_competence_tables.sql	-1748683263	postgres	2020-03-16 01:05:51.483421	16	t
43	2017.09.18.15.30	create element competence tables	SQL	public/V2017.09.18.15.30__create_element_competence_tables.sql	1719291446	postgres	2020-03-16 01:05:51.497649	8	t
44	2017.09.18.17.00	alter form element value	SQL	public/V2017.09.18.17.00__alter_form_element_value.sql	481854281	postgres	2020-03-16 01:05:51.50558	2	t
45	2017.09.19.13.00	alter competence tables	SQL	public/V2017.09.19.13.00__alter_competence_tables.sql	-910326451	postgres	2020-03-16 01:05:51.514622	3	t
46	2017.09.19.15.00	add machine names	SQL	public/V2017.09.19.15.00__add_machine_names.sql	-956319272	postgres	2020-03-16 01:05:51.526812	4	t
47	2017.09.28.18.00	alter relation add index	SQL	public/V2017.09.28.18.00__alter_relation_add_index.sql	-724597427	postgres	2020-03-16 01:05:51.54202	8	t
48	2019.03.12.15.00	add element hint	SQL	public/V2019.03.12.15.00__add_element_hint.sql	286883460	postgres	2020-03-16 01:05:51.550008	2	t
\.


--
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template (id, name, subject, body, kind, recipient_kind) FROM stdin;
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group (user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_login (user_id, provider_id, provider_key) FROM stdin;
\.


--
-- Data for Name: user_meta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_meta (user_id, gdrive_folder_id) FROM stdin;
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 2, true);


--
-- Name: active_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_project_id_seq', 1, false);


--
-- Name: competence_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.competence_group_id_seq', 1, false);


--
-- Name: competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.competence_id_seq', 1, false);


--
-- Name: event_form_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_form_mapping_id_seq', 1, false);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 1, false);


--
-- Name: event_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_job_id_seq', 1, false);


--
-- Name: event_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_notification_id_seq', 1, false);


--
-- Name: form_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_answer_id_seq', 1, false);


--
-- Name: form_element_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_element_answer_id_seq', 1, false);


--
-- Name: form_element_answer_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_element_answer_value_id_seq', 1, false);


--
-- Name: form_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_element_id_seq', 66, true);


--
-- Name: form_element_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_element_value_id_seq', 215, true);


--
-- Name: form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_id_seq', 4, true);


--
-- Name: invite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invite_id_seq', 1, false);


--
-- Name: orgstructure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orgstructure_id_seq', 4, true);


--
-- Name: project_email_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_email_template_id_seq', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 1, true);


--
-- Name: relation_email_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relation_email_template_id_seq', 1, false);


--
-- Name: relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relation_id_seq', 4, true);


--
-- Name: template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.template_id_seq', 1, false);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: active_project_auditor active_project_active_project_id_user_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project_auditor
    ADD CONSTRAINT active_project_active_project_id_user_id_pk PRIMARY KEY (active_project_id, user_id);


--
-- Name: active_project active_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project
    ADD CONSTRAINT active_project_pkey PRIMARY KEY (id);


--
-- Name: competence_group competence_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence_group
    ADD CONSTRAINT competence_group_pkey PRIMARY KEY (id);


--
-- Name: competence competence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence
    ADD CONSTRAINT competence_pkey PRIMARY KEY (id);


--
-- Name: event_form_mapping event_form_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_form_mapping
    ADD CONSTRAINT event_form_mapping_pkey PRIMARY KEY (id);


--
-- Name: event_job event_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_job
    ADD CONSTRAINT event_job_pkey PRIMARY KEY (id);


--
-- Name: event_notification event_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_project event_project_event_id_project_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_project
    ADD CONSTRAINT event_project_event_id_project_id_pk PRIMARY KEY (event_id, project_id);


--
-- Name: form_answer form_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_answer
    ADD CONSTRAINT form_answer_pkey PRIMARY KEY (id);


--
-- Name: form_element_answer form_element_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer
    ADD CONSTRAINT form_element_answer_pkey PRIMARY KEY (id);


--
-- Name: form_element_answer_value form_element_answer_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer_value
    ADD CONSTRAINT form_element_answer_value_pkey PRIMARY KEY (id);


--
-- Name: form_element_competence form_element_competence_element_id_competence_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_competence
    ADD CONSTRAINT form_element_competence_element_id_competence_id_pk PRIMARY KEY (element_id, competence_id);


--
-- Name: form_element form_element_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element
    ADD CONSTRAINT form_element_pkey PRIMARY KEY (id);


--
-- Name: form_element_value form_element_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_value
    ADD CONSTRAINT form_element_value_pkey PRIMARY KEY (id);


--
-- Name: form form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form
    ADD CONSTRAINT form_pkey PRIMARY KEY (id);


--
-- Name: invite invite_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT invite_code_unique UNIQUE (code);


--
-- Name: invite_group invite_group_invite_id_group_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_group
    ADD CONSTRAINT invite_group_invite_id_group_id_pk PRIMARY KEY (invite_id, group_id);


--
-- Name: invite invite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT invite_pkey PRIMARY KEY (id);


--
-- Name: orgstructure orgstructure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orgstructure
    ADD CONSTRAINT orgstructure_pkey PRIMARY KEY (id);


--
-- Name: project_email_template project_email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_email_template
    ADD CONSTRAINT project_email_template_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: relation_email_template relation_email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation_email_template
    ADD CONSTRAINT relation_email_template_pkey PRIMARY KEY (id);


--
-- Name: relation relation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pk PRIMARY KEY (id);


--
-- Name: schema_version schema_version_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_version
    ADD CONSTRAINT schema_version_pk PRIMARY KEY (installed_rank);


--
-- Name: template template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template
    ADD CONSTRAINT template_pkey PRIMARY KEY (id);


--
-- Name: user_group user_group_user_id_group_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_user_id_group_id_pk PRIMARY KEY (user_id, group_id);


--
-- Name: user_login user_login_user_id_provider_id_provider_key_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT user_login_user_id_provider_id_provider_key_pk UNIQUE (provider_id, provider_key);


--
-- Name: event_job_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX event_job_status_index ON public.event_job USING btree (status);


--
-- Name: event_job_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX event_job_time_index ON public.event_job USING btree ("time");


--
-- Name: invite_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invite_code ON public.invite USING btree (code);


--
-- Name: orgstructure_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX orgstructure_name_uindex ON public.orgstructure USING btree (name);


--
-- Name: orgstructure_parent_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orgstructure_parent_id_index ON public.orgstructure USING btree (parent_id);


--
-- Name: project_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX project_name_uindex ON public.project USING btree (name);


--
-- Name: relation_classic_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX relation_classic_unique ON public.relation USING btree (project_id, group_from_id, group_to_id, form_id) WHERE (kind = 0);


--
-- Name: relation_survey_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX relation_survey_unique ON public.relation USING btree (project_id, group_from_id, form_id) WHERE (kind = 1);


--
-- Name: schema_version_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_s_idx ON public.schema_version USING btree (success);


--
-- Name: user_meta_user_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_meta_user_id_uindex ON public.user_meta USING btree (user_id);


--
-- Name: active_project_auditor active_project_active_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project_auditor
    ADD CONSTRAINT active_project_active_project_id_fk FOREIGN KEY (active_project_id) REFERENCES public.active_project(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: active_project active_project_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project
    ADD CONSTRAINT active_project_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: active_project active_project_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project
    ADD CONSTRAINT active_project_project_id_fk FOREIGN KEY (parent_project_id) REFERENCES public.project(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: active_project_auditor active_project_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_project_auditor
    ADD CONSTRAINT active_project_user_id_fk FOREIGN KEY (user_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: competence competence_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence
    ADD CONSTRAINT competence_group_id_fk FOREIGN KEY (group_id) REFERENCES public.competence_group(id) ON UPDATE CASCADE;


--
-- Name: event_form_mapping event_form_mapping_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_form_mapping
    ADD CONSTRAINT event_form_mapping_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_form_mapping event_form_mapping_form_freezed_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_form_mapping
    ADD CONSTRAINT event_form_mapping_form_freezed_id_fk FOREIGN KEY (form_freezed_id) REFERENCES public.form(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_form_mapping event_form_mapping_form_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_form_mapping
    ADD CONSTRAINT event_form_mapping_form_template_id_fk FOREIGN KEY (form_template_id) REFERENCES public.form(id) ON UPDATE CASCADE;


--
-- Name: event_job event_job_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_job
    ADD CONSTRAINT event_job_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_notification event_notification_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_notification
    ADD CONSTRAINT event_notification_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_project event_project_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_project
    ADD CONSTRAINT event_project_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_project event_project_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_project
    ADD CONSTRAINT event_project_project_id_fk FOREIGN KEY (project_id) REFERENCES public.project(id) ON UPDATE CASCADE;


--
-- Name: form_answer form_answer_account_id_from_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_answer
    ADD CONSTRAINT form_answer_account_id_from_fk FOREIGN KEY (user_from_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: form_answer form_answer_account_id_to_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_answer
    ADD CONSTRAINT form_answer_account_id_to_fk FOREIGN KEY (user_to_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: form_answer form_answer_form_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_answer
    ADD CONSTRAINT form_answer_form_id_fk FOREIGN KEY (form_id) REFERENCES public.form(id) ON UPDATE CASCADE;


--
-- Name: form_element_answer form_element_answer_form_answer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer
    ADD CONSTRAINT form_element_answer_form_answer_id_fk FOREIGN KEY (answer_id) REFERENCES public.form_answer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: form_element_answer form_element_answer_form_element_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer
    ADD CONSTRAINT form_element_answer_form_element_id_fk FOREIGN KEY (form_element_id) REFERENCES public.form_element(id) ON UPDATE CASCADE;


--
-- Name: form_element_answer_value form_element_answer_value_form_element_answer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer_value
    ADD CONSTRAINT form_element_answer_value_form_element_answer_id_fk FOREIGN KEY (answer_element_id) REFERENCES public.form_element_answer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: form_element_answer_value form_element_answer_value_form_element_value_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_answer_value
    ADD CONSTRAINT form_element_answer_value_form_element_value_id_fk FOREIGN KEY (form_element_value_id) REFERENCES public.form_element_value(id) ON UPDATE CASCADE;


--
-- Name: form_element_competence form_element_competence_competence_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_competence
    ADD CONSTRAINT form_element_competence_competence_id_fk FOREIGN KEY (competence_id) REFERENCES public.competence(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: form_element_competence form_element_competence_element_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_competence
    ADD CONSTRAINT form_element_competence_element_id_fk FOREIGN KEY (element_id) REFERENCES public.form_element(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: form_element form_element_form_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element
    ADD CONSTRAINT form_element_form_id_fk FOREIGN KEY (form_id) REFERENCES public.form(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: form_element_value form_element_value_form_element_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_element_value
    ADD CONSTRAINT form_element_value_form_element_id_fk FOREIGN KEY (element_id) REFERENCES public.form_element(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invite_group invite_group_group_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_group
    ADD CONSTRAINT invite_group_group_id_fk FOREIGN KEY (group_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: invite_group invite_group_invite_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invite_group
    ADD CONSTRAINT invite_group_invite_id_fk FOREIGN KEY (invite_id) REFERENCES public.invite(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orgstructure orgstructure_orgstructure_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orgstructure
    ADD CONSTRAINT orgstructure_orgstructure_id_fk FOREIGN KEY (parent_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_email_template project_email_template_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_email_template
    ADD CONSTRAINT project_email_template_project_id_fk FOREIGN KEY (project_id) REFERENCES public.project(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_email_template project_email_template_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_email_template
    ADD CONSTRAINT project_email_template_template_id_fk FOREIGN KEY (template_id) REFERENCES public.template(id) ON UPDATE CASCADE;


--
-- Name: project project_group_auditor_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_group_auditor_id_fk FOREIGN KEY (group_auditor_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE;


--
-- Name: relation_email_template relation_email_template_relation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation_email_template
    ADD CONSTRAINT relation_email_template_relation_id_fk FOREIGN KEY (relation_id) REFERENCES public.relation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: relation_email_template relation_email_template_template_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation_email_template
    ADD CONSTRAINT relation_email_template_template_id_fk FOREIGN KEY (template_id) REFERENCES public.template(id) ON UPDATE CASCADE;


--
-- Name: relation relation_form_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_form_id_fk FOREIGN KEY (form_id) REFERENCES public.form(id) ON UPDATE CASCADE;


--
-- Name: relation relation_group_from_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_group_from_id_fk FOREIGN KEY (group_from_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE;


--
-- Name: relation relation_group_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_group_to_id_fk FOREIGN KEY (group_to_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE;


--
-- Name: relation relation_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_project_id_fk FOREIGN KEY (project_id) REFERENCES public.project(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_group user_group_account_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_account_id_fk FOREIGN KEY (user_id) REFERENCES public.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_group user_group_orgstructure_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_orgstructure_id_fk FOREIGN KEY (group_id) REFERENCES public.orgstructure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_login user_login_account_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT user_login_account_id_fk FOREIGN KEY (user_id) REFERENCES public.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_meta user_meta_account_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_meta
    ADD CONSTRAINT user_meta_account_id_fk FOREIGN KEY (user_id) REFERENCES public.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

