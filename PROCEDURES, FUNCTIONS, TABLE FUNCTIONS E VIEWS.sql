
--PROCEDURES, FUNCTIONS, TABLE FUNCTIONS E VIEWS 

------------------------------------------------------------------------------------------------------
											PROCEDURES
------------------------------------------------------------------------------------------------------

--Stored Procedures

--Exemplo - Stored Procedure
CREATE PROCEDURE [dbo].[stpRetornaDobro] (
    @Vl_Entrada INT NULL = 0
)
AS
BEGIN
    SELECT @Vl_Entrada * 2 AS Resultado
END

DROP PROCEDURE IF EXISTS STP_NUM_PRIM;
GO


--EXEMPLO DE STORED PROCEDURE 'VERIFICANDO O NUMERO É PRIMO'

CREATE PROCEDURE STP_NUM_PRIM (
    @VL_ENTRADA INT NULL = 1
)
AS
BEGIN

   DECLARE @AUX INT = @VL_ENTRADA
   DECLARE @CONT INT = 0
  
  WHILE(@AUX >= 1)
		BEGIN
			IF @VL_ENTRADA % @AUX = 0
				BEGIN
					SET @CONT = @CONT + 1
					SET @AUX = @AUX - 1
				END 
			ELSE 
				BEGIN
					SET @AUX = @AUX - 1
				END 
		END 

		IF(@CONT = 2)
			BEGIN
				SELECT @VL_ENTRADA + ' É NUMERO PRIMO' 
			END 
		ELSE
			BEGIN
				SELECT @VL_ENTRADA + ' NÃO É NUMERO PRIMO' 
			END 
END
go

--ALTERANDO UMA STORE PROCEDURE 

ALTER PROCEDURE STP_NUM_PRIM (
    @VL_ENTRADA INT NULL = 1
)
AS
BEGIN

   DECLARE @AUX INT = @VL_ENTRADA
   DECLARE @CONT INT = 0
  
  WHILE(@AUX >= 1)
		BEGIN
			IF @VL_ENTRADA % @AUX = 0
				BEGIN
					SET @CONT = @CONT + 1
					SET @AUX = @AUX - 1
				END 
			ELSE 
				BEGIN
					SET @AUX = @AUX - 1
				END 
		END 

		IF(@CONT = 2)
			BEGIN
				SELECT CONCAT(@VL_ENTRADA,' É NUMERO PRIMO')
			END 
		ELSE
			BEGIN
				SELECT CONCAT(@VL_ENTRADA,' NÃO É NUMERO PRIMO') 
			END 
END
go

--EXECUTANDO UMA STORED PROCEDURE

execute STP_NUM_PRIM 87

------------------------------------------------------------------------------------------------------
												FUNCTIONS
------------------------------------------------------------------------------------------------------


--Exemplo – Scalar Function:

DROP FUNCTION IF EXISTS DBO.FNC_NUM_PRIM
GO

CREATE FUNCTION [dbo].[fncCalculaAumentoSalario] (
    @Vl_Salario NUMERIC(9,2)
)
RETURNS NUMERIC(9,2)
AS
BEGIN
    RETURN @Vl_Salario * 1.1
END

--EXEMPLO DE FUNCTION 'VERIFICANDO SE O NUMERO É PRIMO'


CREATE FUNCTION FNC_NUM_PRIM (
     @VL_ENTRADA INT NULL = 1
)
RETURNS VARCHAR(60)
AS
BEGIN
   DECLARE @RESP  VARCHAR(60) = ''
   DECLARE @AUX INT = @VL_ENTRADA
   DECLARE @CONT INT = 0
  
  WHILE(@AUX >= 1)
		BEGIN
			IF @VL_ENTRADA % @AUX = 0
				BEGIN
					SET @CONT = @CONT + 1
					SET @AUX = @AUX - 1
				END 
			ELSE 
				BEGIN
					SET @AUX = @AUX - 1
				END 
		END 

		
		IF(@CONT = 2)
			BEGIN
				SET @RESP = CONCAT(@VL_ENTRADA, ' É NUMERO PRIMO')
			END 
		ELSE
			BEGIN
				 SET @RESP = CONCAT(@VL_ENTRADA,' NÃO É NUMERO PRIMO')
			END 
	RETURN @RESP
END
go

--ALTERANDO UM FUNCTION SCALAR 

ALTER FUNCTION DBO.FNC_NUM_PRIM (
     @VL_ENTRADA INT NULL = 1
)
RETURNS VARCHAR(60)
AS
BEGIN
   DECLARE @RESP  VARCHAR(60) = ''
   DECLARE @AUX INT = @VL_ENTRADA
   DECLARE @CONT INT = 0
  
  WHILE(@AUX >= 1)
		BEGIN
			IF @VL_ENTRADA % @AUX = 0
				BEGIN
					SET @CONT = @CONT + 1
					SET @AUX = @AUX - 1
				END 
			ELSE 
				BEGIN
					SET @AUX = @AUX - 1
				END 
		END 

		
		IF(@CONT = 2)
			BEGIN
				SET @RESP = CONCAT(@VL_ENTRADA, ' É NUMERO PRIMO TESTE')
			END 
		ELSE
			BEGIN
				 SET @RESP = CONCAT(@VL_ENTRADA,' NÃO É NUMERO PRIMO TESTE')
			END 
	RETURN @RESP
END
go

--CHAMADA DE UMA SCALAR FUNCTION

SELECT 
ID_CLIENTE,
DBO.FNC_NUM_PRIM(ID_CLIENTE)
FROM CLIENTE



--Exemplo – Table-Valued Function:

CREATE FUNCTION [dbo].[fncTabelaClientesRicos] (
    @Vl_Salario NUMERIC(9,2)
)
RETURNS TABLE
AS
RETURN 
    SELECT * 
    FROM [dbo].[Cliente]
    WHERE Vl_Salario >= @Vl_Salario
GO

------------------------------------------------------------------------------------------------------
											VIEWS 
------------------------------------------------------------------------------------------------------

--Exemplo - View

CREATE VIEW [dbo].[vwClientesRicos]
AS
SELECT * 
FROM [Cliente]
WHERE Vl_Salario >= 30000.00
GO

SELECT * 
FROM [dbo].[vwClientesRicos]
