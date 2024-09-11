-- KEYS

ALTER TABLE CLIENTE
    ADD PRIMARY KEY(cod_cliente);

ALTER TABLE PESSOA_JURIDICA
    ADD PRIMARY KEY(cod_cliente)
    ADD FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(cod_cliente);

ALTER TABLE PESSOA_FISICA
    ADD PRIMARY KEY(cod_cliente)
    ADD FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(cod_cliente)
    -- ADD FOREIGN KEY(cod_empresa) REFERENCES PESSOA_JURIDICA(cod_empresa)
;

ALTER TABLE TELEFONE
    ADD PRIMARY KEY(id_telefone)
    ADD FOREIGN KEY(cod_cliente) REFERENCES PESSOA_FISICA(cod_cliente);

ALTER TABLE ESTADO
    ADD PRIMARY KEY(uf);

ALTER TABLE CIDADE
    ADD PRIMARY KEY(cod_cidade)
    ADD FOREIGN KEY(uf) REFERENCES ESTADO(uf);

ALTER TABLE ENDERECO
    DROP COLUMN COD_ENDERECO;
ALTER TABLE ENDERECO
    ADD CONSTRAINT cod_endereco PRIMARY KEY(cod_cidade, cod_cliente)
    ADD FOREIGN KEY(cod_cidade) REFERENCES CIDADE(cod_cidade)
    ADD FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(cod_cliente);

ALTER TABLE PEDIDO
    ADD PRIMARY KEY(num_pedido)
    ADD FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(cod_cliente);

ALTER TABLE ENTREGA
    ADD PRIMARY KEY(num_entrega);

ALTER TABLE CATEGORIA
    ADD PRIMARY KEY(cod_categoria)
    ADD FOREIGN KEY(cod_categoria_pai) REFERENCES CATEGORIA(cod_categoria);

ALTER TABLE PRODUTO
    ADD PRIMARY KEY(cod_produto)
    ADD FOREIGN KEY(cod_categoria) REFERENCES CATEGORIA(cod_categoria);

ALTER TABLE ITEM_PEDIDO
    ADD CONSTRAINT NUM_ITEM_PEDIDO PRIMARY KEY(num_pedido, cod_produto)
    ADD FOREIGN KEY(num_pedido) REFERENCES PEDIDO(num_pedido)
    ADD FOREIGN KEY(cod_produto) REFERENCES PRODUTO(cod_produto)
    ADD FOREIGN KEY(num_entrega) REFERENCES ENTREGA(num_entrega);

-- INDEXES

CREATE INDEX idx_pessoa_fisica_cpf ON PESSOA_FISICA(cpf);
CREATE INDEX idx_cliente_nome ON CLIENTE(nome);
CREATE INDEX idx_pessoa_fisica_nascimento ON PESSOA_FISICA(data_nascimento);

CREATE INDEX idx_pedido_data_emissao ON PEDIDO(data_emissao);
CREATE INDEX idx_pedido_cod_cliente ON PEDIDO(cod_cliente);
