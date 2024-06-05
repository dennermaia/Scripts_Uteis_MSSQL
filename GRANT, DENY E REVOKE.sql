


--GRANT, DENY E REVOKE


--COMANDO PARA VERIFICAR AS PERMISSÕES DO USUÁRIO

EXEC AdventureWorks2022.dbo.sp_helprotect 
    @username = 'NOME DO NOME DO USUARIO'  
go

=================================================================
--COMANDO PARA TESTAR AS PERMISSÕES DO USUARIO

SETUSER 'NOME_USUARIO'
GO

--REVERTER
SETUSER;
=================================================================

--OPÇÕES DE GRANT, DENY E ROVOKE PARA TABELAS 
USE [BASE_DADOS];
GO

--REVOKE
--DENY
GRANT
       ALTER,
       ALTER ANY ASSEMBLY,
       AUTHENTICATE,
       CONNECT,
       CREATE AGGREGATE,
       CREATE ASSEMBLY,
       CREATE DEFAULT,
       CREATE FUNCTION,
       CREATE PROCEDURE,
       CREATE SYNONYM,
       CREATE TABLE,
       CREATE VIEW,
       DELETE,
       EXECUTE,
       INSERT,
       REFERENCES,
       SELECT,
       SHOWPLAN,
       UPDATE,
       VIEW DATABASE STATE,
       VIEW DEFINITION,
ON [NOME_TABELA] TO [NOME_USUARIO];
GO

=================================================================

--OPÇÕES DE GRANT, DENY E ROVOKE PARA SCHEMAS 

--REVOKE
--DENY
GRANT
       ALTER,
       ALTER ANY ASSEMBLY,
       AUTHENTICATE,
       CONNECT,
       CREATE AGGREGATE,
       CREATE ASSEMBLY,
       CREATE DEFAULT,
       CREATE FUNCTION,
       CREATE PROCEDURE,
       CREATE SYNONYM,
       CREATE TABLE,
       CREATE VIEW,
       DELETE,	-- PARA REGISTROS
       EXECUTE, --PROCEDURES
       INSERT,
       REFERENCES,
       SELECT,
       SHOWPLAN,
       UPDATE,
       VIEW DATABASE STATE,
       VIEW DEFINITION,
       ON SCHEMA :: [NOME_SCHEMA]
TO [NOME_USUARIO];
GO

=================================================================