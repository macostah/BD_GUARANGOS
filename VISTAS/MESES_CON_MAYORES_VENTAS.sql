USE [BD_GUARANGOS]
GO

/****** Object:  View [dbo].[VW_VentasMayores1800000]    Script Date: 31/01/2024 19:20:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Vista para Mostrar los meses donde ventas totales superaron S/1800000
create view [dbo].[VW_VentasMayores1800000] as
select MES_VENTA, SUM(TOTAL) VENTA_TOTAL FROM [dbo].[DETALLE_FACTURA]
group by MES_VENTA
having SUM(TOTAL)>1800000
GO

