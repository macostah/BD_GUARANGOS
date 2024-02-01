USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaProductoMayor50000]    Script Date: 31/01/2024 19:36:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaProductoMayor50000](@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
	and TOTAL > 50000
end
GO

