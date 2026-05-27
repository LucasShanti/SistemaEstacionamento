CREATE DATABASE IF NOT EXISTS controle_estacionamento;
USE controle_estacionamento;

-- 1. Tabela TIPO_VEICULO
CREATE TABLE TIPO_VEICULO (
    id_tipo_veiculo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL UNIQUE,
    tolerancia_min INT NOT NULL DEFAULT 15,
    CONSTRAINT PK_tipo_veiculo PRIMARY KEY (id_tipo_veiculo)
);

-- 2. Tabela TABELA_PRECO
CREATE TABLE TABELA_PRECO (
    id_tabela INT NOT NULL AUTO_INCREMENT,
    id_tipo_veiculo INT NOT NULL,
    valor_hora DECIMAL(8,2) NOT NULL,
    valor_diaria DECIMAL(8,2) NOT NULL,
    descricao VARCHAR(100) NULL,
    CONSTRAINT PK_tabela_preco PRIMARY KEY (id_tabela),
    CONSTRAINT FK_tabela_preco_tipo FOREIGN KEY (id_tipo_veiculo) 
        REFERENCES TIPO_VEICULO(id_tipo_veiculo)
);

-- 3. Tabela CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NULL,
    email VARCHAR(100) NULL,
    data_cadastro DATETIME NOT NULL DEFAULT NOW(),
    CONSTRAINT PK_cliente PRIMARY KEY (id_cliente)
);

-- 4. Tabela VEICULO
CREATE TABLE VEICULO (
    id_veiculo INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_tipo_veiculo INT NOT NULL,
    placa VARCHAR(8) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    cor VARCHAR(30) NULL,
    CONSTRAINT PK_veiculo PRIMARY KEY (id_veiculo),
    CONSTRAINT FK_veiculo_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente),
    CONSTRAINT FK_veiculo_tipo FOREIGN KEY (id_tipo_veiculo) 
        REFERENCES TIPO_VEICULO(id_tipo_veiculo)
);

-- 5. Tabela VAGA
CREATE TABLE VAGA (
    id_vaga INT NOT NULL AUTO_INCREMENT,
    id_tipo_veiculo INT NOT NULL,
    numero VARCHAR(10) NOT NULL UNIQUE,
    setor VARCHAR(30) NOT NULL,
    status ENUM('Livre', 'Ocupada') NOT NULL DEFAULT 'Livre',
    CONSTRAINT PK_vaga PRIMARY KEY (id_vaga),
    CONSTRAINT FK_vaga_tipo FOREIGN KEY (id_tipo_veiculo) 
        REFERENCES TIPO_VEICULO(id_tipo_veiculo)
);

-- 6. Tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    id_funcionario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    telefone VARCHAR(15) NULL,
    CONSTRAINT PK_funcionario PRIMARY KEY (id_funcionario)
);

-- 7. Tabela TICKET
CREATE TABLE TICKET (
    id_ticket INT NOT NULL AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_vaga INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME NULL,
    valor_total DECIMAL(8,2) NULL,
    status ENUM('Aberto', 'Encerrado') NOT NULL DEFAULT 'Aberto',
    CONSTRAINT PK_ticket PRIMARY KEY (id_ticket),
    CONSTRAINT FK_ticket_veiculo FOREIGN KEY (id_veiculo) 
        REFERENCES VEICULO(id_veiculo),
    CONSTRAINT FK_ticket_vaga FOREIGN KEY (id_vaga) 
        REFERENCES VAGA(id_vaga),
    CONSTRAINT FK_ticket_funcionario FOREIGN KEY (id_funcionario) 
        REFERENCES FUNCIONARIO(id_funcionario)
);

-- 8. Tabela PAGAMENTO
CREATE TABLE PAGAMENTO (
    id_pagamento INT NOT NULL AUTO_INCREMENT,
    id_ticket INT NOT NULL UNIQUE,
    forma_pagamento ENUM('Dinheiro', 'Cartão de Crédito', 'Cartão de Débito', 'PIX') NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    data_pagamento DATETIME NOT NULL DEFAULT NOW(),
    CONSTRAINT PK_pagamento PRIMARY KEY (id_pagamento),
    CONSTRAINT FK_pagamento_ticket FOREIGN KEY (id_ticket) 
        REFERENCES TICKET(id_ticket)
);
