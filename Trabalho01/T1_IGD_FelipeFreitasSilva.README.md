# Trabalho 01 - Infraestrutura Para Gestão de Dados

## Professora - Aline de Campos

## Aluno - Felipe Freitas Silva

### Enunciado

Você deverá fazer uma reflexão crítica sobre o experimento e os resultados.
Para tanto, apresente um breve texto (mínimo 15 linhas, máximo 30 linhas) refletindo acerca do experimento, onde, nas suas palavras, seja possível demonstrar sua compreensão dos aspectos mais relevantes da escolha e adoção das diferentes estratégias de otimização. Adicione quaisquer outras observações que considerar pertinentes.

### Reflexão Crítica e Resumo dos Experimentos

Na busca a, é interessante que tinhamos um join, um and e liamos duas tabelas por inteiro para buscar um dado relativamente simples (nome, idade e endereço de uma pessoa), porém, ao adicionar indíces nas chaves utilizadas para os filtros, muitas operações de baixo nível (bitwise) foram realizadas e as tabelas foram acessadas "By Index RowID", ou seja muito mais eficientemente. Não sei, porém, porque consta um "Full access" a tabela AIR_PASSENGERS.

Na busca b, é interessante que as imagens constrastam com as da busca a, isto é, na busca a realizamos menos passos, porém mais custosos, antes de aplicarmos os indices, enquanto na busca b tinhamos muitos passos muito custosos claramente exibidos e, após aplicarmos os índices, o plano de explicação fica muito mais conciso e eficiente. Não entendo o porque de o select aparecer com cardinalidade maior inicialmente, mas certamente o custo diminuiu e a busca melhorou, visto que não reaizamos todos os joins e acessos as tabelas inteiras logo de cara.

Na consulta C, parece que temos algo similar ao caso anterior; melhoramos muito o acesso às tabelas (JOINs) e diminuimos o custo final da seleção.

Na consulta D, mesmo tendo acessado as colunas das tabelas dentro de uma função, como criamos indices já considerando esta transformação, foi possível obter uma melhora ao final da execução.
