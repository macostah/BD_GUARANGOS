USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVente]    Script Date: 31/01/2024 19:38:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVente](@codigo nvarchar (255)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where ID_CLIENTE = @codigo
end
GO

