USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[PrecioProducto]    Script Date: 31/01/2024 19:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PrecioProducto](@codigo nvarchar (255)) as
begin
	select ID_PRODUCTO,PRECIO from [dbo].[PRODUCTO]
	where ID_PRODUCTO = @codigo
end
GO

