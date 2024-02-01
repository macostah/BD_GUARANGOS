USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[PRODUCTO_ALERTA2]    Script Date: 31/01/2024 19:17:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[PRODUCTO_ALERTA2]
	on [dbo].[PRODUCTO]
	after delete as
	begin
		print('Se eliminaron los datos')
	end
GO

ALTER TABLE [dbo].[PRODUCTO] ENABLE TRIGGER [PRODUCTO_ALERTA2]
GO

