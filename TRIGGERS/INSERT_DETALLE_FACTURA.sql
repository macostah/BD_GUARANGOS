USE [BD_GUARANGOS]
GO

/****** Object:  Trigger [dbo].[DETALLE_FACTURA_ALERTA]    Script Date: 31/01/2024 20:24:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create trigger [dbo].[DETALLE_FACTURA_ALERTA]
	on [dbo].[DETALLE_FACTURA]
	after insert as
	begin
		print('Se insertaron los datos')
	end
GO

ALTER TABLE [dbo].[DETALLE_FACTURA] ENABLE TRIGGER [DETALLE_FACTURA_ALERTA]
GO

