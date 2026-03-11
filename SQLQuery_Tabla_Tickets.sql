USE [DB]
GO

/****** Object:  Table [dbo].[tickets]    Script Date: 3/11/2026 4:53:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tickets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[id_cliente] [int] NOT NULL,
	[active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tickets] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO

ALTER TABLE [dbo].[tickets] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO

ALTER TABLE [dbo].[tickets] ADD  DEFAULT ((1)) FOR [active]
GO

ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_Tickets_Clientes]
GO


