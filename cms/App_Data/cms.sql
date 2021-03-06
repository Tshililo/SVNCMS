USE [master]
GO
/****** Object:  Database [cms]    Script Date: 2018/06/21 08:03:48 AM ******/
CREATE DATABASE [cms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PALTRACK\MSSQL\DATA\cms.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PALTRACK\MSSQL\DATA\cms_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cms] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cms] SET ARITHABORT OFF 
GO
ALTER DATABASE [cms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cms] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cms] SET  MULTI_USER 
GO
ALTER DATABASE [cms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cms] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [cms] SET DELAYED_DURABILITY = DISABLED 
GO
USE [cms]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ObjId] [uniqueidentifier] NOT NULL,
	[IdNo] [nvarchar](30) NOT NULL,
	[DeedName] [nvarchar](30) NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfBurial] [datetime] NULL,
	[PlaceOfIssue] [nvarchar](30) NULL,
	[AgeGroup] [nvarchar](30) NULL,
	[PurchaseOfGrave] [decimal](10, 0) NULL,
	[ReservationOfGrave] [decimal](10, 0) NULL,
	[OpenCloseGrave] [decimal](10, 0) NULL,
	[WideningOfGrave] [decimal](10, 0) NULL,
	[UseOfANiche] [decimal](10, 0) NULL,
	[BurialOfPauper] [decimal](10, 0) NULL,
	[Amount] [decimal](10, 0) NULL,
	[AmountPaidDate] [datetime] NULL,
	[ReceiptNo] [nvarchar](30) NULL,
	[PlaceOfBurial] [nvarchar](30) NULL,
	[CareTaker] [nvarchar](30) NULL,
	[GrafNumber] [nvarchar](30) NULL,
	[ReligionId] [nvarchar](30) NULL,
	[AgeGroupId] [nvarchar](30) NULL,
	[Mortuary] [nvarchar](30) NULL,
	[DeedGender] [nvarchar](30) NULL,
	[DeathAge] [nvarchar](30) NULL,
	[CauseOfDeath] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[UsualResidence] [nvarchar](30) NULL,
	[CapturedDate] [datetime] NULL,
	[PurchaseCapturedDate] [datetime] NULL,
	[Burial_Status] [bit] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cemetery]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cemetery](
	[ObjId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cemetery] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DualApplication]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DualApplication](
	[ObjId] [uniqueidentifier] NOT NULL,
	[HeaderApplicationId] [uniqueidentifier] NOT NULL,
	[IdNo] [nvarchar](30) NOT NULL,
	[DeedName] [nvarchar](30) NULL,
	[DateOfBirth] [datetime] NULL,
	[DateOfBurial] [datetime] NULL,
	[PlaceOfIssue] [nvarchar](30) NULL,
	[AgeGroup] [nvarchar](30) NULL,
	[PurchaseOfGrave] [decimal](10, 0) NULL,
	[ReservationOfGrave] [decimal](10, 0) NULL,
	[OpenCloseGrave] [decimal](10, 0) NULL,
	[WideningOfGrave] [decimal](10, 0) NULL,
	[UseOfANiche] [decimal](10, 0) NULL,
	[BurialOfPauper] [decimal](10, 0) NULL,
	[Amount] [decimal](10, 0) NULL,
	[AmountPaidDate] [datetime] NULL,
	[ReceiptNo] [nvarchar](30) NULL,
	[PlaceOfBurial] [nvarchar](30) NULL,
	[CareTaker] [nvarchar](30) NULL,
	[GrafNumber] [nvarchar](30) NULL,
	[ReligionId] [nvarchar](30) NULL,
	[AgeGroupId] [nvarchar](30) NULL,
	[Mortuary] [nvarchar](30) NULL,
	[DeedGender] [nvarchar](30) NULL,
	[DeathAge] [nvarchar](30) NULL,
	[CauseOfDeath] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
	[UsualResidence] [nvarchar](30) NULL,
	[CapturedDate] [datetime] NULL,
	[PurchaseCapturedDate] [datetime] NULL,
	[Burial_Status] [bit] NULL,
 CONSTRAINT [PK_DualApplication] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grave]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grave](
	[ObjId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Longitude] [nvarchar](100) NULL,
	[Latitude] [nvarchar](100) NULL,
	[CemeteryId] [uniqueidentifier] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Grave] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GraveOwner]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraveOwner](
	[ObjId] [uniqueidentifier] NOT NULL,
	[GraveId] [uniqueidentifier] NULL,
	[ApplicationId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_GraveOwner] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mortuary]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mortuary](
	[ObjId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Mortuary] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportHeader]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportHeader](
	[ObjId] [uniqueidentifier] NOT NULL,
	[OrganisationName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[TeNo] [nchar](30) NULL,
	[Vat] [nchar](30) NULL,
	[Fax] [nchar](30) NULL,
	[Email] [nchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_ReportHeader] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[EmailConfirmed] [bit] NULL,
	[Password] [nvarchar](30) NULL,
	[PhoneNumber] [nvarchar](30) NULL,
	[TempPassword] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2018/06/21 08:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[ObjId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [cms] SET  READ_WRITE 
GO
