SELECT
    OS.id_os,
    (COALESCE(SUM(S.valor_servico * OSS.quantidade_servico), 0) + COALESCE(SUM(P.valor_unitario_peca * OSP.quantidade_peca), 0)) AS valor_total_os_calculado
FROM
    Ordem_Servico OS
LEFT JOIN
    Ordem_Servico_Servico OSS ON OS.id_os = OSS.id_os
LEFT JOIN
    Servico S ON OSS.id_servico = S.id_servico
LEFT JOIN
    Ordem_Servico_Peca OSP ON OS.id_os = OSP.id_os
LEFT JOIN
    Peca P ON OSP.id_peca = P.id_peca
GROUP BY
    OS.id_os;