-- ============================================================================
-- ETAPA 3: CONSULTAS E RELATÓRIOS ESTRATÉGICOS
-- ============================================================================

-- 1. Relatório de Faturamento por Tipo de Veículo (Uso de JOIN e SUM)
-- Mostra qual categoria de veículo (Carro, Moto, etc) traz mais dinheiro para o estacionamento.
SELECT 
    tv.descricao AS Tipo_Veiculo, 
    SUM(p.valor) AS Faturamento_Total
FROM PAGAMENTO p
JOIN TICKET t ON p.id_ticket = t.id_ticket
JOIN VEICULO v ON t.id_veiculo = v.id_veiculo
JOIN TIPO_VEICULO tv ON v.id_tipo_veiculo = tv.id_tipo_veiculo
GROUP BY tv.descricao;

-- 2. Funcionários com Maior Volume de Atendimentos (Uso de JOIN, COUNT e HAVING)
-- Lista apenas os funcionários que registraram mais de 5 tickets (filtragem com HAVING).
SELECT 
    f.nome AS Funcionario, 
    COUNT(t.id_ticket) AS Total_Tickets_Registrados
FROM FUNCIONARIO f
JOIN TICKET t ON f.id_funcionario = t.id_funcionario
GROUP BY f.nome
HAVING COUNT(t.id_ticket) > 5;

-- 3. Clientes VIP: Gastos Acima da Média (Uso de Subquery e Funções Agregadas)
-- Busca clientes cujo valor total gasto é maior que a média de todos os pagamentos.
SELECT 
    c.nome AS Cliente, 
    SUM(p.valor) AS Total_Gasto
FROM CLIENTE c
JOIN VEICULO v ON c.id_cliente = v.id_cliente
JOIN TICKET t ON v.id_veiculo = t.id_veiculo
JOIN PAGAMENTO p ON t.id_ticket = p.id_ticket
GROUP BY c.nome
HAVING SUM(p.valor) > (SELECT AVG(valor) FROM PAGAMENTO);

-- 4. Vagas Disponíveis no Momento (Uso de Subquery / NOT IN)
-- Lista as vagas que não estão associadas a nenhum ticket com status 'Aberto'.
SELECT 
    numero AS Vaga, 
    setor AS Setor
FROM VAGA 
WHERE id_vaga NOT IN (
    SELECT id_vaga FROM TICKET WHERE status = 'Aberto'
);

-- 5. Histórico Completo de um Ticket (Uso de Múltiplos JOINS)
-- Um relatório detalhado cruzando 5 tabelas para ver a "vida" de uma estadia.
SELECT 
    t.id_ticket AS Ticket,
    c.nome AS Cliente, 
    ve.placa AS Placa, 
    t.data_entrada AS Entrada, 
    t.data_saida AS Saida, 
    p.valor AS Valor_Pago, 
    f.nome AS Funcionario_Responsavel
FROM TICKET t
JOIN VEICULO ve ON t.id_veiculo = ve.id_veiculo
JOIN CLIENTE c ON ve.id_cliente = c.id_cliente
LEFT JOIN PAGAMENTO p ON t.id_ticket = p.id_ticket
JOIN FUNCIONARIO f ON t.id_funcionario = f.id_funcionario;
