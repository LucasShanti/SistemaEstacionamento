START TRANSACTION;

UPDATE TICKET 
SET data_saida = NOW(), valor_total = 25.00, status = 'Fechado' 
WHERE id_ticket = 1;

SAVEPOINT ticket_atualizado;

INSERT INTO PAGAMENTO (id_ticket, forma_pagamento, valor, data_pagamento) 
VALUES (1, 'Cartão de Crédito', 25.00, NOW());

SAVEPOINT pagamento_registrado;

UPDATE VAGA 
SET status = 'Disponivel' 
WHERE id_vaga = (SELECT id_vaga FROM TICKET WHERE id_ticket = 1);

COMMIT;
