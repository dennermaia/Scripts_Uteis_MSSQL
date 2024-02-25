




--	Alterando o Recovery Model da base para FULL para que eu possa realizar Backups do Log

ALTER DATABASE [data-base] SET RECOVERY FULL

--	Realizando um Backup FULL
BACKUP DATABASE Nome_Banco
TO DISK = 'Destino\Nome_arquivo.bak'
WITH INIT, COMPRESSION, CHECKSUM, STATS = 5 ,NAME = 'Destino\Nome_arquivo.bak'

--	Realizando um Backup Diferencial
BACKUP DATABASE Nome_Banco
TO DISK = 'Destino\Nome_arquivo.bak'
WITH DIFFERENTIAL, INIT, COMPRESSION, CHECKSUM, STATS = 5,NAME = 'Destino\Nome_arquivo.bak'

--	Realizando um Backup do Log
BACKUP LOG Nome_Banco
TO DISK = 'Destino\Nome_arquivo.bak'
WITH INIT, COMPRESSION, CHECKSUM,NAME = 'Destino\Nome_arquivo.bak'



---- Restore criando uma nova database
RESTORE DATABASE Nome_Banco
FROM DISK = 'Caminho\Nome_arquivo.bak'
WITH RECOVERY,STATS = 5,
MOVE 'Nome_Banco' TO 'Destino\Nome_Banco.mdf',
MOVE 'Nome_Banco_log' TO 'Destino\Nome_Banco_Log.ldf'


--RESTURANDO BACKUPS FULL, DIFF E LOG

use master

--	Restore FULL
RESTORE DATABASE Nome_Banco
FROM DISK = 'Caminho\Nome_arquivo.bak'
WITH NORECOVERY, REPLACE, STATS = 5

--	Restore Diferencial
RESTORE DATABASE Nome_Banco
FROM disk = 'Caminho\Nome_arquivo.bak'
WITH NORECOVERY, REPLACE, STATS = 5

--	Restore de 1 Backup do Log
RESTORE LOG Nome_Banco
FROM DISK = 'Caminho\Nome_arquivo.bak.bak'
WITH NORECOVERY

--	Comando para deixar a database ONLINE
restore database Nome_banco with recovery






