USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[SumaVentasxFechaa]    Script Date: 31/01/2024 19:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[SumaVentasxFechaa](@FechaVenta nvarchar(255)) returns float as
begin
	declare @suma float
	set @suma = (select SUM(TOTAL) from [dbo].[DETALLE_FACTURA]
				where FECHA_VENTA = @FechaVenta)
	return @suma
end
GO

