USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaMes]    Script Date: 31/01/2024 19:30:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaMes](@mes numeric(2,0)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where MES_VENTA = @mes
end
GO

