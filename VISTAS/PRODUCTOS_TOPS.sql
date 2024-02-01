USE [BD_GUARANGOS]
GO

/****** Object:  View [dbo].[VW_ProductosTops]    Script Date: 31/01/2024 19:19:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_ProductosTops] as
select top(4) NOMBRE_PRODUCTO, sum(TOTAL) Total_ventas from [dbo].[DETALLE_FACTURA]
group by NOMBRE_PRODUCTO
order by 2 desc
GO

