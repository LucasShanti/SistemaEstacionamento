-- ============================================================================
-- ETAPA 4: TRANSAÇÕES E OPERAÇÕES AVANÇADAS (ENTREGA FINAL)
-- ============================================================================

-- CASO 1: Transação Bem-Sucedida (Cenário de Sucesso com COMMIT)
-- Objetivo: Simular a saída de um veículo. O sistema calcula o valor, atualiza o ticket e libera a vaga. 
-- Tudo precisa acontecer junto. Se der certo, salva no banco.

START TRANSACTION;

-- 1. Atualiza o ticket com os dados de saída e o valor total
UPDATE TICKET 
SET data_saida = NOW(), valor_total = 20.00, status = 'Fechado' 
WHERE id_ticket = 1;

-- 2. Registra o pagamento na tabela correspondente
INSERT INTO PAGAMENTO (id_ticket, forma_pagamento, valor, data_pagamento) 
VALUES (1, 'PIX', 20.00, NOW());

-- 3. Libera a vaga mudando o status para 'Disponivel'
UPDATE VAGA 
SET status = 'Disponivel' 
WHERE id_vaga = (SELECT id_vaga FROM TICKET WHERE id_ticket = 1);

-- Como todas as operações deram certo, confirmamos e salvamos permanentemente
COMMIT;


-- ============================================================================


-- CASO 2: Transação com Falha (Cenário de Consistência com ROLLBACK)
-- Objetivo: Tentar registrar a entrada de um carro em uma vaga ocupada.
-- O sistema deve simular um erro e desfazer qualquer alteração para não corromper os dados.

START TRANSACTION;

-- 1. Tenta criar o ticket para uma vaga que o sistema descobriu estar 'Ocupada'
INSERT INTO TICKET (id_veiculo, id_vaga, id_funcionario, data_entrada, status)
VALUES (2, 5, 1, NOW(), 'Aberto');

-- Simulação de Erro de Consistência:
-- O sistema roda uma verificação e detecta que a vaga de ID 5 já estava ocupada por outro carro.
-- Para evitar que dois carros fiquem na mesma vaga no sistema, o Rollback é acionado:

ROLLBACK;
-- O ROLLBACK garante que o ticket acima NUNCA existiu no banco de dados, cancelando a operação.
