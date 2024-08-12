CREATE TABLE ESPORTE (
    id NUMBER NOT NULL,
    sigla CHAR(3) NOT NULL,
    nome VARCHAR2(30) NOT NULL,
    PRIMARY KEY (id)
);
 
CREATE TABLE EVENTO (
    id NUMBER NOT NULL,
    descricao VARCHAR2(50) NOT NULL,
    genero CHAR(1) NOT NULL,
    id_esporte NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_esporte) REFERENCES ESPORTE (id)
);
 
CREATE TABLE PAIS (
    id NUMBER NOT NULL,
    sigla CHAR(3) NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    PRIMARY KEY (id)
);
 
CREATE TABLE TIME (
    id NUMBER NOT NULL,
    id_pais NUMBER NOT NULL,
    descricao VARCHAR2(50),
    PRIMARY KEY (id),
    FOREIGN KEY (id_pais) REFERENCES PAIS (id)
);
 
 
CREATE TABLE ATLETA (
    id NUMBER NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    genero CHAR(1) NOT NULL,
    data_nascimento date NOT NULL,
    id_pais NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_pais) REFERENCES PAIS (id)
);
 
 
CREATE TABLE TIME_ATLETA (
    id_time NUMBER NOT NULL,
    id_atleta NUMBER NOT NULL,
    numero NUMBER,
    PRIMARY KEY (id_time, id_atleta),
    FOREIGN KEY (id_time) REFERENCES TIME (id),
    FOREIGN KEY (id_atleta) REFERENCES ATLETA (id)
);
 
 
CREATE TABLE MEDALHA (
    id NUMBER NOT NULL,
    metal CHAR(1) NOT NULL,
    id_evento NUMBER NOT NULL,
    id_time NUMBER,
    id_atleta NUMBER,
    PRIMARY KEY (id),
    FOREIGN KEY (id_time) REFERENCES TIME (id),
    FOREIGN KEY (id_atleta) REFERENCES ATLETA (id)
);
