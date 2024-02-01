USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DatosProducto]    Script Date: 31/01/2024 19:29:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DatosProducto](@codigo nvarchar (255)) as
begin
	select * from [dbo].[PRODUCTO]
	where ID_PRODUCTO = @codigo
end
GO

