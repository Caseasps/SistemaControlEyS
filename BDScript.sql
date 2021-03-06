USE [master]
GO
/****** Object:  Database [BDAsistenciasEyS]    Script Date: 6/1/2022 4:07:21 AM ******/
CREATE DATABASE [BDAsistenciasEyS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDAsistenciasEyS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDAsistenciasEyS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDAsistenciasEyS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BDAsistenciasEyS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDAsistenciasEyS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDAsistenciasEyS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDAsistenciasEyS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDAsistenciasEyS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDAsistenciasEyS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDAsistenciasEyS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDAsistenciasEyS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET RECOVERY FULL 
GO
ALTER DATABASE [BDAsistenciasEyS] SET  MULTI_USER 
GO
ALTER DATABASE [BDAsistenciasEyS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDAsistenciasEyS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDAsistenciasEyS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDAsistenciasEyS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDAsistenciasEyS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDAsistenciasEyS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDAsistenciasEyS', N'ON'
GO
ALTER DATABASE [BDAsistenciasEyS] SET QUERY_STORE = OFF
GO
USE [BDAsistenciasEyS]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[idAdmin] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](30) NOT NULL,
	[apellidos] [nvarchar](30) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[pw] [nvarchar](20) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[idCargo] [int] IDENTITY(1,1) NOT NULL,
	[nombreCargo] [nvarchar](50) NOT NULL,
	[descCargo] [nvarchar](50) NOT NULL,
	[idDep] [int] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_cargo] PRIMARY KEY CLUSTERED 
(
	[idCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargoEmp]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargoEmp](
	[idCargoEmp] [int] IDENTITY(1,1) NOT NULL,
	[idEmp] [int] NOT NULL,
	[idCargo] [int] NOT NULL,
 CONSTRAINT [PK_cargoEmp] PRIMARY KEY CLUSTERED 
(
	[idCargoEmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[idDep] [int] IDENTITY(1,1) NOT NULL,
	[nombreDep] [nvarchar](30) NOT NULL,
	[extTel] [nvarchar](5) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[idDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmp] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](30) NOT NULL,
	[apellidos] [nvarchar](30) NOT NULL,
	[cedula] [nvarchar](16) NOT NULL,
	[fotoEmp] [image] NULL,
	[fechaNac] [date] NOT NULL,
	[direccion] [nvarchar](100) NOT NULL,
	[telefono] [nvarchar](15) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[correoInst] [nvarchar](50) NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[idEmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registroAsistencia]    Script Date: 6/1/2022 4:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registroAsistencia](
	[idReg] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[horaEntrada] [time](0) NOT NULL,
	[horaSalida] [time](0) NOT NULL,
	[idEmp] [int] NOT NULL,
	[cedula] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_registroAsistencia] PRIMARY KEY CLUSTERED 
(
	[idReg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([idAdmin], [nombres], [apellidos], [username], [pw], [estado]) VALUES (1, N'nombre', N'apellido', N'admin', N'1234', 1)
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
ALTER TABLE [dbo].[cargo]  WITH CHECK ADD  CONSTRAINT [FK_cargo_departamento] FOREIGN KEY([idDep])
REFERENCES [dbo].[departamento] ([idDep])
GO
ALTER TABLE [dbo].[cargo] CHECK CONSTRAINT [FK_cargo_departamento]
GO
ALTER TABLE [dbo].[cargoEmp]  WITH CHECK ADD  CONSTRAINT [FK_cargoEmp_cargo] FOREIGN KEY([idCargo])
REFERENCES [dbo].[cargo] ([idCargo])
GO
ALTER TABLE [dbo].[cargoEmp] CHECK CONSTRAINT [FK_cargoEmp_cargo]
GO
ALTER TABLE [dbo].[cargoEmp]  WITH CHECK ADD  CONSTRAINT [FK_cargoEmp_empleado] FOREIGN KEY([idEmp])
REFERENCES [dbo].[empleado] ([idEmp])
GO
ALTER TABLE [dbo].[cargoEmp] CHECK CONSTRAINT [FK_cargoEmp_empleado]
GO
ALTER TABLE [dbo].[registroAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_idEmp] FOREIGN KEY([idEmp])
REFERENCES [dbo].[empleado] ([idEmp])
GO
ALTER TABLE [dbo].[registroAsistencia] CHECK CONSTRAINT [FK_idEmp]
GO
USE [master]
GO
ALTER DATABASE [BDAsistenciasEyS] SET  READ_WRITE 
GO
