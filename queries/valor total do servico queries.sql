SELECT
    OS_S.id_os,
    S.descricao_servico,
    OS_S.quantidade_servico,
    (S.valor_servico * OS_S.quantidade_servico) AS valor_total_servico_os
FROM
    Ordem_Servico_Servico OS_S
JOIN
    Servico S ON OS_S.id_servico = S.id_servico;