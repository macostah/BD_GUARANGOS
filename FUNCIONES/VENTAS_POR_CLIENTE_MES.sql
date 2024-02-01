USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[VentasxMesyCliente]    Script Date: 31/01/2024 19:45:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VentasxMesyCliente](@mes numeric(2,0), @Cliente nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where	MES_VENTA = @mes
		AND NOMRE_CLIENTE = @Cliente 
)
GO

