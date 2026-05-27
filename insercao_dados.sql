USE controle_estacionamento;

-- ==========================================================
-- POPULANDO A TABELA TIPO_VEICULO (Mínimo de 20 registros)
-- ==========================================================
-- Categorias principais do sistema
INSERT INTO TIPO_VEICULO (descricao, tolerancia_min) VALUES 
('Carro', 15), ('Moto', 15), ('Caminhão', 20), ('Van', 20);

-- Registros adicionais para cumprir a meta de volumetria e testes secundários
INSERT INTO TIPO_VEICULO (descricao, tolerancia_min) VALUES 
('SUV', 15), ('Bicicleta Elétrica', 10), ('Scooter', 15), ('Micro-ônibus', 30), ('Carreta', 30), ('Tronco', 0),
('Tipo Teste 1', 5), ('Tipo Teste 2', 5), ('Tipo Teste 3', 5), ('Tipo Teste 4', 5), ('Tipo Teste 5', 5),
('Tipo Teste 6', 5), ('Tipo Teste 7', 5), ('Tipo Teste 8', 5), ('Tipo Teste 9', 5), 
('Incorreto Erro', 999); -- Registro com tempo de tolerância inconsistente de propósito para filtrar depois

-- ==========================================================
-- POPULANDO A TABELA TABELA_PRECO (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO TABELA_PRECO (id_tipo_veiculo, valor_hora, valor_diaria, descricao) VALUES 
(1, 10.00, 60.00, 'Tarifa Padrão Carro'), (2, 5.00, 30.00, 'Tarifa Padrão Moto'),
(3, 20.00, 120.00, 'Tarifa Padrão Caminhão'), (4, 15.00, 90.00, 'Tarifa Padrão Van'),
(5, 12.00, 70.00, 'Tarifa SUV'), (6, 3.00, 15.00, 'Tarifa Bike'),
(7, 5.00, 30.00, 'Tarifa Scooter'), (8, 25.00, 150.00, 'Tarifa Micro'),
(9, 40.00, 200.00, 'Tarifa Carreta'), (1, 8.00, 50.00, 'Tarifa Conveniada Carro'),
(2, 4.00, 25.00, 'Tarifa Conveniada Moto'), (1, 15.00, 80.00, 'Tarifa Eventos'),
(2, 8.00, 40.00, 'Tarifa Eventos Moto'), (3, 30.00, 180.00, 'Tarifa Noturna'),
(1, 12.00, 75.00, 'Tarifa Feriados'), (2, 6.00, 35.00, 'Tarifa Feriados Moto'),
(1, 0.00, 0.00, 'Cortesia Diretoria'), (2, 0.00, 0.00, 'Cortesia Funcionários'),
(10, 999.99, 9999.99, 'ERRO VALOR INCORRETO'), -- Forçando valores absurdos para testar queries de auditoria na Etapa 3
(1, 10.00, 60.00, NULL); -- Deixando a descrição nula para validar o comportamento do campo opcional

-- ==========================================================
-- POPULANDO A TABELA CLIENTE (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO CLIENTE (nome, cpf, telefone, email) VALUES 
('Lucas Clelio', '11122233344', '62999991111', 'lucas@email.com'),
('Ana Silva', '22233344455', '62999992222', 'ana@email.com'),
('Carlos Souza', '33344455566', '62999993333', 'carlos@email.com'),
('Marcos Lima', '44455566677', '62999994444', 'marcos@email.com'),
('Julia Costa', '55566677788', '62999995555', 'julia@email.com'),
('Roberto Almeida', '66677788899', '62999996666', 'roberto@email.com'),
('Fernanda Reis', '77788899900', '62999997777', 'fernanda@email.com'),
('Ricardo Santos', '88899900011', '62999998888', 'ricardo@email.com'),
('Beatriz Ramos', '99900011122', '62999999999', 'beatriz@email.com'),
('Andre Oliveira', '00011122233', '62999990000', 'andre@email.com'),
('Patricia Melo', '12345678901', '62988881111', 'patricia@email.com'),
('Felipe Dias', '23456789012', '62988882222', 'felipe@email.com'),
('Mariana Xavier', '34567890123', '62988883333', 'mariana@email.com'),
('Gustavo Borges', '45678901234', '62988884444', 'gustavo@email.com'),
('Camila Pires', '56789012345', '62988885555', 'camila@email.com'),
('Thiago Rocha', '67890123456', '62988886666', 'thiago@email.com'),
('Amanda Neves', '78901234567', '62988887777', 'amanda@email.com'),
('Bruno Mendes', '89012345678', '62988888888', 'bruno@email.com'),
-- Casos com dados incompletos/nulos para simular cadastros parciais no sistema
('Cliente Sem Telefone', '90123456789', NULL, 'semfone@email.com'), 
('Cliente Sem Email', '01234567890', '62988889999', NULL);

-- ==========================================================
-- POPULANDO A TABELA VEICULO (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO VEICULO (id_cliente, id_tipo_veiculo, placa, modelo, marca, cor) VALUES 
(1, 1, 'ABC1D23', 'Gol', 'VW', 'Preto'), (2, 1, 'XYZ9H87', 'Onix', 'Chevrolet', 'Branco'),
(3, 2, 'MOTO123', 'CG 160', 'Honda', 'Vermelho'), (4, 1, 'KJG4F55', 'Corolla', 'Toyota', 'Prata'),
(5, 1, 'POU3M22', 'Civic', 'Honda', 'Cinza'), (6, 3, 'CAM9K88', 'Constellation', 'VW', 'Branco'),
(7, 4, 'VAN4F11', 'Ducato', 'Fiat', 'Branco'), (8, 1, 'REI0G99', 'Compass', 'Jeep', 'Azul'),
(9, 2, 'FAZ5T44', 'Fazer 250', 'Yamaha', 'Preto'), (10, 1, 'OPE3D11', 'Uno', 'Fiat', 'Vermelho'),
(11, 1, 'LLL2K33', 'Palio', 'Fiat', 'Prata'), (12, 1, 'KKK4J55', 'Fiesta', 'Ford', 'Preto'),
(13, 2, 'JJJ5H66', 'Biz', 'Honda', 'Rosa'), (14, 1, 'HHH7G88', 'Cruze', 'Chevrolet', 'Branco'),
(15, 1, 'GGG8F99', 'Sandero', 'Renault', 'Prata'), (16, 1, 'FFF1D22', 'HB20', 'Hyundai', 'Bronze'), 
(17, 1, 'EEE2S33', 'Argo', 'Fiat', 'Preto'), (18, 1, 'DDD4E55', 'Kwid', 'Renault', 'Branco'),
-- Forçando campos com strings inconsistentes e valores nulos para testar filtros posteriormente
(19, 1, 'CCC5R66', 'Carro Erro', 'Sem Marca', NULL), 
(20, 1, 'BBB0000', 'ERRO_NOME', 'TESTE', 'Invisível');

-- ==========================================================
-- POPULANDO A TABELA VAGA (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO VAGA (id_tipo_veiculo, numero, setor, status) VALUES 
(1, 'A-01', 'Setor A', 'Livre'), (1, 'A-02', 'Setor A', 'Ocupada'),
(1, 'A-03', 'Setor A', 'Livre'), (2, 'M-01', 'Setor Moto', 'Livre'),
(2, 'M-02', 'Setor Moto', 'Ocupada'), (3, 'C-01', 'Setor Pesados', 'Livre'),
(4, 'V-01', 'Setor Pesados', 'Ocupada'), (1, 'B-01', 'Setor B', 'Livre'),
(1, 'B-02', 'Setor B', 'Livre'), (1, 'B-03', 'Setor B', 'Livre'),
(1, 'A-04', 'Setor A', 'Livre'), (1, 'A-05', 'Setor A', 'Livre'),
(2, 'M-03', 'Setor Moto', 'Livre'), (2, 'M-04', 'Setor Moto', 'Livre'),
(1, 'B-04', 'Setor B', 'Livre'), (1, 'B-05', 'Setor B', 'Livre'),
(1, 'C-02', 'Setor Pesados', 'Livre'), (1, 'V-02', 'Setor Pesados', 'Livre'),
-- Criando dados com nomeações fora do padrão do sistema para testar queries de limpeza de dados
(1, 'X-99', 'Setor Fantasma', 'Livre'), 
(1, 'ERR-0', 'Setor Erro', 'Ocupada');

-- ==========================================================
-- POPULANDO A TABELA FUNCIONARIO (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO FUNCIONARIO (nome, cpf, cargo, turno, telefone) VALUES 
('Carlos Entradas', '12312312311', 'Operador', 'Manhã', '62981110001'),
('Marcos Saídas', '32132132122', 'Operador', 'Tarde', '62981110002'),
('Julia Supervisora', '45645645633', 'Supervisor', 'Noite', '62981110003'),
('Funcionario 4', '11111111111', 'Operador', 'Manhã', NULL),
('Funcionario 5', '22222222222', 'Operador', 'Manhã', NULL),
('Funcionario 6', '33333333333', 'Operador', 'Tarde', NULL),
('Funcionario 7', '44444444444', 'Operador', 'Tarde', NULL),
('Funcionario 8', '55555555555', 'Operador', 'Noite', NULL),
('Funcionario 9', '66666666666', 'Operador', 'Noite', NULL),
('Funcionario 10', '77777777777', 'Supervisor', 'Manhã', NULL),
('Funcionario 11', '88888888888', 'Gerente', 'Comercial', NULL),
('Funcionario 12', '99999999999', 'Operador', 'Manhã', NULL),
('Funcionario 13', '00000000000', 'Operador', 'Tarde', NULL),
('Funcionario 14', '12345678910', 'Operador', 'Noite', NULL),
('Funcionario 15', '10987654321', 'Operador', 'Manhã', NULL),
('Funcionario 16', '11223344556', 'Operador', 'Tarde', NULL),
('Funcionario 17', '65544332211', 'Operador', 'Noite', NULL),
('Funcionario 18', '77889900112', 'Operador', 'Manhã', NULL),
-- Inserindo turnos inválidos propositalmente para simular erros de entrada da aplicação externa
('Funcionario Erro 1', '99988877766', 'Estagiário', 'Madrugada', NULL),
('Funcionario Erro 2', '55544433322', 'Inativo', 'Nenhum', NULL);

-- ==========================================================
-- POPULANDO A TABELA TICKET (Mínimo de 20 registros)
-- ==========================================================
INSERT INTO TICKET (id_veiculo, id_vaga, id_funcionario, data_entrada, data_saida, valor_total, status) VALUES 
(1, 1, 1, '2025-05-27 08:00:00', '2025-05-27 10:00:00', 20.00, 'Encerrado'),
(2, 2, 1, '2025-05-27 08:30:00', NULL, NULL, 'Aberto'), -- Mantendo em aberto para testar estados da vaga ocupada
(3, 4, 1, '2025-05-27 09:00:00', '2025-05-27 09:10:00', 0.00, 'Encerrado'), -- Testando caso de saída dentro do período de tolerância
(4, 3, 2, '2025-05-27 13:00:00', '2025-05-27 17:00:00', 40.00, 'Encerrado'),
(5, 5, 2, '2025-05-27 14:00:00', NULL, NULL, 'Aberto'),
(6, 6, 1, '2025-05-27 07:00:00', '2025-05-27 19:00:00', 120.00, 'Encerrado'),
(7, 7, 3, '2025-05-27 19:30:00', NULL, NULL, 'Aberto'),
(8, 8, 1, '2025-05-27 08:00:00', '2025-05-27 09:00:00', 10.00, 'Encerrado'),
(9, 13, 2, '2025-05-27 12:00:00', '2025-05-27 15:00:00', 15.00, 'Encerrado'),
(10, 9, 1, '2025-05-27 10:00:00', '2025-05-27 11:00:00', 10.00, 'Encerrado'),
(11, 10, 1, '2025-05-27 10:15:00', '2025-05-27 11:15:00', 10.00, 'Encerrado'),
(12, 11, 2, '2025-05-27 14:00:00', '2025-05-27 16:00:00', 20.00, 'Encerrado'),
(13, 12, 2, '2025-05-27 14:30:00', '2025-05-27 15:30:00', 5.00, 'Encerrado'),
(14, 14, 3, '2025-05-27 22:00:00', '2025-05-27 23:00:00', 10.00, 'Encerrado'),
(15, 15, 1, '2025-05-27 08:00:00', '2025-05-27 12:00:00', 40.00, 'Encerrado'),
(16, 16, 2, '2025-05-27 13:00:00', '2025-05-27 14:00:00', 10.00, 'Encerrado'),
(17, 17, 1, '2025-05-27 09:00:00', '2025-05-27 10:00:00', 10.00, 'Encerrado'),
(18, 18, 2, '2025-05-27 15:00:00', '2025-05-27 16:00:00', 10.00, 'Encerrado'),
-- Forçando erros graves na regra de negócio para criar cenários de correção na Etapa 3
(19, 1, 1, '2025-05-27 10:00:00', '2025-05-27 09:00:00', -50.00, 'Encerrado'), -- Inconsistência: Data de saída menor que a de entrada e valor negativo
(20, 2, 2, '2025-05-27 11:00:00', '2025-05-27 13:00:00', NULL, 'Encerrado'); -- Inconsistência: Status fechado mas sem valor total calculado

-- ==========================================================
-- POPULANDO A TABELA PAGAMENTO (Mínimo de 20 registros)
-- ==========================================================
-- Vinculando os pagamentos aos tickets que foram encerrados corretamente acima
INSERT INTO PAGAMENTO (id_ticket, forma_pagamento, valor) VALUES 
(1, 'PIX', 20.00), (3, 'Dinheiro', 0.00), (4, 'Cartão de Crédito', 40.00),
(6, 'Cartão de Débito', 120.00), (8, 'PIX', 10.00), (9, 'Dinheiro', 15.00),
(10, 'PIX', 10.00), (11, 'Cartão de Crédito', 10.00), (12, 'Cartão de Débito', 20.00),
(13, 'PIX', 5.00), (14, 'Dinheiro', 10.00), (15, 'Cartão de Crédito', 40.00),
(16, 'PIX', 10.00), (17, 'Dinheiro', 10.00), (18, 'Cartão de Débito', 10.00);

-- Vinculando pagamento ao ticket problemático para manter o histórico inconsistente
INSERT INTO PAGAMENTO (id_ticket, forma_pagamento, valor) VALUES 
(19, 'Dinheiro', -50.00);

-- Inserindo mais 4 tickets rápidos e encerrados para conseguir fechar a meta de 20 registros na tabela associativa (relação 1:1)
INSERT INTO TICKET (id_veiculo, id_vaga, id_funcionario, data_entrada, data_saida, valor_total, status) VALUES 
(1, 1, 1, '2025-05-27 05:00:00', '2025-05-27 06:00:00', 10.00, 'Encerrado'),
(2, 2, 1, '2025-05-27 05:00:00', '2025-05-27 06:00:00', 10.00, 'Encerrado'),
(3, 3, 1, '2025-05-27 05:00:00', '2025-05-27 06:00:00', 10.00, 'Encerrado'),
(4, 4, 1, '2025-05-27 05:00:00', '2025-05-27 06:00:00', 10.00, 'Encerrado');

-- Pagando os últimos 4 tickets criados para validação final
INSERT INTO PAGAMENTO (id_ticket, forma_pagamento, valor) VALUES 
(21, 'PIX', 10.00), (22, 'Dinheiro', 10.00), (23, 'Cartão de Crédito', 10.00), 
(24, 'PIX', 0.00); -- Inconsistência proposital: Ticket com valor 10.00 pago com valor zerado para auditoria futura
