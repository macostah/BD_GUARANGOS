USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[VentasxMes]    Script Date: 31/01/2024 19:45:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VentasxMes](@mes numeric(2,0)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where MES_VENTA = @mes
)
GO

