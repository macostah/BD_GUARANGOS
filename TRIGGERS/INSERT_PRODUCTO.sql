USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[PRODUCTO_ALERTA]    Script Date: 31/01/2024 19:17:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[PRODUCTO_ALERTA]
	on [dbo].[PRODUCTO]
	after insert as
	begin
		print('Se insertaron los datos')
	end
GO

ALTER TABLE [dbo].[PRODUCTO] ENABLE TRIGGER [PRODUCTO_ALERTA]
GO

