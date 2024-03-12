

	--Query para conferir o histórico de Backups que foram executados

    SELECT	database_name, name,backup_start_date, datediff(mi, backup_start_date, backup_finish_date) [tempo (min)],
		position, server_name, recovery_model, isnull(logical_device_name, ' ') logical_device_name, device_type, 
		type, cast(backup_size/1024/1024 as numeric(15,2)) [Tamanho (MB)]
FROM msdb.dbo.backupset B
	  INNER JOIN msdb.dbo.backupmediafamily BF ON B.media_set_id = BF.media_set_id
where backup_start_date >=  dateadd(hh, -24 ,getdate()  )
--  and type in ('D','I')
order by backup_start_date desc

--	Guardem muito bem essa query que utilizaram uma infinidade de vezes como DBA para conferir Backups!!!
--	D = FULL, I = Diferencial, L = Log



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

  --	Apenas para validar o nome lógico dos arquivos de dados e logs
RESTORE FILELISTONLY
FROM DISK = 'Caminho onde se encontra o arquivo.bak'
  
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


--Restore do Log com STOP AT
--	Restore Log até determinado horário(hora, minuto, segundo, centésimos)
RESTORE LOG TreinamentoDBA
FROM DISK = 'Caminho do Arquivo.bak'
WITH RECOVERY,STOPAT = 'ano/mes/dia hora:minuto:segundo.centésimos'




