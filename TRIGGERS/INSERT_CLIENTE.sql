USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[CLIENTE_ALERTA]    Script Date: 31/01/2024 19:15:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[CLIENTE_ALERTA]
	on [dbo].[CLIENTE]
	after insert as
	begin
		print('Se insertaron los datos')
	end
GO

ALTER TABLE [dbo].[CLIENTE] ENABLE TRIGGER [CLIENTE_ALERTA]
GO

