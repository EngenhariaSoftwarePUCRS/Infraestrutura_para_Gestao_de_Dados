-- 2. Listar o nome dos clientes, bem como os números e as datas de emissão dos seus pedidos
-- , mas apenas para os pedidos efetuados no mês de setembro de 2019.
SELECT
    c.nome
    ,p.num_pedido
    ,p.data_emissao
FROM cliente c
JOIN pedido p
    ON p.cod_cliente = c.cod_cliente
WHERE data_emissao BETWEEN TO_DATE('01-09-2019', 'DD-MM-YYYY')
                       AND TO_DATE('30-09-2019', 'DD-MM-YYYY')
ORDER BY
    p.data_emissao
    ,c.nome
    ,p.num_pedido
;
