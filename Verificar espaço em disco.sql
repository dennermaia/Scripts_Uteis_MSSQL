SELECT DISTINCT
    VS.volume_mount_point [Montagem] ,
    VS.logical_volume_name AS [Volume] ,
    CAST(CAST(VS.total_bytes AS DECIMAL(19, 2)) / 1024 / 1024 / 1024 AS DECIMAL(10, 2)) AS [Espaço_Total_GB] ,
    CAST(CAST(VS.available_bytes AS DECIMAL(19, 2)) / 1024 / 1024 / 1024 AS DECIMAL(10, 2)) AS [Tamanho_DisponIvel_GB] ,
    CAST(( CAST(VS.available_bytes AS DECIMAL(19, 2)) / CAST(VS.total_bytes AS DECIMAL(19, 2)) * 100 ) AS DECIMAL(10, 2)) AS [Perc_Disponivel] ,
    CAST(( 100 - CAST(VS.available_bytes AS DECIMAL(19, 2)) / CAST(VS.total_bytes AS DECIMAL(19, 2)) * 100 ) AS DECIMAL(10, 2)) AS [Perc_Utilizado]
FROM
    sys.master_files AS MF
    CROSS APPLY [sys].[dm_os_volume_stats](MF.database_id, MF.file_id) AS VS
WHERE
    CAST(VS.available_bytes AS DECIMAL(19, 2)) / CAST(VS.total_bytes AS DECIMAL(19, 2)) * 100 < 100;


--Fonte: https://dirceuresende.com/blog/sql-server-como-identificar-e-monitorar-os-discos-espaco-em-disco-total-livre-e-utilizado/