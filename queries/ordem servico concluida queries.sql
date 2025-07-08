SELECT id_os, data_abertura_os, data_conclusao_os, status_os
FROM Ordem_Servico
WHERE status_os = 'Concluída'
ORDER BY data_conclusao_os DESC;