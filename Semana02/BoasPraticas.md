Orientações gerais para boas práticas na construção de modelos de dados físicos em SGBD relacional.

Seja qual for o formato adotado, tenha consistência e use identificadores e nomes descritivos.

## REGRAS GERAIS

- Nunca use espaços em branco em nomes e identificadores.
- Nunca use hífen, acentos e caracteres especiais em nomes e identificadores.
- Use apenas letras, números e underscore (_) em nomes e identificadores.
- Todos os nomes e identificadores devem iniciar sempre com letras e não terminar com underscore.
- Não usar palavras reservadas como: INSERT, DELETE, SELECT e etc.
- Não usar mais que 30 caracteres para criar nomes e identificadores.
- Crie nomes sucintos e objetivos, evite várias interpretações. 

## RECOMENDAÇÕES

- Não usar verbos para nomes e identificadores.
- Não utilizar palavras no plural e use termos coletivos quando for possível.
- Evite o uso de preposições, números e nomes próprios na composição de nomes e identificadores.
- Evite CamelCase, pois é mais difícil de ler rapidamente.
- Para nomes das colunas use singular e adote letras minúsculas.
- Você pode separar nomes compostos com underscore (_);
- Se optar por usar prefixos, defina um padrão para todas as tabelas e colunas. 
- Não dê o mesmo nome para uma tabela que está sendo usado como coluna (vice-versa).
- Prefira usar um termo que descreva a união de duas tabelas (Ex.: FUNCIONARIO_PROJETO -> ALOCACAO).
- Se já existir uma coluna que tem valor único, escolha ela como chave-primária (Ex,: CPF, RG, CNH...)
- Defina se você utilizará maiúsculo OU minúsculo. Se definir que o nome de tabelas será maiúsculo e os campos serão em minúsculo, use da mesma forma para todo o banco de dados.

## REFERÊNCIAS IMPORTANTES

- BRUMM, Bem. SQL Best Practices. DatabaseStar. Disponível em: <https://www.databasestar.com/sql-best-practices>.
- ELMASRI, Ramez; NAVATHE, Shamkant. Sistemas de Banco de Dados. 7ª Edição. São Paulo: Pearson, 2019.
- HAUSER, Carlos Alberto. Projeto de Banco de Dados. Série de livros didáticos Informática UFRGS. 6ª Edição. Porto Alegre: Bookman, 2009.
- HOLYWELL, Simon. SQL Style Guide. Disponível em: <https://www.sqlstyle.guide>.
- SPACEPROGRAMMER. Mapeamento Conceitual para Lógico Relacional. Disponível em: <http://spaceprogrammer.com/bd/regras-de-mapeamento-esquema-er-para-logico-relacional>.
- SQL MAGAZINE. Padronização de nomenclatura. DevMedia - Revista SQL Magazine 100. Disponível em: <https://www.devmedia.com.br/revista-sql-magazine-100/24697>.
