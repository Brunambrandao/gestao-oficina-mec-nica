SELECT
    OS.id_os,
    C.nome_cliente,
    V.placa_veiculo,
    S.descricao_servico,
    OSS.quantidade_servico
FROM
    Ordem_Servico OS
JOIN
    Cliente C ON OS.id_cliente = C.id_cliente
JOIN
    Veiculo V ON OS.id_veiculo = V.id_veiculo
JOIN
    Ordem_Servico_Servico OSS ON OS.id_os = OSS.id_os
JOIN
    Servico S ON OSS.id_servico = S.id_servico
ORDER BY
    OS.id_os;