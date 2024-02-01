USE [BD_GUARANGOS]
GO

/****** Object:  UserDefinedFunction [dbo].[VentasxClientes]    Script Date: 31/01/2024 19:44:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VentasxClientes](@Cliente nvarchar(255)) returns table as
return(
		select * from [dbo].[DETALLE_FACTURA]
		where NOMRE_CLIENTE = @Cliente
)
GO

