USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[CLIENTE_ALERTA2]    Script Date: 31/01/2024 19:16:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[CLIENTE_ALERTA2]
	on [dbo].[CLIENTE]
	after delete as
	begin
		print('Se eliminaron los datos')
	end
GO

ALTER TABLE [dbo].[CLIENTE] ENABLE TRIGGER [CLIENTE_ALERTA2]
GO

