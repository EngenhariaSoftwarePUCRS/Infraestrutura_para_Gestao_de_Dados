-- 2. Listar o nome dos clientes, bem como os números e as datas de emissão dos seus pedidos.
SELECT
    c.nome
    ,p.num_pedido
    ,p.data_emissao
FROM cliente c
JOIN pedido p
    ON p.cod_cliente = c.cod_cliente
ORDER BY
    c.nome
    ,p.data_emissao
    ,p.num_pedido
;
