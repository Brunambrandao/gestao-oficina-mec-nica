
# Modelagem e implementação de banco de dados relacional para gestão de serviços automotivos utilizando SQL

## 📄 Descrição do Projeto

Este projeto visa demonstrar a criação e manipulação de um banco de dados relacional para gerenciar as operações de uma **oficina mecânica**. O objetivo principal foi criar um esquema que pudesse registrar de forma eficiente informações sobre **clientes**, **veículos**, **mecânicos**, **serviços**, **peças** e, principalmente, as **Ordens de Serviço (OS)**.

Além da modelagem, o projeto inclui a criação de scripts SQL para:

- **Construção do esquema do banco de dados (DDL - Data Definition Language)**: tabelas, colunas, chaves primárias e estrangeiras, e restrições.
- **População do banco de dados com dados de teste (DML - Data Manipulation Language)**: inserção de dados realistas para simular o funcionamento da oficina.
- **Execução de queries SQL complexas (DML - Data Manipulation Language)**: para extrair informações e insights do sistema, demonstrando o uso de cláusulas como `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING` e `JOINs`.

Este trabalho foi desenvolvido como parte de um desafio prático de banco de dados, visando aprimorar conhecimentos em **modelagem, SQL DDL e SQL DML**.

---

## ⚙️ Modelagem Lógica do Banco de Dados

O banco de dados foi projetado para suportar as operações de uma oficina mecânica, com foco nas seguintes entidades e seus relacionamentos:

- **Cliente**: Pessoas que levam seus veículos para manutenção.
- **Veículo**: Automóveis que pertencem aos clientes e são atendidos na oficina.
- **Mecânico**: Profissionais que executam os serviços.
- **Serviço**: Tipos de manutenção oferecidos (ex: troca de óleo, revisão, reparo de freio).
- **Peça**: Componentes do estoque utilizados nos serviços.
- **Ordem_Serviço**: O registro principal que detalha os serviços solicitados para um veículo por um cliente e executados por um mecânico.
- **Ordem_Servico_Servico**: Tabela associativa que vincula os serviços à Ordem de Serviço (relacionamento N:N).
- **Ordem_Servico_Peca**: Tabela associativa que vincula as peças utilizadas à Ordem de Serviço (relacionamento N:N).

---

### Diagrama Entidade-Relacionamento (ERD)

* `![Diagrama ER do gestao oficina mecanica](gestao-oficina-mecanica/Imagens/Diagrama ER oficina.png)` 
---

## 🗂️ Estrutura do Banco de Dados (Esquema Lógico)

### Cliente
- `id_cliente` (PK): Identificador único do cliente.
- `nome_cliente`, `cpf_cliente` (UNIQUE), `telefone_cliente`, `endereco_cliente`.

### Veiculo
- `id_veiculo` (PK): Identificador único do veículo.
- `placa_veiculo` (UNIQUE), `marca_veiculo`, `modelo_veiculo`, `ano_veiculo`.
- `id_cliente` (FK): Cliente proprietário do veículo.

### Mecanico
- `id_mecanico` (PK): Identificador único do mecânico.
- `nome_mecanico`, `especialidade_mecanico`, `cpf_mecanico` (UNIQUE).

### Servico
- `id_servico` (PK): Identificador único do serviço.
- `descricao_servico`, `valor_servico`.

### Peca
- `id_peca` (PK): Identificador único da peça.
- `nome_peca`, `valor_unitario_peca`, `quantidade_estoque`.

### Ordem_Servico
- `id_os` (PK): Identificador único da Ordem de Serviço.
- `id_cliente` (FK), `id_veiculo` (FK), `id_mecanico` (FK).
- `data_abertura_os`, `data_conclusao_os`, `status_os` (ENUM: 'Em Aberto', 'Em Andamento', 'Concluída', 'Cancelada').

### Ordem_Servico_Servico
- `id_os` (PK, FK), `id_servico` (PK, FK), `quantidade_servico`.

### Ordem_Servico_Peca
- `id_os` (PK, FK), `id_peca` (PK, FK), `quantidade_peca`.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos

- Um **SGBD relacional** (ex: MySQL, PostgreSQL, SQLite). Os scripts utilizam SQL padrão.
- Um **cliente SQL** (ex: DBeaver, DataGrip, MySQL Workbench, pgAdmin).

### Clonar o Repositório

```bash
git clone https://github.com/Brunambrandao/projeto-banco-dados-oficina.git
cd projeto-banco-dados-oficina
```

### Criar o Esquema do Banco de Dados

1. Abra seu cliente SQL e conecte-se à sua instância de banco de dados.
2. Crie um novo banco de dados (ex: `CREATE DATABASE oficina; USE oficina;`).
3. Abra o arquivo `schema.sql`.
4. Execute o script completo.

### Inserir os Dados de Teste

1. Abra o arquivo `data.sql`.
2. Execute o script para popular as tabelas com dados de exemplo.

### Explorar com Queries

1. Abra o arquivo `queries.sql`.
2. Execute as queries para consultar os dados e entender o funcionamento do sistema.

---

## 📈 Queries SQL de Destaque

O arquivo `queries.sql` contém diversas consultas que permitem obter insights úteis, como:

- Quais são todos os clientes cadastrados?
- Liste todos os serviços oferecidos e seus respectivos valores.
- Quais veículos pertencem ao cliente 'João Silva'?
- Quais peças estão com o estoque abaixo de 50 unidades?
- Qual o valor total de cada serviço adicionado a uma Ordem de Serviço, considerando a quantidade de serviços?
- Qual o valor total da Ordem de Serviço, considerando o somatório do custo das peças e dos serviços?
- Liste todos os mecânicos em ordem alfabética de nome.
- Mostre as ordens de serviço concluídas, da mais recente para a mais antiga.
- Quais clientes tiveram mais de uma Ordem de Serviço registrada?
- Quais serviços geraram um faturamento total (em todas as OS que foram executados) superior a R$ 200,00?
- Quais são os serviços realizados em cada Ordem de Serviço, incluindo o nome do cliente e a placa do veículo?
- Qual mecânico realizou mais Ordens de Serviço concluídas no último mês (considerando o último mês como Junho de 2025)?
- Liste todos os clientes e, para cada um, os veículos que possuem e as ordens de serviço associadas a esses veículos, mesmo que não tenham ordens de serviço.
---

## 🤝 Contribuições

Este projeto é um ponto de partida para a prática de **modelagem e SQL**. Sugestões, melhorias e novas queries são sempre bem-vindas! Sinta-se à vontade para abrir **issues** ou enviar **pull requests**.

---

## 📝 Licença

Este projeto está licenciado sob a **licença MIT**. Consulte o arquivo `LICENSE` para mais detalhes.
