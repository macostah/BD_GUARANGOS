USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[DETALLE_FACTURA_ALERTA2]    Script Date: 31/01/2024 20:24:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[DETALLE_FACTURA_ALERTA2]
	on [dbo].[DETALLE_FACTURA]
	after delete as
	begin
		print('Se eliminaron los datos')
	end
GO

ALTER TABLE [dbo].[DETALLE_FACTURA] ENABLE TRIGGER [DETALLE_FACTURA_ALERTA2]
GO

