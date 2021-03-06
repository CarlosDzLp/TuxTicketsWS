USE [Tickets]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[UrlImagen] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialUsuarioTickets]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialUsuarioTickets](
	[IdHistorial] [uniqueidentifier] NOT NULL,
	[IdUsuario] [uniqueidentifier] NOT NULL,
	[IdSubCategoria] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategorias]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategorias](
	[IdSubCategoria] [uniqueidentifier] NOT NULL,
	[IdCategoria] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[UrlImagen] [text] NOT NULL,
	[PrecioNormal] [smallmoney] NOT NULL,
	[PrecioDescuento] [smallmoney] NOT NULL,
	[CodigoDescuento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Sexo] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[TipoLogin] [varchar](50) NOT NULL,
	[UrlImagen] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistorialUsuarioTickets]  WITH CHECK ADD FOREIGN KEY([IdSubCategoria])
REFERENCES [dbo].[SubCategorias] ([IdSubCategoria])
GO
ALTER TABLE [dbo].[HistorialUsuarioTickets]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[SubCategorias]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
/****** Object:  StoredProcedure [dbo].[spInsAddHistorial]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spInsAddHistorial]
(
    -- Add the parameters for the stored procedure here
    @IdUsuario uniqueidentifier,
	@IdSubCategoria uniqueidentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO [dbo].[HistorialUsuarioTickets]([IdHistorial],[IdUsuario],[IdSubCategoria])VALUES(NEWID(),@IdUsuario,@IdSubCategoria);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsCategoria]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spInsCategoria]
(
    -- Add the parameters for the stored procedure here
	@IdCategoria uniqueidentifier,
    @Nombre varchar(50),
	@Descripcion text,
	@UrlImage text
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO [dbo].[Categorias]([IdCategoria],[Nombre],[Descripcion],[UrlImagen])VALUES(NEWID(),@Nombre,@Descripcion,@UrlImage);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertUsuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spInsertUsuario]
(
    -- Add the parameters for the stored procedure here
    @Nombre varchar(50),
	@Apellidos varchar(50),
	@Sexo varchar(50),
	@Correo varchar(50),
	@Contrasena varchar(50),
	@TipoLogin varchar(50),
	@UrlImage text
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    Insert into [dbo].[Usuario]([IdUsuario],[Nombre],[Apellidos],[Sexo],[Correo],[Contrasena],[TipoLogin],[UrlImagen])
	values(NEWID(),@Nombre,@Apellidos,@Sexo,@Correo,@Contrasena,@TipoLogin,@UrlImage);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsHistorialUsuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spInsHistorialUsuario]
(
    -- Add the parameters for the stored procedure here
	@IdUsuario uniqueidentifier,
    @IdSubCategoria uniqueidentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO [dbo].[HistorialUsuarioTickets]([IdHistorial],[IdUsuario],[IdSubCategoria])VALUES(NEWID(),@IdUsuario,@IdSubCategoria);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsSubCategoria]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spInsSubCategoria]
(
    -- Add the parameters for the stored procedure here
	@IdCategoria uniqueidentifier,
    @Nombre varchar(50),
	@Descripcion text,
	@UrlImage text,
	@PrecioNormal smallmoney,
	@PrecioDescuento smallmoney,
	@CodigoDescuento int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO [dbo].[SubCategorias]([IdSubCategoria],[IdCategoria],[Nombre],[Descripcion],[UrlImagen],[PrecioNormal],[PrecioDescuento],[CodigoDescuento])
	VALUES(NEWID(),@IdCategoria,@Nombre,@Descripcion,@UrlImage,@PrecioNormal,@PrecioDescuento,@CodigoDescuento);
END
GO
/****** Object:  StoredProcedure [dbo].[spSelCategorias]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spSelCategorias]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT [IdCategoria],[Nombre],[Descripcion],[UrlImagen] FROM [dbo].[Categorias];
END
GO
/****** Object:  StoredProcedure [dbo].[spSelHistorialUsuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spSelHistorialUsuario]
(
	@IdUsuario uniqueidentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT s.IdSubCategoria,s.Nombre,s.Descripcion,s.UrlImagen,s.PrecioNormal,s.PrecioDescuento,s.CodigoDescuento FROM HistorialUsuarioTickets as h, SubCategorias as s where h.IdSubCategoria = s.IdSubCategoria AND h.IdUsuario =@IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[spSelSubCategorias]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spSelSubCategorias]
(
	@IdCategoria uniqueidentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT [IdSubCategoria],[IdCategoria],[Nombre],[Descripcion],[UrlImagen],[PrecioNormal],[PrecioDescuento],[CodigoDescuento] FROM [dbo].[SubCategorias] WHERE [IdCategoria] = @IdCategoria;
END
GO
/****** Object:  StoredProcedure [dbo].[spSelUsuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spSelUsuario]
(
    -- Add the parameters for the stored procedure here
	@Correo varchar(50),
	@Contrasena varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    Select [IdUsuario],[Nombre],[Apellidos],[Sexo],[Correo],[Contrasena],[TipoLogin],[UrlImagen] from [dbo].[Usuario] where [Correo] = @Correo and [Contrasena] = @Contrasena;
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUsuario]    Script Date: 04/10/2018 04:19:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateUsuario]
(
    -- Add the parameters for the stored procedure here
	@IdUsaurio uniqueidentifier,
    @Nombre varchar(50),
	@Apellidos varchar(50),
	@Sexo varchar(50),
	@Correo varchar(50),
	@Contrasena varchar(50),
	@TipoLogin varchar(50),
	@UrlImage text
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    UPDATE [dbo].[Usuario] SET [Nombre] = @Nombre, [Apellidos] = @Apellidos, [Sexo] = @Sexo , [Correo] = @Correo ,[Contrasena] = @Contrasena , [TipoLogin] = @TipoLogin ,[UrlImagen] = @UrlImage where [IdUsuario] = @IdUsaurio;
END
GO
