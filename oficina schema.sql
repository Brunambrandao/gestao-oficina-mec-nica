CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;
-- O restante do seu script CREATE TABLE viria aqui abaixo-- Criação do Banco de Dados 
-- CREATE DATABASE oficina;
-- USE oficina; -- Para MySQL/SQL Server

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT para MySQL, SERIAL para PostgreSQL
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente VARCHAR(14) UNIQUE NOT NULL,
    telefone_cliente VARCHAR(15),
    endereco_cliente VARCHAR(255)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa_veiculo VARCHAR(7) UNIQUE NOT NULL,
    marca_veiculo VARCHAR(50),
    modelo_veiculo VARCHAR(50),
    ano_veiculo INT,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome_mecanico VARCHAR(100) NOT NULL,
    especialidade_mecanico VARCHAR(50),
    cpf_mecanico VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela Servico
CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao_servico VARCHAR(100) NOT NULL,
    valor_servico DECIMAL(10, 2) NOT NULL
);

-- Tabela Peca
CREATE TABLE Peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(100) NOT NULL,
    valor_unitario_peca DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT DEFAULT 0
);

-- Tabela Ordem_Servico
CREATE TABLE Ordem_Servico (
    id_os INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_mecanico INT NOT NULL,
    data_abertura_os DATE NOT NULL,
    data_conclusao_os DATE,
    status_os ENUM('Em Aberto', 'Em Andamento', 'Concluída', 'Cancelada') DEFAULT 'Em Aberto',
    CONSTRAINT fk_os_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    CONSTRAINT fk_os_veiculo FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    CONSTRAINT fk_os_mecanico FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

-- Tabela Associativa Ordem_Servico_Servico
CREATE TABLE Ordem_Servico_Servico (
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade_servico INT DEFAULT 1,
    PRIMARY KEY (id_os, id_servico),
    CONSTRAINT fk_oss_os FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    CONSTRAINT fk_oss_servico FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- Tabela Associativa Ordem_Servico_Peca
CREATE TABLE Ordem_Servico_Peca (
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_peca INT NOT NULL,
    PRIMARY KEY (id_os, id_peca),
    CONSTRAINT fk_osp_os FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
    CONSTRAINT fk_osp_peca FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);