-- DROP SEQUENCE public.empresa_id_seq;

CREATE SEQUENCE public.empresa_id_seq;

ALTER SEQUENCE public.empresa_id_seq
    OWNER TO algawork;
    
-- DROP SEQUENCE public.funcionario_id_seq;

CREATE SEQUENCE public.funcionario_id_seq;

ALTER SEQUENCE public.funcionario_id_seq
    OWNER TO algawork;
    
-- DROP SEQUENCE public.lancamento_id_seq;

CREATE SEQUENCE public.lancamento_id_seq;

ALTER SEQUENCE public.lancamento_id_seq
    OWNER TO algawork;
    
-- Table: public.empresa

-- DROP TABLE public.empresa;

CREATE TABLE public.empresa
(
    id bigint NOT NULL DEFAULT nextval('empresa_id_seq'::regclass),
    cnpj character varying(255) COLLATE pg_catalog."default" NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    razao_social character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT empresa_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.empresa
    OWNER to algawork;
    
-- Table: public.funcionario

-- DROP TABLE public.funcionario;

CREATE TABLE public.funcionario
(
    id bigint NOT NULL DEFAULT nextval('funcionario_id_seq'::regclass),
    cpf character varying(255) COLLATE pg_catalog."default" NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    perfil character varying(255) COLLATE pg_catalog."default" NOT NULL,
    qtd_horas_almoco real,
    qtd_horas_trabalho_dia real,
    senha character varying(255) COLLATE pg_catalog."default" NOT NULL,
    valor_hora numeric(19,2),
    id_empresa bigint,
    CONSTRAINT funcionario_pkey PRIMARY KEY (id),
    CONSTRAINT fk3s15y0uscp165nxb1r77ryiur FOREIGN KEY (id_empresa)
        REFERENCES public.empresa (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.funcionario
    OWNER to algawork;
    
-- Table: public.lancamento

-- DROP TABLE public.lancamento;

CREATE TABLE public.lancamento
(
    id bigint NOT NULL DEFAULT nextval('lancamento_id_seq'::regclass),
    data timestamp without time zone NOT NULL,
    data_atualizacao timestamp without time zone NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    descricao character varying(255) COLLATE pg_catalog."default" NOT NULL,
    localizacao character varying(255) COLLATE pg_catalog."default" NOT NULL,
    tipo character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_funcionario bigint,
    CONSTRAINT lancamento_pkey PRIMARY KEY (id),
    CONSTRAINT fk2qjm6vtlrftns4xo2nktlripg FOREIGN KEY (id_funcionario)
        REFERENCES public.funcionario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.lancamento
    OWNER to algawork;
