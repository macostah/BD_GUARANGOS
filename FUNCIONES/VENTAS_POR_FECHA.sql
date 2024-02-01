USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[VentasxFecha]    Script Date: 31/01/2024 19:44:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VentasxFecha](@FechaVenta nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where FECHA_VENTA = @FechaVenta
)
GO

