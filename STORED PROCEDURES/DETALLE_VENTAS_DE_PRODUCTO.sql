USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaProducto]    Script Date: 31/01/2024 19:34:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaProducto](@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_PRODUCTO = @codigo
end
GO

