USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[SumaVentasxClientee]    Script Date: 31/01/2024 19:47:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[SumaVentasxClientee](@Cliente nvarchar(255)) returns float as
begin
	declare @suma float
	set @suma = (select sum(TOTAL) from [dbo].[DETALLE_FACTURA]
				where NOMRE_CLIENTE = @Cliente)
	return @suma
end
GO

