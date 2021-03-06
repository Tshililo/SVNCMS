USE [master]
GO
/****** Object:  Database [cms]    Script Date: 2019/01/11 10:46:01 AM ******/
CREATE DATABASE [cms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PALTRACK\MSSQL\DATA\cms.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.PALTRACK\MSSQL\DATA\cms_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
EXEC sys.sp_db_vardecimal_storage_format N'cms', N'ON'
GO
ALTER DATABASE [cms] SET QUERY_STORE = OFF
GO
USE [cms]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [cms]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2019/01/11 10:46:02 AM ******/
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
	[MortuaryId] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[Cemetery]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[DualApplication]    Script Date: 2019/01/11 10:46:02 AM ******/
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
	[MortuaryId] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[Grave]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[GraveOwner]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[Mortuary]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[PublicUsers]    Script Date: 2019/01/11 10:46:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicUsers](
	[ObjId] [uniqueidentifier] NOT NULL,
	[Cell_No] [nvarchar](50) NULL,
 CONSTRAINT [PK_PublicUsers] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportHeader]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[SiteVisitAudit]    Script Date: 2019/01/11 10:46:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteVisitAudit](
	[ObjId] [uniqueidentifier] NOT NULL,
	[DateOfVisit] [datetime] NULL,
	[Purpose] [nvarchar](500) NULL,
	[Officer] [nvarchar](50) NULL,
	[GraveFound] [bit] NULL,
 CONSTRAINT [PK_SiteVisitAudit] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2019/01/11 10:46:02 AM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 2019/01/11 10:46:03 AM ******/
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
INSERT [dbo].[Application] ([ObjId], [IdNo], [DeedName], [DateOfBirth], [DateOfBurial], [PlaceOfIssue], [AgeGroup], [PurchaseOfGrave], [ReservationOfGrave], [OpenCloseGrave], [WideningOfGrave], [UseOfANiche], [BurialOfPauper], [Amount], [AmountPaidDate], [ReceiptNo], [PlaceOfBurial], [CareTaker], [GrafNumber], [ReligionId], [AgeGroupId], [MortuaryId], [DeedGender], [DeathAge], [CauseOfDeath], [Address], [UsualResidence], [CapturedDate], [PurchaseCapturedDate], [Burial_Status]) VALUES (N'a6bb05de-87a0-45f7-beff-47f7069c8a53', N'212121', N'best', NULL, NULL, NULL, N'Children', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'White', NULL, N'a89a5677-18ff-4b80-9538-01f99f2f3df6', N'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Application] ([ObjId], [IdNo], [DeedName], [DateOfBirth], [DateOfBurial], [PlaceOfIssue], [AgeGroup], [PurchaseOfGrave], [ReservationOfGrave], [OpenCloseGrave], [WideningOfGrave], [UseOfANiche], [BurialOfPauper], [Amount], [AmountPaidDate], [ReceiptNo], [PlaceOfBurial], [CareTaker], [GrafNumber], [ReligionId], [AgeGroupId], [MortuaryId], [DeedGender], [DeathAge], [CauseOfDeath], [Address], [UsualResidence], [CapturedDate], [PurchaseCapturedDate], [Burial_Status]) VALUES (N'16453427-36c0-4f19-bf0f-9363e8329583', N'4555555', N'manana', CAST(N'2018-08-28T00:00:00.000' AS DateTime), CAST(N'2018-08-29T00:00:00.000' AS DateTime), NULL, N'Children', NULL, NULL, NULL, NULL, NULL, NULL, CAST(1222 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, N'White', NULL, N'71a2523b-a29e-42ba-9ae9-92056215969e', N'Male', NULL, NULL, NULL, N'west', CAST(N'2018-09-04T00:00:00.000' AS DateTime), CAST(N'2018-08-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Application] ([ObjId], [IdNo], [DeedName], [DateOfBirth], [DateOfBurial], [PlaceOfIssue], [AgeGroup], [PurchaseOfGrave], [ReservationOfGrave], [OpenCloseGrave], [WideningOfGrave], [UseOfANiche], [BurialOfPauper], [Amount], [AmountPaidDate], [ReceiptNo], [PlaceOfBurial], [CareTaker], [GrafNumber], [ReligionId], [AgeGroupId], [MortuaryId], [DeedGender], [DeathAge], [CauseOfDeath], [Address], [UsualResidence], [CapturedDate], [PurchaseCapturedDate], [Burial_Status]) VALUES (N'6c870db9-c2bc-4963-ba85-cb6bcc622e1a', N'212111111', N'bestos', CAST(N'2018-08-29T00:00:00.000' AS DateTime), CAST(N'2018-09-06T00:00:00.000' AS DateTime), NULL, N'Children', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'African', NULL, N'a89a5677-18ff-4b80-9538-01f99f2f3df6', N'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'42e197f5-fb5d-4d6a-b044-247812586d00', N'Zamenkomste Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'842a0b5a-16fd-48f6-be39-3c998ab073b9', N'Ha-Ramantsha Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'e789fd0b-8c85-4ecf-b80c-686a7887c42b', N'Makhitha Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'42bca60b-2d15-475a-9cf9-82d783bbe502', N'Dzanani Makhado Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'b1b57b5d-244c-443c-bd74-8e4afe619b20', N'Tshikota Graveyard')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'b8eec0c1-2d82-41d8-a492-932a599dcb41', N'Muraleni Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'ab3b0ef9-ff7f-4e62-b5ae-a02ffa67ae07', N'Maebani Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'ed393676-31d8-4362-925e-a8b0ff5fedb0', N'Tshiozwi Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'023fa114-0434-4fab-a855-c11043f26dab', N'Makhado Cemetery')
INSERT [dbo].[Cemetery] ([ObjId], [Name]) VALUES (N'ab9f6c56-ddaf-40e3-ac64-e8f8a9d944fd', N'Madombidzha Cemetery')
INSERT [dbo].[DualApplication] ([ObjId], [HeaderApplicationId], [IdNo], [DeedName], [DateOfBirth], [DateOfBurial], [PlaceOfIssue], [AgeGroup], [PurchaseOfGrave], [ReservationOfGrave], [OpenCloseGrave], [WideningOfGrave], [UseOfANiche], [BurialOfPauper], [Amount], [AmountPaidDate], [ReceiptNo], [PlaceOfBurial], [CareTaker], [GrafNumber], [ReligionId], [AgeGroupId], [MortuaryId], [DeedGender], [DeathAge], [CauseOfDeath], [Address], [UsualResidence], [CapturedDate], [PurchaseCapturedDate], [Burial_Status]) VALUES (N'9568ab3d-f706-4df1-a596-b762d669d268', N'a6bb05de-87a0-45f7-beff-47f7069c8a53', N'8566777970988', N'tessss', NULL, CAST(N'2019-01-03T00:00:00.000' AS DateTime), NULL, N'Children', NULL, NULL, NULL, NULL, NULL, NULL, CAST(6 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, N'Indian', NULL, N'a89a5677-18ff-4b80-9538-01f99f2f3df6', N'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DualApplication] ([ObjId], [HeaderApplicationId], [IdNo], [DeedName], [DateOfBirth], [DateOfBurial], [PlaceOfIssue], [AgeGroup], [PurchaseOfGrave], [ReservationOfGrave], [OpenCloseGrave], [WideningOfGrave], [UseOfANiche], [BurialOfPauper], [Amount], [AmountPaidDate], [ReceiptNo], [PlaceOfBurial], [CareTaker], [GrafNumber], [ReligionId], [AgeGroupId], [MortuaryId], [DeedGender], [DeathAge], [CauseOfDeath], [Address], [UsualResidence], [CapturedDate], [PurchaseCapturedDate], [Burial_Status]) VALUES (N'987ef933-c223-4cdd-a7c5-c6258109f60d', N'16453427-36c0-4f19-bf0f-9363e8329583', N'8768965600000', N'test', NULL, CAST(N'2019-01-02T00:00:00.000' AS DateTime), NULL, N'Adult', NULL, NULL, NULL, NULL, NULL, NULL, CAST(21221 AS Decimal(10, 0)), NULL, NULL, NULL, NULL, NULL, N'African', NULL, N'255a99fe-3e14-44c9-8dd8-66e71c40cd35', N'Male', NULL, NULL, NULL, NULL, CAST(N'2019-01-10T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4281-9339-7e20445d8f8a', N'Col 1 Row 1 No 3', N'31° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2832-eff8-4281-9339-7e20445d8f8a', N'Col 1 Row 1 No 2', N'25° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4381-9339-7e20445d8f8a', N'Col 1 Row 1 No 4', N'32° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4481-9339-7e20445d8f8a', N'Col 1 Row 1 No 5', N'33° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4581-9339-7e20445d8f8a', N'Col 1 Row 1 No 6', N'34° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4681-9339-7e20445d8f8a', N'Col 1 Row 1 No 7', N'35° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4881-9339-7e20445d8f8a', N'Col 1 Row 1 No 8', N'37° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-4981-9339-7e20445d8f8a', N'Col 1 Row 1 No 9', N'38° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'ab3b0ef9-ff7f-4e62-b5ae-a02ffa67ae07', N'Used - N/A')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-5081-9339-7e20445d8f8a', N'Col 1 Row 1 No 10', N'39° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2831-eff8-5181-9339-7e20445d8f8a', N'Col 1 Row 2 No 1', N'40° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'496b2832-eff8-4281-9339-7e40445d8f8a', N'Col 1 Row 1 No 1', N'29° 54'' 11.48" E', N'-23° 02'' 37.86" S', N'023fa114-0434-4fab-a855-c11043f26dab', N'Open Space')
INSERT [dbo].[Grave] ([ObjId], [Name], [Longitude], [Latitude], [CemeteryId], [Status]) VALUES (N'cf98e0e2-a317-462f-9db3-b09446552c67', N'Col 2 Row 2', N'Col 1 Row 1 No 3', N'214321312', N'b8eec0c1-2d82-41d8-a492-932a599dcb41', N'Reserved Space')
INSERT [dbo].[GraveOwner] ([ObjId], [GraveId], [ApplicationId]) VALUES (N'5fe21f9e-7264-433e-b27a-0ff4f940edad', N'496b2831-eff8-4481-9339-7e20445d8f8a', N'16453427-36c0-4f19-bf0f-9363e8329583')
INSERT [dbo].[GraveOwner] ([ObjId], [GraveId], [ApplicationId]) VALUES (N'5a34db28-5a99-4ed9-bae2-27d316b89138', N'496b2831-eff8-4481-9339-7e20445d8f8a', N'314ea190-6a97-4c3d-9bc0-0099a3983d0c')
INSERT [dbo].[GraveOwner] ([ObjId], [GraveId], [ApplicationId]) VALUES (N'b07b265f-f8e3-4976-b110-29cdf16d7b45', N'496b2832-eff8-4281-9339-7e40445d8f8a', N'e3912bdd-b97b-4fe5-a7f2-ee90f1b21532')
INSERT [dbo].[GraveOwner] ([ObjId], [GraveId], [ApplicationId]) VALUES (N'34327bce-7631-48df-8353-c8f6fe89c253', N'496b2831-eff8-4381-9339-7e20445d8f8a', N'4334d9f4-6259-488e-a446-48dddd3f9238')
INSERT [dbo].[GraveOwner] ([ObjId], [GraveId], [ApplicationId]) VALUES (N'696ea799-1e1a-41e4-b1b6-d127556c71b2', N'496b2832-eff8-4281-9339-7e40445d8f8a', N'87934b06-97ae-41fb-a972-a626547407ae')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'a89a5677-18ff-4b80-9538-01f99f2f3df6', N'BAFA FUNERAL UNDERTAKERS')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'3aced48a-2a11-4821-b767-0f52475b2163', N'PROFESSIONAL INSURANCE BROKERS CC')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'b0c3ff2f-931f-4bff-8a89-49c12faa8dfa', N'V VHULENDA TOMBSTONES AND FUNERAL SERVICES')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'29e2fc93-13ff-41f2-aad7-590b2d193b75', N'MTG FUNERAL CC')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'255a99fe-3e14-44c9-8dd8-66e71c40cd35', N'M M K FUNERAL UNDERTAKER SERVICES')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'9edc7459-8b7f-475c-a457-7c820b513762', N'M T T FUNERAL SERVICES')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'71a2523b-a29e-42ba-9ae9-92056215969e', N'VENDA FUNERAL SOC')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'd7dc3646-babb-4714-ba27-d197c6301748', N'MUTONDI FUNERAL SERVICES')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'22c12097-75f8-4922-b9fa-d1d7914c8500', N'MALESELA KHUTJO FUNERAL SERVICES')
INSERT [dbo].[Mortuary] ([ObjId], [Name]) VALUES (N'3da34b2c-569a-42dc-b755-ff3251306e3b', N'AVBOB')
INSERT [dbo].[ReportHeader] ([ObjId], [OrganisationName], [Address], [TeNo], [Vat], [Fax], [Email], [Active]) VALUES (N'624f854d-9cfc-416e-8fb2-3b8ca162b78d', N'Makhado Municipality Cemetery Report', N'Private Bag X2596, Louis Trichardt, Limpopo, 0920', N'015 519 3000                  ', NULL, NULL, N'municipal.manager@makhado.gov.za                  ', NULL)
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'37f37df4-c5c0-44d9-8510-e7daee079926', N'Admin                                             ')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'e482345d-302e-4aa5-b22c-ffa5d81f7fc2', N'SiteAudit                                         ')
INSERT [dbo].[SiteVisitAudit] ([ObjId], [DateOfVisit], [Purpose], [Officer], [GraveFound]) VALUES (N'44e66d0d-e300-4f71-8a51-5b33c9c5bc07', CAST(N'2018-09-17T00:05:00.000' AS DateTime), N'check Again', N'pollla', 0)
INSERT [dbo].[SiteVisitAudit] ([ObjId], [DateOfVisit], [Purpose], [Officer], [GraveFound]) VALUES (N'8cd967c1-f127-4de8-afeb-77aef6cbed79', CAST(N'2018-09-12T08:00:00.000' AS DateTime), N'visit the graves', N'mulaudzi', 1)
INSERT [dbo].[SiteVisitAudit] ([ObjId], [DateOfVisit], [Purpose], [Officer], [GraveFound]) VALUES (N'6db5e49d-db0b-4636-a890-a5d1e254fe46', CAST(N'2018-09-12T00:00:00.000' AS DateTime), N'Check up', N'Felix Rama', 0)
INSERT [dbo].[User] ([Id], [Email], [EmailConfirmed], [Password], [PhoneNumber], [TempPassword], [UserName]) VALUES (N'6c7f26b5-9fe1-4038-8806-2b2d402ab4e6', N'tshililo@paltrack.co.za', 1, N'Mutheiwana27', N'0796416858', NULL, N'Paltrack')
INSERT [dbo].[User] ([Id], [Email], [EmailConfirmed], [Password], [PhoneNumber], [TempPassword], [UserName]) VALUES (N'4be115d6-19eb-45d9-89bd-e952f9bc192c', N'b.mutheiwana@gmail.com', 1, N'Mutheiwana27', N'0796416858', NULL, N'tshililo')
INSERT [dbo].[UserRole] ([ObjId], [UserId], [RoleId]) VALUES (N'd8f77e6d-6a6d-4892-920a-3dee131acd73', N'6c7f26b5-9fe1-4038-8806-2b2d402ab4e6', N'e482345d-302e-4aa5-b22c-ffa5d81f7fc2')
INSERT [dbo].[UserRole] ([ObjId], [UserId], [RoleId]) VALUES (N'39704ab7-bad9-4d12-ae18-daef61d833dd', N'4be115d6-19eb-45d9-89bd-e952f9bc192c', N'37f37df4-c5c0-44d9-8510-e7daee079926')
USE [master]
GO
ALTER DATABASE [cms] SET  READ_WRITE 
GO
