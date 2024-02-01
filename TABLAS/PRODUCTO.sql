USE [BD_GUARANGOS]
GO

/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 31/01/2024 19:17:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PRODUCTO](
	[ID_PRODUCTO] [nvarchar](255) NULL,
	[NOMBRE_PRODUCTO] [nvarchar](255) NULL,
	[PRECIO] [money] NULL
) ON [PRIMARY]
GO

