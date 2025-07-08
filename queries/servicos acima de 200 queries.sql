SELECT
    S.descricao_servico,
    SUM(S.valor_servico * OSS.quantidade_servico) AS faturamento_total_servico
FROM
    Servico S
JOIN
    Ordem_Servico_Servico OSS ON S.id_servico = OSS.id_servico
GROUP BY
    S.descricao_servico
HAVING
    SUM(S.valor_servico * OSS.quantidade_servico) > 200.00;