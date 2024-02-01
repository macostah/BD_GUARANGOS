USE [BD_GUARANGOS]
GO

/****** Object:  View [dbo].[VW_ClientesTops]    Script Date: 31/01/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_ClientesTops] as
select top(4) NOMRE_CLIENTE, sum(TOTAL) Total_venta from [dbo].[DETALLE_FACTURA]
group by NOMRE_CLIENTE
order by 2 desc
GO

