USE [BD_GUARANGOS]
GO

/****** Object:  Table [dbo].[DETALLE_FACTURA]    Script Date: 31/01/2024 19:16:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DETALLE_FACTURA](
	[ID_VENTA] [nvarchar](255) NULL,
	[FECHA_VENTA] [nvarchar](255) NULL,
	[TIPO_PAGO] [nvarchar](255) NULL,
	[ID_CLIENTE] [nvarchar](255) NULL,
	[NOMRE_CLIENTE] [nvarchar](255) NULL,
	[ID_PRODUCTO] [nvarchar](255) NULL,
	[NOMBRE_PRODUCTO] [nvarchar](255) NULL,
	[CANTIDAD] [float] NULL,
	[KILOS] [float] NULL,
	[PRECIO] [float] NULL,
	[TOTAL] [float] NULL,
	[MES_VENTA] [numeric](2, 0) NULL
) ON [PRIMARY]
GO

