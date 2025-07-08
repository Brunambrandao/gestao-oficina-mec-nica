SELECT
    M.nome_mecanico,
    COUNT(OS.id_os) AS total_os_concluidas
FROM
    Mecanico M
JOIN
    Ordem_Servico OS ON M.id_mecanico = OS.id_mecanico
WHERE
    OS.status_os = 'Concluída'
    AND OS.data_conclusao_os BETWEEN '2025-06-01' AND '2025-06-30'
GROUP BY
    M.nome_mecanico
ORDER BY
    total_os_concluidas DESC
LIMIT 1; -- Para mostrar apenas o mecânico com mais OS