USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[SumaVentasxMess]    Script Date: 31/01/2024 19:47:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[SumaVentasxMess](@mes numeric(2,0)) returns float as
begin
	declare @suma float
	set @suma = (select sum(TOTAL) from [dbo].[DETALLE_FACTURA]
					where MES_VENTA = @mes)
	return @suma
end
GO

