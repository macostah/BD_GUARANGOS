USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaProductoMayor3000]    Script Date: 31/01/2024 19:35:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaProductoMayor3000](@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
	and TOTAL > 3000
end
GO

