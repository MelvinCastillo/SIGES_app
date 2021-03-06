USE [master]
GO
/****** Object:  Database [CAID_H]    Script Date: 3/7/2015 10:43:59 AM ******/
CREATE DATABASE [CAID_H]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CAID_H', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CAID_H.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CAID_H_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CAID_H_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CAID_H] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CAID_H].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CAID_H] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CAID_H] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CAID_H] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CAID_H] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CAID_H] SET ARITHABORT OFF 
GO
ALTER DATABASE [CAID_H] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CAID_H] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CAID_H] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CAID_H] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CAID_H] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CAID_H] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CAID_H] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CAID_H] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CAID_H] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CAID_H] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CAID_H] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CAID_H] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CAID_H] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CAID_H] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CAID_H] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CAID_H] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CAID_H] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CAID_H] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CAID_H] SET RECOVERY FULL 
GO
ALTER DATABASE [CAID_H] SET  MULTI_USER 
GO
ALTER DATABASE [CAID_H] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CAID_H] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CAID_H] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CAID_H] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CAID_H', N'ON'
GO
USE [CAID_H]
GO
/****** Object:  Table [dbo].[HIST_PAX00000]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_PAX00000](
	[HIDX] [int] IDENTITY(1,1) NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[RECORDID] [int] NOT NULL,
	[CATEGORIAID] [varchar](50) NOT NULL,
	[NOMBRE1] [varchar](25) NOT NULL,
	[NOMBRE2] [varchar](25) NOT NULL,
	[APELLIDO1] [varchar](25) NOT NULL,
	[APELLIDO2] [varchar](25) NOT NULL,
	[FULLNAME] [varchar](125) NOT NULL,
	[APODO] [varchar](50) NOT NULL,
	[FNACE] [datetime] NOT NULL,
	[PAISID] [varchar](50) NOT NULL,
	[CIUDADID] [varchar](50) NOT NULL,
	[SEXOID] [varchar](50) NOT NULL,
	[ESASEGURADO] [bit] NOT NULL,
	[ARSID] [varchar](50) NOT NULL,
	[NSSID] [varchar](50) NOT NULL,
	[COINDICION] [int] NOT NULL,
	[RESIDECON] [int] NOT NULL,
	[RESIDECON1] [varchar](50) NOT NULL,
	[CUIDADOPOR] [int] NOT NULL,
	[CUIDADOPOR1] [varchar](50) NOT NULL,
	[AGENTSOCIALID] [varchar](50) NOT NULL,
	[MEDICOID] [varchar](50) NOT NULL,
	[TERAPISTAID] [varchar](50) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_PAX00000] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIST_PAX00200]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_PAX00200](
	[HIDX] [int] IDENTITY(1,1) NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DESCUENTO] [decimal](18, 2) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_PAX00200] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIST_SMX00001]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_SMX00001](
	[HIDX] [int] IDENTITY(1,1) NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[CODIGOID] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_SMX00001] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIST_SMX00002]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_SMX00002](
	[HIDX] [int] IDENTITY(1,1) NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[CODIGOID] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](100) NOT NULL,
	[PAISID] [varchar](50) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_SMX00002] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIST_SMX30013]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_SMX30013](
	[HIDX] [int] IDENTITY(1,1) NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_SMX30013] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HIST_SMX30015]    Script Date: 3/7/2015 10:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HIST_SMX30015](
	[HIDX] [int] NOT NULL,
	[HFECHA] [datetime] NOT NULL,
	[HACCION] [varchar](2) NOT NULL,
	[HUSERID] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[ROWIDX] [int] NOT NULL,
	[ROWGUID] [varchar](50) NOT NULL,
	[ROWCDTE] [datetime] NOT NULL,
	[ROWMDTE] [datetime] NOT NULL,
	[ROWUSERID] [varchar](50) NOT NULL,
	[ROWSGXID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HIST_SMX30015] PRIMARY KEY CLUSTERED 
(
	[HIDX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[HIST_PAX00000] ADD  CONSTRAINT [DF_HIST_PAX00000_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_PAX00000] ADD  CONSTRAINT [DF_HIST_PAX00000_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_PAX00000] ADD  CONSTRAINT [DF_HIST_PAX00000_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_PAX00000] ADD  CONSTRAINT [DF_HIST_PAX00000_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_PAX00000] ADD  CONSTRAINT [DF_HIST_PAX00000_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
ALTER TABLE [dbo].[HIST_PAX00200] ADD  CONSTRAINT [DF_HIST_PAX00200_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_PAX00200] ADD  CONSTRAINT [DF_HIST_PAX00200_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_PAX00200] ADD  CONSTRAINT [DF_HIST_PAX00200_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_PAX00200] ADD  CONSTRAINT [DF_HIST_PAX00200_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_PAX00200] ADD  CONSTRAINT [DF_HIST_PAX00200_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
ALTER TABLE [dbo].[HIST_SMX00001] ADD  CONSTRAINT [DF_HIST_SMX00001_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_SMX00001] ADD  CONSTRAINT [DF_HIST_SMX00001_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_SMX00001] ADD  CONSTRAINT [DF_HIST_SMX00001_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_SMX00001] ADD  CONSTRAINT [DF_HIST_SMX00001_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_SMX00001] ADD  CONSTRAINT [DF_HIST_SMX00001_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
ALTER TABLE [dbo].[HIST_SMX00002] ADD  CONSTRAINT [DF_HIST_SMX00002_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_SMX00002] ADD  CONSTRAINT [DF_HIST_SMX00002_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_SMX00002] ADD  CONSTRAINT [DF_HIST_SMX00002_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_SMX00002] ADD  CONSTRAINT [DF_HIST_SMX00002_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_SMX00002] ADD  CONSTRAINT [DF_HIST_SMX00002_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
ALTER TABLE [dbo].[HIST_SMX30013] ADD  CONSTRAINT [DF_HIST_SMX30013_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_SMX30013] ADD  CONSTRAINT [DF_HIST_SMX30013_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_SMX30013] ADD  CONSTRAINT [DF_HIST_SMX30013_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_SMX30013] ADD  CONSTRAINT [DF_HIST_SMX30013_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_SMX30013] ADD  CONSTRAINT [DF_HIST_SMX30013_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
ALTER TABLE [dbo].[HIST_SMX30015] ADD  CONSTRAINT [DF_HIST_SMX30015_ROWGUID]  DEFAULT (newid()) FOR [ROWGUID]
GO
ALTER TABLE [dbo].[HIST_SMX30015] ADD  CONSTRAINT [DF_HIST_SMX30015_ROWCDTE]  DEFAULT (getdate()) FOR [ROWCDTE]
GO
ALTER TABLE [dbo].[HIST_SMX30015] ADD  CONSTRAINT [DF_HIST_SMX30015_ROWMDTE]  DEFAULT (getdate()) FOR [ROWMDTE]
GO
ALTER TABLE [dbo].[HIST_SMX30015] ADD  CONSTRAINT [DF_HIST_SMX30015_ROWUSERID]  DEFAULT ('SYSTEM') FOR [ROWUSERID]
GO
ALTER TABLE [dbo].[HIST_SMX30015] ADD  CONSTRAINT [DF_HIST_SMX30015_ROWSGXID]  DEFAULT ('SYSTEM') FOR [ROWSGXID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número único del Paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'RECORDID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID de la Categorización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'CATEGORIAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primer Nombre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'NOMBRE1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Segundo Nombre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'NOMBRE2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primer Apellido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'APELLIDO1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Segundo Apellido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'APELLIDO2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre Completo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'FULLNAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apodo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'APODO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Nacimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'FNACE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'País de Nacimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'PAISID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ciudad de Nacimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'CIUDADID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID del Género' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'SEXOID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Condición Asegurado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ESASEGURADO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID de la ARS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ARSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de Seguridad Social' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'NSSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Hijo(a) Biológico | 2-Hijo(a) Adoptivo(a) | 3-Hijo(a) de Crianza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'COINDICION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Ambos Padres | 2-Madre | 3-Padre | 4-Tutor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'RESIDECON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Tutor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'RESIDECON1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Ambos Padres | 2-Madre | 3-Padre | 4-Tutor | 5-Otro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'CUIDADOPOR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Cuidador Alternativo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'CUIDADOPOR1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Agente Social' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'AGENTSOCIALID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Médico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'MEDICOID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Terapista' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'TERAPISTAID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de la Tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWIDX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave única del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Creación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWCDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWMDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWUSERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Compañía' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00000', @level2type=N'COLUMN',@level2name=N'ROWSGXID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'NOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje Descuento de Tarifas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'DESCUENTO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de la Tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWIDX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre Tipo Tarifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Creación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWCDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWMDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWUSERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Compañía' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_PAX00200', @level2type=N'COLUMN',@level2name=N'ROWSGXID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código Internacional del País' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX00001', @level2type=N'COLUMN',@level2name=N'CODIGOID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del País' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX00001', @level2type=N'COLUMN',@level2name=N'NOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de la Provincia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX00002', @level2type=N'COLUMN',@level2name=N'CODIGOID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Provincia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX00002', @level2type=N'COLUMN',@level2name=N'NOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID País' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX00002', @level2type=N'COLUMN',@level2name=N'PAISID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'NOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de la Tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWIDX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre Tipo Tarifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Creación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWCDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWMDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWUSERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Compañía' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30013', @level2type=N'COLUMN',@level2name=N'ROWSGXID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'NOMBRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de la Tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWIDX'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre Tipo Tarifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Creación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWCDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWMDTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWUSERID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GUID Compañía' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HIST_SMX30015', @level2type=N'COLUMN',@level2name=N'ROWSGXID'
GO
USE [master]
GO
ALTER DATABASE [CAID_H] SET  READ_WRITE 
GO
