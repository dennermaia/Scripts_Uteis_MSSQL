--Mostra o valor atual do IDENTITY e o próximo valor a ser usado.

DBCC CHECKIDENT ('NomeDaTabela', NORESEED);

--Faz com que o próximo valor inserido seja 1000 + 1 = 1000 (se a tabela estiver vazia, o próximo será exatamente 999 + 1).

DBCC CHECKIDENT ('NomeDaTabela', RESEED, 999);
