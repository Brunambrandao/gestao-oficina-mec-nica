-- Inserir Clientes
INSERT INTO Cliente (nome_cliente, cpf_cliente, telefone_cliente, endereco_cliente) VALUES
('João Silva', '111.222.333-44', '31987654321', 'Rua A, 123 - Centro'),
('Maria Oliveira', '555.666.777-88', '31998765432', 'Av B, 456 - Bairro X'),
('Carlos Pereira', '999.888.777-66', '31976543210', 'Rua C, 789 - Vila Z');

-- Inserir Veiculos
INSERT INTO Veiculo (placa_veiculo, marca_veiculo, modelo_veiculo, ano_veiculo, id_cliente) VALUES
('ABC1234', 'Fiat', 'Palio', 2015, 1),
('XYZ5678', 'Chevrolet', 'Onix', 2020, 2),
('DEF9012', 'Ford', 'Ka', 2018, 1);

-- Inserir Mecanicos
INSERT INTO Mecanico (nome_mecanico, especialidade_mecanico, cpf_mecanico) VALUES
('Pedro Souza', 'Mecânica Geral', '000.111.222-33'),
('Ana Costa', 'Elétrica Automotiva', '444.555.666-77');

-- Inserir Servicos
INSERT INTO Servico (descricao_servico, valor_servico) VALUES
('Troca de Óleo', 80.00),
('Revisão Completa', 350.00),
('Alinhamento e Balanceamento', 120.00),
('Reparo Freio', 150.00);

-- Inserir Pecas
INSERT INTO Peca (nome_peca, valor_unitario_peca, quantidade_estoque) VALUES
('Filtro de Óleo', 25.00, 100),
('Vela de Ignição', 15.00, 50),
('Pastilha de Freio', 70.00, 30),
('Pneu Aro 15', 300.00, 20);

-- Inserir Ordens de Serviço
INSERT INTO Ordem_Servico (id_cliente, id_veiculo, id_mecanico, data_abertura_os, status_os) VALUES
(1, 1, 1, '2025-06-01', 'Concluída'), -- OS 1: João, Palio, Pedro
(2, 2, 2, '2025-06-05', 'Em Andamento'), -- OS 2: Maria, Onix, Ana
(1, 3, 1, '2025-06-10', 'Em Aberto');   -- OS 3: João, Ka, Pedro

-- Inserir Serviços em Ordens de Serviço
INSERT INTO Ordem_Servico_Servico (id_os, id_servico, quantidade_servico) VALUES
(1, 1, 1), -- OS 1: Troca de Óleo
(1, 2, 1), -- OS 1: Revisão Completa
(2, 3, 1), -- OS 2: Alinhamento e Balanceamento
(3, 1, 1), -- OS 3: Troca de Óleo
(3, 4, 1); -- OS 3: Reparo Freio

-- Inserir Peças em Ordens de Serviço
INSERT INTO Ordem_Servico_Peca (id_os, id_peca, quantidade_peca) VALUES
(1, 1, 1), -- OS 1: Filtro de Óleo
(1, 2, 4), -- OS 1: 4 Velas de Ignição
(2, 4, 2), -- OS 2: 2 Pneus Aro 15
(3, 1, 1), -- OS 3: Filtro de Óleo
(3, 3, 1); -- OS 3: Pastilha de Freio