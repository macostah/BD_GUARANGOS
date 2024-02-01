USE [BD_GUARANGOS]
GO

/****** Object:  StoredProcedure [dbo].[DetalleVentaMesMayores50000]    Script Date: 31/01/2024 19:31:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DetalleVentaMesMayores50000](@mes numeric(2,0)) as
begin
	select * from [dbo].[DETALLE_FACTURA]
	where MES_VENTA = @mes
	and TOTAL > 50000
end
GO

