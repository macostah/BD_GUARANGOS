USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[VentasxClienteyFecha]    Script Date: 31/01/2024 19:44:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VentasxClienteyFecha](@Cliente nvarchar(255), @Fecha nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where FECHA_VENTA = @Fecha
		AND NOMRE_CLIENTE = @Cliente
)
GO

