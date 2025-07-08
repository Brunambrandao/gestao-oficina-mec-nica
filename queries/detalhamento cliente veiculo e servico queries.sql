SELECT
    C.nome_cliente,
    V.placa_veiculo,
    V.modelo_veiculo,
    OS.id_os,
    OS.data_abertura_os,
    OS.status_os
FROM
    Cliente C
LEFT JOIN
    Veiculo V ON C.id_cliente = V.id_cliente
LEFT JOIN
    Ordem_Servico OS ON V.id_veiculo = OS.id_veiculo
ORDER BY
    C.nome_cliente, V.placa_veiculo;