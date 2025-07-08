SELECT
    C.nome_cliente,
    COUNT(OS.id_os) AS total_ordens_servico
FROM
    Cliente C
JOIN
    Ordem_Servico OS ON C.id_cliente = OS.id_cliente
GROUP BY
    C.nome_cliente
HAVING
    COUNT(OS.id_os) > 1;