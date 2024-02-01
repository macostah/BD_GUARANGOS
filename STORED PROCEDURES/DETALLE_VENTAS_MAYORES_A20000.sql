USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaMayor20000]    Script Date: 31/01/2024 19:30:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaMayor20000](@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_CLIENTE = @codigo
	and TOTAL > 20000
end
GO

