SELECT V.placa_veiculo, V.marca_veiculo, V.modelo_veiculo
FROM Veiculo V
JOIN Cliente C ON V.id_cliente = C.id_cliente
WHERE C.nome_cliente = 'João Silva';