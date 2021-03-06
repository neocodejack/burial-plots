USE [master]
GO
/****** Object:  Database [BurialPlots]    Script Date: 11/15/2017 10:42:11 PM ******/
CREATE DATABASE [BurialPlots]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BurialPlots', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BurialPlots.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BurialPlots_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BurialPlots_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BurialPlots] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BurialPlots].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BurialPlots] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BurialPlots] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BurialPlots] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BurialPlots] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BurialPlots] SET ARITHABORT OFF 
GO
ALTER DATABASE [BurialPlots] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BurialPlots] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BurialPlots] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BurialPlots] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BurialPlots] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BurialPlots] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BurialPlots] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BurialPlots] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BurialPlots] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BurialPlots] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BurialPlots] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BurialPlots] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BurialPlots] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BurialPlots] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BurialPlots] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BurialPlots] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BurialPlots] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BurialPlots] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BurialPlots] SET  MULTI_USER 
GO
ALTER DATABASE [BurialPlots] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BurialPlots] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BurialPlots] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BurialPlots] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BurialPlots] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BurialPlots]
GO
/****** Object:  Table [dbo].[AdministrativeEmail]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdministrativeEmail](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Email] [varchar](max) NULL,
	[AddBy] [varchar](max) NULL,
 CONSTRAINT [PK_AdministrativeEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingShipping]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingShipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NULL,
	[LastName] [varchar](max) NULL,
	[Addressone] [varchar](max) NULL,
	[Addresstwo] [varchar](max) NULL,
	[City] [varchar](max) NULL,
	[State] [varchar](max) NULL,
	[Zip] [varchar](max) NULL,
	[ItemId] [int] NULL,
	[ItemQty] [int] NULL,
	[UserId] [int] NULL,
	[Information] [varchar](50) NULL,
 CONSTRAINT [PK_BillingShipping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[FeaturedImage] [varchar](max) NULL,
	[CategoryId] [decimal](18, 0) NULL,
	[IsApproved] [bit] NULL,
	[IsFeatured] [bit] NULL,
	[PublishedDate] [datetime] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ItemName] [varchar](max) NULL,
	[ItemPicture] [varchar](max) NULL,
	[ItemQty] [varchar](max) NULL,
	[ItemPrice] [varchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Code] [varchar](max) NULL,
	[CateName] [varchar](max) NULL,
	[CatPic] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cemetery]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cemetery](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Code] [varchar](max) NULL,
	[OriginalCode] [varchar](max) NULL,
	[AddedDate] [date] NULL,
	[Image] [varchar](max) NULL,
	[RegionId] [decimal](18, 0) NULL,
	[IsFeatured] [bit] NULL,
	[Description] [varchar](max) NULL,
	[KeyInformation] [varchar](max) NULL,
	[MapLocation] [varchar](max) NULL,
	[LocationDescription] [varchar](max) NULL,
	[WhyChoose] [varchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
 CONSTRAINT [PK_Cemetery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CemeteryImages]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CemeteryImages](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Image] [varchar](max) NULL,
	[OriginalImage] [varchar](max) NULL,
	[CemeteryId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CemeteryImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CemeteryLayers]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CemeteryLayers](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[CemeteryId] [decimal](18, 0) NULL,
	[IsBooking] [bit] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_CemeteryLayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Counties]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Counties](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[AddedDate] [date] NULL,
	[CountryId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Counties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NULL,
	[Answer] [varchar](max) NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CopyRight] [varchar](max) NULL,
	[Branding] [varchar](max) NULL,
	[PubDate] [date] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FuneralProduct]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FuneralProduct](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductPrice] [decimal](18, 0) NULL,
	[PrdoctDescription] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[FuneralServiceId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_FuneralProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FuneralServices]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FuneralServices](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Date] [date] NULL,
	[Picture] [varchar](max) NULL,
 CONSTRAINT [PK_FuneralServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Graves]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Graves](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Address] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[SKU] [varchar](max) NULL,
	[PlotName] [varchar](max) NULL,
	[PlotNo] [varchar](max) NULL,
	[PlotType] [varchar](max) NULL,
	[Size] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[TierId] [decimal](18, 0) NULL,
	[ShortDescription] [varchar](max) NULL,
	[FullDescription] [varchar](max) NULL,
	[Internement] [varchar](max) NULL,
	[InternementFee] [decimal](18, 0) NULL,
	[Lease] [varchar](max) NULL,
	[Maintenance] [varchar](max) NULL,
	[SpotId] [varchar](max) NULL,
	[SectionId] [decimal](18, 0) NULL,
	[ReligionId] [decimal](18, 0) NULL,
	[SectId] [decimal](18, 0) NULL,
	[IsEnabled] [bit] NULL,
 CONSTRAINT [PK_Graves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItalianPage]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItalianPage](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[PageTittle] [nvarchar](max) NULL,
	[Pageurl] [nvarchar](max) NULL,
	[FeatureImage] [varchar](max) NULL,
	[ServiceTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItalianPage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [varchar](max) NULL,
	[ItemName] [varchar](max) NULL,
	[ItemQty] [int] NULL,
	[ItemCprice] [money] NULL,
	[ItemRprice] [money] NULL,
	[ItemActive] [bit] NULL,
	[ItemFeature] [bit] NULL,
	[ItemImage] [varchar](max) NULL,
	[CateId] [decimal](18, 0) NULL,
	[ItemDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MainSections]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MainSections](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CemeteryId] [decimal](18, 0) NULL,
	[Name] [varchar](max) NULL,
	[Code] [varchar](max) NULL,
	[OriginalCode] [varchar](max) NULL,
	[SpotId] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_MainSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Suspend] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_addmember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](max) NULL,
	[Lname] [varchar](max) NULL,
	[Username] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[CellNo] [varchar](max) NULL,
	[Active] [bit] NULL,
	[Picture] [varchar](max) NULL,
	[Role] [varchar](max) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pageurl] [varchar](max) NULL,
	[Category] [varchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsManagement]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsManagement](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PubDate] [date] NULL,
	[ExpiryDate] [date] NULL,
	[TitleUrdu] [nvarchar](max) NULL,
	[TitleArabic] [nvarchar](max) NULL,
	[TitleChinese] [nvarchar](max) NULL,
	[TitleHindi] [nvarchar](max) NULL,
	[TitleItalian] [nvarchar](max) NULL,
	[TitleBengali] [nvarchar](max) NULL,
	[TitleHebrew] [nvarchar](max) NULL,
	[DescriptionUrdu] [nvarchar](max) NULL,
	[DescriptionArabic] [nvarchar](max) NULL,
	[DescriptionChinese] [nvarchar](max) NULL,
	[DescriptionHindi] [nvarchar](max) NULL,
	[DescriptionItalian] [nvarchar](max) NULL,
	[DescriptionBengali] [nvarchar](max) NULL,
	[DescriptionHebrew] [nvarchar](max) NULL,
	[TitleTurkish] [nvarchar](max) NULL,
	[DescriptionTurkish] [nvarchar](max) NULL,
 CONSTRAINT [PK_NewsManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCemetery]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCemetery](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CemeteryId] [decimal](18, 0) NULL,
	[OrderId] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
	[PreNeed] [bit] NULL,
	[AtNeed] [bit] NULL,
 CONSTRAINT [PK_OrderCemetery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPlan]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPlan](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[PartnerId] [decimal](18, 0) NULL,
	[Status] [varchar](max) NULL,
	[FirstName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Country] [varchar](max) NULL,
	[CellNo] [varchar](max) NULL,
	[AmountStatus] [bit] NULL,
	[ServiceListingId] [decimal](18, 0) NULL,
	[CartId] [varchar](max) NULL,
 CONSTRAINT [PK_OrderPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderPlanItem]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPlanItem](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderPlanId] [decimal](18, 0) NULL,
	[Title] [varchar](max) NULL,
	[Price] [money] NULL,
	[Description] [varchar](max) NULL,
	[ServiceListingPlanId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderPlanItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[MemberId] [decimal](18, 0) NULL,
	[Status] [varchar](max) NULL,
	[FirstName] [varchar](max) NULL,
	[LastName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Country] [varchar](max) NULL,
	[CellNo] [varchar](max) NULL,
	[AmountStatus] [bit] NULL,
	[CartId] [varchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Origins]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Origins](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_Origins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Page]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Page](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Body] [varchar](max) NULL,
	[PageTittle] [varchar](max) NULL,
	[Pageurl] [varchar](max) NULL,
	[FeatureImage] [varchar](max) NULL,
	[BodyUrdu] [nvarchar](max) NULL,
	[BodyHindi] [nvarchar](max) NULL,
	[BodyChinese] [nvarchar](max) NULL,
	[BodyArabic] [nvarchar](max) NULL,
	[BodyItalian] [nvarchar](max) NULL,
	[BodyTurkish] [nvarchar](max) NULL,
	[BodyBengali] [nvarchar](max) NULL,
	[BodyHebrew] [nvarchar](max) NULL,
	[TitleUrdu] [nvarchar](max) NULL,
	[TitleHindi] [nvarchar](max) NULL,
	[TitleChinese] [nvarchar](max) NULL,
	[TitleArabic] [nvarchar](max) NULL,
	[TitleItalian] [nvarchar](max) NULL,
	[TitleTurkish] [nvarchar](max) NULL,
	[TitleBengali] [nvarchar](max) NULL,
	[TitleHebrew] [nvarchar](max) NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PageBox]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageBox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Page] [int] NULL,
	[Box] [int] NULL,
	[UrduPage] [int] NULL,
 CONSTRAINT [PK_PageBox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerPlan]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartnerPlan](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Price] [float] NULL,
	[Position] [int] NULL,
	[PlanPeriods] [int] NULL,
	[FreeListingPeriod] [int] NULL,
 CONSTRAINT [PK_PartnerPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](max) NULL,
	[Lname] [varchar](max) NULL,
	[Username] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[CellNo] [varchar](max) NULL,
	[Active] [bit] NULL,
	[Role] [varchar](max) NULL,
	[Picture] [varchar](max) NULL,
	[PartnerPlanId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [varchar](max) NULL,
	[CardName] [varchar](max) NULL,
	[ExpMonth] [date] NULL,
	[ExpYear] [date] NULL,
	[CvcNo] [int] NULL,
	[UserId] [int] NULL,
	[BillId] [int] NULL,
 CONSTRAINT [PK_PaymentCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[InstallationId] [varchar](max) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PostCodes]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PostCodes](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Code] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[AddedDate] [date] NULL,
	[CountyId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PostCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseBoxImage]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseBoxImage](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_PurchaseBoxImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Relgion]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relgion](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[RelgionName] [varchar](max) NULL,
	[Picture] [varchar](max) NULL,
 CONSTRAINT [PK_Relgion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PartnerId] [decimal](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[ServiceListingId] [decimal](18, 0) NULL,
	[Date] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceBox]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceBox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BoxName] [varchar](max) NULL,
	[BoxPic] [varchar](max) NULL,
	[BoxUrl] [int] NULL,
	[BoxDescription] [varchar](max) NULL,
	[BoxStatus] [bit] NULL,
	[ServiceUrl] [varchar](max) NULL,
	[UrlStatus] [bit] NULL,
	[BoxNameInUrdu] [nvarchar](max) NULL,
	[BoxNameInItalian] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceBox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceListingPlans]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceListingPlans](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CountyId] [decimal](18, 0) NULL,
	[BusinessId] [decimal](18, 0) NULL,
	[PlanId] [decimal](18, 0) NULL,
	[ServiceListId] [decimal](18, 0) NULL,
	[ExpiryDate] [date] NULL,
 CONSTRAINT [PK_ServiceListingPlans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServicesListingApproval]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesListingApproval](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ServicesListingApproval] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeviceListing]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeviceListing](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[BusinessName] [varchar](max) NULL,
	[PostCode] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[PhoneNo] [varchar](max) NULL,
	[Website] [varchar](max) NULL,
	[BusinessClassification] [varchar](max) NULL,
	[FuneralServiceId] [decimal](18, 0) NULL,
	[Picture] [varchar](max) NULL,
	[IsApproved] [bit] NULL,
	[Address1] [varchar](max) NULL,
	[Address2] [varchar](max) NULL,
	[Number] [varchar](max) NULL,
	[Town] [varchar](max) NULL,
	[County] [varchar](max) NULL,
	[Country] [varchar](max) NULL,
	[Latitude] [varchar](max) NULL,
	[Longitude] [varchar](max) NULL,
	[ServicesAndProducts] [varchar](max) NULL,
	[BusinessDescription] [varchar](max) NULL,
	[PartnerId] [decimal](18, 0) NULL,
	[PaymentGateways] [varchar](max) NULL,
	[SocialIcons] [varchar](max) NULL,
	[FacebookLink] [varchar](max) NULL,
	[TwitterLink] [varchar](max) NULL,
	[GooglePlusLink] [varchar](max) NULL,
	[CountiesId] [varchar](max) NULL,
	[CountiesName] [varchar](max) NULL,
	[NationWide] [bit] NULL,
	[LinkedIn] [varchar](max) NULL,
 CONSTRAINT [PK_SeviceListing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[SlideImages] [varchar](max) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Caption] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[SliderId] [decimal](18, 0) NULL,
	[CaptionUrdu] [nvarchar](max) NULL,
	[CaptionArabic] [nvarchar](max) NULL,
	[CaptionHindi] [nvarchar](max) NULL,
	[CaptionChinese] [nvarchar](max) NULL,
	[CaptionItalian] [nvarchar](max) NULL,
	[CaptionTurkish] [nvarchar](max) NULL,
	[CaptionBengali] [nvarchar](max) NULL,
	[CaptionHebrew] [nvarchar](max) NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCate]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCate](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[MainCate] [decimal](18, 0) NULL,
	[SubName] [nchar](10) NULL,
 CONSTRAINT [PK_SubCate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubChlidMenu]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubChlidMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NULL,
	[PageUrl] [varchar](max) NULL,
	[PageTitle] [varchar](max) NULL,
 CONSTRAINT [PK_SubChlidMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[submenu]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[submenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[menuId] [int] NULL,
	[pageurl] [varchar](max) NULL,
	[pagetitle] [varchar](max) NULL,
 CONSTRAINT [PK_submenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubRelgion]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubRelgion](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[SubRelgionName] [varchar](max) NULL,
	[RelgioId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SubRelgion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Post] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tiers]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tiers](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Tiers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[AddedDate] [varchar](max) NULL,
	[CountyId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UrduPage]    Script Date: 11/15/2017 10:42:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UrduPage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[PageTittle] [nvarchar](max) NULL,
	[Pageurl] [nvarchar](max) NULL,
	[FeatureImage] [varchar](max) NULL,
	[ServiceTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_PageInUrdu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdministrativeEmail] ON 

INSERT [dbo].[AdministrativeEmail] ([Id], [Email], [AddBy]) VALUES (CAST(18 AS Decimal(18, 0)), N'arshad@intelliscence.com', NULL)
SET IDENTITY_INSERT [dbo].[AdministrativeEmail] OFF
SET IDENTITY_INSERT [dbo].[AdminLogin] ON 

INSERT [dbo].[AdminLogin] ([Id], [Username], [Password], [Role]) VALUES (2, N'arshad', N'123', N'Admin')
INSERT [dbo].[AdminLogin] ([Id], [Username], [Password], [Role]) VALUES (14, N'admin', N'123', N'SuperAdmin')
SET IDENTITY_INSERT [dbo].[AdminLogin] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(3 AS Decimal(18, 0)), N'Funeral Services', N'sdf sdf  fdf fd sdfsd
', N'article-646614.jpg', CAST(2 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(4 AS Decimal(18, 0)), N'Funeral Services', N'Funeral services r are the necessary for the funeral arrangments, Funeral services r are the necessary for the funeral arrangments,
Funeral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangmentsFuneral services r are the necessary for the funeral arrangments.
', N'article-990121.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(6 AS Decimal(18, 0)), N'Funeral Plans', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.
', N'article-1018370.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(7 AS Decimal(18, 0)), N'Funeral Services', N'Funeral services are the services provide the way to manage the funeral activitesies
', N'article-50-272261.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(8 AS Decimal(18, 0)), N'Funeral Cars', N'Funeral Cars have the vital importance in the funeral services.It provides the funeral cars online..It provides the sheapest rates.So It seems to be very good.
', N'service-block617114.jpg', CAST(3 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(12 AS Decimal(18, 0)), N'Funeral Directors', N'Funeral Cars have the vital importance in the funeral services.It provides the funeral cars online..It provides the sheapest rates.So It seems to be very good.

', N'images (3)7484.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(13 AS Decimal(18, 0)), N'Funeral Insurance', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'images (7)48603.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-26 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(14 AS Decimal(18, 0)), N'Funeral Cars', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'IMG_002436411.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(15 AS Decimal(18, 0)), N'Funeral Florists', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'images13529.png', CAST(1 AS Decimal(18, 0)), 1, 0, CAST(N'2017-05-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(16 AS Decimal(18, 0)), N'Funeral Plans', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'hero-mangranddad@2x40762.png', CAST(1 AS Decimal(18, 0)), 1, 0, CAST(N'2017-05-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(17 AS Decimal(18, 0)), N'Funeral Plot', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'Masonic_Gravestones_Valentines_Korell30134.png', CAST(2 AS Decimal(18, 0)), 1, 0, CAST(N'2017-05-23 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(18 AS Decimal(18, 0)), N'Funeral Cars', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'IMG_002479517.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(19 AS Decimal(18, 0)), N'Funeral Headstones', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'Masonic_Gravestones_Valentines_Korell65403.png', CAST(1 AS Decimal(18, 0)), NULL, 1, CAST(N'2017-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(20 AS Decimal(18, 0)), N'Funeral Florists', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'images59447.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-16 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(21 AS Decimal(18, 0)), N'Funeral Florists', N'Funeral Plans are the main part in the life.This seems to be horrible but it is necessary.Funeral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessaryFuneral Plans are the main part in the life.This seems to be horrible but it is necessary.

', N'images18552.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(22 AS Decimal(18, 0)), N'Funeral Directors', N'Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.
', N'images (3)60513.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(23 AS Decimal(18, 0)), N'Funeral Florists', N'Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.
', N'images59069.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(24 AS Decimal(18, 0)), N'Funeral Cars', N'Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an important role in the funeral servcies arrrangements.Funeral services are plays an imp
', N'IMG_002457736.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(25 AS Decimal(18, 0)), N'Funeral Directors', N'“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare".
', N'images (3)58282.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(26 AS Decimal(18, 0)), N'Funeral Insurance', N'“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.”
', N'article-448728.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(27 AS Decimal(18, 0)), N'Funeral Measons', N'“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.”
', N'banner-search69623.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(28 AS Decimal(18, 0)), N'Funeral Headstones', N'“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.”
', N'article-1042238.jpg', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([Id], [Title], [Description], [FeaturedImage], [CategoryId], [IsApproved], [IsFeatured], [PublishedDate]) VALUES (CAST(29 AS Decimal(18, 0)), N'Funeral Insurance', N'<p><strong>Aliquam quis pulvinar purus. </strong></p><p>Etiam cursus ipsum quis enim faucibus,</p><p> quis posuere orci ornare. </p><p>Duis mattis sagittis fringilla.</p>', N'images (7)9107687471.png', CAST(1 AS Decimal(18, 0)), 1, 1, CAST(N'2017-05-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 

INSERT [dbo].[BlogCategory] ([Id], [Name]) VALUES (CAST(1 AS Decimal(18, 0)), N'Funeral Services')
INSERT [dbo].[BlogCategory] ([Id], [Name]) VALUES (CAST(2 AS Decimal(18, 0)), N'Funeral Plots')
INSERT [dbo].[BlogCategory] ([Id], [Name]) VALUES (CAST(3 AS Decimal(18, 0)), N'Funeral  Cars')
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [ItemId], [ItemName], [ItemPicture], [ItemQty], [ItemPrice], [UserId]) VALUES (35, 6, N'Yamhaa', N'bik29867.jpg', N'6', N'10004.0000', NULL)
INSERT [dbo].[Cart] ([Id], [ItemId], [ItemName], [ItemPicture], [ItemQty], [ItemPrice], [UserId]) VALUES (36, 1003, N'Plots', N'block-pic288317.jpg', N'5', N'4500.0000', NULL)
INSERT [dbo].[Cart] ([Id], [ItemId], [ItemName], [ItemPicture], [ItemQty], [ItemPrice], [UserId]) VALUES (37, 1003, N'Plots', N'block-pic288317.jpg', N'5', N'4500.0000', NULL)
INSERT [dbo].[Cart] ([Id], [ItemId], [ItemName], [ItemPicture], [ItemQty], [ItemPrice], [UserId]) VALUES (38, 1003, N'Plots', N'block-pic288317.jpg', N'5', N'4500.0000', NULL)
INSERT [dbo].[Cart] ([Id], [ItemId], [ItemName], [ItemPicture], [ItemQty], [ItemPrice], [UserId]) VALUES (1002, 1003, N'Plots', N'block-pic288317.jpg', N'5', N'4500.0000', NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(8 AS Decimal(18, 0)), N'1', N'CARS', N'dfsa82107.jpg', NULL)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(9 AS Decimal(18, 0)), N'2', N'Bikes', N'bbb76878.JPG', 1)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(1006 AS Decimal(18, 0)), N'12', N'Burial Plots', N'article-50-378926.jpg', 1)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(1007 AS Decimal(18, 0)), N'610104', N'Muslims', N'Chrysanthemum29763.jpg', 1)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(1008 AS Decimal(18, 0)), N'100', N'Catholic', N'Chrysanthemum10940.jpg', 1)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(1009 AS Decimal(18, 0)), N'101', N'Jewish', N'Koala14643.jpg', 1)
INSERT [dbo].[Category] ([Id], [Code], [CateName], [CatPic], [Active]) VALUES (CAST(1010 AS Decimal(18, 0)), N'102', N'Christian', N'Desert52004.jpg', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Cemetery] ON 

INSERT [dbo].[Cemetery] ([Id], [Name], [Code], [OriginalCode], [AddedDate], [Image], [RegionId], [IsFeatured], [Description], [KeyInformation], [MapLocation], [LocationDescription], [WhyChoose], [Latitude], [Longitude]) VALUES (CAST(15 AS Decimal(18, 0)), N'Borehamwood', N'"{\"id\":9140,\"editor\":{\"selected_shape\":\"rect-3799\",\"tool\":\"poly\"},\"general\":{\"name\":\"unknown\",\"width\":1170,\"height\":608,\"naturalWidth\":1170,\"naturalHeight\":608},\"image\":{\"url\":\"http://localhost:6465/Images/CemeteryPlots/78409594img171030.jpg\"},\"spots\":[{\"id\":\"rect-3799\",\"title\":\"rect-3799\",\"type\":\"poly\",\"x\":62.199,\"y\":12.79,\"width\":27.41,\"height\":36.516,\"tooltip_content\":{\"squares_settings\":{\"containers\":[{\"id\":\"sq-container-403761\",\"settings\":{\"elements\":[{\"settings\":{\"name\":\"Paragraph\",\"iconClass\":\"fa fa-paragraph\"}}]}}]},\"plain_text\":\"Muslim Section\"},\"points\":[{\"x\":3.8461538461538463,\"y\":4.761904761904762},{\"x\":2.7472527472527473,\"y\":21.428571428571423},{\"x\":12.087912087912088,\"y\":21.428571428571423},{\"x\":12.087912087912088,\"y\":42.063492063492056},{\"x\":0,\"y\":44.444444444444436},{\"x\":2.7472527472527473,\"y\":90.47619047619048},{\"x\":15.384615384615385,\"y\":88.09523809523809},{\"x\":15.384615384615385,\"y\":88.09523809523809},{\"x\":17.032967032967033,\"y\":93.65079365079364},{\"x\":78.02197802197803,\"y\":100},{\"x\":81.86813186813187,\"y\":88.09523809523809},{\"x\":74.72527472527473,\"y\":84.12698412698413},{\"x\":80.21978021978022,\"y\":58.730158730158735},{\"x\":86.81318681318682,\"y\":60.317460317460316},{\"x\":100,\"y\":3.968253968253968},{\"x\":54.395604395604394,\"y\":0}]}]}"', N'{"id":9140,"editor":{"selected_shape":"rect-3799","tool":"poly"},"general":{"name":"unknown","width":1170,"height":608,"naturalWidth":1170,"naturalHeight":608},"image":{"url":"http://localhost:6465/Images/CemeteryPlots/78409594img171030.jpg"},"spots":[{"id":"rect-3799","title":"rect-3799","type":"poly","x":62.199,"y":12.79,"width":27.41,"height":36.516,"tooltip_content":{"squares_settings":{"containers":[{"id":"sq-container-403761","settings":{"elements":[{"settings":{"name":"Paragraph","iconClass":"fa fa-paragraph"}}]}}]}},"points":[{"x":3.8461538461538463,"y":4.761904761904762},{"x":2.7472527472527473,"y":21.428571428571423},{"x":12.087912087912088,"y":21.428571428571423},{"x":12.087912087912088,"y":42.063492063492056},{"x":0,"y":44.444444444444436},{"x":2.7472527472527473,"y":90.47619047619048},{"x":15.384615384615385,"y":88.09523809523809},{"x":15.384615384615385,"y":88.09523809523809},{"x":17.032967032967033,"y":93.65079365079364},{"x":78.02197802197803,"y":100},{"x":81.86813186813187,"y":88.09523809523809},{"x":74.72527472527473,"y":84.12698412698413},{"x":80.21978021978022,"y":58.730158730158735},{"x":86.81318681318682,"y":60.317460317460316},{"x":100,"y":3.968253968253968},{"x":54.395604395604394,"y":0}]}]}', CAST(N'2017-10-30' AS Date), N'78409594img171030.jpg', CAST(8 AS Decimal(18, 0)), 1, N'<p><br></p>', N'<p><br></p>', N'', N'', N'<p><br></p>', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cemetery] OFF
SET IDENTITY_INSERT [dbo].[CemeteryImages] ON 

INSERT [dbo].[CemeteryImages] ([Id], [Image], [OriginalImage], [CemeteryId]) VALUES (CAST(17 AS Decimal(18, 0)), N'green map.png147354580img171030_thumbLarge.jpg', N'green map.png147354580img171030.jpg', CAST(15 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[CemeteryImages] OFF
SET IDENTITY_INSERT [dbo].[CemeteryLayers] ON 

INSERT [dbo].[CemeteryLayers] ([Id], [Name], [CemeteryId], [IsBooking], [Price]) VALUES (CAST(356 AS Decimal(18, 0)), N'aa', CAST(129 AS Decimal(18, 0)), 0, 15.0000)
INSERT [dbo].[CemeteryLayers] ([Id], [Name], [CemeteryId], [IsBooking], [Price]) VALUES (CAST(357 AS Decimal(18, 0)), N'bb', CAST(129 AS Decimal(18, 0)), 0, 30.0000)
SET IDENTITY_INSERT [dbo].[CemeteryLayers] OFF
SET IDENTITY_INSERT [dbo].[Counties] ON 

INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10035 AS Decimal(18, 0)), N'Bedfordshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10036 AS Decimal(18, 0)), N'Berkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10037 AS Decimal(18, 0)), N'Bristol', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10038 AS Decimal(18, 0)), N'Buckinghamshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10039 AS Decimal(18, 0)), N'Cambridgeshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10040 AS Decimal(18, 0)), N'Cheshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10041 AS Decimal(18, 0)), N'Cornwall', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10042 AS Decimal(18, 0)), N'Cumbria', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10043 AS Decimal(18, 0)), N'Derbyshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10044 AS Decimal(18, 0)), N'Devon', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10045 AS Decimal(18, 0)), N'Dorset', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10046 AS Decimal(18, 0)), N'Durham', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10047 AS Decimal(18, 0)), N'East Riding of Yorkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10048 AS Decimal(18, 0)), N'East Sussex', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10049 AS Decimal(18, 0)), N'Essex', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10050 AS Decimal(18, 0)), N'Gloucestershire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10051 AS Decimal(18, 0)), N'Greater Manchester', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10052 AS Decimal(18, 0)), N'Hampshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10053 AS Decimal(18, 0)), N'Hereford and Worcester', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10054 AS Decimal(18, 0)), N'Hertfordshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10055 AS Decimal(18, 0)), N'Isle of Man', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10056 AS Decimal(18, 0)), N'Isle of Wight', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10057 AS Decimal(18, 0)), N'Kent', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10058 AS Decimal(18, 0)), N'Lancashire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10059 AS Decimal(18, 0)), N'Leicestershire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10060 AS Decimal(18, 0)), N'Lincolnshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10061 AS Decimal(18, 0)), N'London', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10062 AS Decimal(18, 0)), N'Merseyside', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10063 AS Decimal(18, 0)), N'Middlesex', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10064 AS Decimal(18, 0)), N'Norfolk', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10065 AS Decimal(18, 0)), N'North Yorkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10066 AS Decimal(18, 0)), N'Northamptonshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10067 AS Decimal(18, 0)), N'Northumberland', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10068 AS Decimal(18, 0)), N'Nottinghamshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10069 AS Decimal(18, 0)), N'Oxfordshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10070 AS Decimal(18, 0)), N'Rutland', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10071 AS Decimal(18, 0)), N'Shropshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10072 AS Decimal(18, 0)), N'Somerset', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10073 AS Decimal(18, 0)), N'South Yorkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10074 AS Decimal(18, 0)), N'Staffordshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10075 AS Decimal(18, 0)), N'Suffolk', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10076 AS Decimal(18, 0)), N'Surrey', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10077 AS Decimal(18, 0)), N'Tyne and Wear', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10078 AS Decimal(18, 0)), N'Warwickshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10079 AS Decimal(18, 0)), N'West Midlands', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10080 AS Decimal(18, 0)), N'West Sussex', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10081 AS Decimal(18, 0)), N'West Yorkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10082 AS Decimal(18, 0)), N'Wiltshire', NULL, CAST(N'2017-09-29' AS Date), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10083 AS Decimal(18, 0)), N'County Antrim', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10084 AS Decimal(18, 0)), N'County Armagh', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10085 AS Decimal(18, 0)), N'County Down', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10086 AS Decimal(18, 0)), N'County Fermanagh', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10087 AS Decimal(18, 0)), N'County Londonderry', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10088 AS Decimal(18, 0)), N'County Tyrone', NULL, CAST(N'2017-09-29' AS Date), CAST(4 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10089 AS Decimal(18, 0)), N'Aberdeenshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10090 AS Decimal(18, 0)), N'Angus', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10091 AS Decimal(18, 0)), N'Argyll and Bute', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10092 AS Decimal(18, 0)), N'Ayrshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10093 AS Decimal(18, 0)), N'Clackmannanshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10094 AS Decimal(18, 0)), N'Dumfries and Galloway', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10095 AS Decimal(18, 0)), N'Dunbartonshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10096 AS Decimal(18, 0)), N'Dundee', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10097 AS Decimal(18, 0)), N'East Lothian', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10098 AS Decimal(18, 0)), N'Edinburgh', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10099 AS Decimal(18, 0)), N'Falkirk', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10100 AS Decimal(18, 0)), N'Fife', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10101 AS Decimal(18, 0)), N'Glasgow', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10102 AS Decimal(18, 0)), N'Highland', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10103 AS Decimal(18, 0)), N'Inverclyde', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10104 AS Decimal(18, 0)), N'Lanarkshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10105 AS Decimal(18, 0)), N'Midlothian', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10106 AS Decimal(18, 0)), N'Moray', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10107 AS Decimal(18, 0)), N'Orkney', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10108 AS Decimal(18, 0)), N'Perth and Kinross', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10109 AS Decimal(18, 0)), N'Renfrewshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10110 AS Decimal(18, 0)), N'Scottish Borders', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10111 AS Decimal(18, 0)), N'Shetland Isles', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10112 AS Decimal(18, 0)), N'Stirlingshire', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10113 AS Decimal(18, 0)), N'West Lothian', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10114 AS Decimal(18, 0)), N'Western Isles', NULL, CAST(N'2017-09-29' AS Date), CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10115 AS Decimal(18, 0)), N'Anglesey/Sir Fon', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10116 AS Decimal(18, 0)), N'Blaenau Gwent', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10117 AS Decimal(18, 0)), N'Bridgend', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10118 AS Decimal(18, 0)), N'Caerphilly', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10119 AS Decimal(18, 0)), N'Cardiff', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10120 AS Decimal(18, 0)), N'Carmarthenshire', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10121 AS Decimal(18, 0)), N'Ceredigion', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10122 AS Decimal(18, 0)), N'Conwy', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10123 AS Decimal(18, 0)), N'Denbighshire', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10124 AS Decimal(18, 0)), N'Flintshire', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10125 AS Decimal(18, 0)), N'Glamorgan', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10126 AS Decimal(18, 0)), N'Gwynedd', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10127 AS Decimal(18, 0)), N'Merthyr Tydfil', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10128 AS Decimal(18, 0)), N'Monmouthshire', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10129 AS Decimal(18, 0)), N'Neath Port Talbot', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10130 AS Decimal(18, 0)), N'Newport', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10131 AS Decimal(18, 0)), N'Pembrokeshire', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10132 AS Decimal(18, 0)), N'Powys', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10133 AS Decimal(18, 0)), N'Rhondda Cynon Taff', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
GO
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10134 AS Decimal(18, 0)), N'Swansea', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10135 AS Decimal(18, 0)), N'Torfaen', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Counties] ([Id], [Name], [Description], [AddedDate], [CountryId]) VALUES (CAST(10136 AS Decimal(18, 0)), N'Wrexham', NULL, CAST(N'2017-09-29' AS Date), CAST(5 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Counties] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(1 AS Decimal(18, 0)), N'UK', N'UK', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(2 AS Decimal(18, 0)), N'England', N'England', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(3 AS Decimal(18, 0)), N'Scotland', N'Scotland', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(4 AS Decimal(18, 0)), N'Northern Ireland', N'Northern Ireland', NULL)
INSERT [dbo].[Countries] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(5 AS Decimal(18, 0)), N'Wales', N'Wales', NULL)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(2 AS Decimal(18, 0)), N'Burial Plots FAQs', N'Here at Burialplots.co.uk we try our best to make the experience of bereavement as stress free as it possibly can be. A large part of that involves providing as much information as possible, all gathered in one place and easily accessed. Just in case we’ve missed anything out, here are a few of the questions people frequently ask when planning or attending a funeral, or dealing with the wider ramifications of the death of a loved one.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(3 AS Decimal(18, 0)), N'Do I have to wear black to a funeral?', N'It’s traditional to wear black and dress formally for a funeral, but this is nothing like as strict a rule as it once was. Whilst most of the men attending a funeral are still likely to be wearing a formal suit and tie, people now feel able to dress in a way which, perhaps, reflects the personality of the deceased. The most important thing is to find out what those closest to the deceased would prefer and dress accordingly. If you’re arranging a funeral and would like the standard dress ‘rules’ relaxing, then let your guests know.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(4 AS Decimal(18, 0)), N'Who is allowed to travel with the funeral procession?', N'This will be up to the person arranging the funeral. In most cases close family and friends will travel in the limousines arranged by the funeral director, with other mourners following in their own cars or meeting where the service will be held.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(5 AS Decimal(18, 0)), N'Where does the funeral procession leave from?', N'It’s traditional to wear black and dress formally for a funeral, but this is nothing like as strict a rule as it once was. Whilst most of the men attending a funeral are still likely to be wearing a formal suit and tie, people now feel able to dress in a way which, perhaps, reflects the personality of the deceased. The most important thing is to find out what those closest to the deceased would prefer and dress accordingly. If you’re arranging a funeral and would like the standard dress ‘rules’ relaxing, then let your guests know.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(6 AS Decimal(18, 0)), N'Where do people sit during the service?', N'Those who were closest to the deceased, the chief mourners, sit at the front of the venue for the service. ', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(7 AS Decimal(18, 0)), N'What usually happens after the funeral?', N'After the funeral is over, the mourners usually gather for refreshments. This may be at a nearby pub or hotel, or perhaps at the home of the deceased. If you find it difficult to locate a suitable venue then your funeral director may be able to help.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(8 AS Decimal(18, 0)), N'Can a mourner take part in the funeral service?', N'Friends or family are welcome to carry the coffin into the venue for the service, often feeling privileged to do one last thing or the deceased. If the numbers are insufficient, a funeral director will offer help and support, as well as instructing the people carrying the coffin, known as pall bearers.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(9 AS Decimal(18, 0)), N'Can the funeral procession travel past a favourite place?', N'The person responsible for the cars will be happy to travel along a specified route and even stop at a place which was special to the deceased. This could be anything from an old home to a school, a sporting venue or even a pub.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(10 AS Decimal(18, 0)), N'Can a mourner take part in the funeral service?', N'Friends or family of the deceased are more than welcome to take part in the service. This might mean reading a poem, a prayer or some other piece of literature, up to and including writing and reading a eulogy.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(11 AS Decimal(18, 0)), N'Can I put objects in the coffin?', N'Yes, it is perfectly acceptable to put keepsakes such as jewellery, photographs, letters, medals or favourite possessions in the coffin as a gesture to the deceased. If the body is to be cremated, your funeral director will advise as to what objects will have to be removed. ', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(12 AS Decimal(18, 0)), N'Should children go to the funeral?', N'If you feel the children in question will be able to cope with emotion of the day, then allowing them to attend the funeral will probably help them to deal with the bereavement. It’s important to make sure they know what’s going to happen before the funeral, and to be ready to answers questions and offer comfort on the day itself.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(13 AS Decimal(18, 0)), N'What happens if I visit the chapel of rest?', N'The decision to see the deceased for one last time at a chapel of rest is a highly personal one. Many people find the peacefulness of the loved one comforting, whilst others may be upset to see how pale they are and how cold to the touch. Whatever your feelings, don’t allow yourself to be pressured into visiting or not visiting. This should be your decision and yours alone.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(14 AS Decimal(18, 0)), N'What if the will can’t be found?', N'Many wills often go missing after a death, particularly if the death was unexpected. That’s why it’ so important to store your will safely with a person such as a solicitor. If the will was professionally written, it is possible to search for it through the National Wills Register. If it can’t be found, the normal legal processes will be allowed to take their course.', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[FAQs] ([Id], [Question], [Answer], [AddedDate]) VALUES (CAST(15 AS Decimal(18, 0)), N'Do I need to publish an obituary notice?', N'Publishing an obituary notice in a local or national newspaper is recommended. It will allow people you can’t contact personally to find out about the death and when and where the funeral will be held. If you’re unsure how to go about posting an obituary, your funeral director will be able to help. ', CAST(N'2017-10-07' AS Date))
SET IDENTITY_INSERT [dbo].[FAQs] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([Id], [CopyRight], [Branding], [PubDate]) VALUES (CAST(1 AS Decimal(18, 0)), N'&copy; 2017, Burial Plots', N'Powered by <a style="color:lightblue" href="http://www.wertech.co.uk/" target="_blank">WeRTech</a>', CAST(N'2017-04-18' AS Date))
SET IDENTITY_INSERT [dbo].[Footer] OFF
SET IDENTITY_INSERT [dbo].[FuneralServices] ON 

INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(3 AS Decimal(18, 0)), N'Solicitors', N'legal matters ', CAST(N'2017-05-12' AS Date), N'solicitors-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(4 AS Decimal(18, 0)), N'Will Writers', N'legal writing services', CAST(N'2017-05-12' AS Date), N'will-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(5 AS Decimal(18, 0)), N'Funeral Directors', N'funeral orchestrator', CAST(N'2017-05-12' AS Date), N'funeral-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(6 AS Decimal(18, 0)), N'Funeral Cars', N'car hire chauffeur services', CAST(N'2017-05-12' AS Date), N'funeral-car-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(7 AS Decimal(18, 0)), N'Florists', N'floral decoration services for funeral', CAST(N'2017-05-12' AS Date), N'florist-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(8 AS Decimal(18, 0)), N'Insurance', N'Insurance', CAST(N'2017-05-12' AS Date), N'insurance-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(9 AS Decimal(18, 0)), N'Funeral Plans', N'funeral management', CAST(N'2017-05-12' AS Date), N'funeral plan98345.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(10 AS Decimal(18, 0)), N'Memorials ', N'memorial service', CAST(N'2017-05-12' AS Date), N'memorial-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(11 AS Decimal(18, 0)), N'Headstones', N'headstones for plots', CAST(N'2017-05-12' AS Date), N'headstone46761.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(12 AS Decimal(18, 0)), N'Stonemasons', N'stonemasons', CAST(N'2017-05-12' AS Date), N'stonemasons-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(14 AS Decimal(18, 0)), N'Coffins', N'Coffins', CAST(N'2017-05-12' AS Date), N'coffin-pic.jpg')
INSERT [dbo].[FuneralServices] ([Id], [Name], [Description], [Date], [Picture]) VALUES (CAST(17 AS Decimal(18, 0)), N'Probate', N'Probate', CAST(N'2017-05-12' AS Date), N'probate-pic.jpg')
SET IDENTITY_INSERT [dbo].[FuneralServices] OFF
SET IDENTITY_INSERT [dbo].[Graves] ON 

INSERT [dbo].[Graves] ([Id], [Address], [Image], [SKU], [PlotName], [PlotNo], [PlotType], [Size], [Location], [TierId], [ShortDescription], [FullDescription], [Internement], [InternementFee], [Lease], [Maintenance], [SpotId], [SectionId], [ReligionId], [SectId], [IsEnabled]) VALUES (CAST(129 AS Decimal(18, 0)), NULL, N'', N'plotName', N'Plot No. 2', N'2', N'Plot No. 2', N'12', NULL, CAST(1 AS Decimal(18, 0)), N'Plot No. 2', N'Plot No. 2', N'12', CAST(12 AS Decimal(18, 0)), N'23', N'Plot No. 2', N'spot-1543', CAST(31 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Graves] OFF
SET IDENTITY_INSERT [dbo].[ItalianPage] ON 

INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(1 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Dove Iniziare</h2>
                    <div class="padding-left">
                      <p>Quando qualcuno vicino a te muore la prima sfida è di affrontare il dolore, la sofferenza, la rabbia e l’intorpidimento che si può sentire che potrebbe essere travolgente nella fase iniziale della perdita. Ciò che colpisce molte persone sono tuttavia il numero di problemi che devono essere risolti nella fase che segue subito la morte. Per alcuni, queste questioni burocratiche e pratiche possono essere totalmente travolgenti, mentre altri sentono che avere un punto di focalizzazione di questo tipo possa in realtà aiutarli nei primi giorni del lutto. Il numero di agenzie che devono essere contattate, e la documentazione e la burocrazia coinvolti, possono essere minimizzati con un certo grado di pre-pianificazione, in particolare nei termini di organizzazione di un funerale, ma qualsiasi morte porta un’ampia gamma di compiti legali e amministrativi.</p>
                      <p>Su Burialplots.co.uk abbiamo racchiuso tutta la gamma di informazioni necessarie nel caso della perdita. Dal momento che muore una persona, bisogna ricercare un posto di sepoltura e organizzare un funerale, e affrontare la vita che si sussegue, e troverai tutte le informazioni e i consigli che necessiti su questo sito. Ciò inizia con i passi che devono essere necessariamente svolti immediatamente dopo la morte diuna persona amata.</p>
                    </div>
                    <br />
                    <h2 class="underline">Registrare la morte</h2>
                    <div class="padding-left">
                      <p>Nella maggior parte dei casi, la morte deve essere registrata entro cinque giorni. Il luogo migliore in cui farlo è presso l’ufficio di registrazione locale, in quanto ciò significa che riceverai i documenti necessari nello stesso giorno. Il processo dovrebbe durare non più di 30 minuti e potrebbe essere necessario prendere in precedenza un appuntamento. La morte può essere registrata da:</p>
                      <ul>
                          <li>Un partente del defunto</li>
                          <li>Una persona presente al momento della morte</li>
                          <li>Un amministratore di un ospedale (se la morte accade in ospedale)</li>
                          <li>Una persona che ha trovato il corpo (se la morte è accaduta altrove)</li>
                          <li>La persona incaricata all’organizzazione con il direttore funebre</li>
                      </ul>
                      <p>Devi prendere il certificato che indica la causa di morte, firmato da un medico, e sarebbe utile anche se non obbligatorio portare qualunque o tutti i documenti seguenti:</p>
                      <ul>
                          <li>Certificato di nascita</li>
                          <li>Conto fiscale del consiglio</li>
                          <li>La patente di guida</li>
                          <li>Certificato di matrimonio o relazione civile</li>
                          <li>Una scheda medica NHS</li>
                          <li>Un passaporto/li>
                          <li>Prova di indirizzo come una fattura di servizi</li>
                      </ul>
                      <p>Dovrai comunicare al magistrato il nome completo del defunto al momento in cui è morto e il suo nome da nubile. Dovrai anche fornire dettagli circa la data e il luogo di nascita, l’ultimo indirizzo residenziale e l’occupazione, se applicabile. Il magistrato dovrà anche sapere il nome, la data di nascita e l’occupazione di qualunque coniuge o partner civile, che sia sopravvissuto o deceduto, e dovrai fornire dettagli di qualsiasi pensione di stato o altri benefici di cui stava usufruendo il defunto. Quando il processo è completato, il magistrato fornirà un Certificato di Sepoltura o di Cremazione, conosciuto come “Green Form” (Modulo Verde) e un modulo BD8 che corrisponde al Certificato della Registrazione della Morte. Se il defunto stava usufruendo di una pensione di stato o di altri benefici, è necessario compilare il BD8 e spedirlo in una busta prepagata.</p>
                     
                      <p>Le copie del Certificato di Morte possono essere acquistate dal magistrato per una piccola tassa, e queste saranno necessarie per sistemare gli affari del defunto.</p>
                    </div>
                    <br />
                    <h2 class="underline">Se è coinvolto un medico legale </h2>
                    <div class="padding-left">
                      <p>In alcuni casi, quando ad esempio la causa di morte è sconosciuta o era violenta o innaturale, il medico coinvolto può segnalare la morte al medico legale. Se fosse questo il caso, il processo di registrazione della morte potrebbe durare più a lungo. In alcuni casi il medico legale può affermare che la causa della morte era ovvia, e in questo caso il medico può firmare il certificato di morte e il medicolegale può rilasciare un certificatoseparato che precisa che non è necessario un’indagine post mortem. Se è necessaria invece un esame post mortem ciò causerà un ritardo nel rilascio del certificato di morte, in particolare se il post portem è inconclusivo e il medico legale decide di instaurare un’inchiesta. In casi del genere, è possibile farsi rilasciare un certificato di morte intermedio che può essere utilizzato per dimostrare alle varie organizzazioni che la persona in questione sia deceduta.</p>
                      <p>Una volta registrata la morte, è possibile iniziare il processo dell’organizzazione di un funerale. Per consigli su questo o altri problemi riguardo la perdita, si prega di contattarci tramite email (Email) o chiamando il numero 0100 000 0000.  </p>
                    </div>
                    
                </div>', N'Dove iniziare', N'Dove iniziare', N'banner-where-to-start456.jpg', N'WHERE TO START')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(2 AS Decimal(18, 0)), N'
            <header id="masthead" class="site-header" role="banner">
                <div class="site-header-main">
                    <div class="banner" style="background-image: url(''images/banner-where-to-start.jpg'');">
                    
                    </div><!-- banner -->
                    <!-- .site-header-menu -->
                </div>
                <!-- .site-header-main -->
            </header>
            <!-- .site-header -->
         
                                <h2 class="underline">Burial Plots Dopo Il Funerale</h2>
                                <div class="padding-left">
                                    <p>Per molte persone, il periodo che segue immediatamente il funerale rappresenta una delle fasi più difficili del processo di lutto. Organizzare un funerale, per quanto possa essere complesso, può fornire un focus che manca subito dopo la morte. Allo stesso tempo, la perdita di una persona cara è ancora recente e i sentimenti sono ancora crudi, e l’aiuto ed il supporto delle persone potrebbero essere collaborativi.</p>
                                    <p>Qui su Burialplots.co.uk lavoriamo per rendere il processo del lutto il più semplice possibile. Lo facciamo offrendo dei posti di sepoltura di facile accesso e convenienti, in questo periodo in cui la fornitura di posti è minore rispetto alla domanda. Raggruppiamo inoltre anche tutto l’aiuto e i consigli di cui potresti necessitare in seguito alla perdita di una persona cara, che va dall’impatto psicologico fino all’offrire accesso all’aiuto pratico e ai servizi necessari. Mentre il funerale stesso contrassegna una fase particolare del processo di lutto, il periodo che segue contrassegna l’inizio del resto della tua vita senza la presenza del defunto. Altrove sul sito troverai consigli su come affrontare la perdita a lungo termine, e i dettagli delle organizzazioni che ti possono aiutare in questo. Immediatamente dopo il funerale, tuttavia, ci sono svariati passi pratici che dovresti affrontare. </p>
                                </div>
                                <br />
                                <h2 class="underline">Diccelo Una Volta</h2>
                                <div class="padding-left">
                                    <p>Anche se avrai informato amici e famiglia al tempo della perdita, ci sono molte organizzazioni e organismi che dovranno essere notificati a lungo termine. Alcuni di questi potrebbero essere affrontati quando si registra la morte. In alcune aree è disponibile il servizio Diccelo Una Volta. Se fosse così il magistrato ti provvederà un numero di riferimento unico che può essere usato online o quando telefoni l’assistenza telefonica di Diccelo Una Volta. Dovrai fornire le informazioni seguenti a Diccelo Una Volta:</p>
                                    <ul>
                                        <li>Data di nascita del defunto</li>
                                        <li>Numero di assicurazione nazionale</li>
                                        <li>Numero di patente (se disponibile)</li>
                                        <li>Numero di passaporto (se disponibile) </li>
                                        <li>Dettagli di qualunque beneficio di cui usufruivano, come la Pensione Statale</li>
                                        <li>Dettagli del servizio del consiglio a cui avevano accesso, come il settore Blue Badge</li>
                                        <li>Nome e indirizzo del parente più prossimo</li>
                                        <li>Nome e indirizzo di qualunque coniuge o partner civile, se diverso dal parente prossimo</li>
                                        <li>Persona o azienda, come un’impresa legale, che amministra il patrimonio del defunto, che include qualunque cosa che va dalla proprietà, oggetti di valore e denaro, e provvedere nome, indirizzo e dettagli di contatto</li>
                                        <li>Dettagli di qualunque settore di pensione pubblica o delle forze armate di cui era membro </li>
                                    </ul>
                                    <p>Si prega di notare che è necessaria l’autorizzazione del parente prossimo, di qualunque persona si stia occupando del loro patrimonio (nominato generalmente “esecutore” o “amministratore”) e chiunque sia in condivisione comune di benefici, prima di dare i loro dettagli in Diccelo Una Volta.</p>
                                    <p>Una volta che hai fornito i dettagli rilevanti a Diccelo Una Volta, essi informeranno le organizzazioni seguenti:</p>
                                    <ul>
                                        <li>Agenzia delle entrate (HMRC)</li>
                                        <li>Dipartimento del lavoro e delle pensioni (DWP)</li>
                                        <li>L’ufficio passaporti</li>
                                        <li>L’agenzia per la licenza di guida (DVLA)</li>
                                        <li>Il consiglio locale</li>
                                        <li>Qualunque settore pubblico o delle forze armate</li>
                                    </ul>
                                    <p>Nel momento dell’elaborazione di questo testo, le seguenti autorità locali non offrono il servizio di Diccelo Una Volta, implicando che dovrai contattare personalmente gli organismi rilevanti:</p>
                                    <ul>
                                        <li>Brighton and Hove</li>
                                        <li>Croydon</li>
                                        <li>East Sussex</li>
                                        <li>Eastbourne</li>
                                        <li>Hammersmith and Fulham</li>
                                        <li>Harrow</li>
                                        <li>Hastings</li>
                                        <li>Highland</li>
                                        <li>Lewes</li>
                                        <li>Liverpool</li>
                                        <li>Manchester</li>
                                        <li>Medway</li>
                                        <li>Portsmouth</li>
                                        <li>Rother</li>
                                        <li>Salford</li>
                                        <li>Wealden</li>
                                    </ul>
                                </div>
                                <br />
                                <h2 class="underline">Altre organizzazioni/h2>
                                <div class="padding-left">
                                    <p>Sia che tu possa usare Diccelo Una Volta o meno, dovrai anche informare qualunque banca o società imprenditoriale con cui il defunto aveva degli account in modo da poterli chiudere o modificare. Dovrai inoltre notificare i seguenti organismi o organizzazioni:</p>
                                    <ul>
                                        <li>Qualunque datore di lavoro del defunto</li>
                                        <li>I Servizi Sociali, specificatamente per annullare qualunque servizio di cui stavano usufruendo</li>
                                        <li>Le organizzazioni mediche come ospedali, medici o dentisti per annullare qualunque appuntamento e per restituire le attrezzature, se disponibili</li>
                                        <li>Rappresentanti legali come avvocati</li>
                                        <li>Qualunque organismo che provvede a servizi volontari, come pasti su ruote o Cura e Riparazione</li>
                                    </ul>
                                    <p>I dettagli precisi differiranno di persona in persona, ma dovresti inoltre anche contattare gli imprenditori privati, prestatori di mutui, compagnie di assicurazioni, società di servizi (acqua, gas, elettricità), società telefoniche (mobile e fissa), per la licenza TV, le compagnie da cui il defunto ha affittato elettrodomestici come televisori digitali, fornitori di Internet, carta di credito o altre società di prestiti. Dovresti inoltre annullare l’adesione a organizzazioni quali librerie, club sociali, sindacati e organizzazioni professionali. Se qualunque bimbo nella famiglia era vicino al defunto è una buona idea informare la scuola, consentendo agli insegnanti di affrontare qualsiasi reazione in modo sensibile e informato. </p>
                                </div>
                                <br />
                                <h2 class="underline">Le tue stesse circostanze</h2>
                                <div class="padding-left">
                                    <p>La morte di una persona cara potrebbe cambiare anche le tue circostanze personali. Se questo è il caso potresti beneficiare di determinate prestazioni o diritti. Il tuo ufficio di Sicurezza Sociale o DWP così come l’ufficio di Consulenza dei Cittadinidovrebbe essere in grado di dirti se questo è il caso.</p>
                                    <p>Il numero di questioni pratiche che emergono dopo la morte di una persona cara può essere molto travolgente. La buona notizia è che è disponibile l’aiuto, e se non trovi le informazioni che stai ricercando su questo sito ti preghiamo di contattarci tramite email a (Email) o chiama al numero 0100 000 0000. </p>
                                </div>

                              ', N'DOPO FUNERALE', N'DOPO FUNERALE', N'banner-where-to-start85273.jpg', N'AFTER FUNERAL')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(3 AS Decimal(18, 0)), N'			 <div class="container">
                    <h2 class="underline">Burial Plots Memoriale </h2>
                    <div class="padding-left">
                      <p>Mentre ogni individuo affronterà la perdita di una persona cara nella propria maniera personale, una cosa che porta conforto a molte persone è la presenza di un memoriale a lungo termine del defunto. La forma più comune di memoriale è probabilmente una pietra tombale sulla tomba stessa, ma se le circostanze lo permettono, può assumere qualunque forma tu possa desiderare. La chiave per scegliere un memoriale sta nella selezione di qualcosa che potrai essere in grado di visitare quando desideri avvicinarti alla persona che hai perso. Anche se il defunto è probabilmente nella tua mente la maggior parte del tempo, un memoriale offrirà un santuario nella vita quotidiana per focalizzare specificatamente i tuoi pensieri, sentimenti e ricordi. </p>
                      <p>Burialplots.co.uk è stato creato per alleviare i problemi che le persone riscontrano sempre più spesso quando si tratta di acquistare un posto di sepoltura. Sia che il posto in questione sia necessario per una persona cara che è appena andata, sia che si sta acquistando come parte di una pre-pianificazione di un funerale, la verità è che la domanda sta superando di gran lunga la fornitura in molte parti del paese. Noi abbiamo applicato la tecnologia più moderna per rendere più semplice la ricerca di un posto di sepoltura nella località a tua scelta, con una selezione di opzioni di pagamento che offrono flessibilità e convenienza. Abbiamo inoltre riunito una vasta gamma di informazioni ed aiuti necessari per quando una persona non c’è più, includendo i vari memoriali disponibili.</p>
                    </div>
                    <br />
                    <h2 class="underline">Pietra tombale</h2>
                    <div class="padding-left">
                      <p>Se si opta per una pietra tombale tradizionale come memoriale per il defunto è necessario scoprire le norme in atto del cimitero in questione. Ci sono probabilmente regole che riguardano l’aspetto quale la dimensione e la forma di una pietra così come il colore e la tipologia consentita della formulazione. È bene ricordare anche che potresti aspettare un po’ di tempo dopo la sepoltura prima che si possa porre la pietra in sicurezza.</p>
                    </div>
                      <br />
                    <h2 class="underline">Alternative</h2>
                    <div class="padding-left">
                      <p>Se una pietra tombale non è un’opzione valida, o personalmente senti che non sia appropriata, esiste una vasta gamma di opzioni spesso disponibili. Molte persone optano per una semplice targhetta in un giardinetto, o piuttosto una targhetta su una panchina o sedile entro il giardino. Un’altra alternativa è quella di piantare un albero o un’altra pianta come memoriale vivente. Le opzioni offerte dai diversi cimiteri o dai luoghi di culto potranno variare e potresti scegliere quindi di collocare un memoriale altrove. Potresti scegliere di ricordare il tuo caro optando per un memoriale quale una targhetta, una meridiana, una vasca per uccellini o una panchina posta in un luogo che sapevi era speciale per loro, e che potresti visitare quando desideri riavvicinarti a loro. Un’altra possibilità è di fare una donazione a loro nome ad un progetto della comunità o ad un’organizzazione che si basa sulle donazioni caritatevoli. In molti casi, l’eventuale edificio in questione contrassegnerà il dono con un mattone o una piastrella marcate o una targhetta.</p>
                    </div>
                    <br />
                    <h2 class="underline">Memoriale online</h2>
                    <div class="padding-left">
                      <p>Con l’avanzamento della tecnologia, sempre più persone stanno approfittando del fatto che ora è possibile creare un memoriale online. I siti web dedicati ai memoriali ti permetteranno di creare una home page con un’immagine della persona in questione con le parole che scegli di scrivere su di loro. Il vantaggio di un sito del genere è che anche altre personepossono visitare ed aggiungere i loro tributi e ricordi nel tempo. Siti differenti offrono diverse opzioni riguardo la possibilità di caricare elementi come video e musica mentre altri avranno le opzioni di sicurezza che ti permetteranno di avere un controllo completo e di limitare la disponibilità. Per assicurare la presenza a lungo termine del tuo memoriale online chiedi se il sito in questione abbia firmato il codice volontario di condotta conosciuto come Il Codice del Memoriale.</p>
                      <p>Qualunque tipo di memoriale tu scelga di creare in memoria del tuo amato, dovresti prenderti del tempo per scegliere e dovresti sentire di avere il controllo completo sul risultato finale. Se desideri saperne di piùsulle opzioni offerte contattaci via email a (Email) o chiamateci al numero 0100 000 0000.</p>
                    </div>
                                </div>', N'MEMORIALS', N'MEMORIALS', N'banner-about31519.jpg', N'MEMORIALS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(4 AS Decimal(18, 0)), N'   <div class="container">
                    <h2 class="underline">Burial Plots Funerali</h2>
                    <div class="padding-left">
                      <p>Il funerale che scegli dopo la morte di una persona cara sarà la tua occasione di marcare il suo passaggio e di celebrare la sua vita. Essendoci molti aspetti diversi nell’organizzazione di un funerale, molte persone trovano che il processo in sé sia piuttosto terapeutico, offrendo in un certo senso la “chiusura” al tutto e dandogli qualcosa verso cui focalizzare le emozioni che si sentono immediatamente dopo la morte. Qui su Burialplots.co.uk offriamo accesso alla più vasta gamma possibile di consigli e aiuti per le persone che stanno affrontando il problema di una perdita. Sono inclusi supporti emotivi, spiegazioni di questioni pratiche e forniture convenienti ed accessibili di posti di sepoltura localizzati in tutto il Regno Unito. In alcuni casi il defunto potrebbe aver intrapreso una certapre-pianificazione per quanto riguarda i vari aspetti del funerale, con la speranza di far risparmiare un po’ dello stress e delle spese coinvolte ai loro cari. La reticenza nei confronti della questione della mortalità implica però che spesso questo non è il caso, e che il funerale in questione dovrà essere organizzato da zero appena dopo la morte. Indipendentemente dalle circostanze in particolare, ci sono delle azionibase che devono essere eseguitecon la morte di una persona, dopo che questa morte sia stata registrata. </p>
                      
                    </div>
                    <br />
                    <h2 class="underline">Un direttore funebre</h2>
                    <div class="padding-left">
                      <p>Nella maggior parte dei casi, il primo passo per organizzare un funerale sarà trovare un direttore funebre. Alcune persone scelgonodi organizzare loro stessi il funerale, per un desiderio di essere coinvolti più personalmente, o per risparmiare i costi del funerale. Indipendentemente dal corso d’azione che si intraprende, i dettagli del servizio funebre saranno in questo caso totalmente nelle sue mani. Bisogna ricordare che questa è la tua occasione per marcare la perdita di una persona cara ma anche di celebrare cosa significava per te e per gli altri. Ciò potrebbe comportare, ad esempio, una selezione di musiche che significava molto per loro da suonare o ascoltare durante il servizio funebre, o di scegliere letture o poemi o altra letteratura che sapevi che lei amava. Non sentirti limitato nelle tue opzioni a causa della sensazione di fare ciò che sarebbe “previsto” in un funerale. Ad esempio, diverse culture marcano il passaggio di una persona amata in modi che potrebbero colpire noi persone di paesi sviluppati dell’occidente come qualcosa di bizzarro; da Funerali Jazz del New Orleans alla “sepoltura del cielo” Tibetana e l’opzione della Corea del Sud in cui si trasformano i resti del deceduto in perline lucenti e colorate piuttosto che in cenere. Nel Ghana le persone sono spesso sotterrate in quello che chiamano le “bare fantasia” che sono create e costruite per rappresentare qualcosa di importante nella vita del deceduto. I risultati possono essere simili ad una sfilata fluttuante piuttosto che ad una bara tradizionale, e esempi notevoli includono la creazione di un Mercedes Benz, un velivolo leggero e un pollo gigante.</p>
                      <p>Mentre i dettagli di un funerale e del servizio funebre stesso sono aperti all’interpretazione, esiste un modello specifico per i funerali svolti nel Regno Unito. Nella maggior parte dei casi la processione inizia dalla casa del defunto, con la bara su un’auto e le persone partecipanti in altre auto viaggiando lentamente verso il luogo in cui si svolge il servizio. Questo è spesso un edificio religioso come una chiesa o una cappella. La bara sarà piazzata davanti a tutti, e i parenti più stretti saranno seduti più vicini. In caso di sepoltura, la bara sarà portata alla tomba dopo il servizio iniziale e in seguito si svolgerà un servizio più breve quando la bara verrà abbassata nel terreno. L’ordine e il contenuto del servizio è qualcosa che amici e famiglia del defunto incaricati di organizzare il funerale decideranno fra loro. Dopo il funerale, i partecipanti spesso si riuniscono per un rinfresco, spesso a casa del defunto, a volte in un luogo come la sala di servizio in un hotel locale o un pub. In molti casi questo è il momento in cui le persone si sentono più a loro agio nel condividere i loro ricordi della persona morta, e per iniziare il processo di guardare alla loro vita con gioia e con tristezza.</p>
                      <p>In altre parti di questo sito vedremo le opzioni disponibili per quanto riguardano gli aspetti di un funerale come fiori, memoriali, musica e trasporto. Mentre specializziamo nel fornire accesso a posti di sepoltura convenienti, offriamo anche consigli su tutti gli altri aspetti di un funerale. Se hai qualsiasi domanda al riguardo, per favore contattaci tramite email a (Email) o chiama al numero 0100 000 0000. </p>
                    </div>
                   
                 
                </div>', N'Funerales', N'Funerales', N'banner-about4181.jpg', N'FUNERALS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(5 AS Decimal(18, 0)), N'<header id="masthead" class="site-header" role="banner">
    <div class="site-header-main">
        <div class="banner" style="background-image: url(''images/banner-where-to-start.jpg'');">
       
        </div><!-- banner -->
        <!-- .site-header-menu -->
    </div>
    <!-- .site-header-main -->
</header>
<!-- .site-header -->

                    <h2 class="underline">Burial Plots Organizzare</h2>
                    <div class="padding-left">
                        <p>Qui su Burialplots.co.uk il nostro obiettivo principale è di rendere l’organizzazione funebre più facile diquanto lo sia mai stato. Per questo abbiamo reso più semplice la ricerca del tuo posto di sepoltura perfetto. La località precisa del luogo di riposo è di grande importanza per chiunque voglia essere seppellito, ma la realtà è che la fornitura di posti di sepoltura nel Regno Unito sono ai più bassi livelli storici. Questo porta a due effetti: i prezzi si innalzano e ricercare la perfetta località diventa incredibilmente difficile. Abbiamo quindi creato una soluzione online in cui raggruppiamo tutti i posti disponibili nel Regno Unito in un unico luogo. Abbiamo reso la ricerca del posto perfetto incredibilmente semplice e inoltre offriamo una varietà di opzioni di pagamento, che va dal pagamento in anticipo fino all’elaborazione di un piano di pagamento. Sia che tu sia in necessità urgente o che tu stia pianificando per il futuro, in tal modo noi ti offriamo tranquillità mentale.</p>
                        <p>Oltre a fornire posti di sepoltura rendiamo semplice anche il resto della pianificazione funebre in termini generali. Nel nostro sito troverai consigli, aiuto e link che riguardano ogni aspetto del lutto, dall’impatto psicologico della perdita di una persona cara fino a questioni pratiche come la registrazione della morte. Mentre molte persone fanno organizzare il funerale da un direttore funebre esperto, è vitale avere una chiara idea di cosa sarà coinvolto nel funerale in questione. Anche se pensarci su possa sembrare difficile al momento, il funerale è la tua occasione di dare un ultimo saluto e di celebrare la vita del defunto. Col passare il tempo il fatto che tu abbia dato il saluto che la persona in questione si meritava sarà una fonte di grande conforto.</p>
                    </div>
                    <br />
                    <h2 class="underline">Organizzazione</h2>
                    <div class="padding-left">
                        <p>Ogni funerale sarà diverso, poiché rappresenta la persona che è morta e i sentimenti delle persone che sono rimaste in vita. Per questo motivo, anche se si lavora con un direttore funebre, è meglio avere un’idea di quali sono i vari componenti del funerale medio. Le questioni pratiche come la scelta di una bara e di un memoriale, o organizzare l’acquisto di fiori, sono trattati altrove su Burialplots.co.uk. Raggruppare tutti i dettagli di un servizio funebre è profondamente personale, e un paio di fattori da tenere a mente sono elencati di seguito:</p>
                        <ul>
                            <li><strong>La sede del funerale</strong>. Si assume in generale che i servizi funebri saranno svolti in una chiesa o in qualche altro edificio religioso. Può invece avvenire in qualsiasi luogo adatto o persino in una casa privata, tuttavia, che potrebbe essere più adatto ad una persona senza forti credenze religiose. </li>
                            <li><strong>Il servizio</strong>. Di nuovo, si assume che il servizio sarà svolto da una figura religiosa come un ministro o un prete. Potrebbe, tuttavia, essere svolto da un umanista, dal direttore funebre che hai assunto o persino da qualcuno vicino al defunto.</li>
                            <li><strong>Contenuto</strong>. Le parole dette sono in realtà molto importanti. Se, come spesso è il caso, la persona che sta svolgendo il servizio non ha conosciuto il defunto, assicurati di fornirgli i dettagli necessari per personalizzare il servizio. Puoi anche avere altre persone che leggono brani come poemi, preghiere o qualsiasi altra cosa che pensi possa aiutare a riflettere la personalità e la vita del defunto.</li>
                            <li><stron>Musica</strong>. Sono tradizionalmente eseguiti inni in un funerale, ma negli anni recenti è diventato sempre più popolare includere altri tipi di musica. Questo è generalmente trasmesso da CD o da musica scaricata, ma è anche possibile suonare musica live.</li>
                            <li><strong>Ordine del servizio</strong>. Un ordine stampato del servizio serve a due scopi. Renderà più semplice seguire le procedure a coloro che stanno partecipando al funerale, e darà a chiunque un memento da tenere, ricordandogli la persona che stanno salutando. L’ordine del servizio può anche essere spedito agli amici e ai membri della famiglia che non possono partecipare. </li>
                        </ul>
                        <p>Devi anche prendere in considerazione l’organizzazione del funerale stesso. Il trasporto da e per il funerale consiste in genere di un carro funebre e dalle auto organizzate dal direttore funebre. Come per ogni altro aspetto, tuttavia, questo può essere personalizzato. Alcune persone preferiscono il trasporto con un carro trainato da cavalli, altri invece optano per una modalità di trasporto connesso al defunto, che può includere furgoni, camion e moto. </p>
                        <p>Organizzare un funerale significa pensare alla persona che hai appena perso e come ti piacerebbe contrassegnarlo. Spesso è un processo terapeutico, e rappresenta il primo passo verso la guarigione dal dolore del lutto. Se desideri discutere del processo allora si prega di contattarci per email a (Email) o chiamaci al 0100 000 0000.</p>
                    </div>

                    ', N'SISTEMAZIONE', N'SISTEMAZIONE', N'banner-where-to-start11492.jpg', N'ARRANGING')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(6 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Servizi£</h2>
                    <div class="column-block">
                      <div class="column">
                           <p>Quando qualcuno vicino a te muore l’impatto è multi-sfaccettato. Il primo e il più ovvio problema che si deve affrontare saranno le emozioni che sentirai. Non ci sono due persone uguali, e così il dolore, la rabbia, la tristezza e lo shock differiranno di persona in persona e di caso in caso. La cosa importante da realizzare è che non c’è una cosa quale il “corretto” modo di sentirsi quando hai perso una persona cara, e il cliché che afferma che il tempo è il migliore guaritore è in realtà basato sulla verità. Anche se risulta difficile credere alla situazione immediata che segue la morte, verrà un momento in cui potrai ricordare la vita di una persona sia con gioia che con tristezza.</p>
                          <p>Il secondo aspetto dell’afflizione, che può soggiungere più come uno shock, è il numero reale di questioni pratiche che devono essere trattate. In alcuni casi il defunto potrebbe aver programmato fino ad un certo punto il suo funerale, ma spesso questo non è il caso, in particolare se la morte era inaspettata. Anche la pre-pianificazione potrebbe lasciare alcuni aspetti del processo, come la registrazione della morte, da gestire dopo l’evento, e affrontare le diverse organizzazioni coinvolte può essere travolgente.</p>
                      </div>
                      <div class="column">
                          <img src="/images/video.jpg" alt="">
                      </div>
                    </div>
                    <div class="padding-left">
                      <p>Burialplots.co.uk è stato creato per rendere l’impatto del lutto un po’ meno stressante. Prima di tutto lo facciamorendendo più facile la ricerca e l’acquisto di un posto di sepoltura nel Regno Unito. Il mercato attuale dei posti di sepoltura non sta funzionando correttamente, con un’abbondanza di domanda rispetto alle disponibilità e di prezzi che si innalzano. Noi stiamo utilizzando la tecnologia più moderna per rendere la ricerca del postodi sepoltura desiderato più veloce e facile, e offriamo anche piani di pagamento per aumentare la flessibilità e la convenienza.</p>
                    </div>
                    <br />
                    <h2 class="underline">Probate Services</h2>
                    <div class="padding-left">
                      <p>Il secondo aspetto della nostra offerta è di accedere all’intera gamma di servizi necessari alla realizzazione di un funerale. Sia che tu possa utilizzare un direttore funebre o possa organizzare personalmente i dettagli, qui troverai link, consigli ed aiuti in tutto il sito web. Abbiamo riunito tutti i servizi in cui potresti essere interessato, così come un ampio supporto di consigli su questioni emotive e legali, e i dettagli delle organizzazioni che sono specializzate nell’aiutare le persone che devono affrontare un lutto. </p>
                    </div>
                    <br />
                    <h2 class="underline">Tipo di servizio</h2>
                    <div class="padding-left">
                      <p>Anche se ogni funerale è il riflesso dell’individuo che avete perso e i sentimenti di coloro che sono rimasti in vita, ci sono diversi aspetti inclusi nella maggioranza dei funerali, quindiponiamo nel sito web i link che provvedono a questi servizi. Così come i direttori funebri, provvediamo ai dettagli generali su aspetti quali la scelta di una bara, organizzare un memoriale, prenotare una auto necessaria per il funerale, la tipologia di fiori che vorreste acquistare e diverse opzioni di programmi di funerali disponibili. Organizzando in anticipo un funerale potrebbe far risparmiare il tempo e l’impegno coinvolti nell’organizzare il funerale in seguito alla morte alle persone care.</p>
                      <p>Non importa quali siano le tue circostanze individuali, qui troverai tutto quello di cui necessiti per affrontare un funerale in Buralplots.co.uk. Se hai qualsiasi domanda, o se volessi discutere riguardo qualcosa in particolare che tu abbia visto sul sito, si prega di contattarci per email all’indirizzo (Email) o telefonando il nostro team su 0100 000 0000.</p>
                    </div>
               
                </div>', N'Servizi', N'Servizi', N'banner-about73860.jpg', N'SERVICES')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(7 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Pianificazione di un Funerale £ &pound;</h2>
                    <div class="padding-left">
                      <p>Organizzare in anticipo un funerale è qualcosa su cui molte persone tendono ad esitare.Le ragioni sono evidenti; scrivere un testamento, acquistare un’assicurazione sulla vita, o comprare un piano funebre è un’accettazione del fatto che un giorno lascerai i tuoi cari. Proprio come scrivere un testamento, tuttavia, acquistare un piano funebre è un modo per assicurarti che il dolore della tua perdita sarà diminuito di un certo grado. Affrontare la morte di una persona amata è un miscuglio complesso di risposte emotive e questioni pratiche. Pianificando quindi in anticipo il più possibile, sarai in grado di alleviare ai tuoi cari l’obbligo di trattare con tali questioni pratiche, lasciandoli liberi di concentrarsi sul lutto del tuo passaggio e di celebrare la tua vita. Il fatto che un piano assicurerà anche che la tua famiglia non sarà impattata da un certo numero di fatture costose a seguito del tuo passaggio offrirà una grande tranquillità mentale.</p>
                      <p>Qui su Burialplots.co.uk abbiamo creato un sito che rende la pre-pianificazione di un funerale più semplice di quanto sia mai stato. Mettendo insieme tutto l’aiuto, tutte le informazioni e i servizi di cui necessiterai quando farai i tuoi arrangiamenti, abbiamo creato un portale unico accessibile e utile. Piuttosto che avere a che fare con una gamma di diverse agenzie e compagnie, qui troverai tutte le informazioni che ti servono, dall’acquisto di un posto di sepoltura nella località a tua scelta fino alla scelta di vari piani funebri. </p>
                    </div>
                    <br />
                    <h2 class="underline">Cos’è un piano funebre?</h2>
                    <div class="padding-left">
                      <p>In simple terms a funeral plan is a financial arrangement which allows you to decide upon the arrangements for your funeral in advance and put aside the money to pay for those arrangements. The key to the security offered by a funeral plan is that it will keep the money you pay into it securely ring-fenced, and will, when the time comes, use that money to carry out your wishes precisely. The cost of funerals has risen by more than the rate of inflation in recent years and seems set to continue doing so in the future. By investing in a funeral plan, you ensure that no matter how much prices rise, the funds to carry out your wishes will be available. </p>
                    </div>
                    <br />
                    <h2 class="underline">How Will I Pay?</h2>
                    <div class="padding-left">
                      <p>In termini semplici un piano funebre è un accordo finanziario che ti permette di decidere le modalità del tuo funerale in anticipo permettendoti di mettere da parte i soldi per pagare tali arrangiamenti. La chiave di sicurezza offerta da un piano funebre è che i soldi che pagherai saranno tenuti al sicuro e quando verrà il momento quei soldi si useranno per eseguire con precisione i tuoi desideri. Il costo dei funerali si è innalzato più della rata di inflazione negli ultimi anni e sembra che continuerà a seguire lo stesso schema anche in futuro. Investendo quindi in un piano funebre sei assicurato che indipendentemente dall’aumento del prezzo, saranno sempre disponibili i fondi per realizzare i tuoi desideri.</p>
                    </div>
                    <br />
                    <h2 class="underline">Come posso pagare? </h2>
                    <div class="padding-left">
                      <p>La maggior parte dei piani offrono delle opzioni flessibili per quanto riguarda il pagamento. Se lo desideri puoi pagare il totale del piano in anticipo, o altrimenti pagare un deposito e poi investire mensilmente per un periodo di anni, che vanno di solito da un anno a dieci. Avendo arrangiato un semplice ordineunico e permanente puoi rilassarti con la consapevolezza che i costi del tuo funerale saranno provveduti. Se dovessi andartene prima che si sia completato il piano di pagamento, molti fornitori offrono il servizio già pagato se i tuoi parenti coprono il saldo rimanente.</p>
                      <p>Un piano funebre differisce da un’assicurazione sulla vita o da un conto per i risparmi per due motivi; garantisce la copertura dei costi del funerale che tu stesso hai scelto pagato al prezzo corrente e indipendentemente dall’innalzamento dei costi in futuro. Ti permette anche inoltre di salvare i tuoi cari dallo stress e dalle preoccupazioni dell’organizzazione in sè. Quando te ne andrai, tutto ciò che devono fare è fare una semplice chiamata al fornitore del piano funebre. Se sei interessato ad acquistare un piano funebre, o hai ulteriori domande al riguardo, non esitare a contattarci. Lo puoi fare tramite email al (Email) o ci puoi chiamare al 0100 000 0000.</p>
                    </div>
                    
                   
                </div>', N'PIANI FUNERALI', N'PIANI FUNERALI', N'banner-about67235.jpg', N'FUNERAL PLANS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(8 AS Decimal(18, 0)), N'<h2 class="ql-align-center">Burial Plots Su Di Noi</h2>
<p class="ql-align-center">Siamo un’azienda che lavora per chiarificare e per semplificare il processo della pianificazione o dell’organizzazione di un funerale, sia che stiate salutando una persona amata o organizzandovi per le vostre necessità future. Svolgiamo questa attività con due scopi principali. Il primo riguarda il fornire accesso ai posti di sepoltura, e il secondo è fornire consigli, aiuti e servizi di cui possa necessitare la persona media quando viene il momento di pianificare un funerale o di affrontare il lutto.</p>
<p class="ql-align-center">La fornitura di posti di sepoltura è qualcosa che negli ultimi anni ha raggiunto una crisi nel Regno Unito. Un sondaggio della BBC del 2013 ha scoperto che molte autorità locali del paese hanno predetto che i posti si esauriranno entro il decennio, dato che l’opzione di riutilizzare i posti già usati è qualcosa che rimane troppo controversa per essere una soluzione valida.</p>
<p><br></p><h2 class="ql-align-center">Domanda</h2>
<p class="ql-align-center">Questa carenza di fornitura sta avvenendo in una domanda che riguarda il 25% dei funerali. Il fatto è che le comunità religiose come le fedi musulmane e ebree che sono ormai saldamente incluse nella popolazione britannica, fedi in cui è obbligatoria la sepoltura, implica che la domanda dei posti di sepoltura molto probabilmente non diminuirà in futuro. Per far fronte a questa situazione abbiamo già acquistato 6000 posti entro l’area londinese e presto avremo acquistato oltre 150.000 in tutto il Regno Unito. Oltre a ciò acquisteremo e svilupperemo i cimiteri nell’Ovest di Londra, Dorset e Birmingham, lavorando per trasformare la nostra fornitura di posti di sepoltura in un’offerta nazionale. Facendo ciò saremo in grado di offrire posti per uso immediato o per la pre-pianificazione in una località a scelta dei clienti a prezzi accessibili. Inoltre offriamo anche piani di pagamento flessibili, offrendo così la tranquillità offerta dal pre-acquisto di un posto di sepoltura per molte più persone.</p>
<h2 class="ql-align-center">Servizi</h2>
<p class="ql-align-center">L’altro aspetto della nostra offerta è la creazione di un portale unico che fornisce informazioni e permette l’accesso a tutti gli aspetti della pianificazione di un funerale. I visitatori del nostro sito potranno avere accesso all’intera gamma di servizi necessari quando si pianifica un funerale, che vogliano acquistare o meno un posto di sepoltura. Come stanno le cose, i servizi di questo tipo sono generalmente solo disponibili tramite un direttore funebre, e le informazioni sulle offerte sono frammentate e distribuite tra una varietà di imprese e agenzie. Visitando quindi il nostro sito chiunque debba organizzare un funerale sarà in grado di trovare tutto l’aiuto e le informazioni di cui si necessita, dall’accesso a servizi tipo fiorai, auto e pietre tombali, ai consigli su come far fronte agli impatti emotivi e psicologici del lutto e della perdita.</p>
<p class="ql-align-center">Burialplots.co.uk fornirà tutti gli strumenti necessari a chiunque abbia bisogno di organizzare un funerale o a chi voglia già pianificare gli eventi della loro stessa morte. Affrontando questioni tipo testamenti, assicurazioni sulla vita e piani funebri su misura, siamo in grado di offrire il pacchetto completo, lasciando agli utenti la sicurezza di sapere che hanno fatto tutto il possibile per facilitare uno degli aspetti più difficili della vita di un individuo.</p>', N'RIGUARDO A NOI', N'RIGUARDO A NOI', N'banner-about45773.jpg', N'ABOUTUS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(9 AS Decimal(18, 0)), N'  <div class="container">
                    <h2 class="underline">Burial Plots Chi e Perchè</h2>
                    <h3>Chi?</h3>
                    <div class="padding-left">
                      <p>Burialplots.co.uk è una società dedicata all’aggiornamento, alla semplificazione e alla trasformazione del mercato che provvede ai funerali. Organizzare un funerale è qualcosa che le persone sono riluttanti a pensare fino a quando non sia troppo tardi, e a quel punto i più vicini e i più cari devono affrontare la realtà della pianificazione funebre. La realtà è che nel momento in cui si sta lottando per affrontare l’impatto emotivo del lutto, si devono affrontare anche i numerosi problemi pratici e le spese inerenti a proposito della morte di una persona amata</p>
                      <p>Abbiamo quindi deciso di trasformare il compito dell’organizzazione di un funerale, che si tratti di una necessità immediata o che la persona che lo sta organizzando sta pianificando per un futuro. Per entrambi i casi abbiamo raccolto l’intera gamma di servizi che sono normalmente accessibili solo tramite un Direttore Funebre e li abbiamo postati in un unico luogo. Usare Burialplots.co.uk come portale rende possibile l’accesso a ogni aspetto di un funerale, dall’acquisto di una bara a consigli su come scrivere un elogio. Fornendo anche i dettagli di contatti delle organizzazioni che specializzano nell’aiutare le persone ad affrontare gli aspetti pratici ed emotivi di un lutto, abbiamo sviluppato una vera e propria destinazione finale.</p>
                      <p>L’altro aspetto fondamentale della nostra offerta, come suggerisce per l’appunto il nome, è provvedere ad un posto di sepoltura. Una sepoltura in un cimitero tradizionale corrisponde all’opzione di scelta del 25% della popolazione britannica. Le crescenti richieste dello spazio terrestre, e la riluttanza di riutilizzare luoghi esistenti, ha creato una situazione in cui molte autorità locali stanno segnalando una riduzione della disponibilità dei terreni necessari. In alcune parti del paese si prevede che le provvisioni si esauriranno completamente nel prossimo decennio o giù di lì. In questo scenario abbiamo acquisito, e continueremo ad acquisire, posti di sepoltura in tutto il Regno Unito. Combinando questa provvisione con la tecnologia moderna del clicca o scorri, abbiamo reso incredibilmente semplice trovare un posto di sepoltura nella località a tua scelta. Abbiamo combinato ciò con l’opzione di un pagamento flessibile che unisce il pagamento anticipato con piani accessibili, e quindi disponiamo di un servizio che unisce le provvisioni con convenienza e accessibilità.</p>
                      <h3>Perché?</h3>
                      <p>Che tu stia pianificando il tuo funerale o affrontando la morte di una persona cara, questo può essere un processo complicato e difficoltoso. La natura frammentaria del mercato potrebbe implicare che si devono affrontare contemporaneamente una serie di agenzie o imprese differenti, cosa abbastanza difficile quanto si sta pre-pianificando il funerale, ma particolarmente stressante se ti ritrovi recentemente in lutto. Usando quindi il nostro sito web troverai che l’intero processo è stato semplificato e velocizzato, e allo stesso tempo sarai sicuro di avere ottenuto il miglior affare possibile. Fare il possibile per la tua famiglia che lascerai alle spalle, o per una persona amata che è appena deceduta, può portare le persone allo sfinimento. Comparando quindi la vasta gamma di servizi e di fornitori accessibili tramite il nostro sito sarai capace di organizzare esattamente il funerale che vuoi senza pagare più di quanto dovresti. Un funerale è una celebrazione di vita, un’espressione d’amore e una parte vitale del processo di lutto. Semplificando quindi così i vari problemi pratici, Burialplots.co.uk ti renderà più semplice concentrarti sulle emozioni che contano veramente. Se hai qualsiasi domanda riguardo i servizi che offriamo, o riguardo qualunque aspetto dell’organizzazione di un funerale, per favore ci contatti all’indirizzo email (Email) o chiami al numero 0100 000 0000.</p>
                    </div>               

                    
                </div>', N'CHI E PERCHÉ', N'CHI E PERCHÉ', N'banner-about41924.jpg', N'WHO AND WHY')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(10 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Team</h2>
                    <div class="padding-left">
                      <p>Qualsiasi attività è buona quanto le persone che ci lavorano, e Burialplots.co.uk è sede delle migliori persone. Dall’alto verso il basso, il team che gestisce la nostra attività è dedicata a offrire i migliori servizi per i clienti, guidati da un desiderio di aiutare le persone in uno dei momenti più difficili della loro vita, con la consapevolezza completa delle problematiche emotive e pratiche coinvolte nell’organizzazione o nella pre-programmazione di un funerale. In definitiva, ogni funerale riguarda le persone, coloro che sono state lasciate indietro e coloro che sono decadute. Le persone che lavorano a Burialplots.co.uk lo comprendono e proprio per questo siamo orgogliosi di raccontarti un po’ di più su di loro:</p>
                    </div>
                 
                    

                   
                </div>', N'SQUADRA', N'SQUADRA', N'banner-about3649.jpg', N'TEAM')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(11 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Testimonianza</h2>
                    <div class="padding-left">
                      <p>Ci piace pensare di offrire il miglior servizio possibile a chiunque entra in contatto con noi. Organizzare o pre-programmare un funerale è una cosa difficile da fare, sia in termini pratici che emotivi. L’aiuto che offriamo è progettato per alleviare lo stress coinvolto e per offrire calma mentale. Le citazioni sotto riportate da alcune delle persone che abbiamo aiutato in passato illustrano quanto lavoriamo duramente per offrire un servizio di prima qualità:</p>
                    </div>
                    

                   
                </div>', N'TESTIMONIANZE', N'TESTIMONIANZE', N'banner-about101.jpg', N'TESTIMONIALS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(12 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Processo di Guarigione</h2>
                    <div class="padding-left">
                      <p>La prima cosa da dire riguardo il processo di guarigione quando perdi qualcuno vicino è che non esiste un modo “corretto” o “sbagliato” di sentirsi. La morte di qualcuno che ami è probabilmente la cosa più difficile, stressante e sconvolgente che tu abbia dovuto affrontare fino ad ora. Appena dopo la morte è probabile che tu sia sommerso da una devastante gamma di emozioni, che vanno dallo shock all’intorpidimento fino alla totale disperazione, e può capitare che questi sentimenti siano totalmente schiaccianti. </p>
                      <p>La notizia positiva è che l’intensità del dolore passerà col tempo. Per quanto dolorosa, la morte è una parte naturale della vita e l’accettazione della perdita di qualcuno è strettamente collegata alla psicologia umana. Naturalmente “cercare di superare” una perdita suona superficiale, e ciò non implica che verrà il momento in cui smetterai di sentire la mancanzadella persona che hai perso o che ti dimenticherai di loro. Qualcuno che ami non lascerà mai completamente il tuo cuore e la tua mente, ma nel processo di guarigione verrà un momento in cui potrai ricordare la persona con qualche altro sentimento oltre il dolore e la tristezza. Potrebbe sembrare impossibile appena dopo la morte, ma eventualmente sarai in grado di guardare con gioia e felicità la vita che hai condiviso con tale persona, oltre che il solo dolore della perdita. Non sarà un processo completamente lineare, e ci saranno periodi in cui sembra che stai iniziando ad emergere dal peggio del tuo dolore solo per ritornarci di nuovo, ma si giungerà un certo livello di accettazione della tua perdita.</p>
                    </div>
                    <br />
                    <h2 class="underline">Fasi iniziali</h2>
                    <div class="padding-left">
                      <p>Anche se ogni caso è differente, così come è differente ogni persona, il dolore può essere suddiviso in fasi che supererai man mano. La reazione iniziale è un senso di intorpidimento e di incredulità, e non importa quanto siamo consapevoli a livello intellettuale che tutti coloro che ci sono vicini un giorno moriranno, lo shock di vederlo accadere realmente è enorme. L’equilibrio tra l’intorpidimento e la pura incredulità è risultato dell’effetto di quanto sia stata inaspettata la morte in questione. In tutti i casi, è molto probabile che trascorrerai il periodo immediatamente dopo la morte sentendoti come se fossi confuso. Ti sarà difficile concentrarti sui compiti quotidiani e sarai sopraffatto da onde di tristezza così intense che l’unica cosa che sarai in grado di fare è sederti e piangere.</p>
                      <p>Oltre ai sentimenti previsti di dolore e afflizione, le persone che hanno perso una persona amata spesso riferiscono anche di essere arrabbiati, a volte con la persona che li ha lasciati, a volte col destino e con la vita in generale e a volte con qualunque causa di morte. Il potere puro delle emozioni che senti possono portare anche a sintomi fisici. Oltre all’esaurimento ti potresti sentire stordito, senza fiato o persino iperattivo, come se bloccarti e stare fermo ti portasse ad essere più sopraffatto dal dolore. Potresti avere difficoltà a dormire iniziando così un ciclo doloroso in cui ti ritrovi ancora più esausto il giorno seguente.</p>
                    </div>
                    <br />
                    <h2 class="underline">Andare avanti</h2>
                    <div class="padding-left">
                      <p>Dopo aver accettato che la perdita sia reale e aver sperimentato il dolore del lutto, ti ritroverai in una fase in cui accetterai lentamente la tua perdita. Proprio durante questo periodo è molto importante tirare fuori i tuoi sentimenti piuttosto che cercare di indossare un volto coraggioso. Se sei fortunato avrai amici e famiglia con cui parlare, ma questo non è sempre il caso. C’è anche la possibilità che ti sentiresti a disagio ad essere completamente onesto con le persone che ti sono vicine, dato che probabilmente anche loro stanno affrontando il loro dolore. Questo è il momento in cui può essere estremamente d’aiuto avere qualcuno con cui parlare, parte delle molte organizzazioni che sono state appositamente create per aiutare le persone ad affrontare la propria perdita. Abbiamo fornito una lista di alcune di queste organizzazioni utili qui (Link per la pagina “Organizzazioni Utili”), ed è probabile che sarai in grado di trovare una che si occupa della tua situazione specifica.</p>
                      <p> Col tempo, gli estremi iniziali di dolore inizieranno a diminuire, ma non c’è un periodo di tempo fisso perché ciò possa accadere. Alcuni momenti dell’anno, come Natale, anniversari di compleanno o di matrimonio, possono essere particolarmente difficili da affrontare. Per alcune persone, affrontare questi giorni può implicare il prendersi un giorno di pausa dal lavoro per ritirarsi a passare il tempo con i loro pensieri, mentre altri potrebbero optare di fare qualcosa di celebrativo, o forse provare ad agire come se fosse una giornata normale. La chiave è di fare tutto quello che ti porta a tuo agio.</p>
                      <p>Se ritieni che non ti stai smuovendo dai forti sentimenti iniziali di dolore, o che stai diventando dipendente da altri sostegni come l’alcol o farmaci, non avere paura di parlare con il tuo medico personale o con un consulente. È possibile trasformare la tristezza naturale del dolore in problemi mentali, e se tu o la tua famiglia sentite che la tua perdita sta avendo ancora un impatto estremamente negativo quando dovresti provare ad andare avanti, è meglio cercare un aiuto disponibile.</p>
                      <p>Se hai domande riguardo il processo di lutto o stai cercando di accettare una perdita, contattaci per favore tramite email (Email) o chiama il numero 0100 000 0000.</p>
                    </div>
                    
                </div>', N'PROCESSO DI GUARIGIONE', N'PROCESSO DI GUARIGIONE', N'banner-about10245.jpg', N'HEALING PROCESS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(13 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Avere a che fare con bambini</h2>
                    <div class="padding-left">
                      <p>Come adulto, avere a che fare col dolore del lutto può essere un processo difficile e confusionario. È difficile quindi immaginare quanto possa essere dolorosa la perdita di un membro stretto della famiglia nella percezione di un bambino.</p>
                      <p>Quando cresciamo, capiamo lentamente i concetti di mortalità e il fatto che tutti dovranno eventualmente morire. Un bambino che si trova di fronte alla morte di una persona cara si troverà ad affrontare per la prima volta questa idea, e il tuo ruolo come adulto è cercare di guidarli attraverso le emozioni che sentono e permetterli di parlare degli effetti che la morte ha avuto su di loro.</p>
                    </div>
                    <br />
                    <h2 class="underline">Raccontare al bambino</h2>
                    <div class="padding-left">
                      <p>È importante raccontare al bambino circa la morte di una persona cara il più presto possibile. Si può essere tentati di lasciarli ignoranti al riguardo, ma ritardare la cattiva notizia potrebbe portare ad una scoperta accidentale e in una maniera incontestabile. Se ti siedi vicino al bambino e racconti con calma e pazienza cosa sia successo riuscirai a gestire facilmente questo momento difficile. Cerca di evitare eufemismi come “sta riposando”, poiché questo potrebbe portare al dubbio che la persona in questione si possa risvegliare un giorno, inoltre potrebbe portarli ad una estrema preoccupazione quando essi stessi stanno per andare a dormire.</p>
                    </div>
                    <br />
                    <h2 class="underline">Rispondere alle domande</h2>
                    <div class="padding-left">
                      <p>Come regola generale, se un bimbo è abbastanza maturo da fare domande sul concetto della perdita e della morte, allora è abbastanza maturo da poter ricevere una risposta onesta. Cerca il più possibile di dare risposte brevi e semplici, ma tieni sempre a mente che questo evento nella vita di un bambino può avere un impatto che perdurerà per il resto della sua vita. Alcune domande, come perché muoiono le persone, sono più difficili di altre, ovviamente, ma un consiglio utile è di riportare il bimbo al mondo naturale che lo circonda e ad eventi come la caduta delle foglie da un albero d’inverno. Il bambino potrebbe anche chiedere cosa succede alle persone quando muoiono. Se hai una fede religiosa allora potresti dare conforto raccontando i concetti del paradiso e della vita post-morte, ma se non ce l’hai puoi sempre dire che una persona morta continua a vivere sia nella vostra mente che nei vostri cuori, nei ricordi e nelle conversazioni che avete fatto.</p>
                    </div>
                    <br />
                    <h2 class="underline">Parlare del defunto</h2>
                    <div class="padding-left">
                      <p>Parlare del defunto e dei tuoi ricordi da bambino è una parte vitale del processo della perdita. Alcune persone lasciano una “scatola dei ricordi” quando sanno che stanno per morire, ma se questo non è il caso puoi sempre creare una scatola per il tuo bambino, che contiene fotografie e altri oggetti per aiutare a ricordare e ad avere una conversazione appropriata. Qualsiasi cosa possa far sentire il bambino vicino alla persona che ha perso potrebbe aiutarlo ad affrontare i suoi sentimenti. Spiega che è perfettamente naturale che si sentano tristi e voler piangere ma che col tempo questi sentimenti cambieranno. Se trovi che sia difficile aiutare un bambino che sta nel processo di lutto, non esitare a contattare una delle organizzazioni specialiste create proprio per dare un aiuto in una situazione del genere.</p>
                    </div>
                    <br />
                    <h2 class="underline">Andare al funerale</h2>
                    <div class="padding-left">
                      <p>Decidere se un bambino dovesse partecipare al funerale è una domanda difficile e riguarda la tua conoscenza del bimbo in questione. Se un bimbo chiede di andare, e pensi che sia in grado di affrontarlo, allora dovresti permetterlo. Se non partecipasse potrebbe scatenarsi la sua immaginazione. Preparalo in anticipo per il funerale spiegando esattamente cosa accadrà, e spiegagli che andrete a vedere altri adulti che amano che saranno a loro volta sconvolti. Assicurati che il bimbo ha qualcuno di vicino durante il funerale, in modo tale che possa spiegare cosa stia accadendo, rispondere a qualsiasi domanda e offrire conforto. </p>
                      <p>Se hai qualsiasi domanda riguardo il processo del lutto o riguardo l’aiutare i bambini ad affrontare la perdita, contattaci per email al (Email) o chiama al numero 0100 000 0000.</p>
                    </div>
                    
                </div>', N'CONCESSIONE DEI BAMBINI', N'CONCESSIONE DEI BAMBINI', N'banner-about66176.jpg', N'DEALING WITH LOSS OF A CHILD')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(14 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Dolore Genitoriale</h2>
                    <div class="padding-left">
                      <p>Qualsiasi morte di qualcuno vicino a te è disturbante e difficile da affrontare, ma la morte di un bambino rappresenta una perdita particolarmente dolorosa. Quando i genitori perdono un figlio perdono una parte di loro stessi e perdono il futuro che avevano pianificato per il loro figlio. Perdere un genitore o un parente più anziano è un dolore genuino, ma in un certo senso si inserisce in quello che definiamo come il corso “naturale” degli eventi. Anche perdere un partner, terribile quanto possa essere, è qualcosa che accettiamo sempre come una possibilità. D’altro canto però, perdere un figlio sembra “sbagliato” e innaturale ad un livello molto primitivo ed istintivo. Per questi motivi si tratta di una delle afflizioni più dolorose per qualsiasi persona che debba affrontarlo.  </p>
                    </div>
                    <br />
                    <h2 class="underline">L’età del figlio</h2>
                    <div class="padding-left">
                      <p>Mentre perdere un piccolo bambino sembra il colpo più crudele di tutti, anche la morte di un bimbo più cresciuto può avere un impatto enorme, e i genitori raccontano spesso di come una parte di loro stessi sia morta con il loro bambino. Quasi tutti gli aspetti normali del dolore del lutto saranno ingigantiti quando muore un bambino, ma in particolare lo saranno le sensazioni di ingiustizia e i sentimenti di rabbia che si proveranno. Le coppie troveranno che l’intensità del dolore che stanno sentendo e qualsiasi differenza nel modo in cui reagisconoa questo dolore apre un baratro tra di loro. Per alcune persone il dolore potrebbe essere affrontato rinchiudendo le emozioni e cercando di indossare un volto coraggioso, mentre altri potrebbero esprimere il dolore che sentono in termini più aperti. Quando accade questa differenza tra i due componenti di una coppia essi potrebbero puntarsi a vicenda affermando di non soffrire “correttamente”. La verità è che non c’è un modo “corretto” di soffrire la morte di un figlio, e i genitori dovrebbero concedersi più spazio nel processare le emozioni che stanno sentendo a modo loro. In seguito alla perdita, ovviamente, questo è più facile da dire che da fare.</p>
                    </div>
                    <h2 class="underline">Altri bambini</h2>
                    <div class="padding-left">
                      <p>La presenza di altri bambini in famiglia potrebbe dare un po’ di sollievo quando muore un figlio, anche perché il genitore sente comunque il dovere di occuparsi del resto della propria famiglia, oltre a aiutarli a far fronte alla perdita di un fratello o di una sorella. A lungo termine però i genitori potrebbero comportarsi in modo troppo protettivo verso i bambini rimasti. Questa è una risposta naturale, ma bisogna ricordare che non deve essere permesso intralciare la vita di questi bambini che devono vivere al massimo la propria vita. Può essere confortante per un genitore sentire che il tributo migliore che possono pagare al loro bambino morto sarebbe quello di garantire che gli altri figli crescano conducendo la vita più pienamente e felicemente possibile.</p>
                    </div>
                    <h2 class="underline">Funerale del bambino</h2>
                    <div class="padding-left">
                      <p>Quando muore un parente più anziano il funerale che si organizza può in parte essere una celebrazione della loro vita. D’altro canto lo shock della morte di un bambino potrebbe rendere questo caso più improbabile, dato che l’attenzione sarà naturalmente sulla vita non vissuta piuttosto che sugli anni che hanno passato. Un funerale però serve comunque una funzione utile dato che offre al genitore un modo per focalizzare il loro dolore e offre un’opportunità di raduno per gli amici e per la famiglia. Parlare con i genitori riguardo il figlio che hanno perso può rivelarsi difficoltoso, scomodo e doloroso, ma la verità è che le conversazioni di questo tipo potrebbero in realtà essere d’aiuto.</p>
                      <p>Se hai bisogno di aiuto nell’affrontare la perdita di un bambino non esitare a contattare una delle organizzazioni specializzate che sono state istituite per fornire tale aiuto. Uno degli aspetti peggiori di questo tipo di perdita è la sensazione di solitudine e del fatto che nessuno potrebbe mai capire cosa tu stia passando. Parlare quindi con qualcuno che è stato anche un genitore in lutto, e sentire che ciò che senti è normale e naturale, può essere incredibilmente utile.</p>
                      <p>Se hai qualsiasi domanda riguardo il processo del lutto, riguardo l’affrontare la perdita di un bambino o per aiutare qualcuno che sta affrontando questo lutto, contattaci per email (Email) o telefona a 0100 000 0000.</p>
                    </div>
                    
                </div>', N'GRENO PARENTALE', N'GRENO PARENTALE', N'banner-about44905.jpg', N'PARENTAL GRIEF')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(15 AS Decimal(18, 0)), N'   <div class="container">
                    <h2 class="underline">Burial Plots Scossa da Morte Improvvisa</h2>
                    <div class="padding-left">
                      <p>Qualsiasi morte di una persona cara è un’esperienza traumatica e dolorosa, ma una morte improvvisa o violenta presenta un insieme unico di sfide. Quando qualcuno vicino a te muore alla fine di una lunga malattia la sensazione di tristezza, di dolore e del trauma sono del tutto genuini, ma un minimo di consolazione si può sentire nel fatto che, ad esempio, hai avuto la possibilità di salutare la persona in questione. Quelli che hanno perso qualcuno in questo modo spesso parlano del conforto che hanno ricavato dal sapere che sono stati in grado di dire alla persona deceduta che li amavano, per esempio, e che il deceduto è stato in grado di sistemare i propri affari e di sperimentare un livello di tranquillità mentale prima di morire.</p>
                      <p>D’altro canto, nel caso di una morte improvvisa o violenta non si applica nulla di questo. La sensazione iniziale di intorpidimento, scossa e disperazione si uniranno a una sensazione di rabbia e ingiustizia. Anche se nessuno fosse direttamente responsabile della morte, comincerai naturalmente a guardarti intorno, disperato a cercare la colpa di qualcuno o qualcosa. Questo è perfettamente naturale, date le tue sensazioni di colpa dell’essere vivo mentre la tua persona amata è stata portata via.</p>
                    </div>
                    <br />
                    <h2 class="underline">I fatti</h2>
                    <div class="padding-left">
                      <p>È importante cercare di scoprire il più possibile circa le circostanze della morte in questione. Il tuo istinto naturale può essere quello di proteggerti dagli aspetti spiacevoli che spesso accompagnano una morte improvvisa o violenta, ma le cose che ti ritroverai ad immaginare saranno altrettanto negative quanto la realtà. In più potresti sentirti perseguitato negli anni a venire dalla consapevolezza che non saprai mai esattamente cosa stava accadendo durante gli attimi finali della tua persona amata.</p>
                    </div>
                    <br />
                    <h2 class="underline">Questioni ufficiali</h2>
                    <div class="padding-left">
                      <p>Quando qualcuno muore inaspettatamente, non importa quali siano le cause, ma ci dovranno essere inchieste ufficiali. Questo può includere il coinvolgimento di medici, medico legale e altre organizzazioni. Questo può farti sentire come se il tuo caro fosse diventato di proprietà altrui, ma potrebbe anche farti focalizzare aiutandoti con il tuo dolore. La determinazione dello scoprire esattamente cosa sia successo ti potrebbe guidare attraverso le prime fasi della perdita, ma devi essere consapevole che quando si concludono le investigazioni ti ritroverai da solo con le tue emozioni, e questo potrebbe essere il momento in cui il dolore colpisce particolarmente forte.</p>
                    </div>
                    <br />
                    <h2 class="underline">Andare avanti</h2>
                    <div class="padding-left">
                      <p>Come per qualsiasi processo di lutto, superare lo shock iniziale e l’incredulità di una morte improvvisa o violenta può richiedere molto tempo, e questo varia di persona in persona. C’è una differenza tra accettare ciò che è successo e superarlo completamente. Il senso di ingiustizia e di perdita potrebbero non lasciarti mai, ma arrivare ad accettare ciò che sia successo significherà accettare queste emozioni e poter continuare a vivere il resto della tua vita. Come per tutte le afflizioni, parlare con altre persone può essere incredibilmente d’aiuto. Gli amici e la famiglia potrebbero starti vicino, ma spesso è più facile aprirsi ed esprimere totalmente le proprie emozioni con degli sconosciuti. Le organizzazioni specialistiche create per aiutare le persone ad affrontare la morte improvvisa o violenta forniscono esattamente questa opportunità, e questa opportunità dovrebbe essere sfruttata il più possibile. </p>
                      <p>Se hai qualsiasi domanda riguardo il processo del lutto, o di accettazione di una morte improvvisa o violenta, si prega di contattare per email all’indirizzo (Email) o telefonare il numero 0100 000 0000.</p>
                    </div>
                 
                </div>', N'SHOCK DI SUDDEN DEATH', N'SHOCK DI SUDDEN DEATH', N'banner-about51114.jpg', N'SHOCK OF SUDDEN DEATH')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(16 AS Decimal(18, 0)), N'  <div class="container">
                    <h2 class="underline">Burial Plots Suicidio</h2>
                    <div class="padding-left">
                      <p>La morte per suicidio di qualcuno che ti era vicino è una forma quasi unica del dolore che si prova nel lutto. I sentimenti normali di perdita e dolore saranno aggravati da un senso di colpa per non essere riusciti a impedire che accadesse, inoltre si potrebbeprovare rabbia verso i defunti.</p>
                    </div>
                    <br />
                    <h2 class="underline">Cause</h2>
                    <div class="padding-left">
                      <p>Ricercare la causa di un suicidio può essere una cosa incredibilmente difficile da fare. Questo perché nella maggioranza dei casi non c’è nulla di così semplice come una singola causa. Una delle cose più difficili da affrontare per coloro che restano indietro dopo un suicidio è il grado di dolore che il loro caro deve aver sopportato per decidere che la morte fosse l’unica soluzione possibile. Per la maggior parte delle persone, nessun problema risulta essere così grave da togliersi la vita. La persona che si è tolta la vita quindi era in uno stato di dolore così acuto che questa sembrava ai suoi occhi una decisione logica. Coloro rimasti indietro spesso si tormentano col pensiero che potevano fare di più, o che non hanno individuato in tempo i segnali. La verità è che la persona suicida si trovava in uno stato mentale che va al di là del ragionamento o della persuasione. Sebbene possano presentare un viso calmo e ragionevole nei confronti del mondo, dentro di loro sentono di aver fallito in una maniera enormemente fondamentale. </p>
                    </div>
                    <br />
                    <h2 class="underline">Reazione</h2>
                    <div class="padding-left">
                      <p>Uno degli aspetti più difficili di affrontare in una morte per suicidio è la reazione delle altre persone. Il fatto che dovrà essere svolta un’indagine, un’inchiesta del medico legale e la presenza probabile di qualche notizia stampa significa che tu sei consapevole che tutti sappiano cosa sia successo. Anche se ingiusta, l’idea del suicidio è vista ancora come un tabù, per cui le persone trovano una maggiore difficoltà a parlarne come farebbero con qualsiasi altro tipo di morte. Tuttavia però parlare del suicidio risulta essere una delle cose più utili che tu possa fare per affrontarlo. In verità nessuno potrebbe avere necessariamente le risposte alle domande che ti stai ponendo, ma essere semplicemente in grado di farle uscire ad alta voce può risultare estremamente terapeutico. Può essere anche confortante sentire che le altre persone che stavano vicine al deceduto non sono state in grado di individuare i segnali del dolore che stava passando, o al contrario, che sentivano che il suicidio fosse inevitabile e non poteva essere impedito da nessuno. Se non riesci a parlare del suicidio con le persone che ti sono vicine approfitta delle molte organizzazioni che offrono consigli di consulenza e servizi di ascolto specializzati su questo argomento. La possibilità di spiegare come ti senti a qualcuno che ha affrontato lo stesso dolore, o è stato addestrato ad aiutare a affrontare le ripercussioni, spesso segna il primo passo della lunga strada verso la guarigione.</p>
                    </div>
                    <br />
                    <h2 class="underline">Andare avanti</h2>
                    <div class="padding-left">
                      <p>L’unico modo per accettare un suicidio di una persona cara è di accettare che, in un certo senso, non capirai mai pienamente cosa li ha fatti agire in tal modo. Non potresti mai superare il fatto che hanno scelto di lasciarti, ma col tempo realizzerai che la scelta è stata unicamente loro, e che tu non li avresti potuti fermare in alcun modo. Forse sarai in grado di trarre un pochino di conforto dal fatto che il dolore che ristagnava in loro è, almeno, finito. </p>
                      <p>Se hai domande riguardo il processo di lutto, o riguardo l’accettazione della morte per suicidio, si prega di contattarci per email (Email) o telefonando il numero 0100 000 0000.</p>
                    </div>
                  
                </div>', N'SUICIDIO', N'SUICIDIO', N'banner-about29612.jpg', N'SUICIDE')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(17 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots Elogi</h2>
                    <div class="padding-left">
                          <p>Il funerale di una persona vicina ha un ruolo importante nel processo del lutto. Nelle fasi iniziali della perdita di una persona cara si può spesso sentire sconcertati, persi e in qualche modo intorpiditi. I molti problemi pratici e legali coinvolti nella morte di una persona possono aiutare a farti focalizzare e ad attraversare quei primi giorni difficili, e pianificando i dettagli del funerale hai la possibilità di ripensare profondamente alla persona persa. </p>
                          <p>Molte persone anticipano la preparazione del loro funerale e sicuramente sarete estremamente grati per questo. Dopo tutto, il funerale è un’opportunità di dare un ultimo saluto celebrando la vita, ed avere la consapevolezza che certi dettagli come la musica, i fiori e persino il luogo di sepoltura erano scelti dal defunto ti tranquillizzerà. La sensazione del “E’ quello che lui avrebbe voluto” è più che un cliché, è un pensiero immensamente confortante. </p>
                    </div>             
                    <br />
                    <h2 class="underline">Lo scopo dell’Elogio</h2>
                    <div class="padding-left">
                      <p>Se il servizio funebre nel suo complesso è stato progettato per catturare e riflettere la personalità del defunto, l’elogio siede al centro del cuore del suo processo. E’ la tua occasione per mettere giù le parole e per esprimere cosa ha significato per te. Molti servizi sono presieduti da qualcuno, spesso una figura religiosa, che forse non ha mai conosciuto in realtà la persona in questione. Mentre potresti essere in grado di fornirgli alcuni dettagli personali, niente si può avvicinare a un discorso scritto col cuore, designato per raccontare al mondo quello che trovavi di così speciale nella persona defunta.</p>
                    </div>
                    <br />
                    <h2 class="underline">Come iniziare</h2>
                    <div class="padding-left">
                      <p>La prima cosa da fare è sedersi e pensare alla persona che hai perso. Con un elogio vuoi dire al mondo cosa lo rende così speciale, quindi inizia a ricordare perché sia così speciale per te. Anche se questo può risultare doloroso, sarà anche confortante, e le persone che hanno scritto gli elogi commentano spesso che era la prima volta dalla morte dei loro cari che si sono ritrovati a sorridere al loro ricordo. Non ti preoccupare se non ti consideri uno scrittore di talento o hai un proprio modo di fare con le parole. Le persone non stanno cercando la creazione di una grande letteratura o frasi poetiche. Stanno invece cercando qualcosa che viene direttamente dal cuore, che esprime come ti senti e che gli ricorda la persona che vogliono rimembrare. Può risultare difficile focalizzare i tuoi pensieri quindi è meglio decidere una struttura dell’elogio. Si può seguire in ordine cronologico la loro vita, concentrarsi su un tema particolare come il loro senso dell’humor o la loro natura gentile, o si possono scegliere due o tre eventi chiave della loro vita. Un elogio stesso non deve essere totalmente tetro. Molti dei ricordi più a cuore di una persona sono quelli che coinvolgono risate, e il tuo elogio può essere al contempo divertente quanto triste.</p>
                    </div>
                    <br />
                    <h2 class="underline">Contenuto</h2>
                    <div class="padding-left">
                      <p>L’obiettivo principale di un elogio dovrebbe essere quello di riportare la tua persona amata per qualche istante in vita, preferibilmente presentando aspetti della sua personalità che tutti potrebbero riconoscere e ricordare. Potresti fare questo elencando i suoi conseguimenti, citando caratteristiche uniche della sua personalità o ripetendo le affermazioni con cui se ne uscivano, specificando i modi in cui abbia affrontato periodi negativi e quelli positivi, parlando di come la sua influenza continua a vivere nelle generazioni successive e discutere l’impatto che possa avere avuto su una comunità più ampia. </p>
                    </div>
                    <br />
                    <h2 class="underline">Tono</h2>
                    <div class="padding-left">
                      <p>Non sentirti costretto a usare un linguaggio tipo “Siamo qui riuniti oggi”. Parla in un modo che ti sembra naturale e che riflette onestamente il defunto. Se pensi che fosse stato imbarazzato a sentire le sue lodi in tal modo, o contrariamente fosse d’accordo con ogni parola detta, allora non escludere questo nel tuo elogio. Chiedi alle altre persone che lo conoscevano di condividere con te i loro ricordi, così potresti scoprire cose che possono essere usate per rendere il ritratto che stai dipingendo più ricco e più pieno. Non rendere l’elogio troppo lungo, specialmente se non sei abituato a parlare in pubblico. Qualsiasi cosa dura più di cinque minuti può far sì che le persone iniziano naturalmente a perdere interesse. </p>
                      <p>Come per tutti gli aspetti di un funerale non c’è un modo sbagliato o corretto di scrivere un elogio. Parla dal cuore, parla della persona che amavi e perché la amavi e prendi l’occasione per dare un ultimo saluto affettuoso,producendo qualcosa che tocca tutti coloro che lo ascoltano.</p>

                </div>', N'SCRITTURA DI EULAGIES', N'SCRITTURA DI EULAGIES', N'banner-about16863.jpg', N'WRITING EULAGIES')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(18 AS Decimal(18, 0)), N' <div class="container">
                    <h2 class="underline">Burial Plots Organizzazioni Utili</h2>
                    <div class="padding-left">
                      <p>Di seguito c’è una lista di varie organizzazioni che possono rivelarsi utili quando si sta affrontando un lutto o quando si sta pianificando un funerale. L’aiuto offerto da queste organizzazioni vanno dai consigli pratici legali e finanziari alle persone con cui parlare dei tuoi sentimenti di perdita e dolore.</p>
                    </div>
                    <br />
                    <h2 class="underline">Supporto Perdita</h2>
                    <div class="padding-left">
                      <p><strong>CruseBereavement Care </strong> <br/>
                      <strong>Tel:</strong> <a href="tel:0808 808 1677">0808 808 1677</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.cruse.org.uk" target="_blank">www.cruse.org.uk</a> &nbsp;&nbsp;
                      <strong>Indirizzo:</strong> CruseBereavement Care, PO Box 800,Richmond, Surrey, TW9 1RG 
                      </p>
                      <p><strong>I samaritani</strong> <br/>
                      <strong>Tel:</strong> <a href="tel:116 123">116 123</a> &nbsp;&nbsp;
                      <strong>Website:</strong> <a href="www.samaritans.org" target="_blank">www.samaritans.org</a>
                      </p>
                      <p><strong>Consiglio Cittadino</strong> <br />
                          Consigli pratici su aspetti legali e finanziari del lutto. Trova il tuo ufficio più vicino su  <a href="www.citizensadvice.org.uk" target="_blank">www.citizensadvice.org.uk</a>
                      </p>
                      <p><strong>Preoccupazioni sull’età Inghilterra</strong> <br/>
                      <strong>Address:</strong> Astral House, 1268 London Road,London ,SW16 4ER. &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:020 8765 7200">020 8765 7200</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.ageconcern.org.uk" target="_blank">www.ageconcern.org.uk</a>                       
                      </p>
                      <p><strong>Centro di Morte Naturale</strong> <br/>
                      <strong>Indirizzo:</strong> 6Blackstock Mews, Blackstock Road, London N4 2BT  &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:020 7359 8391">020 7359 8391</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.naturaldeath.org.uk" target="_blank">www.naturaldeath.org.uk</a>                       
                      </p>
                      <p><strong>Centro di Consiglio della Perdita</strong> <br/>
                      <strong>Indirizzo:</strong> Simplify,Heron House,Timothy''s Bridge Road,Stratford Upon Avon,CV37 9BX. &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:0800 634 9494">0800 634 9494</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.bereavementadvice.org" target="_blank">www.bereavementadvice.org</a>                       
                      </p>
                      <p><strong>Consiglio del Governo:</strong> <br/>
                      <a href="www.gov.uk/browse/births-deaths-marriages/death" target="_blank">www.gov.uk/browse/births-deaths-marriages/death</a>                       
                      </p>
                      <h3>La Morte di un Bimbo</h3>
                      <p><strong>Gli amici compassionevoli</strong> <br/>
					  <strong>Helpline:</strong> <a href="tel:0345 123 2304">0345 123 2304</a> &nbsp;&nbsp;
					  <strong>Sito web:</strong> <a href="www.tcf.org.uk" target="_blank">www.tcf.org.uk</a>
                      <strong>Indirizzo:</strong> The Compassionate Friends, 14 New King Street, Deptford, London SE8 3HS. &nbsp;&nbsp;
                      
                                             
                      </p>
                      <p><strong>Assistenza Telefonica Morte di un Bimbo</strong> <br/>                      
                      <strong>Assistenza telefonica:</strong> <a href="tel:0800 282 986">0800 282 986</a> / <a href="tel:0800 282 986">0800 282 986</a> &nbsp;&nbsp;
                      <strong>Sito web: </strong> <a href="www.childdeathhelpline.org.uk" target="_blank">www.childdeathhelpline.org.uk</a> <br />   
                      <strong>L’assistenza telefonica è aperta:</strong> Lunedì a venerdì dalle  10am to 1pm &nbsp;&nbsp; Martedì dall’1pm alle 4pm &nbsp;&nbsp; Mercoledì dall’1pm alle 4pm &nbsp;&nbsp; Tutte le sere dalle 7pm alle 10pm
                      </p>
                      <p><strong>La Fondazione per lo Studio della Morte Infantile (FSID)</strong> <br/>
                      Supporto per genitori i quali bimbi sono morti in culla. <br />
                      <strong>Indirizzo:</strong> FSID, 11 Belgrave Road, London SW1V 1RB &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:0808 802 6868">0808 802 6868</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.fsid.org.uk" target="_blank">www.fsid.org.uk</a>                       
                      </p>
                      <p><strong>Perdita di un Bambino Regno Unito</strong> <br/>
                      
                      <strong>Indirizzo:</strong> Clare Charity Centre, Wycombe Road, Saunderton, Buckinghamshire HP14 4BF &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:01494 568 900">01494 568 900</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.childbereavementuk.org" target="_blank">www.childbereavementuk.org</a>                       
                      </p>
                      <h3>Suicidio</h3>
                      <p><strong>Mente</strong> <br/>
                      
                      <strong>Indirizzo:</strong> 15-19 Broadway, Stratford, London E15 4BQ &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:020 8519 2122">020 8519 2122</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.mind.org.uk" target="_blank">www.mind.org.uk</a>                       
                      </p>
                      <p><strong>Ripensamento</strong> <br/>
                      
                      <strong>Ripensamento:</strong> 15th Floor, 89 Albert Embankment,London, SE1 7TP &nbsp;&nbsp;
                      <strong>Tel:</strong> <a href="tel:0300 5000 927">0300 5000 927</a> &nbsp;&nbsp;
                      <strong>Sito web:</strong> <a href="www.rethink.org" target="_blank">www.rethink.org</a>                       
                      </p>
                    </div>
                  
                </div>', N'HELPFUL ORGS', N'HELPFUL ORGS', N'banner-about60921.jpg', N'HELPFUL ORGS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(19 AS Decimal(18, 0)), N'<div class="container">
                    <h2 class="underline">Burial Plots procedura di omologazione di un testamento</h2>
                    <div class="padding-left">
                      <p>Affrontare i problemi legali che sorgono quando muore qualcuno può essere una questione estremamente complessa. Da una parte, può includere delle questioni relativamente semplici quali registrare la morte e informare gli organismi competenti come l’HMRC, l’ufficio passaporti e il consiglio locale. D’altra parte, però, la morte di una persona implica che coloro che sono rimasti in vita devono gestire il patrimonio del defunto.</p>
                      <p>Se la persona in questione ha lasciato un testamento allora sarà esattamente chiaro come esso desidera che i beni che ha lasciato saranno condivisi tra i vari beneficiari, ma anche in casi come questi deve essere seguita la procedura di omologazione. In termini semplici, il termine “omologazione” comporta l’assegnazione di un permesso legale ad una persona in modo tale da riunire tutti i beni del defunto, valorizzare questi beni e distribuire poi la proprietà.</p>
                    </div>
                    <br />
                    <h2 class="underline">Gestire l’omologazione/h2>
                    <div class="padding-left">
                      <p>Per accedere e distribuire i beni del defunto si ha prima di tutto bisogno di una concessione di rappresentanza, un documento legale che le banche ed altre istituzioni finanziarie vorranno esaminare prima di poter accedere ai fondi in questione. Ci sono delle eccezioni a questa regola. Non è necessaria una concessione di rappresentanza se la proprietà in questione è valutata meno di £5000 e non comprende azioni, proprietà o terre. Inoltre non si avrà bisogno di una concessione se la proprietà apparteneva in condivisione con un coniuge vivo o un partner civile, per cui passa direttamente alla persona in questione. Se è coinvolto un testamento, allora la persona che deve gestire l’omologazione sarà denominato nel testamento come esecutore. Se non è questo il caso, sarà nominato un esecutore e questo corrisponderà in genere al parente più vicino del defunto.</p>
                      <p>If a will is involved, then the person dealing with probate will have been named in the will as executor. If not, then an executor will be appointed and will generally be the closest living relative of the deceased. </p>
                    </div>
                    <br />
                    <h2 class="underline">Valutare il patrimonio</h2>
                    <div class="padding-left">
                      <p>Per valutare il patrimonio, l’esecutore del testamento deve raggruppare le informazioni di tutti i beni del defunto. Questo include quindi i conti in banca e la società immobiliare, le proprietà, gli investimenti, oggetti personali quali gioielli e pezzi d’arte, veicoli a motore, polizze di vita e pensione. Il valore di ogni bene deve essere stabilito al momento della morte della persona. Bisognerà contattare i fornitori di tutti i prodotti finanziari e avere le proprietà valutate da un agente immobiliare o da un valutatore indipendente. Si dovranno anche scoprire e calcolare tutti gli eventuali debiti, come carte di credito, prestiti, mutui e debiti personali, e il costo del funerale può inoltre essere detratto dal valore del patrimonio. Ciò che rimane dopo aver detratto qualunque debito dai beni rappresenterà il valore reale del patrimonio, e determinerà se sia necessario pagare l’Imposta di Successione</p>
                    </div>
                    <br />
                    <h2 class="underline">L’imposta di successione</h2>
                    <div class="padding-left">
                      <p>Alcune proprietà non devono pagare l’imposta di successione. Queste includono le proprietà che hanno un valore minore del valore limite di £325,000 e quelle che sono esenti perché lasciate al coniuge o al partner civile o ad una carità qualificata.</p>
                      <p>Nuove leggi introdotte nell’aprile del 2010 implicano che la proprietà in questione cadrà al di fuori dell’imposta di successione se vale meno di £650,000 ed il 100% dell’imposta di successione inutilizzatoda parte di un vecchio coniuge o un partner civile può essere trasferito al defunto. </p>
                      <p>Anche se non devi pagare l’imposta di successione, avrai comunque bisogno di compilare un modulo per la Restituzione del Patrimonio Immobiliare per HMRC, mentre se si deve pagare, o il patrimonio non è esente, allora è necessario compilare il modulo IHT400 molto più lungo, dettagliando tutti i beni e i debiti del defunto.</p>
                    </div>
                    <br />
                    <h2 class="underline">Ottenere l’omologazione</h2>
                    <div class="padding-left">
                      <p>Una volta che sono stati compilati i moduli questi devono essere inviati all’HMRC e al Registro di Omologazione e qualsiasi Imposta di Successione deve essere pagata. Successivamente, l’esecutore deve partecipare alla sede di Omologazione o deve presentarsi all’ufficio di commissario di giuramenti, generalmente da un avvocato, per fare il giuramento in persona. La concessione della rappresentanza sarà poi fornita, consentendo all’esecutore di accedere ai beni del defunto, pagare qualunque debito e distribuire il patrimonio tra i beneficiari. </p>
                      <p>Come si può capire da questa descrizione abbastanza breve, la verifica può essere un processo complesso e lungo, che richiede spesso un anno se non più per completarsi. Potresti come esecutore optare per collocare l’omologazione interamente nelle mani di un professionista legale, o eseguire la maggioranza del lavoro e poi chiedere ad un avvocato di controllare i moduli e i dettagli prima di presentarli. </p>
                      <p>Se avete domande su qualsiasi questione riguardo l’omologazione o altri processi legali che riguardano il lutto, si prega di contattarci all’(Email) o telefonando al numero di Burialplots.co.uk 0100 000 0000.</p>
                    </div>
                  
                </div>', N'PROBATE', N'PROBATE', N'banner-about71771.jpg', N'PROBATE')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(20 AS Decimal(18, 0)), N' <div class="container">
                   
                    <h2 class="underline">Burial Plot Testamento</h2>
                    <div class="padding-left">
                      <p>Uno degli aspetti più difficili da affrontare nella morte di una persona amata è l’impatto emotivo di perdere qualcuno che ti stava vicino. Non c’è modo di fuggire dalle emozioni, ovviamente, ma i problemi pratici che vengono messi in evidenza quando qualcuno muore possono essere minimizzati fortemente con una certa pianificazione anticipata.</p>
                      <p>Se qualcuno decede a un’età più giovane del previsto allora è meno probabile che si sia pianificato un funerale in anticipo, ma per molte persone è un’opzione che potrebbe aiutare a facilitare l’impatto stressante di coloro che sono stati lasciati. Uno degli obiettivi principali di Burialplots.co.uk è di rendere questo tipo di pianificazione molto semplice. In primo luogo, offriamo una fornitura di posti di sepoltura da acquistare in località entro tutto il Regno Unito. Con la domanda di tali posti che supera notevolmente lafornitura, i posti di sepoltura sono diventati difficili da trovare e sono diventati molto più costosi negli ultimi anni. Offrendo quindi una semplice opzione di ricerca e un piano di pagamento flessibile, vogliamo rinnovare la situazione e rendere la ricerca dei posti di sepoltura il più semplice possibile.</p>
                      <p>L’altro scopo principale del sito è quello di agire come un portale completo per tutti gli aspetti della pianificazione funebre. Ciò si estende dall’offrire link a servizi come fiorai, pietre tombali, l’acquisto di bare fino a fornire consigli su aspetti legali necessari. Uno di questi aspetti è di trattare con l’eredità del defunto, e ciò è reso molto semplice sela persona in questione hasfruttato il proprio tempo per scrivere un testamento.</p>
                    </div>
                    <br />
                    <h2 class="underline">Perché scrivere un testamento?</h2>
                    <div class="padding-left">
                      <p>Ci sono molte ragioni per cui vale la pena scrivere un testamento. Scrivere esattamente ciò che vuoi lasciare e a chi lo vuoi lasciare ti assicura che i tuoi possessi siano tramandati esattamente come desideri e dovrebbe, se fatto correttamente, prevenire qualsiasi disputa a seguito della tua morte. La pianificazione accurata di un testamento, probabilmente con l’aiuto di un avvocato, può anche aiutare a minimizzare qualsiasi imposta di successione, e un testamento è spesso il posto perfetto in cui scrivere un paio di dettagli del tipo di funerale che ti piacerebbe avere.</p>
                    </div>
                    <br />
                    <h2 class="underline">Cosa ti serve per scrivere un testamento</h2>
                    <div class="padding-left">
                      <p>Per scrivere un testamento efficacemente devi prima di tutto valutare il tuo patrimonio. Questo significa che devi individuare e valutare quanto valgono i tuoi beni, inclusi gli elementi quali:</p>
                      <ul>
                          <li>Tutte le proprietà che possiedi</li>
                          <li>Investimenti, quali azioni e borse</li>
                          
                          <li>Denaro risparmiato nei conti in banca e società immobiliare</li>
                          <li>Polizze assicurative</li>
						  <li>Veicoli a motore/li>
                          <li>Fondi di pensione che pagano una somma forfettaria alla morte</li>
                          <li>Beni personali, come gioielli, oggetti d’antiquariato ecc.</li>
						  
                      </ul>
                      <p>È importante che questi beni siano valutati regolarmente dato che il valore di alcuni, come ad esempio borse e proprietà, potrebbero oscillare. Ad esempio, in certe parti del Regno Unito la tua casa potrebbe aumentare drasticamente di valore negli anni, e questo potrebbe influenzare le disposizioni del testamento.</p>
                    </div>
                    <br />
                    <h2 class="underline">Cosa dovresti includere</h2>
                    <div class="padding-left">
                      <p>Dovresti esplorare esattamente dove vuoi che vadano i vari componenti del tuo patrimonio. Molte persone, ad esempio, offrono alcuni elementi a persone individuali lasciando la maggior parte del loro patrimonio al coniuge. Altri potrebbero lasciare la loro casa principale e metà del loro patrimonio al coniuge o al partner civile, e suddividere il resto tra i loro figli. Il tuo testamento dovrebbe anche includere dettagli di ciò che vorresti che accadesse se qualunque beneficiario morisse prima di te.</p>
                    </div>
                    <br />
                    <h2 class="underline">Validità</h2>
                    <div class="padding-left">
                      <p>Per essere valido, un testamento deve essere scritto e deve essere firmato da te e da due testimoni. Devi avere la capacità mentale al momento della scrittura del testamento per essere in grado di capire cosa significa. Se persiste qualche dubbio al riguardo, se ti è stata data ad esempio una diagnosi di demenza, allora hai bisogno di avere quello che è chiamato la “capacità testamentaria”, che richiede una dichiarazione firmata da un medico. Il testamento dovrebbe inoltre affermare che è prioritario rispetto a tutti gli altri testamenti, e qualsiasi testamento precedentemente scritto dovrebbe essere distrutto.  </p>
                      <p>I due testimoni devono essere adulti che firmano il testamento in tua presenza. Va notato che i testimoni e i loro coniugi o partner civili non potranno beneficiare del testamento. Il resto del testamento è ancora valido se è stato lasciato qualcosa al testimone, ma esso non avrà il diritto di avere ciò che volevi dargli. L’esecutore scelto per trattare il tuo patrimonio è autorizzato a testimoniare il testamento, ma non può essere dunque un beneficiario.</p>
                      <p>Una volta completato il testamento possono essere apportate modifiche minori. Queste sono chiamate codicilli, e devono essere aggiunti al testamento e firmati e testimoniati come per il testamento originario, con i due testimoni che non devono obbligatoriamente esseregli stessi. Non si può fare alcun cambiamento alterando in modo significativo il testamento reale, si possono solamente aggiungere i codicilli, e qualsiasi cambiamento maggiore richiederà la scrittura di un nuovo testamento. </p>
                      <p>Il tuo testamento deve essere conservato in un luogo sicuro, che sia da un avvocato o in banca o nell’archivio testamentario. Se hai qualsiasi domanda riguardo testamenti o gli altri processi legali che riguardano il lutto, contattaci per favore all’indirizzo email (Email) o telefona Burialplots.co.uk a 0100 000 0000.</p>
                    </div>
                   
                </div>', N'WILLS', N'WILLS', N'banner-about86364.jpg', N'WILLS')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(21 AS Decimal(18, 0)), N'     <div class="container">
                    <h2 class="underline">Burial Plots Notizia Stampa</h2>
                    <div class="padding-left">
                      <p>Non dovete prendere solo la nostra parola riguardo il rivoluzionamento nel campo della pianificazione funebre. Date un’occhiata alle notizie stampa di seguito e vedrete quale impatto ha avuto il nostro approccio rigenerato, innovativo e facile da usare. Noi vogliamo offrire un nuovo metodo per affrontare il trauma della perdita, e siamo felici di vedere che molte persone sono d’accordo. </p>
                    </div>
                    
                </div>', N'RASSEGNA STAMPA', N'RASSEGNA STAMPA', N'banner-about26964.jpg', N'PRESS COVERAGE')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(22 AS Decimal(18, 0)), N'<h2 class="ql-align-center">Burial Plots Newsfeed</h2>
<p class="ql-align-center">Tieniti aggiornato con gli ultimi sviluppi nel campo della pianificazione funebre utilizzando il newsfeed di Burialplots.co.uk.</p>
', N'NEWS FEED', N'NEWS FEED', N'banner-about8208.jpg', N'NEWSFEED')
INSERT [dbo].[ItalianPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (CAST(24 AS Decimal(18, 0)), N'Index', N'Index', N'banner-about16863.jpg', N'Index', NULL)
SET IDENTITY_INSERT [dbo].[ItalianPage] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (3, N'12', N'Honda', 5, 1000.0000, 1000.0000, 1, 1, N'bd54792.jpg', CAST(9 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (4, N'121', N'Honda125', 10, 1000.0000, 1000.0000, 1, 0, N'bdgg91980.jpg', CAST(9 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (5, N'121', N'Honda New', 5, 1500.0000, 15000.0000, 1, 0, N'xdf80898.jpg', CAST(9 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (6, N'001', N'Yamhaa', 6, 10004.0000, 10004.0000, 1, 0, N'bik29867.jpg', CAST(9 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (7, N'4452', N'BMW', 6, 10004.0000, 10004.0000, 1, 0, N'sdf77658.png', CAST(8 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (8, N'4452', N'BMWr', 6, 10004.0000, 10004.0000, 1, 0, N'ds71005.jpg', CAST(8 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (9, N'4452', N'Nissan', 6, 10004.0000, 10004.0000, 1, 0, N'dfsa91171.jpg', CAST(8 AS Decimal(18, 0)), N'THE CORSAIR GAMING SERIES GS600 POWER SUPPLY IS THE IDEAL PRICE-PERFORMANCE SOLUTION FOR BUILDING OR UPGRADING A GAMING PC. A SINGLE +12V RAIL PROVIDES UP TO 48A OF RELIABLE, CONTINUOUS POWER FOR MULTI-CORE ')
INSERT [dbo].[Item] ([Id], [ItemNo], [ItemName], [ItemQty], [ItemCprice], [ItemRprice], [ItemActive], [ItemFeature], [ItemImage], [CateId], [ItemDescription]) VALUES (1003, N'452', N'Plots', 5, 4500.0000, 4500.0000, 1, 1, N'block-pic288317.jpg', CAST(1006 AS Decimal(18, 0)), N'For Buril Plots')
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[MainSections] ON 

INSERT [dbo].[MainSections] ([Id], [CemeteryId], [Name], [Code], [OriginalCode], [SpotId], [Image]) VALUES (CAST(31 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), N'Muslim Section', N'"{\"id\":568,\"editor\":{\"selected_shape\":\"spot-1091\"},\"general\":{\"name\":\"unknown\",\"width\":319,\"height\":224,\"naturalWidth\":319,\"naturalHeight\":224},\"image\":{\"url\":\"http://localhost:6465/Images/CemeteryPlots/386425192img171104.jpg\"},\"spots\":[{\"id\":\"spot-2025\",\"title\":\"spot-2025\",\"x\":7.955,\"y\":8.793,\"tooltip_content\":{\"squares_settings\":{\"containers\":[{\"id\":\"sq-container-403761\",\"settings\":{\"elements\":[{\"settings\":{\"name\":\"Paragraph\",\"iconClass\":\"fa fa-paragraph\"}}]}}]}}},{\"id\":\"spot-1543\",\"title\":\"spot-1543\",\"x\":31.191,\"y\":5.625,\"tooltip_content\":{\"squares_settings\":{\"containers\":[{\"id\":\"sq-container-403761\",\"settings\":{\"elements\":[{\"settings\":{\"name\":\"Paragraph\",\"iconClass\":\"fa fa-paragraph\"}}]}}]},\"plain_text\":\"Plot No. 2\"},\"default_style\":{\"icon_type\":\"custom\",\"icon_url\":\"http://localhost:6465/Images/pins/pin77655.png\"}},{\"id\":\"spot-1091\",\"title\":\"spot-1091\",\"x\":46.238,\"y\":3.393,\"tooltip_content\":{\"squares_settings\":{\"containers\":[{\"id\":\"sq-container-403761\",\"settings\":{\"elements\":[{\"settings\":{\"name\":\"Paragraph\",\"iconClass\":\"fa fa-paragraph\"}}]}}]}}}]}"', NULL, N'rect-3799', N'386425192img171104.jpg')
SET IDENTITY_INSERT [dbo].[MainSections] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([Id], [FirstName], [LastName], [Email], [Password], [Suspend], [Status]) VALUES (2, N'Hamzasadfasdf', N'Shafiqsdfasdf', N'Hamzash75@gmail..sdfasdf', N'fsadf', N'false', 0)
INSERT [dbo].[Member] ([Id], [FirstName], [LastName], [Email], [Password], [Suspend], [Status]) VALUES (1004, N'hamza', N'Shafiq', N'hamzash75@gmail.com', N'123', N'false', 1)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(19 AS Decimal(18, 0)), N'Mirza', N'Arshad', NULL, N'7ddSdlUDk5WuwrS0vyM4yPyR2JepBCT5wA8vcHInBCtbakZMNF+rtpokxvc7ERPNJW3OcbSjLWvmRVIK7nWZpQ==', N'12345', N'MHMolZDbyKHsKsqRshpHHoLJtbiVc6VhMdFvaw2tDoI=', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(20 AS Decimal(18, 0)), N'john', N'smith', NULL, N'0vR0NwYssrHxrPyichRW3txaEPJmlfa1h728Nn1b9ghPoSo6pQo5rUMDTIW4KXW0', N'123', N'YHsLQgbBLsQGgZcrQiO5kQ==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(31 AS Decimal(18, 0)), N'john', N'doe', NULL, N'MBLrYo4WoqoWFVPHL/eKHSJ5x3xaxOQlVS/+BhTn9K0RhGbt2iz6dCh+8IsG7pyv', N'noreply', N'fc0iUkg331qk3V8HY6MWvQ==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(32 AS Decimal(18, 0)), N'sad', N'ads', NULL, N'7jKrYB2MI6Z4hu4NUazV5A==', N'asas', N'D+TnT1aSf97FjJ+Gkovtfw==', 0, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(33 AS Decimal(18, 0)), N'asd', N'asda', NULL, N'00kxrqUQJyVeJiR9Yqd/ZNsse6TypK5r/9vKFkxNc7I=', N'123', N'oPBxevaVxd3XE7EZQhfDnw==', 0, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(35 AS Decimal(18, 0)), N'John', N'Doe', NULL, N'3VmJEUXpNZB6W60Kj7Ax1H1pCaQyqX7WRDkail55jU4=', N'22312', N'Yb/8hh4WI8tBw5WuPX7BJg==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(36 AS Decimal(18, 0)), N'john', N'Doe', NULL, N'9LjKyn/zp5wSLPIAbVtMz+d5witxQ4dSQyySR/SHkAQ=', N'123', N'Q6UOPEgQtUzjdLtngr7vEw==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(37 AS Decimal(18, 0)), N'Rameon', N'joo', NULL, N'o2KYBc7w4kJVwzbzIgQ22Bs6+Vp2GwBLuQA+TVBlOmE=', N'1234', N'p5IBSh6pVTtqYFszwDtYIQ==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(38 AS Decimal(18, 0)), N'Sandy', N'rae', NULL, N'pw2iiA6HuGsRwtO1E7EAqatT4s7wc9bylR8RCQZgTLc=', N'1234', N'U49e4Vse7gMK+Ty6SvuHBQ==', 1, NULL, N'Customer')
INSERT [dbo].[Members] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Picture], [Role]) VALUES (CAST(39 AS Decimal(18, 0)), N'asdfvsda', N'asdfa', NULL, N'ldbnf5QzW1vfa4fudR9QEDTC4gMtTetNY+MAVoanOv0=', N'123123', N'prWvnxWq0mGxqdXpNhjFVg==', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (20, N'BURIAL PLOTS1', N'BURIAL PLOTS')
INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (21, N'/Admin/Page/PageView/BURIAL PLOTS', N'BEREAVEMENT')
INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (22, N'/Admin/Page/PageView/BURIAL PLOTS', N'ABOUTUS ')
INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (23, N'/Admin/Page/PageView/BURIAL PLOTS', N'HELPFUL ADVICE')
INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (1024, N'/Admin/Page/PageView/ABOUTUS', N'LEGAL')
INSERT [dbo].[Menu] ([Id], [Pageurl], [Category]) VALUES (1025, NULL, N'PRESS & NEWS')
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[NewsManagement] ON 

INSERT [dbo].[NewsManagement] ([Id], [Title], [Description], [PubDate], [ExpiryDate], [TitleUrdu], [TitleArabic], [TitleChinese], [TitleHindi], [TitleItalian], [TitleBengali], [TitleHebrew], [DescriptionUrdu], [DescriptionArabic], [DescriptionChinese], [DescriptionHindi], [DescriptionItalian], [DescriptionBengali], [DescriptionHebrew], [TitleTurkish], [DescriptionTurkish]) VALUES (CAST(3 AS Decimal(18, 0)), N'Article one', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac risus lobortis, vehicula arcu hendrerit, semper turpis. Proin efficitur id massa at maximus. Maecenas et augue convallis, feugiat orci id, ullamcorper lectus. Proin ut purus eget nibh maximus bibendum. Aliquam quis purus ut lectus vehicula blandit. Nunc blandit hendrerit leo sed accumsan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae pharetra lectus. Sed ut tempor nibh. ', CAST(N'2017-05-29' AS Date), CAST(N'2018-05-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NewsManagement] ([Id], [Title], [Description], [PubDate], [ExpiryDate], [TitleUrdu], [TitleArabic], [TitleChinese], [TitleHindi], [TitleItalian], [TitleBengali], [TitleHebrew], [DescriptionUrdu], [DescriptionArabic], [DescriptionChinese], [DescriptionHindi], [DescriptionItalian], [DescriptionBengali], [DescriptionHebrew], [TitleTurkish], [DescriptionTurkish]) VALUES (CAST(4 AS Decimal(18, 0)), N'Artical two', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac risus lobortis, vehicula arcu hendrerit, semper turpis. Proin efficitur id massa at maximus. Maecenas et augue convallis, feugiat orci id, ullamcorper lectus. Proin ut purus eget nibh maximus bibendum. Aliquam quis purus ut lectus vehicula blandit. Nunc blandit hendrerit leo sed accumsan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae pharetra lectus. Sed ut tempor nibh. ', CAST(N'2017-05-29' AS Date), CAST(N'2018-05-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NewsManagement] ([Id], [Title], [Description], [PubDate], [ExpiryDate], [TitleUrdu], [TitleArabic], [TitleChinese], [TitleHindi], [TitleItalian], [TitleBengali], [TitleHebrew], [DescriptionUrdu], [DescriptionArabic], [DescriptionChinese], [DescriptionHindi], [DescriptionItalian], [DescriptionBengali], [DescriptionHebrew], [TitleTurkish], [DescriptionTurkish]) VALUES (CAST(5 AS Decimal(18, 0)), N'Artical three', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac risus lobortis, vehicula arcu hendrerit, semper turpis. Proin efficitur id massa at maximus. Maecenas et augue convallis, feugiat orci id, ullamcorper lectus. Proin ut purus eget nibh maximus bibendum. Aliquam quis purus ut lectus vehicula blandit. Nunc blandit hendrerit leo sed accumsan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae pharetra lectus. Sed ut tempor nibh. ', CAST(N'2017-05-29' AS Date), CAST(N'2018-05-05' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NewsManagement] OFF
SET IDENTITY_INSERT [dbo].[OrderPlan] ON 

INSERT [dbo].[OrderPlan] ([Id], [OrderDate], [PartnerId], [Status], [FirstName], [Address], [Country], [CellNo], [AmountStatus], [ServiceListingId], [CartId]) VALUES (CAST(14 AS Decimal(18, 0)), CAST(N'2017-10-07 12:59:56.293' AS DateTime), CAST(8 AS Decimal(18, 0)), N'Confirmed', N'Joan Rae', N'london london 2', N'VE', N'044-33242343', NULL, CAST(30069 AS Decimal(18, 0)), N'plan-46981776')
INSERT [dbo].[OrderPlan] ([Id], [OrderDate], [PartnerId], [Status], [FirstName], [Address], [Country], [CellNo], [AmountStatus], [ServiceListingId], [CartId]) VALUES (CAST(15 AS Decimal(18, 0)), CAST(N'2017-10-25 12:56:15.510' AS DateTime), CAST(5 AS Decimal(18, 0)), N'Confirmed', N'Ali Raza', N'London ', N'GB', N'0300-9984332', NULL, CAST(30077 AS Decimal(18, 0)), N'plan-22039361')
INSERT [dbo].[OrderPlan] ([Id], [OrderDate], [PartnerId], [Status], [FirstName], [Address], [Country], [CellNo], [AmountStatus], [ServiceListingId], [CartId]) VALUES (CAST(16 AS Decimal(18, 0)), CAST(N'2017-10-25 13:09:29.890' AS DateTime), CAST(5 AS Decimal(18, 0)), N'Confirmed', N'Ali Raza', N'London London', N'GB', N'0300-9984332', NULL, CAST(30077 AS Decimal(18, 0)), N'plan-93543526')
INSERT [dbo].[OrderPlan] ([Id], [OrderDate], [PartnerId], [Status], [FirstName], [Address], [Country], [CellNo], [AmountStatus], [ServiceListingId], [CartId]) VALUES (CAST(17 AS Decimal(18, 0)), CAST(N'2017-10-25 15:40:18.017' AS DateTime), CAST(5 AS Decimal(18, 0)), N'Confirmed', N'Ali ss', N'London London', N'GB', N'0300202030', NULL, CAST(30078 AS Decimal(18, 0)), N'plan-21694899')
INSERT [dbo].[OrderPlan] ([Id], [OrderDate], [PartnerId], [Status], [FirstName], [Address], [Country], [CellNo], [AmountStatus], [ServiceListingId], [CartId]) VALUES (CAST(18 AS Decimal(18, 0)), CAST(N'2017-10-25 15:52:34.047' AS DateTime), CAST(5 AS Decimal(18, 0)), N'Confirmed', N'Ali Raza', N'London ', N'TV', N'0300-9984332', NULL, CAST(30079 AS Decimal(18, 0)), N'plan-22703947')
SET IDENTITY_INSERT [dbo].[OrderPlan] OFF
SET IDENTITY_INSERT [dbo].[OrderPlanItem] ON 

INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(20 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), NULL, 150.0000, NULL, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(21 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), NULL, 130.0000, NULL, CAST(31 AS Decimal(18, 0)))
INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(22 AS Decimal(18, 0)), CAST(15 AS Decimal(18, 0)), NULL, 120.0000, NULL, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(23 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), NULL, 130.0000, NULL, CAST(31 AS Decimal(18, 0)))
INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(24 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), NULL, 130.0000, NULL, CAST(33 AS Decimal(18, 0)))
INSERT [dbo].[OrderPlanItem] ([Id], [OrderPlanId], [Title], [Price], [Description], [ServiceListingPlanId]) VALUES (CAST(25 AS Decimal(18, 0)), CAST(18 AS Decimal(18, 0)), NULL, 99.0000, NULL, CAST(34 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderPlanItem] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [MemberId], [Status], [FirstName], [LastName], [Address], [Country], [CellNo], [AmountStatus], [CartId]) VALUES (CAST(62 AS Decimal(18, 0)), CAST(N'2017-08-12 16:07:19.527' AS DateTime), CAST(31 AS Decimal(18, 0)), N'cancelled', N'John', N'Doe', N'London', N'UK', N'12345678910', NULL, N'cart-52228050')
INSERT [dbo].[Orders] ([Id], [OrderDate], [MemberId], [Status], [FirstName], [LastName], [Address], [Country], [CellNo], [AmountStatus], [CartId]) VALUES (CAST(63 AS Decimal(18, 0)), CAST(N'2017-09-21 14:38:16.583' AS DateTime), CAST(31 AS Decimal(18, 0)), N'Confirmed', N'john', N'doe', N'London', N'UK', N'123123', NULL, N'cart-26821137')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Origins] ON 

INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(1 AS Decimal(18, 0)), N'East Midlands', N'East Midlands', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(2 AS Decimal(18, 0)), N'East of England', N'East of England', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(4 AS Decimal(18, 0)), N'London', N'London', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(5 AS Decimal(18, 0)), N'North East', N'North East', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(6 AS Decimal(18, 0)), N'North West', N'North West', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(7 AS Decimal(18, 0)), N'Scotland', N'Scotland', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(8 AS Decimal(18, 0)), N'South East', N'South East', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(9 AS Decimal(18, 0)), N'South West', N'South West', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(10 AS Decimal(18, 0)), N'Wales', N'Wales', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(11 AS Decimal(18, 0)), N'West Midlands', N'West Midlands', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(13 AS Decimal(18, 0)), N'Yorkshire', N'Yorkshire', NULL)
INSERT [dbo].[Origins] ([Id], [Name], [Description], [AddedDate]) VALUES (CAST(14 AS Decimal(18, 0)), N'Humber', N'Humber', NULL)
SET IDENTITY_INSERT [dbo].[Origins] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (1029, N'






<h2 class="underline">Burial Plots Cars</h2>
<div class="column-block">
    <div class="column">
        <p>Arranging the details of a funeral can seem like too much to cope with when you’re trying to come to terms with the death of a loved one, but it’s something which simply has to be done. In the first instance there are legal obligations to do things such as register the death and deal with matters such as state benefits and pensions. A second consideration is the fact that planning a funeral can often feel like the very first stage of the process of coming to terms with your loss.  </p>
        <p>The host of bureaucratic necessities following a death can feel intrusive, but many people welcome the focus which having to perform simple if fairly mundane tasks can help to bring. The details of arranging a funeral, on the other hand, offer the chance to focus your thoughts upon the person you’ve just lost, and arrange a final goodbye which is fitting. </p>
    </div>
    <div class="column">
        <img src="/images/video.jpg" alt="">
    </div>
</div>
<div class="padding-left">
    <p>The time and effort you put into arranging a funeral can often pay dividends in the long run, as you’re able to look back at an occasion which you can genuinely feel celebrated the life of the person you’ve lost at the same time as marking their passing.</p>
</div>
<br />
<h2 class="underline">Help</h2>
<div class="padding-left">
    <p>Here at Burialplots.co.uk we realise just how difficult bringing together all of the aspects of a funeral can be, so we’ve done precisely that. Although the primary purpose of our website is to make it easier to find and purchase a burial plot in the UK, we’ve also gathered a host of information and services. We’ve made it easy to access everything from advice on dealing with wills to the contact details of organisations which help with the emotional impact of bereavement. Planning a funeral carefully will help to keep costs down at the same time as ensuring a day which you’ll be able to remember with some happiness as well as grief. Given the cost of the average funeral there’s no need to feel embarrassed about making sure that nobody takes advantage of your vulnerable state by charging more than they should. The wealth of services available on our site will make it possible for you to find the best possible deal for aspects such as funeral cars</p>
</div>
<br />
<h2 class="underline">Cars</h2>
<div class="padding-left">
    <p>The number of cars you’ll need for your funeral will depend upon the number of guests and how many of those guests will need transporting to and from the venue for the service itself. Initially, you’ll need a hearse which can transport the coffin from the funeral home, or the home of the deceased, and limousines to transport what are generally known as the chief mourners. Taking a limousine in this manner will allow those closest to the deceased to travel in extreme comfort, without having to worry about driving or parking. Extra limousines can be hired if you want more of your guests to be driven to the funeral, and the drivers will be happy to take a specified route if you’d like to drive past a certain spot. You may want to stop at a beauty spot which the deceased loved, or pause outside the stadium of the football team they supported, for example. </p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Other Options</h2>
<div class="padding-left">
    <p>Occasionally, people ask if it is possible to have the coffin of a loved one transported on an alternative form of transport. This can be arranged in some cases, as when the family of a lorry driver might ask for the truck to be used for one last journey, or when a horse drawn carriage is chosen. As with all aspects of a funeral, the cars you select should be chosen to suit your needs and the funeral you’d like to experience. If you’re having any kind of difficulty doing that, then please contact us via email at (Email) or by phoning 0100 000 0000.</p>
</div>

', N'Cars', N'CARS', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (1035, N'<h2 class="ql-align-center">BURIAL PLOTS SUICIDE</h2><p class="ql-align-center">The death of someone close to you through suicide is an almost uniquely painful form of bereavement. The normal feelings of loss and pain will be compounded by a sense of guilt that you couldn’t stop it happening, and anger toward the deceased themselves.</p><p><br></p><h2 class="ql-align-center">CAUSES</h2><p class="ql-align-center">Pin-pointing the cause of a suicide can feel like an incredibly difficult thing to do. This is because, in the majority of cases, there isn’t anything as simple as a single cause. One of the hardest things for those left behind after a suicide to come to terms with is the degree of pain which their loved one must have been feeling in order to decide that death was the only possible answer. For most people, no problem is so severe that the only solution could be taking their own life. The person who took their life was clearly in a state of pain so acute that this seemed like a logical decision. Those left behind will often torment themselves with the thought that they could have done more, or didn’t spot the signs. The truth of the matter, however, is that a suicidal person will be in a state of mind which is beyond reasoning or persuasion. Although they may present a calm and reasonable face to the world, within themselves they will feel that they have failed in some massively fundamental manner.</p><p><br></p><h2 class="ql-align-center">REACTION</h2><p class="ql-align-center">One of the most difficult aspects of dealing with a death by suicide is the reaction of other people. The fact that there will have to be an investigation, a coroner’s inquest and perhaps even some media coverage will mean that you are aware that everyone else knows what happened. Unfair as it may be, the idea of suicide is still seen as something of a taboo, and people may find it much more difficult to talk about than they would any other kind of death. Talking about the suicide, however, is one of the most useful things you can do when trying to come to terms with it. In truth, nobody will necessarily have answers to the questions you’re asking, but simply being able to voice them aloud can be hugely therapeutic. It can be comforting, as well, to hear that other people who were closed to the deceased failed to spot the signs of how much pain they were in or, conversely, that they feel the suicide was inevitable and could not have been stopped by anyone. If you don’t feel able to talk to people close to you about the suicide then take advantage of the many organisations which offer specialist counselling advice and listening services focused on this topic. The chance to explain how you’re feeling to someone who has been through the same thing, or has been trained to deal with the repercussions, often marks the first step on the long road to recovery.</p><p><br></p><h2 class="ql-align-center">MOVING ON</h2><p class="ql-align-center">In many ways the only way to come to terms with the suicide of someone close to you is to accept that, on one level, you will never truly understand what made them do it. You may never quite get over the fact that they chose to leave you but, in time, you may come to realise that the choice was theirs to make, and that you couldn’t have stopped them no matter how hard you tried. Perhaps you’ll be able to draw some small amount of comfort from the fact that the pain they were clearly in has, at least, been ended for them.</p><p class="ql-align-center">If you have any questions about the grieving process, or about coming to terms with a death by suicide, then please contact us by email at (Email) or by calling 0100 000 0000.</p><p><br></p>', N'Burial Plots Suicide', N'BURIAL-PLOTS-SUICIDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (1041, N'<h1>WE ARE HEALTHPURE</h1><p>We have designed the Marketplace for you to easily find products related to your condition or symptoms. If you&nbsp;<a href="http://healthpure.herokuapp.com/members/sign_up" target="_blank" style="background-color: transparent; color: rgb(255, 255, 255);">have an account with us</a>, we’ll tailor products to your needs, keep your order history for easy refills, and send you coupons and discounts for future use. Plus, you can schedule shipments directly to your home and save even more!&nbsp;</p><p><a href="http://localhost:14333/AboutUs/" target="_blank" style="background-color: transparent; color: rgb(255, 255, 255);">Learn more about us.</a></p>', N'Healthpure', N'HealtPure', N'Tulips69459.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (1042, N'<p>asdfklasjdflk sdl;fkj sdlkfj s;ldkf sl;dkfjlksdfjs; dlkf</p>', N'Pure', N'Pure', N'Koala94923.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (2038, N'
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Burial Plots</h2>
<div class="padding-left">
    <p>For many years people may have taken it for granted that, when the time came, there would be a space available for them to either be buried or to bury a loved one. Despite the other options available, such as cremation, burial is still the choice which many people opt for when someone close to them dies or when they are planning their own funeral arrangements in advance. Several religions and cultures insist on burial, and many more people opt for it as their preferred option. This is often because it enables them to select a final resting place of their choice, one which, in many cases, will be close to loved ones or people of the same religions.</p>
</div>
<br /><br />
<h2 class="underline">Shortage of Burial Plots</h2>
<div class="padding-left">
    <p>The reality, however, is that the UK is facing a desperate shortage of burial plots, making finding the right plot either extremely difficult or prohibitively expensive. According to a BBC survey carried out in 2013, for example, more than 180 local authorities around the country reported that they would be running out of space in less than a decade. In some of the larger UK cities the problem is even more acute than this, and with official figures predicting that there will be as many as 680,000 burials in the years leading up to 2020, the search for a solution has become urgent.</p>
    <p>Offering a solution to this problem is what Burialpolots.co.uk is all about. We don’t want to see the situation faced by people in cities like New York and Hong Kong – where burial plots can cost tens of thousands of dollars – becoming the norm in the UK, and that’s why we offer a service which places the burial plot of choice within the reach of all of our clients.</p>
</div>
<br /><br />
<h2 class="underline">Increased Supply </h2>
<div class="padding-left">
    <p>We begin that process by offering existing burial plots in cities around the UK, and will be expanding our offer by creating our own cemeteries in the near future. The traditional view of the purchase of a burial plot may be that it is something which happens after a death has taken place. If this is the case, then our website and easily navigated process will help to reduce stress at this difficult time. Increasingly, however, people are buying plots in advance, providing the security of knowing that the plot will be available when the time comes, and that the loved ones they leave behind won’t face the task of finding a plot.</p>
</div>
<br /><br />
<h2 class="underline">A Simple Process </h2>
<div class="padding-left">
    <p>We’ve made finding the perfect burial plot quick and easy. Simply search by location across the UK and then within a specific cemetery, taking note of the burial plots which are available and making the selection which suits your needs. There is none of the hard sell which sometimes accompanies a visit to a cemetery, and all the information needed to make the right choice is readily available. We offer different types of burial plots, including the following:</p> <br /> <br />

    <ul>
        <li><strong>Single plots</strong> – plots which contain a coffin with the remains of just one person are the type most frequently provided</li>
        <li><strong>Companion Plots</strong> – many couples take great comfort in the knowledge that they’ll be buried together, either side by side or in a double depth plot with the coffins placed one on top of the other</li>
        <li><strong>Family Plots</strong> – some cemeteries offer the option of purchasing a slightly larger area which can then be used to position several individual plots for members of the same family</li>
        <li><strong>Cremation Plots</strong> – some people opt to combine cremation with burial by purchasing a plot in which urns containing cremated remains can be buried and commemorated.</li>
    </ul>

</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<div class="padding-left">
    <p>By offering payment options which include advance payment in full and flexible payment plans, we make burial plots affordable to the widest possible range of people, bringing peace of mind and long term security within easy reach.</p>
    <p>We realise that finding the right burial plot is only one part of the bereavement process, and that’s why we combine our offer with a wealth of help, advice and information. From planning in advance to dealing with a sudden loss, our site offers everything needed to deal with the practical and emotional issues involved. If you have a question or would like to learn more about purchasing a burial plot, then contact us today, on email at (Email) or by calling <a href="tel:0100 000 000">0100 000 000</a>.</p>
</div>
', N'Burial Plots', N'BURIAL-PLOTS', N'banner-burial98855.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4045, N'<p><br></p><p class="ql-align-center"><br></p><p><br></p><p><br></p><p>Welcome to&nbsp;<a href="https://en.wikipedia.org/wiki/Wikipedia" target="_blank" style="color: rgb(11, 0, 128);">Wikipedia</a>,</p><p>the&nbsp;<a href="https://en.wikipedia.org/wiki/Free_content" target="_blank" style="color: rgb(11, 0, 128);">free</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Encyclopedia" target="_blank" style="color: rgb(11, 0, 128);">encyclopedia</a>&nbsp;that&nbsp;<a href="https://en.wikipedia.org/wiki/Wikipedia:Introduction" target="_blank" style="color: rgb(11, 0, 128);">anyone can edit</a>.</p><p><a href="https://en.wikipedia.org/wiki/Special:Statistics" target="_blank" style="color: rgb(11, 0, 128);">5,392,168</a>&nbsp;articles in&nbsp;<a href="https://en.wikipedia.org/wiki/English_language" target="_blank" style="color: rgb(11, 0, 128);">English</a></p><ul><li><a href="https://en.wikipedia.org/wiki/Portal:Arts" target="_blank" style="color: rgb(11, 0, 128);">Arts</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Biography" target="_blank" style="color: rgb(11, 0, 128);">Biography</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Geography" target="_blank" style="color: rgb(11, 0, 128);">Geography</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:History" target="_blank" style="color: rgb(11, 0, 128);">History</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Mathematics" target="_blank" style="color: rgb(11, 0, 128);">Mathematics</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Science" target="_blank" style="color: rgb(11, 0, 128);">Science</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Society" target="_blank" style="color: rgb(11, 0, 128);">Society</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Technology" target="_blank" style="color: rgb(11, 0, 128);">Technology</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Contents/Portals" target="_blank" style="color: rgb(11, 0, 128);"><strong>All portals</strong></a></li></ul><h2><strong>From today''s featured article</strong></h2><p class="ql-align-center"><a href="https://en.wikipedia.org/wiki/File:Michael_Emerson_SDCC_2013.jpg" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Michael_Emerson_SDCC_2013.jpg/100px-Michael_Emerson_SDCC_2013.jpg" alt="Michael Emerson in 2014" height="148" width="100"></a>Michael Emerson</p><p class="ql-align-right"><a href="https://en.wikipedia.org/wiki/The_Shape_of_Things_to_Come_(Lost)" target="_blank" style="color: rgb(11, 0, 128);"><strong>"The Shape of Things to Come"</strong></a>&nbsp;is the 81st&nbsp;<a href="https://en.wikipedia.org/wiki/List_of_Lost_episodes" target="_blank" style="color: rgb(11, 0, 128);">episode</a>&nbsp;of the&nbsp;<a href="https://en.wikipedia.org/wiki/American_Broadcasting_Company" target="_blank" style="color: rgb(11, 0, 128);">American Broadcasting Company</a>&nbsp;television series&nbsp;<a href="https://en.wikipedia.org/wiki/Lost_(TV_series)" target="_blank" style="color: rgb(11, 0, 128);"><em>Lost</em></a>, and the ninth episode of the&nbsp;<a href="https://en.wikipedia.org/wiki/Lost_(season_4)" target="_blank" style="color: rgb(11, 0, 128);">fourth season</a>. The episode first aired on April&nbsp;24, 2008, in the U.S. and Canada. It was written by&nbsp;<a href="https://en.wikipedia.org/wiki/Drew_Goddard" target="_blank" style="color: rgb(11, 0, 128);">Drew Goddard</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Brian_K._Vaughan" target="_blank" style="color: rgb(11, 0, 128);">Brian K. Vaughan</a>&nbsp;and directed by&nbsp;<a href="https://en.wikipedia.org/wiki/Jack_Bender" target="_blank" style="color: rgb(11, 0, 128);">Jack Bender</a>. The narrative centers on&nbsp;<a href="https://en.wikipedia.org/wiki/Ben_Linus" target="_blank" style="color: rgb(11, 0, 128);">Ben Linus</a>, played by&nbsp;<a href="https://en.wikipedia.org/wiki/Michael_Emerson" target="_blank" style="color: rgb(11, 0, 128);">Michael Emerson</a>&nbsp;<em>(pictured)</em>, as he and the&nbsp;<a href="https://en.wikipedia.org/wiki/Oceanic_Airlines" target="_blank" style="color: rgb(11, 0, 128);">Oceanic Airlines</a>&nbsp;Flight&nbsp;815 crash survivors at the Barracks come under attack in December 2004, while&nbsp;<a href="https://en.wikipedia.org/wiki/Flashforward" target="_blank" style="color: rgb(11, 0, 128);">flashforwards</a>&nbsp;to late 2005 show him recruiting&nbsp;<a href="https://en.wikipedia.org/wiki/Sayid_Jarrah" target="_blank" style="color: rgb(11, 0, 128);">Sayid Jarrah</a>&nbsp;(<a href="https://en.wikipedia.org/wiki/Naveen_Andrews" target="_blank" style="color: rgb(11, 0, 128);">Naveen Andrews</a>) as a&nbsp;<a href="https://en.wikipedia.org/wiki/Hitman" target="_blank" style="color: rgb(11, 0, 128);">hitman</a>&nbsp;and confronting his enemy&nbsp;<a href="https://en.wikipedia.org/wiki/Charles_Widmore" target="_blank" style="color: rgb(11, 0, 128);">Charles Widmore</a>&nbsp;(<a href="https://en.wikipedia.org/wiki/Alan_Dale" target="_blank" style="color: rgb(11, 0, 128);">Alan Dale</a>). Production was paused by the 100-day&nbsp;<a href="https://en.wikipedia.org/wiki/2007%E2%80%932008_Writers_Guild_of_America_strike" target="_blank" style="color: rgb(11, 0, 128);">Writers Guild of America strike</a>. "The Shape of Things to Come" received positive critical reviews and the original broadcast was watched by 14 million Americans. Much praise was directed at Emerson''s acting skills, particularly in his reaction to the execution of his character''s daughter&nbsp;<a href="https://en.wikipedia.org/wiki/Alex_(Lost)" target="_blank" style="color: rgb(11, 0, 128);">Alex</a>&nbsp;(<a href="https://en.wikipedia.org/wiki/Tania_Raymonde" target="_blank" style="color: rgb(11, 0, 128);">Tania Raymonde</a>). His performance in this episode garnered a nomination for&nbsp;<a href="https://en.wikipedia.org/wiki/Primetime_Emmy_Award_for_Outstanding_Supporting_Actor_-_Drama_Series" target="_blank" style="color: rgb(11, 0, 128);">Outstanding Supporting Actor in a Drama Series</a>&nbsp;for the&nbsp;<a href="https://en.wikipedia.org/wiki/60th_Primetime_Emmy_Awards" target="_blank" style="color: rgb(11, 0, 128);">60th Primetime Emmy Awards</a>, and the episode was nominated in the category of Outstanding Sound Editing for a Series. (<a href="https://en.wikipedia.org/wiki/The_Shape_of_Things_to_Come_(Lost)" target="_blank" style="color: rgb(11, 0, 128);"><strong>Full&nbsp;article...</strong></a>)Recently featured:&nbsp;<a href="https://en.wikipedia.org/wiki/Shakespeare_authorship_question" target="_blank" style="color: rgb(11, 0, 128);">Shakespeare authorship question</a><a href="https://en.wikipedia.org/wiki/Carnotaurus" target="_blank" style="color: rgb(11, 0, 128);"><em>Carnotaurus</em></a><a href="https://en.wikipedia.org/wiki/SMS_Kaiser_Barbarossa" target="_blank" style="color: rgb(11, 0, 128);">SMS&nbsp;<em>Kaiser Barbarossa</em></a></p><ul><li class="ql-align-right"><a href="https://en.wikipedia.org/wiki/Wikipedia:Today%27s_featured_article/April_2017" target="_blank" style="color: rgb(11, 0, 128);"><strong>Archive</strong></a><a href="https://lists.wikimedia.org/mailman/listinfo/daily-article-l" target="_blank" style="color: rgb(102, 51, 102);"><strong>By email</strong></a><a href="https://en.wikipedia.org/wiki/Wikipedia:Featured_articles" target="_blank" style="color: rgb(11, 0, 128);"><strong>More featured articles...</strong></a></li></ul><h2><strong>Did you know...</strong></h2><p class="ql-align-center"><a href="https://en.wikipedia.org/wiki/File:Big_Chief_Restaurant.jpg" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Big_Chief_Restaurant.jpg/133px-Big_Chief_Restaurant.jpg" alt="Big Chief Restaurant" height="100" width="133"></a>Big Chief Restaurant</p><ul><li>... that&nbsp;<a href="https://en.wikipedia.org/wiki/Big_Chief_Restaurant" target="_blank" style="color: rgb(11, 0, 128);"><strong>Big Chief Restaurant</strong></a>&nbsp;<em>(pictured)</em>&nbsp;in&nbsp;<a href="https://en.wikipedia.org/wiki/Wildwood,_Missouri" target="_blank" style="color: rgb(11, 0, 128);">Wildwood, Missouri</a>, is all that remains of a tourist complex that opened on&nbsp;<a href="https://en.wikipedia.org/wiki/U.S._Route_66" target="_blank" style="color: rgb(11, 0, 128);">U.S. Route 66</a>&nbsp;in 1928?</li><li>... that during the&nbsp;<a href="https://en.wikipedia.org/wiki/History_of_the_Jews_in_Italy#Jews_during_the_Fascist_era" target="_blank" style="color: rgb(11, 0, 128);">Holocaust in Italy</a>, doctors at&nbsp;<a href="https://en.wikipedia.org/wiki/Fatebenefratelli_Hospital" target="_blank" style="color: rgb(11, 0, 128);"><strong>Fatebenefratelli Hospital</strong></a>&nbsp;protected Jews from the Nazis by diagnosing them with a fictitious disease called "Syndrome K"?</li><li>... that&nbsp;<a href="https://en.wikipedia.org/wiki/Louise_Nixon_Sutton" target="_blank" style="color: rgb(11, 0, 128);"><strong>Louise Nixon Sutton</strong></a>&nbsp;was the first African-American woman to be awarded a PhD in mathematics by&nbsp;<a href="https://en.wikipedia.org/wiki/New_York_University" target="_blank" style="color: rgb(11, 0, 128);">New York University</a>&nbsp;in 1962?</li><li>... that&nbsp;<a href="https://en.wikipedia.org/wiki/Muhammad" target="_blank" style="color: rgb(11, 0, 128);">Muhammad</a>''s first wife&nbsp;<a href="https://en.wikipedia.org/wiki/Khadija_bint_Khuwaylid" target="_blank" style="color: rgb(11, 0, 128);">Khadija</a>&nbsp;and uncle&nbsp;<a href="https://en.wikipedia.org/wiki/Abu_Talib_ibn_Abd_al-Muttalib" target="_blank" style="color: rgb(11, 0, 128);">Abu Talib</a>&nbsp;died in the same year, traditionally known as the&nbsp;<a href="https://en.wikipedia.org/wiki/Year_of_Sorrow" target="_blank" style="color: rgb(11, 0, 128);"><strong>Year of Sorrow</strong></a>?</li><li>... that the predatory mite&nbsp;<a href="https://en.wikipedia.org/wiki/Neoseiulus_cucumeris" target="_blank" style="color: rgb(11, 0, 128);"><strong><em>Neoseiulus cucumeris</em></strong></a>&nbsp;can survive and breed while feeding solely on pollen?</li><li>... that Filipino director&nbsp;<a href="https://en.wikipedia.org/wiki/Jerrold_Tarog" target="_blank" style="color: rgb(11, 0, 128);"><strong>Jerrold Tarog</strong></a>&nbsp;has planned a film adaptation of the&nbsp;<a href="https://en.wikipedia.org/wiki/Graphic_novel" target="_blank" style="color: rgb(11, 0, 128);">graphic novel</a><a href="https://en.wikipedia.org/wiki/The_Mythology_Class" target="_blank" style="color: rgb(11, 0, 128);"><em>The Mythology Class</em></a>&nbsp;by&nbsp;<a href="https://en.wikipedia.org/wiki/Arnold_Arre" target="_blank" style="color: rgb(11, 0, 128);">Arnold Arre</a>?</li><li>... that two students at&nbsp;<a href="https://en.wikipedia.org/wiki/Traian_National_College" target="_blank" style="color: rgb(11, 0, 128);"><strong>Traian National College</strong></a>&nbsp;in&nbsp;<a href="https://en.wikipedia.org/wiki/Turnu_Severin" target="_blank" style="color: rgb(11, 0, 128);">Turnu Severin</a>, Romania, were executed in 1949 for being part of the&nbsp;<a href="https://en.wikipedia.org/wiki/Romanian_anti-communist_resistance_movement" target="_blank" style="color: rgb(11, 0, 128);">anti-communist resistance movement</a>?</li><li>... that&nbsp;<a href="https://en.wikipedia.org/wiki/Caleb_Swanigan" target="_blank" style="color: rgb(11, 0, 128);"><strong>Caleb Swanigan</strong></a>&nbsp;went from being a 360-pound (160&nbsp;kg) eighth grader to an&nbsp;<a href="https://en.wikipedia.org/wiki/College_basketball" target="_blank" style="color: rgb(11, 0, 128);">NCAA basketball</a>&nbsp;consensus first-team&nbsp;<a href="https://en.wikipedia.org/wiki/NCAA_Men%27s_Basketball_All-Americans" target="_blank" style="color: rgb(11, 0, 128);">All-American</a>?</li><li class="ql-align-right"><a href="https://en.wikipedia.org/wiki/Wikipedia:Recent_additions" target="_blank" style="color: rgb(11, 0, 128);"><strong>Recent additions</strong></a><a href="https://en.wikipedia.org/wiki/Wikipedia:Your_first_article" target="_blank" style="color: rgb(11, 0, 128);"><strong>Start a new article</strong></a><a href="https://en.wikipedia.org/wiki/Template_talk:Did_you_know" target="_blank" style="color: rgb(11, 0, 128);"><strong>Nominate an article</strong></a></li></ul><h2><strong>In the news</strong></h2><p class="ql-align-center"><a href="https://en.wikipedia.org/wiki/File:2017_London_Marathon_-_Elite_Women_%26_Men_winners.jpg" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/a/a8/2017_London_Marathon_-_Elite_Women_%26_Men_winners.jpg/100px-2017_London_Marathon_-_Elite_Women_%26_Men_winners.jpg" alt="Mary Keitany and Daniel Wanjiru" height="83" width="100"></a>Mary Keitany and Daniel Wanjiru</p><ul><li>In the&nbsp;<a href="https://en.wikipedia.org/wiki/2017_London_Marathon" target="_blank" style="color: rgb(11, 0, 128);"><strong>2017 London Marathon</strong></a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Mary_Jepkosgei_Keitany" target="_blank" style="color: rgb(11, 0, 128);">Mary Keitany</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Daniel_Wanjiru" target="_blank" style="color: rgb(11, 0, 128);">Daniel Wanjiru</a>&nbsp;(pictured) win the women''s and men''s races respectively.</li><li><a href="https://en.wikipedia.org/wiki/Turkey" target="_blank" style="color: rgb(11, 0, 128);">Turkey</a>&nbsp;votes in&nbsp;<a href="https://en.wikipedia.org/wiki/Turkish_constitutional_referendum,_2017" target="_blank" style="color: rgb(11, 0, 128);"><strong>a constitutional referendum</strong></a>&nbsp;in favour of replacing its&nbsp;<a href="https://en.wikipedia.org/wiki/Parliamentary_system" target="_blank" style="color: rgb(11, 0, 128);">parliamentary system</a>&nbsp;of government with an executive presidency.</li><li><a href="https://en.wikipedia.org/wiki/2017_Aleppo_suicide_car_bombing" target="_blank" style="color: rgb(11, 0, 128);"><strong>A suicide bombing</strong></a>&nbsp;of civilian evacuation buses near&nbsp;<a href="https://en.wikipedia.org/wiki/Aleppo" target="_blank" style="color: rgb(11, 0, 128);">Aleppo</a>, Syria, kills more than 120 people, including at least 80 children.</li><li><a href="https://en.wikipedia.org/wiki/Emma_Morano" target="_blank" style="color: rgb(11, 0, 128);"><strong>Emma Morano</strong></a>, the last living person born before 1900, dies at the age of 117.</li><li><a href="https://en.wikipedia.org/wiki/Pakistan" target="_blank" style="color: rgb(11, 0, 128);">Pakistan</a>&nbsp;sentences former&nbsp;<a href="https://en.wikipedia.org/wiki/India" target="_blank" style="color: rgb(11, 0, 128);">Indian</a>&nbsp;naval officer&nbsp;<a href="https://en.wikipedia.org/wiki/Kulbhushan_Jadhav" target="_blank" style="color: rgb(11, 0, 128);"><strong>Kulbhushan Jadhav</strong></a>&nbsp;to death for&nbsp;<a href="https://en.wikipedia.org/wiki/State-sponsored_terrorism#India" target="_blank" style="color: rgb(11, 0, 128);">espionage and sabotage</a>.</li></ul><p><a href="https://en.wikipedia.org/wiki/Portal:Current_events" target="_blank" style="color: rgb(11, 0, 128);"><strong>Ongoing</strong></a>:&nbsp;<a href="https://en.wikipedia.org/wiki/Battle_of_Mosul_(2016%E2%80%9317)" target="_blank" style="color: rgb(11, 0, 128);">Battle of Mosul</a></p><p><a href="https://en.wikipedia.org/wiki/Deaths_in_2017" target="_blank" style="color: rgb(11, 0, 128);"><strong>Recent deaths</strong></a>:&nbsp;<a href="https://en.wikipedia.org/wiki/Michele_Scarponi" target="_blank" style="color: rgb(11, 0, 128);">Michele Scarponi</a><a href="https://en.wikipedia.org/wiki/Ugo_Ehiogu" target="_blank" style="color: rgb(11, 0, 128);">Ugo Ehiogu</a><a href="https://en.wikipedia.org/wiki/Aaron_Hernandez" target="_blank" style="color: rgb(11, 0, 128);">Aaron Hernandez</a><a href="https://en.wikipedia.org/wiki/Rosey_(wrestler)" target="_blank" style="color: rgb(11, 0, 128);">Rosey</a></p><h2><strong>On this day...</strong></h2><p><a href="https://en.wikipedia.org/wiki/April_24" target="_blank" style="color: rgb(11, 0, 128);"><strong>April 24</strong></a>:&nbsp;<a href="https://en.wikipedia.org/wiki/Armenian_Genocide_Remembrance_Day" target="_blank" style="color: rgb(11, 0, 128);"><strong>Armenian Genocide Remembrance Day</strong></a>;&nbsp;<a href="https://en.wikipedia.org/wiki/Yom_HaShoah" target="_blank" style="color: rgb(11, 0, 128);"><strong>Yom HaShoah</strong></a>&nbsp;in Israel (2017)</p><p class="ql-align-center"><a href="https://en.wikipedia.org/wiki/File:TuthmosisIII.JPG" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/TuthmosisIII.JPG/100px-TuthmosisIII.JPG" alt="Thutmose III" height="133" width="100"></a>Thutmose III</p><ul><li><a href="https://en.wikipedia.org/wiki/1470s_BC" target="_blank" style="color: rgb(11, 0, 128);">1479 BC</a>&nbsp;–&nbsp;<a href="https://en.wikipedia.org/wiki/Thutmose_III" target="_blank" style="color: rgb(11, 0, 128);"><strong>Thutmose III</strong></a>&nbsp;<em>(statue pictured)</em>&nbsp;became the sixth&nbsp;<a href="https://en.wikipedia.org/wiki/Pharaoh" target="_blank" style="color: rgb(11, 0, 128);">Pharaoh</a>&nbsp;of the&nbsp;<a href="https://en.wikipedia.org/wiki/Eighteenth_Dynasty_of_Egypt" target="_blank" style="color: rgb(11, 0, 128);">Eighteenth Dynasty of Egypt</a>, although during the first 22 years of the reign he was&nbsp;<a href="https://en.wikipedia.org/wiki/Co-regent" target="_blank" style="color: rgb(11, 0, 128);">co-regent</a>&nbsp;with his aunt,&nbsp;<a href="https://en.wikipedia.org/wiki/Hatshepsut" target="_blank" style="color: rgb(11, 0, 128);">Hatshepsut</a>.</li><li><a href="https://en.wikipedia.org/wiki/1547" target="_blank" style="color: rgb(11, 0, 128);">1547</a>&nbsp;–&nbsp;<a href="https://en.wikipedia.org/wiki/Schmalkaldic_War" target="_blank" style="color: rgb(11, 0, 128);">Schmalkaldic War</a>:&nbsp;<a href="https://en.wikipedia.org/wiki/Charles_V,_Holy_Roman_Emperor" target="_blank" style="color: rgb(11, 0, 128);">Charles V,&nbsp;Holy Roman Emperor</a>, led Imperial troops to a decisive victory in the&nbsp;<a href="https://en.wikipedia.org/wiki/Battle_of_M%C3%BChlberg" target="_blank" style="color: rgb(11, 0, 128);"><strong>Battle of Mühlberg</strong></a>&nbsp;over the&nbsp;<a href="https://en.wikipedia.org/wiki/Lutheranism" target="_blank" style="color: rgb(11, 0, 128);">Lutheran</a>&nbsp;<a href="https://en.wikipedia.org/wiki/Schmalkaldic_League" target="_blank" style="color: rgb(11, 0, 128);">Schmalkaldic League</a>&nbsp;of&nbsp;<a href="https://en.wikipedia.org/wiki/Protestantism" target="_blank" style="color: rgb(11, 0, 128);">Protestant</a>&nbsp;princes.</li><li><a href="https://en.wikipedia.org/wiki/1915" target="_blank" style="color: rgb(11, 0, 128);">1915</a>&nbsp;– The&nbsp;<a href="https://en.wikipedia.org/wiki/Armenian_Genocide" target="_blank" style="color: rgb(11, 0, 128);">Armenian Genocide</a>&nbsp;in the&nbsp;<a href="https://en.wikipedia.org/wiki/Ottoman_Empire" target="_blank" style="color: rgb(11, 0, 128);">Ottoman Empire</a>&nbsp;began with&nbsp;<a href="https://en.wikipedia.org/wiki/Deportation_of_Armenian_intellectuals_on_24_April_1915" target="_blank" style="color: rgb(11, 0, 128);"><strong>the arrest and deportation</strong></a>&nbsp;of hundreds of prominent Armenians in&nbsp;<a href="https://en.wikipedia.org/wiki/Constantinople" target="_blank" style="color: rgb(11, 0, 128);">Constantinople</a>.</li><li><a href="https://en.wikipedia.org/wiki/1933" target="_blank" style="color: rgb(11, 0, 128);">1933</a>&nbsp;–&nbsp;<a href="https://en.wikipedia.org/wiki/Nazi_Germany" target="_blank" style="color: rgb(11, 0, 128);">Nazi Germany</a>&nbsp;began its&nbsp;<a href="https://en.wikipedia.org/wiki/Persecution_of_Jehovah%27s_Witnesses_in_Nazi_Germany" target="_blank" style="color: rgb(11, 0, 128);"><strong>persecution of Jehovah''s Witnesses</strong></a>&nbsp;by shutting down the&nbsp;<a href="https://en.wikipedia.org/wiki/Corporations_of_Jehovah%27s_Witnesses" target="_blank" style="color: rgb(11, 0, 128);">Watch Tower Society</a>&nbsp;office in&nbsp;<a href="https://en.wikipedia.org/wiki/Magdeburg" target="_blank" style="color: rgb(11, 0, 128);">Magdeburg</a>.</li><li><a href="https://en.wikipedia.org/wiki/1993" target="_blank" style="color: rgb(11, 0, 128);">1993</a>&nbsp;– The&nbsp;<a href="https://en.wikipedia.org/wiki/Provisional_Irish_Republican_Army" target="_blank" style="color: rgb(11, 0, 128);">Provisional Irish Republican Army</a>&nbsp;<a href="https://en.wikipedia.org/wiki/1993_Bishopsgate_bombing" target="_blank" style="color: rgb(11, 0, 128);"><strong>detonated a truck bomb</strong></a>&nbsp;in&nbsp;<a href="https://en.wikipedia.org/wiki/London" target="_blank" style="color: rgb(11, 0, 128);">London</a>''s financial district in&nbsp;<a href="https://en.wikipedia.org/wiki/Bishopsgate" target="_blank" style="color: rgb(11, 0, 128);">Bishopsgate</a>, killing one person, injuring forty-four others, and causing&nbsp;£350 million&nbsp;in damages.</li></ul><p><a href="https://en.wikipedia.org/wiki/Mellitus" target="_blank" style="color: rgb(11, 0, 128);"><strong>Mellitus</strong></a>&nbsp;(d.&nbsp;624)&nbsp;<strong>·</strong>&nbsp;<a href="https://en.wikipedia.org/wiki/Mimi_Smith" target="_blank" style="color: rgb(11, 0, 128);"><strong>Mimi Smith</strong></a>&nbsp;(b.&nbsp;1906)&nbsp;<strong>·</strong>&nbsp;<a href="https://en.wikipedia.org/wiki/Laurentia_Tan" target="_blank" style="color: rgb(11, 0, 128);"><strong>Laurentia Tan</strong></a>&nbsp;(b.&nbsp;1979)</p><p>More anniversaries:&nbsp;<a href="https://en.wikipedia.org/wiki/April_23" target="_blank" style="color: rgb(11, 0, 128);">April 23</a><a href="https://en.wikipedia.org/wiki/April_24" target="_blank" style="color: rgb(11, 0, 128);"><strong>April 24</strong></a><a href="https://en.wikipedia.org/wiki/April_25" target="_blank" style="color: rgb(11, 0, 128);">April 25</a></p><ul><li class="ql-align-right"><a href="https://en.wikipedia.org/wiki/Wikipedia:Selected_anniversaries/April" target="_blank" style="color: rgb(11, 0, 128);"><strong>Archive</strong></a><a href="https://lists.wikimedia.org/mailman/listinfo/daily-article-l" target="_blank" style="color: rgb(102, 51, 102);"><strong>By email</strong></a><a href="https://en.wikipedia.org/wiki/List_of_historical_anniversaries" target="_blank" style="color: rgb(11, 0, 128);"><strong>List of historical anniversaries</strong></a></li></ul><h2><strong>From today''s featured list</strong></h2><p class="ql-align-center"><a href="https://en.wikipedia.org/wiki/File:Billy_Hamilton_Baseball_Card.jpg" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Billy_Hamilton_Baseball_Card.jpg/100px-Billy_Hamilton_Baseball_Card.jpg" alt="Billy Hamilton" height="183" width="100"></a>Billy Hamilton</p><p>The&nbsp;<a href="https://en.wikipedia.org/wiki/Kansas_City_Cowboys_(AA)_all-time_roster" target="_blank" style="color: rgb(11, 0, 128);"><strong>Kansas City Cowboys'' players</strong></a>&nbsp;participated in the&nbsp;<a href="https://en.wikipedia.org/wiki/American_Association_(19th_century)" target="_blank" style="color: rgb(11, 0, 128);">American Association</a>&nbsp;(AA) for two seasons from 1888 to 1889. A professional baseball team based in&nbsp;<a href="https://en.wikipedia.org/wiki/Kansas_City,_Missouri" target="_blank" style="color: rgb(11, 0, 128);">Kansas City, Missouri</a>, the franchise initially used&nbsp;<a href="https://en.wikipedia.org/wiki/Association_Park" target="_blank" style="color: rgb(11, 0, 128);">Association Park</a>&nbsp;as their home field in 1888, then moved to&nbsp;<a href="https://en.wikipedia.org/wiki/Exposition_Park_(Kansas_City)" target="_blank" style="color: rgb(11, 0, 128);">Exposition Park</a>&nbsp;for the 1889&nbsp;season. Although the&nbsp;<a href="https://en.wikipedia.org/wiki/Kansas_City_Cowboys_(American_Association)" target="_blank" style="color: rgb(11, 0, 128);">Cowboys</a>&nbsp;completed their initial season in last place out of the league''s eight teams, there were notable player achievements; on June&nbsp;6,&nbsp;<a href="https://en.wikipedia.org/wiki/Henry_Porter_(baseball)" target="_blank" style="color: rgb(11, 0, 128);">Henry Porter</a>&nbsp;threw a&nbsp;<a href="https://en.wikipedia.org/wiki/No-hitter" target="_blank" style="color: rgb(11, 0, 128);">no-hitter</a>, and on June&nbsp;13, Barkley hit for the&nbsp;<a href="https://en.wikipedia.org/wiki/Hitting_for_the_cycle" target="_blank" style="color: rgb(11, 0, 128);">cycle</a>. The franchise''s only future&nbsp;<a href="https://en.wikipedia.org/wiki/National_Baseball_Hall_of_Fame_and_Museum" target="_blank" style="color: rgb(11, 0, 128);">Hall of Fame</a>&nbsp;player,&nbsp;<a href="https://en.wikipedia.org/wiki/Billy_Hamilton_(baseball,_born_1866)" target="_blank" style="color: rgb(11, 0, 128);">"Slidin'' Billy" Hamilton</a>&nbsp;<em>(pictured)</em>, began his career as a part-time outfielder in 1888, and was their starting&nbsp;<a href="https://en.wikipedia.org/wiki/Right_fielder" target="_blank" style="color: rgb(11, 0, 128);">right fielder</a>&nbsp;in 1889. He is the franchise''s all-time leader in&nbsp;<a href="https://en.wikipedia.org/wiki/Run_(baseball)" target="_blank" style="color: rgb(11, 0, 128);">runs</a>&nbsp;scored,&nbsp;<a href="https://en.wikipedia.org/wiki/Base_on_balls" target="_blank" style="color: rgb(11, 0, 128);">bases on balls</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Stolen_base" target="_blank" style="color: rgb(11, 0, 128);">stolen bases</a>. With&nbsp;<a href="https://en.wikipedia.org/wiki/Bill_Watkins" target="_blank" style="color: rgb(11, 0, 128);">Bill Watkins</a>&nbsp;as the team''s&nbsp;<a href="https://en.wikipedia.org/wiki/Manager_(baseball)" target="_blank" style="color: rgb(11, 0, 128);">manager</a>&nbsp;in 1889, the team improved to seventh in the league. On November 15, 1889, the Cowboys submitted their resignation from the AA. (<a href="https://en.wikipedia.org/wiki/Kansas_City_Cowboys_(AA)_all-time_roster" target="_blank" style="color: rgb(11, 0, 128);"><strong>Full&nbsp;list...</strong></a>)</p><p class="ql-align-right">Recently featured:&nbsp;<a href="https://en.wikipedia.org/wiki/List_of_Gantz_chapters" target="_blank" style="color: rgb(11, 0, 128);"><em>Gantz</em>&nbsp;chapters</a><a href="https://en.wikipedia.org/wiki/Wolfmother_discography" target="_blank" style="color: rgb(11, 0, 128);">Wolfmother discography</a><a href="https://en.wikipedia.org/wiki/List_of_cities_and_towns_in_Montana" target="_blank" style="color: rgb(11, 0, 128);">Cities and towns in Montana</a></p><ul><li class="ql-align-right"><a href="https://en.wikipedia.org/wiki/Wikipedia:Today%27s_featured_list/April_2017" target="_blank" style="color: rgb(11, 0, 128);"><strong>Archive</strong></a><a href="https://en.wikipedia.org/wiki/Wikipedia:Featured_lists" target="_blank" style="color: rgb(11, 0, 128);"><strong>More featured lists...</strong></a></li></ul><h2><strong>Today''s featured picture</strong></h2><p><a href="https://en.wikipedia.org/wiki/File:JesseBJackson.jpg" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/JesseBJackson.jpg/300px-JesseBJackson.jpg" alt="Jesse B. Jackson" height="392" width="300"></a><a href="https://en.wikipedia.org/wiki/Jesse_B._Jackson" target="_blank" style="color: rgb(11, 0, 128);"><strong>Jesse B. Jackson</strong></a>&nbsp;was a United States consul and an&nbsp;<a href="https://en.wikipedia.org/wiki/Witnesses_and_testimonies_of_the_Armenian_Genocide" target="_blank" style="color: rgb(11, 0, 128);">eyewitness</a>&nbsp;to the&nbsp;<a href="https://en.wikipedia.org/wiki/Armenian_Genocide" target="_blank" style="color: rgb(11, 0, 128);">Armenian Genocide</a>. He served as consul in&nbsp;<a href="https://en.wikipedia.org/wiki/Aleppo" target="_blank" style="color: rgb(11, 0, 128);">Aleppo</a>&nbsp;when the town was the junction of many important deportation routes. Jackson concluded that the policies towards the Armenians were carefully planned to "extinguish the Armenian race". He estimated that a million Armenians had been killed and considered his own survival a "miracle". After the genocide, Jackson led a relief effort and was credited with saving the lives of thousands.</p><p>Photograph:&nbsp;<a href="https://en.wikipedia.org/wiki/Harris_%26_Ewing" target="_blank" style="color: rgb(11, 0, 128);">Harris &amp; Ewing</a>; restoration:&nbsp;<a href="https://en.wikipedia.org/wiki/User:Centpacrr" target="_blank" style="color: rgb(11, 0, 128);">Centpacrr</a></p><p class="ql-align-right">Recently featured:&nbsp;<a href="https://en.wikipedia.org/wiki/Template:POTD/2017-04-23" target="_blank" style="color: rgb(11, 0, 128);">Dynjandi</a><a href="https://en.wikipedia.org/wiki/Template:POTD/2017-04-22" target="_blank" style="color: rgb(11, 0, 128);">Female proboscis monkey on Borneo</a><a href="https://en.wikipedia.org/wiki/Template:POTD/2017-04-21" target="_blank" style="color: rgb(11, 0, 128);">Dome of the Fatima Masumeh Shrine</a></p><ul><li class="ql-align-right"><a href="https://en.wikipedia.org/wiki/Wikipedia:Picture_of_the_day/April_2017" target="_blank" style="color: rgb(11, 0, 128);"><strong>Archive</strong></a><a href="https://en.wikipedia.org/wiki/Wikipedia:Featured_pictures" target="_blank" style="color: rgb(11, 0, 128);"><strong>More featured pictures...</strong></a></li></ul><h2>Other areas of Wikipedia</h2><ul><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Community_portal" target="_blank" style="color: rgb(11, 0, 128);"><strong>Community portal</strong></a>&nbsp;– Bulletin board, projects, resources and activities covering a wide range of Wikipedia areas.</li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Help_desk" target="_blank" style="color: rgb(11, 0, 128);"><strong>Help desk</strong></a>&nbsp;– Ask questions about using Wikipedia.</li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Local_Embassy" target="_blank" style="color: rgb(11, 0, 128);"><strong>Local embassy</strong></a>&nbsp;– For Wikipedia-related communication in languages other than English.</li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Reference_desk" target="_blank" style="color: rgb(11, 0, 128);"><strong>Reference desk</strong></a>&nbsp;– Serving as virtual librarians, Wikipedia volunteers tackle your questions on a wide range of subjects.</li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:News" target="_blank" style="color: rgb(11, 0, 128);"><strong>Site news</strong></a>&nbsp;– Announcements, updates, articles and press releases on Wikipedia and the Wikimedia Foundation.</li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Village_pump" target="_blank" style="color: rgb(11, 0, 128);"><strong>Village pump</strong></a>&nbsp;– For discussions about Wikipedia itself, including areas for technical issues and policies.</li></ul><h2>Wikipedia''s sister projects</h2><p>Wikipedia is hosted by the&nbsp;<a href="https://en.wikipedia.org/wiki/Wikimedia_Foundation" target="_blank" style="color: rgb(11, 0, 128);">Wikimedia Foundation</a>, a non-profit organization that also hosts a range of other&nbsp;<a href="https://wikimediafoundation.org/wiki/Our_projects" target="_blank" style="color: rgb(102, 51, 102);">projects</a>:</p><p><a href="https://commons.wikimedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/31px-Commons-logo.svg.png" alt="Commons" height="42" width="31"></a><a href="https://commons.wikimedia.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Commons</strong></a></p><p>Free media repository<a href="https://www.mediawiki.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Mediawiki-logo.png/35px-Mediawiki-logo.png" alt="MediaWiki" height="26" width="35"></a><a href="https://mediawiki.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>MediaWiki</strong></a></p><p>Wiki software development<a href="https://meta.wikimedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/35px-Wikimedia_Community_Logo.svg.png" alt="Meta-Wiki" height="35" width="35"></a><a href="https://meta.wikimedia.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Meta-Wiki</strong></a></p><p>Wikimedia project coordination<a href="https://en.wikibooks.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/35px-Wikibooks-logo.svg.png" alt="Wikibooks" height="35" width="35"></a><a href="https://en.wikibooks.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikibooks</strong></a></p><p>Free textbooks and manuals<a href="https://www.wikidata.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/47px-Wikidata-logo.svg.png" alt="Wikidata" height="26" width="47"></a><a href="https://www.wikidata.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikidata</strong></a></p><p>Free knowledge base<a href="https://en.wikinews.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/51px-Wikinews-logo.svg.png" alt="Wikinews" height="28" width="51"></a><a href="https://en.wikinews.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikinews</strong></a></p><p>Free-content news<a href="https://en.wikiquote.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/35px-Wikiquote-logo.svg.png" alt="Wikiquote" height="41" width="35"></a><a href="https://en.wikiquote.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikiquote</strong></a></p><p>Collection of quotations<a href="https://en.wikisource.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/35px-Wikisource-logo.svg.png" alt="Wikisource" height="37" width="35"></a><a href="https://en.wikisource.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikisource</strong></a></p><p>Free-content library<a href="https://species.wikimedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/35px-Wikispecies-logo.svg.png" alt="Wikispecies" height="41" width="35"></a><a href="https://species.wikimedia.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikispecies</strong></a></p><p>Directory of species<a href="https://en.wikiversity.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Wikiversity-logo.svg/41px-Wikiversity-logo.svg.png" alt="Wikiversity" height="33" width="41"></a><a href="https://en.wikiversity.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikiversity</strong></a></p><p>Free learning materials and activities<a href="https://en.wikivoyage.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/35px-Wikivoyage-Logo-v3-icon.svg.png" alt="Wikivoyage" height="35" width="35"></a><a href="https://en.wikivoyage.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wikivoyage</strong></a></p><p>Free travel guide<a href="https://en.wiktionary.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Wiktionary-logo-v2.svg/35px-Wiktionary-logo-v2.svg.png" alt="Wiktionary" height="35" width="35"></a><a href="https://en.wiktionary.org/" target="_blank" style="color: rgb(102, 51, 102);"><strong>Wiktionary</strong></a></p><p>Dictionary and thesaurus</p><h2>Wikipedia languages</h2><p>This Wikipedia is written in&nbsp;<a href="https://en.wikipedia.org/wiki/English_language" target="_blank" style="color: rgb(11, 0, 128);">English</a>. Started in 2001, it currently contains&nbsp;<a href="https://en.wikipedia.org/wiki/Special:Statistics" target="_blank" style="color: rgb(11, 0, 128);">5,392,168</a>&nbsp;articles. Many other Wikipedias are available; some of the largest are listed below.</p><ul><li>More than 1,000,000 articles:&nbsp;<a href="https://de.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Deutsch</a><a href="https://es.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Español</a><a href="https://fr.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Français</a><a href="https://it.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Italiano</a><a href="https://nl.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Nederlands</a><a href="https://ja.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">???</a><a href="https://pl.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Polski</a><a href="https://ru.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">???????</a><a href="https://sv.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Svenska</a><a href="https://vi.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Ti?ng Vi?t</a></li><li>More than 250,000 articles:&nbsp;<a href="https://ar.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">???????</a><a href="https://id.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Bahasa Indonesia</a><a href="https://ms.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Bahasa Melayu</a><a href="https://ca.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Català</a><a href="https://cs.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Ceština</a><a href="https://eu.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Euskara</a><a href="https://fa.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">?????</a><a href="https://ko.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">???</a><a href="https://hu.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Magyar</a><a href="https://no.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Norsk bokmål</a><a href="https://pt.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Português</a><a href="https://ro.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Româna</a><a href="https://sr.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Srpski</a><a href="https://sh.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Srpskohrvatski</a><a href="https://fi.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Suomi</a><a href="https://tr.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Türkçe</a><a href="https://uk.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">??????????</a><a href="https://zh.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">??</a></li><li>More than 50,000 articles:&nbsp;<a href="https://bs.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Bosanski</a><a href="https://bg.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">?????????</a><a href="https://da.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Dansk</a><a href="https://et.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Eesti</a><a href="https://el.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">????????</a><a href="https://simple.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">English (simple form)</a><a href="https://eo.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Esperanto</a><a href="https://gl.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Galego</a><a href="https://he.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">?????</a><a href="https://hr.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Hrvatski</a><a href="https://lv.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Latviešu</a><a href="https://lt.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Lietuviu</a><a href="https://nn.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Norsk nynorsk</a><a href="https://sk.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Slovencina</a><a href="https://sl.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">Slovenšcina</a><a href="https://th.wikipedia.org/wiki/" target="_blank" style="color: rgb(102, 51, 102);">???</a></li></ul><p class="ql-align-center"><a href="https://meta.wikimedia.org/wiki/List_of_Wikipedias" target="_blank" style="color: rgb(102, 51, 102);"><strong>Complete list of Wikipedias</strong></a></p><h2>Navigation menu</h2><p><br></p><ul><li>Not logged in</li><li><a href="https://en.wikipedia.org/wiki/Special:MyTalk" target="_blank" style="color: rgb(11, 0, 128);">Talk</a></li><li><a href="https://en.wikipedia.org/wiki/Special:MyContributions" target="_blank" style="color: rgb(11, 0, 128);">Contributions</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Special:CreateAccount&amp;returnto=Main+Page" target="_blank" style="color: rgb(11, 0, 128);">Create account</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Special:UserLogin&amp;returnto=Main+Page" target="_blank" style="color: rgb(11, 0, 128);">Log in</a></li></ul><p><br></p><ul><li><a href="https://en.wikipedia.org/wiki/Main_Page" target="_blank" style="color: rgb(34, 34, 34);">Main Page</a></li><li><a href="https://en.wikipedia.org/wiki/Talk:Main_Page" target="_blank" style="color: rgb(6, 69, 173);">Talk</a></li><li><a href="https://en.wikipedia.org/wiki/Main_Page" target="_blank" style="color: rgb(34, 34, 34);">Read</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;action=edit" target="_blank" style="color: rgb(6, 69, 173);">View source</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;action=history" target="_blank" style="color: rgb(6, 69, 173);">View history</a></li></ul><h3><strong>Search</strong></h3><p><br></p><p><br></p><p><br></p><ul><li><a href="https://en.wikipedia.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Main page</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Contents" target="_blank" style="color: rgb(11, 0, 128);">Contents</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Featured_content" target="_blank" style="color: rgb(11, 0, 128);">Featured content</a></li><li><a href="https://en.wikipedia.org/wiki/Portal:Current_events" target="_blank" style="color: rgb(11, 0, 128);">Current events</a></li><li><a href="https://en.wikipedia.org/wiki/Special:Random" target="_blank" style="color: rgb(11, 0, 128);">Random article</a></li><li><a href="https://donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wikipedia.org&amp;uselang=en" target="_blank" style="color: rgb(11, 0, 128);">Donate to Wikipedia</a></li><li><a href="https://shop.wikimedia.org/" target="_blank" style="color: rgb(11, 0, 128);">Wikipedia store</a></li></ul><h3>Interaction</h3><ul><li><a href="https://en.wikipedia.org/wiki/Help:Contents" target="_blank" style="color: rgb(11, 0, 128);">Help</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:About" target="_blank" style="color: rgb(11, 0, 128);">About Wikipedia</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Community_portal" target="_blank" style="color: rgb(11, 0, 128);">Community portal</a></li><li><a href="https://en.wikipedia.org/wiki/Special:RecentChanges" target="_blank" style="color: rgb(11, 0, 128);">Recent changes</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Contact_us" target="_blank" style="color: rgb(11, 0, 128);">Contact page</a></li></ul><h3>Tools</h3><ul><li><a href="https://en.wikipedia.org/wiki/Special:WhatLinksHere/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">What links here</a></li><li><a href="https://en.wikipedia.org/wiki/Special:RecentChangesLinked/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Related changes</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:File_Upload_Wizard" target="_blank" style="color: rgb(11, 0, 128);">Upload file</a></li><li><a href="https://en.wikipedia.org/wiki/Special:SpecialPages" target="_blank" style="color: rgb(11, 0, 128);">Special pages</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;oldid=762066868" target="_blank" style="color: rgb(11, 0, 128);">Permanent link</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;action=info" target="_blank" style="color: rgb(11, 0, 128);">Page information</a></li><li><a href="https://www.wikidata.org/wiki/Q5296" target="_blank" style="color: rgb(11, 0, 128);">Wikidata item</a></li></ul><h3>Print/export</h3><ul><li><a href="https://en.wikipedia.org/w/index.php?title=Special:Book&amp;bookcmd=book_creator&amp;referer=Main+Page" target="_blank" style="color: rgb(11, 0, 128);">Create a book</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Special:Book&amp;bookcmd=render_article&amp;arttitle=Main+Page&amp;returnto=Main+Page&amp;oldid=762066868&amp;writer=rdf2latex" target="_blank" style="color: rgb(11, 0, 128);">Download as PDF</a></li><li><a href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;printable=yes" target="_blank" style="color: rgb(11, 0, 128);">Printable version</a></li></ul><h3>In other projects</h3><ul><li><a href="https://commons.wikimedia.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikimedia Commons</a></li><li><a href="https://www.mediawiki.org/wiki/MediaWiki" target="_blank" style="color: rgb(11, 0, 128);">MediaWiki</a></li><li><a href="https://meta.wikimedia.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Meta-Wiki</a></li><li><a href="https://species.wikimedia.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikispecies</a></li><li><a href="https://en.wikibooks.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikibooks</a></li><li><a href="https://www.wikidata.org/wiki/Wikidata:Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikidata</a></li><li><a href="https://en.wikinews.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikinews</a></li><li><a href="https://en.wikiquote.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikiquote</a></li><li><a href="https://en.wikisource.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikisource</a></li><li><a href="https://en.wikiversity.org/wiki/Wikiversity:Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikiversity</a></li><li><a href="https://en.wikivoyage.org/wiki/Main_Page" target="_blank" style="color: rgb(11, 0, 128);">Wikivoyage</a></li></ul><h3>Languages</h3><ul><li><a href="https://ar.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???????</a></li><li><a href="https://bg.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">?????????</a></li><li><a href="https://bs.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Bosanski</a></li><li><a href="https://ca.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Català</a></li><li><a href="https://cs.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Ceština</a></li><li><a href="https://da.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Dansk</a></li><li><a href="https://de.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Deutsch</a></li><li><a href="https://et.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Eesti</a></li><li><a href="https://el.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">????????</a></li><li><a href="https://es.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Español</a></li><li><a href="https://eo.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Esperanto</a></li><li><a href="https://eu.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Euskara</a></li><li><a href="https://fa.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">?????</a></li><li><a href="https://fr.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Français</a></li><li><a href="https://gl.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Galego</a></li><li><a href="https://ko.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???</a></li><li><a href="https://hr.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Hrvatski</a></li><li><a href="https://id.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Bahasa Indonesia</a></li><li><a href="https://it.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Italiano</a></li><li><a href="https://he.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">?????</a></li><li><a href="https://ka.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???????</a></li><li><a href="https://lv.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Latviešu</a></li><li><a href="https://lt.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Lietuviu</a></li><li><a href="https://hu.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Magyar</a></li><li><a href="https://ms.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Bahasa Melayu</a></li><li><a href="https://nl.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Nederlands</a></li><li><a href="https://ja.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???</a></li><li><a href="https://no.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Norsk bokmål</a></li><li><a href="https://nn.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Norsk nynorsk</a></li><li><a href="https://pl.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Polski</a></li><li><a href="https://pt.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Português</a></li><li><a href="https://ro.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Româna</a></li><li><a href="https://ru.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???????</a></li><li><a href="https://simple.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Simple English</a></li><li><a href="https://sk.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Slovencina</a></li><li><a href="https://sl.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Slovenšcina</a></li><li><a href="https://sr.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">?????? / srpski</a></li><li><a href="https://sh.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Srpskohrvatski / ??????????????</a></li><li><a href="https://fi.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Suomi</a></li><li><a href="https://sv.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Svenska</a></li><li><a href="https://th.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">???</a></li><li><a href="https://tr.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Türkçe</a></li><li><a href="https://uk.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">??????????</a></li><li><a href="https://vi.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">Ti?ng Vi?t</a></li><li><a href="https://zh.wikipedia.org/wiki/" target="_blank" style="color: rgb(11, 0, 128);">??</a></li><li><a href="https://meta.wikimedia.org/wiki/List_of_Wikipedias" target="_blank" style="color: rgb(11, 0, 128);"><strong>Complete list</strong></a></li><li>Text is available under the&nbsp;<a href="https://en.wikipedia.org/wiki/Wikipedia:Text_of_Creative_Commons_Attribution-ShareAlike_3.0_Unported_License" target="_blank" style="color: rgb(11, 0, 128);">Creative Commons Attribution-ShareAlike License</a>; additional terms may apply. By using this site, you agree to the&nbsp;<a href="https://wikimediafoundation.org/wiki/Terms_of_Use" target="_blank" style="color: rgb(11, 0, 128);">Terms of Use</a>&nbsp;and&nbsp;<a href="https://wikimediafoundation.org/wiki/Privacy_policy" target="_blank" style="color: rgb(11, 0, 128);">Privacy Policy</a>. Wikipedia® is a registered trademark of the&nbsp;<a href="https://www.wikimediafoundation.org/" target="_blank" style="color: rgb(11, 0, 128);">Wikimedia Foundation, Inc.</a>, a non-profit organization.</li><li><a href="https://wikimediafoundation.org/wiki/Privacy_policy" target="_blank" style="color: rgb(11, 0, 128);">Privacy policy</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:About" target="_blank" style="color: rgb(11, 0, 128);">About Wikipedia</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:General_disclaimer" target="_blank" style="color: rgb(11, 0, 128);">Disclaimers</a></li><li><a href="https://en.wikipedia.org/wiki/Wikipedia:Contact_us" target="_blank" style="color: rgb(11, 0, 128);">Contact Wikipedia</a></li><li><a href="https://www.mediawiki.org/wiki/Special:MyLanguage/How_to_contribute" target="_blank" style="color: rgb(11, 0, 128);">Developers</a></li><li><a href="https://wikimediafoundation.org/wiki/Cookie_statement" target="_blank" style="color: rgb(11, 0, 128);">Cookie statement</a></li><li><a href="https://en.m.wikipedia.org/w/index.php?title=Main_Page&amp;mobileaction=toggle_view_mobile" target="_blank" style="color: rgb(11, 0, 128);">Mobile view</a></li><li class="ql-align-right"><a href="https://wikimediafoundation.org/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://en.wikipedia.org/static/images/wikimedia-button.png" alt="Wikimedia Foundation" height="31" width="88"></a></li><li class="ql-align-right"><a href="https://www.mediawiki.org/" target="_blank" style="color: rgb(11, 0, 128);"><img src="https://en.wikipedia.org/static/images/poweredby_mediawiki_88x31.png" alt="Powered by MediaWiki" height="31" width="88"></a></li></ul><p><br></p>', N'honme', N'honme', N'Desert27274.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4051, N'<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="ql-align-center">BURIAL PLOTS</h2><p class="ql-align-center">We are a business which works to clarify and simplify the process of planning or arranging a funeral, whether you’re saying goodbye to a loved one or making arrangements for your own future needs. We do this through two central planks of provision. The first deals with access to burial plots, and the second to the advice, help and services which the average person needs to call upon when the time comes to plan a funeral or deal with bereavement.</p><p class="ql-align-center">Provision of burial plots is something which, in recent years, has reached crisis point within the UK. A 2013 BBC survey found that several local authorities across the country were predicting they would run out of plots within the decade, whilst the option of reusing older plots is something which is still too controversial to offer a viable solution.</p><p><br></p>
<h2 class="ql-align-center">DEMAND</h2><p class="ql-align-center">This lack of supply is occurring against the backdrop of demand which has plateaued at around 25% of all funerals. The fact that religious communities such as the Muslim and Jewish faiths are now firmly ensconced within the UK population – faiths within which burial is compulsory – means that demand for burial plots is unlikely to drop at any time in the future. To deal with this situation we’ve already purchased 6000 plots within the London area and will soon be acquiring 150,000 across the UK. On top of this we will be acquiring and developing cemeteries in West London, Dorset and Birmingham, as we work to turn our stock of burial plots into a nationwide offering. By doing this we’ll be able to offer plots for immediate use or pre planning in a location of the clients’ choice and at affordable prices. We also provide flexible payment plans, bringing the peace of mind offered by a pre-purchased burial plot within the reach of even more people.</p><p><br></p>
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="ql-align-center">SERVICES</h2><p class="ql-align-center">The other aspect of our offer is the provision of a one-stop portal providing information and access to all aspects of funeral planning. Whether they wish to purchase a burial plot to not, visitors to our site will be able to access the full range of services needed when arranging a funeral. As thing stand, services of this kind are generally only available via the employment of a funeral director, and the information on offer is fragmented and spread across a variety of businesses and agencies. By visiting our site anyone arranging a funeral will be able to find all of the help and information they need, from access to services such as florists, cars and stonemasons to advice on dealing with the emotional and psychological impact of bereavement and loss.</p><p class="ql-align-center">Burialplots.co.uk will provide all of the tools necessary for anyone who needs to arrange a funeral or who is simply thinking ahead and planning for the event of their own death. By dealing with matters such as wills, life insurance and bespoke funeral plans, we’re able to offer the complete package, leaving users secure in the knowledge that they’ve done everything possible to ease the passage of one of the more difficult aspects of any individual’s life.</p>', N'About Us', N'ABOUT-US', N'banner-about45773.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4053, N'<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Burial Plots After Funeral</h2>
<div class="padding-left">
    <p>For many people, the period immediately following the funeral represents one of the hardest stages of the grieving process. Arranging the funeral, as complex as it might be, can provide a focus which is lacking in the immediate aftermath. At the same time, the loss of your loved one is still recent and the feelings fairly raw, whilst the help and support provided by other people may not be as forthcoming. </p>
    <p>Here at Burialplots.co.uk we work to make the bereavement process as simple as possible. We do that by offering easy and affordable access to burial plots at a time when the supply of plots is falling far behind the demand. We also bring together all the help and advice you might need following the loss of someone close to you, from dealing with the psychological impact to offering access to the practical help and services needed. Whilst the funeral itself marks one particular phase of the grieving process, the period immediately following marks the beginning of the rest of your life without the presence of the deceased. Elsewhere on the site you’ll find advice on how to cope with grief in the longer term, and the details of organisations which can help with this. Immediately following the funeral, however, there are a number of practical steps which you may have to take. </p>
</div>
<br />
<h2 class="underline">Tell Us Once</h2>
<div class="padding-left">
    <p>Although you will have informed friends and family at the time loss itself, there are other organisations and bodies which will need to be notified in the longer term. Some of this may have been dealt with when the death was registered. In some areas the Tell Us Once service is available. If it is then the registrar will provide a unique reference number which can be used online or when you phone the Tell Us Once helpline. You will need to provide the following information to Tell Us Once:</p>
    <ul>
        <li>The date of birth of the deceased</li>
        <li>Their National Insurance Number</li>
        <li>Their driving licence number (if applicable)</li>
        <li>Their passport number (if applicable) </li>
        <li>Details of any benefits they were receiving, such as a State Pension</li>
        <li>Details of council services they accessed, such as the Blue Badge scheme</li>
        <li>The name and address of the next of kin</li>
        <li>The name and address of any spouse or civil partner, if different from the next of kin</li>
        <li>If a person or company, such as a law firm, is administering the estate of the deceased, which includes anything such as property, valuables and money, then you will need to provide their name, address and contact details </li>
        <li>The details of any armed forces or public sector pension schemes they were a party to. </li>
    </ul>
    <p>Please note that you’ll need the permission of the next of kin, any person dealing with their estate (generally referred to as the ‘executor’ or ‘administrator’) and anyone who was in joint receipt of entitlements or benefits, before you give their details to Tell Us Once. </p>
    <p>Once you’ve given the relevant details to Tell Us Once, they will inform the following organisations:</p>
    <ul>
        <li>HM Revenue and Customs (HMRC)</li>
        <li>Department for Work and pensions (DWP)</li>
        <li>The Passport Office</li>
        <li>The Driver and Vehicle Licensing Agency (DVLA)</li>
        <li>The local council </li>
        <li>Any public sector or armed forces pension schemes</li>
    </ul>
    <p>At the time of writing, the following local authorities don’t offer the Tell Us Once service, meaning that you will have to contact the relevant bodies yourself:</p>
    <ul>
        <li>Brighton and Hove</li>
        <li>Croydon</li>
        <li>East Sussex</li>
        <li>Eastbourne</li>
        <li>Hammersmith and Fulham</li>
        <li>Harrow</li>
        <li>Hastings</li>
        <li>Highland</li>
        <li>Lewes</li>
        <li>Liverpool</li>
        <li>Manchester</li>
        <li>Medway</li>
        <li>Portsmouth</li>
        <li>Rother</li>
        <li>Salford</li>
        <li>Wealden</li>
    </ul>
</div>
<br />
<h2 class="underline">Other Organisations</h2>
<div class="padding-left">
    <p>Whether you use Tell Us Once or not, you will also need to inform any banks or building societies which the deceased used so that accounts can be closed down or modified. You will also have to notify the following bodies or organisations:</p>
    <ul>
        <li>Any employer of the deceased</li>
        <li>The Social Services, specifically to cancel any services which were being provided</li>
        <li>Medical organisations such as a hospital, doctors or dentists in order to cancel any appointments and return equipment where applicable</li>
        <li>Legal representatives such as solicitors</li>
        <li>Any bodies providing voluntary services, such as meals on wheels or Care and Repair</li>
    </ul>
    <p>The precise details will differ from person to person, but you may also need to get in touch with a private landlord, a mortgage provider, insurance companies, utility companies (i.e. water, gas and electric) a telephone company (mobile or landline), TV Licensing, companies from which the deceased rented household appliances such as digital TV boxes, internet providers, credit card or other loan companies. You may also need to cancel the membership of organisations such as libraries, social clubs, unions and professional organisations. If any children in the family were close to the deceased then it may be a good idea to inform their school, allowing teachers to deal with any reactions in a sensitive and informed manner. </p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Your Own Circumstances</h2>
<div class="padding-left">
    <p>The death of someone close to you may lead to a change in your personal circumstances. If this is the case, you may be eligible for certain benefits or entitlements. Your local Social Security or DWP office should be able to advise if this is the case, as will the Citizens Advice Bureau. </p>
    <p>The number of practical issues which emerge following the death of someone close to you can feel almost overwhelming. The good news is that help is available, and if you don’t find the information you’re looking for on this site then please contact us, via email at (Email) or by calling 0100 000 0000. </p>
</div>


', N'After Funeral', N'AFTER-FUNERAL', N'banner-where-to-start85273.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4054, N'
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Burial Plots Arranging</h2>
<div class="padding-left">
    <p>Here at Burialplots.co.uk our main aim is to make arranging a funeral simpler than it’s ever been. To that end we’ve made it easier to find your perfect burial plot. The precise location of a final resting place is of huge importance to anyone who wishes to be buried, but the truth of the matter is that the supply of burial plots in the UK is at historically low levels. This has two effects – it drives up prices and it makes finding your preferred location incredibly difficult. We’ve created an online solution that gathers plots from around the UK in one place. We’ve made searching for the perfect plot incredibly simple and we offer a choice of payment options, from advanced payment to setting up a payment plan. Whether you’re need is urgent or you’re planning for the future, we’ll give you peace of mind. </p>
    <p>As well as providing burial plots we make the task of arranging a funeral much simpler in general terms. Across the site you’ll find advice, help and links dealing with every aspect of bereavement, from the psychological impact of losing a loved one to the practical matter of registering a death. While most people place arranging a funeral in the experienced hands of a funeral director, it’s still vital to have a clear idea of just what the funeral in question is going to involve. Although thinking about it may seem difficult at the time, the funeral is your chance to say goodbye and celebrate the life of the deceased. As time goes by the fact that you gave them the farewell they deserved will come to be a source of great comfort.</p>
</div>
<br />
<h2 class="underline">The Arrangements</h2>
<div class="padding-left">
    <p>Every funeral will be different, representing the person who has died and the feelings of those left behind. That’s why, even when working with a funeral director, it’s helpful to have an idea in your head of what the various components of the average funeral are. Practical matters such as choosing a casket and memorial, or arranging the purchase of flowers, are dealt with elsewhere on Burialplots.co.uk. Pulling together the details of the funeral service is a deeply personal matter, and a few of the factors to bear in mind are the following:</p>
    <ul>
        <li><strong>The venue for the funeral</strong> – it’s generally assumed that funeral services take place in a church or some other religious building. It can take place in any suitable venue or even a private home, however, which may be more apt for someone without strong religious beliefs.</li>
        <li><strong>The service</strong> – once again, the assumption is that the service will be led by a religious figure such as a minister or priest. It could, however, be led by a humanist, the funeral director you’ve hired or even by someone close to the deceased.</li>
        <li><strong>Content</strong> – the words actually spoken are very important. If, as is often the case, the person leading the service didn’t know the deceased, make sure you provide them with the details needed to personalise the service. You can also have other people reading out things such as poems, prayers or anything else which you think helps to reflect the personality and life of the deceased.</li>
        <li><strong>Music</strong> – hymns are traditionally the music featured at funerals, but in recent years it has become increasingly popular to include other types of music. This is generally played via CD’s or downloads of favourite songs, but live music is also an option.</li>
        <li><strong>Order of Service</strong> – a printed order of service will serve two purposes. It will make it easier for those attending the funeral to follow the proceedings, and it will give everyone a memento to keep, reminding them of the person they are saying goodbye to. The order of service could also be sent to those friends and family members who are unable to attend on the day. </li>
    </ul>
    <p>You’ll also need to consider arrangements around the funeral itself. Transport to and from the funeral will usually consist of a hearse and cars arranged by the funeral director. Like any other aspect, however, this can be personalised. Some people prefer a horse drawn carriage, whilst others might opt for a mode of transport linked to the deceased, up to and including vans, truck and motorbikes. </p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>


<div class="padding-left">
    <p>Arranging a funeral means thinking about the life of the person you’ve just lost and how you’d like to mark it. It’s often a therapeutic process, marking the first step towards healing the pain of bereavement. If you’d like to discuss the process then please contact us by email at (Email) or call us on 0100 000 000. </p>
</div>
', N'Arranging', N'ARRANGING', N'banner-where-to-start11492.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4055, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Bereavement</h2>
    <div class="padding-left">
        <p>Coping with the death of a loved one is an inevitable part of life, but the knowledge that we’ll have to face bereavement one day doesn’t make coping with the reality any easier.  This is the case even if the death was expected, such as when someone has suffered a long illness. When death occurs suddenly and without warning then the shock merely adds to the sense of grief, and in all cases the feelings of loss are something which will impact upon those left behind for many years to come. </p>
        <p>Throughout Burialplots.co.uk you’ll find a wealth of practical advice dealing with what to do when someone close to you dies. The emotional impact of a death is often compounded by the sheer weight of practical issues which have to be dealt with, from registering the death to arranging a funeral and dealing with any outstanding financial or legal matters. Whilst our primary aim is to make finding and purchasing a burial plot much simpler than is currently the case, we’re also here to help with every other aspect of the process, and that begins with underlining the impact of bereavement.</p>
    </div>
    <br />
    <h2 class="underline">Individual Responses</h2>
    <div class="padding-left">
        <p>The first thing to understand about bereavement is that it will impact upon each individual in a different manner, and that there is no ‘right’ way of feeling when someone close to you dies. In the initial stages you may feel numb, as you struggle to process the scale of loss which is facing you. Many people are also surprised by the range of emotions which can sweep over them once the initial shock of losing someone begins to wear away. As well as grief, which might be expected, bereaved people often report feeling of anger, sometimes directed toward the person who has died for ‘leaving them’. This will then often be followed by guilt at feeling angry in this manner. Bereavement can also make those left behind feel anxious, apathetic and unable to eat or sleep properly.</p>
        <p>The precise make up of each individual response will depend upon a combination of the individual personality and the circumstances of the bereavement. The death of a younger person, in an accident for example, may well provoke more feelings of anger and unfairness than the passing of an ageing relative through natural causes. Similarly, a sudden and unexpected death of any kind is bound to leave those left behind regretting the fact that they didn’t have the chance to say goodbye or prepare themselves for loss. </p>
        <p>In all cases, the key to coping is to remember that there is no ‘right’ way of grieving, and that how you choose to respond is a natural reflection of how you’re feeling. Some people find it helps to immerse themselves in their ordinary daily routine, whilst others feel that the absence of the loved one who would normally have shared that routine makes even everyday tasks difficult to cope with, particularly for the first few times. </p>
    </div>
    <br />
    <h2 class="underline">Seeking Help</h2>
    <div class="padding-left">
        <p>Whilst sadness is natural, there is a chance that this could tip over into depression, particularly if you’ve had problems of this kind in the past. Don’t hesitate to seek the help of your GP if you’re worried that this is the case. Whilst you may feel duty bound to put on a ‘brave face’ around those closest to you – particularly if other family members are grieving with you – it can help to have someone you can share your feeling with honestly. This is where the many organisations which are set up to help bereaved people can be incredibly useful, being run by people who have been bereaved themselves or who have been trained to deal with bereavement. Talking to someone who understands something of what you’re going through can help you come to terms with the emotions you’re feeling, and we’ve provided a list of some of these organisations <a href="javascript:void();" target="_blank">here</a>.</p>
        
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

    <div class="padding-left">
        <p>It’s difficult to offer comfort to those who’ve been bereaved without lapsing into cliché, but in this case the clichés happen to be true; in time the pain will begin to lessen and, although the sense of loss will never leave you, it will, eventually, be accompanied by the ability to look back with fondness and pleasure on the life you shared with the person you loved.</p>
        <p>If you have any questions about bereavement or the funeral process then we’re sure you can find the answers on Burialplots.co.uk. If you’d like more tailored and personal advice then please don’t hesitate to contact us (Email) or by calling 0100 000 000. </p>  
      </div>
    </div>
', N'Bereavement', N'Bereavement', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4057, N'<h2 class="underline">Burial Plots Coffins</h2>
<div class="column-block">
    <div class="column">
        <p>Arranging the funeral of someone close to you is an emotional and practical ordeal. The emotional aspect is something which most people probably expect. Losing a loved one, even if their death follows a long illness, can come as a huge shock to the system. Everyone will respond in different ways, but feelings of grief, numbness, anger and sadness are bound to come to the fore and will make it difficult to start getting to grips with the practical issues involved in bereavement. </p>
        <p>In the days immediately following a death, dealing with bureaucratic and legal matters might be the last thing on your mind. There are some things which have to be done almost immediately, however, such as registering the death, and the truth is that many people find the wider challenge of arranging a funeral can be somewhat therapeutic. </p>
    </div>
    <div class="column">
        <img src="/images/video.jpg" alt="">
    </div>
</div>
<h2 class="underline">Planning</h2>
<div class="padding-left">
    <p>Choosing all of the details of the funeral can be a way of focusing your thoughts on the person you’ve just lost, whilst the funeral itself can act as a major milestone on the road to emerging from the shock of bereavement. The funeral you arrange is the last chance to say goodbye to the person you’ve lost, and the details will provide comfort in the years to come. While we make it easier to find an affordable burial plot in the UK, we also offer links and information to services such as coffins.</p>
    <p>Choosing a coffin for your loved one’s final resting place may seem like quite a simple choice, but the fact of the matter is that this is part of your chance to say goodbye to them, by selecting a coffin which you think they would like themselves, and which you’re happy to think of them resting in.</p>
</div>
<br />
<h2 class="underline">Choices</h2>
<div class="padding-left">
    <p>The initial choice to make when choosing a coffin is the appearance of the outside of the coffin. Most traditional coffins are wooden in appearance and the first thing to choose is the type of wood. Options such as oak, mahogany, teak and walnut offer different tones and shades of warmth, whilst the additions it is possible to include make it possible to personalise the coffin you’ve selected. These additions include handles, ranging from minimalist and modern to ornate antique versions, and panels, whether plain or embossed and carved with imagery. The coffin will also feature a nameplate, and it is possible to have other symbols attached to the outer casing. It’s also possible to have larger, heavier coffins constructed from steel, though it should be noted that these, and certain wooden coffins, may not be suitable for cremation.</p>
    
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<div class="padding-left">
    <p>Inside, the coffin will be lined, usually in white and with materials such as taffeta, lace and satin. Some interiors are quilted and include a small cushion, something which comes as particular comfort to people who opt to view the body of the deceased in the coffin before burial. You may also opt to place some objects inside the coffin to accompany the deceased. This is a completely personal choice, of course, but options include flowers, personal letters, photographs, medals or items of jewellery. Your funeral director or staff at a crematorium will be able to advise if any of the objects you’ve chosen will have to be removed prior to a cremation. </p>
    <p>Choosing the perfect coffin will help you to feel that you’re doing one final thing for the person you’ve lost, as well as helping to provide a focus amidst the difficult emotions of bereavement. If you have any questions about coffins, or any other aspect of arranging or pre-planning a funeral then please contact us. You can email at (Email) or phone us on 0100 000 0000. </p>
</div>', N'Coffins', N'Coffins', N'banner-about59989.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4058, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Dealing With Children</h2>
    <div class="padding-left">
        <p>As an adult, dealing with the pain of bereavement can be a difficult and confusing process. It’s hard to imagine, then, just how much more painful the loss of a close family member can be when viewed from the perspective of a child.</p>
        <p>As we grow up, we slowly come to terms with the concept of mortality and the fact that everyone is eventually going to die. A child faced with the death of a loved one will be facing up to this idea for the first time, and your role as an adult is to attempt to guide them through the emotions they feel and allow them to talk about the effect the death has had upon them.</p>
    </div>
    <br />
    <h2 class="underline">Telling a Child</h2>
    <div class="padding-left">
        <p>It’s important to tell a child about the death of someone close to them as soon as possible. It may be tempting to let them remain blissfully ignorant, but delaying the bad news runs the risk of them finding out by accident and in an unsympathetic manner. By sitting a child down and explaining calmly and patiently what has happened you’ll make this difficult moment as easily managed as it possibly can be. Try to avoid using euphemisms such as ‘gone to sleep’, as this might leave the child wondering when the person in question is going to wake up again, not to mention being worried about when they themselves go to sleep. </p>
    </div>
    <br />
    <h2 class="underline">Answering Questions</h2>
    <div class="padding-left">
        <p>As a general rule, if a child is mature enough to ask a question about the concept of bereavement and dying then they are mature enough to be given an honest answer. Try to keep your answers as brief and simple as possible, but always bear in mind that this event in the life of a child will have an impact which will last for the rest of their life. Some questions, such as why people have to die, are more difficult than others, of course, but a useful tip is to refer the child to the natural world around them and event such as the trees losing their leaves in winter. Your child may also ask what happens to people when they die. If you have a religious faith then you may both draw comfort from the concept of heaven and an afterlife, but if not you can point out that the dead person lives on in both of your hearts and minds, and in the memories you carry and the conversations you have.</p>
    </div>
    <br />
    <h2 class="underline">Talking about the Deceased</h2>
    <div class="padding-left">
        <p>Talking about the deceased and your child’s memories of them is a vital part of the grieving process. Some people leave a ‘Memory Box’ when they know they are dying, but if this isn’t this case you could always put together a box for your child, containing photographs and other keepsakes to prompt memories and conversation. Anything which makes the child feel connected to the person they’ve lost will help them to deal with their feelings. Explain that it’s perfectly natural to feel sad and to want to cry but that, in time, these feelings will pass.  If you’re finding it difficult to deal with the grieving process of a child close to you, don’t hesitate to get in touch with one of the specialist organisations set up to help with just such a situation. </p>
    </div>
    <br />
    <h2 class="underline">Going to the Funeral</h2>
    <div class="padding-left">
        <p>Deciding whether a child should attend a funeral is a difficult question and one which is dependent upon your own knowledge of the child in question. If a child is asking to go, and you feel they will be able to cope, then you should allow them. If they don’t attend their imaginations may run riot. Prepare them for the funeral by explaining exactly what will happen, and warning that they are going to see other adults they love and rely upon being upset. Make sure that the child has someone they are close to with them throughout the funeral, to explain what’s happening, answer any questions and offer comfort. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <div class="padding-left">
        <p>If you have any questions about the grieving process or about helping children to come to terms with bereavement, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
    </div>
</div>', N'Dealing With Loss of a Child', N'DEALING-WITH-LOSS-OF-A-CHILD', N'banner-about66176.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4059, N'<h2 class="underline">Burial Plots Florists</h2>
<div class="column-block">
    <div class="column">
        <p>When someone close to you dies the emotional impact can be so devastating that coping with the myriad of practical issues thrown up can seem impossible. Even if death wasn’t sudden, the shock and finality can be overwhelming, but the fact of the matter is that there are details which those who have been left behind have to attend to.</p>
        <p>The positive aspect of this situation is two-fold. In the first instance, having practical matters to focus on can sometimes help when you’re dealing with the first impact of bereavement. The legal matters such as dealing with probate or simply registering a death can’t be avoided, whilst planning the funeral can, for some people, feel therapeutic. </p>
    </div>
    <div class="column">
        <img src="/images/video.jpg" alt="">
    </div>
</div>
<div class="padding-left">
    <p>In the immediate aftermath of a loss it can be difficult to gather your thoughts and get a clear picture of how you’re coping. Pulling together the details of a funeral can provide the focus needed, as you try your best to arrange something which says goodbye in the way you want it to. </p>
</div>
<br />
<h2 class="underline">Planning</h2>
<div class="padding-left">
    <p>The second positive aspect of the situation is that a lot of help is available. In the first instance family and friends will probably rally round, but there are also agencies and bodies devoted to making bereavement easier to cope with. Burialplots.co.uk is one such port of call. As well as making it easier to find a burial plot in the UK, and providing plots at affordable prices, we bring together the wide range of information needed following bereavement in one easily accessible place. A part of this is providing links to services such as florists.</p>
</div>
<br />
<h2 class="underline">Choosing</h2>
<div class="padding-left">
    <p>Choosing the flowers for a funeral is just one more way of making a personal tribute as part of an event which is all about saying goodbye to someone you love. Whilst a bunch of flowers may seem like a simple thing, the truth of the matter is that a skilled florist can arrange and create a dazzling array of designs able to reflect the person you’re arranging the funeral for. Every arrangement, what’s more, will be utterly unique, dependent upon the flowers which are available at any given time of year, and of the size shape and colour of the individual flowers chosen. </p>
    <p><strong>Floral Sprays</strong> – a floral spray is an arrangement of flowers which can be laid flat upon the lid of the coffin. Sprays can range in size from under a metre to several feet long, and can be made up of whatever flowers you choose. The deceased may have had a favourite flower, or perhaps something as simple as a colour which they particularly liked. Popular choices include roses, lilies and carnations. Most sprays take the form of a simple flattened bouquet, but it is possible to order a spray in the shape of something like a cross. </p>
    <p><strong>Wreaths</strong> – wreaths and sympathy bouquets are smaller arrangements of flowers which can be carried by mourners and placed on or around the coffin. Posies and baskets are similar, and in all cases a selection of foliage and greenery can be used to create something which is genuinely and totally unique.</p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<div class="padding-left">
    <p><strong>Tributes</strong> – whilst the floral arrangements described above are similar to those which you may see elsewhere there are certain designs which are particularly suited to funerals. These include small cushions made of flowers, hearts or individual letters which can be used to spell out a name.   A skilled florist will be able to conjure up virtually anything you’d like to see, from a word such as Mum or Dad to an item such as a star, a butterfly or a basketball. The key is to create something which is natural, beautiful and fits with your memories of the person you’re saying goodbye to. </p>
    <p>Flowers may seem like only a small part of the funeral, but they’re a chance to create something which is genuinely unique and which, when you look back on it, will help you to think more fondly of a traumatic and difficult time. If you’ve got any questions about finding a florist, or any other aspect of arranging a funeral, please contact us via email at (Email) or by calling 0100 000 0000. </p>
 </div>', N'Florists', N'FLORISTS', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4060, N'


   
    <h2 class="underline">Burial Plots Funeral Directors</h2>
    <div class="padding-left">
        <p>The practicalities of arranging a funeral can often seem all but overwhelming in the immediate aftermath of a loved one’s death. From the legal issues of registering the death, to making sure that all the relevant people are informed and then dealing with the details of the funeral itself, the need to liaise with a number of differing agencies can be extremely difficult when all you want to think about is the person you’ve just lost.</p>
        <p>Burialplots.co.uk was created, at least in part, to make this process simpler. In the first instance we make it much easier to find and purchase a burial plot, whether you need a plot straight away or are planning for the future. The supply of burial plots in the UK is lower than it’s ever been, and we make it easy to find one that’s located exactly where you need it, while our prices are competitive and our payment plan options offer more flexibility. On top of this we’ve pulled together all of the information you’ll need when planning a funeral, from choosing flowers to writing a eulogy and dealing with legal matters. We understand that bereavement can feel like a very lonely place, and we provide a point of contact that’s accessible and comprehensive. From the contact details of organisations which will help you cope with your loss, to information about funeral directors, we provide everything needed to make bereavement at least a little bit easier. </p>
    </div>
    <br />
    <h2 class="underline">Funeral Directors</h2>
    <div class="padding-left">
        <p>A funeral director is the first port of call for most people arranging a funeral. Whilst it’s possible to make the arrangements yourself, and the details on this site will put you in touch with all of the relevant agencies, many people find it comforting to fall back upon the experience of someone who deals with these arrangements for a living.</p>
        <p>For your own sense of well-being it’s important to choose a funeral director who is a member of one of the following bodies:</p>
        <ul>
            <li>National Association of Funeral Directors</li>
            <li>National Federation of Funeral Directors</li>
            <li>Society of Allied and Independent Funeral Directors</li>
        </ul>
        <p>This means that they will adhere to very strict codes of practice. Arranging a funeral can be very expensive, and the emotions involved may leave you vulnerable to exploitation. A funeral director who is a member of one of these bodies, for example, will have to provide you with a price list when asked, and you can be certain they will always behave with the utmost tact and sensitivity. The exact role a funeral director will fill varies from case to case, as part of the remit is to respond to the unique needs of each individual client. Amongst the duties which they will generally undertake will be the following:</p>
        <ul>
            <li>Moving the deceased to the funeral home from the hospital, or helping to make arrangements if you wish them to stay at home before the funeral</li>
            <li>Making it possible for family members and others to view the deceased before burial if desired</li>
            <li>Placing announcements in local or national newspapers or any online equivalent needed</li>
            <li>Dealing with paperwork</li>
            <li>Helping you to choose a suitable coffin</li>
            <li>Helping to arrange the details of the funeral such as musical requests, printing an order of service, ordering flowers and looking after any flowers that are delivered directly to the funeral home</li>
            <li>Organising any collection of charity donations in place of flowers </li>
            <li>Helping to arrange the venue and catering for any gathering taking place after the funeral</li>
        </ul>
    </div>
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <br />
    <div class="padding-left">
        <p>No matter how grateful you may be for the help a funeral director offers, always remember that they are charging for their services and, difficult though it may be, you have to treat your dealings as a financial transaction. As for quotes throughout and, if need be, get quotes from more than one company. As long as all of the companies are members of the associations previously mentioned, you’ll be guaranteed certain minimum standards, and you shouldn’t let the fact that you’d like to deal with these issues as quickly as possible allow you to be taken advantage of. If you’d like to know more about arranging a funeral, or what you should expect from a funeral director, please contact us at (Email) or call our team on 0100 000 000.</p>
        <p>When choosing a funeral director:</p>
        <ul>
            <li>Ask for a detailed description of costs when getting a quote</li>
            <li>When asking for a telephone quote make sure that it is also put in writing</li>
            <li>Be sure to get quotes from more than one company and find out if he/she is a member of any of the trade associations</li>
            <li>If you are at the Funeral Directors premises, do not be afraid to leave to consider your options</li>
            <li>Remember that just because a firm has been there for many years it does not mean that it is still Family owned. If this is important to you ask who is the owner - even ask to meet him or her! A Family owned firm will reflect its owner</li>
            <li>Funeral Directors are amongst the most open professionals. They are usually entrenched in the local community. You can talk openly about the funeral arrangements you want to make.</li>
        </ul>
    </div>

', N'Funeral Directors', N'FUNERAL-DIRECTORS', N'banner-about18552.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4061, N'<div class="container">
    <h2 class="underline">Burial Plots Funeral Plans</h2>
    <div class="padding-left">
        <p>Arranging a funeral in advance is something which many people have traditionally been hesitant to think about. The reasons are obvious; like writing a will or purchasing life insurance, buying a funeral plan is an acceptance of the fact that you’re one day going to be leaving your loved ones behind. Just like writing a will, however, purchasing a funeral plan is one way of making sure that the pain of your loss will be lessened to a degree. Coping with the death of a loved one is a complex mix of emotional responses and practical matters. By planning in advance as much as possible, you’ll be able to relieve your loved ones of the duty of dealing with those practical matters, leaving them free to concentrate on mourning your passing and celebrating your life. The fact that a plan will also ensure that your family isn’t impacted by a number of expensive bills in the wake of your passing will also offer great peace of mind. </p>
        <p>Here at Burialplots.co.uk we’ve created a site which makes pre planning a funeral easier than it’s ever been. By pulling together all of the help, information and services you’ll need when making your arrangements, we’ve created an accessible and useful one stop portal. Rather than having to cope with a range of different agencies and businesses, you’ll be able to find all of the information you need right here, from purchasing a burial plot in the location of your choice to accessing a range of funeral plans.</p>
    </div>
    <br />
    <h2 class="underline">What is a Funeral Plan?</h2>
    <div class="padding-left">
        <p>In simple terms a funeral plan is a financial arrangement which allows you to decide upon the arrangements for your funeral in advance and put aside the money to pay for those arrangements. The key to the security offered by a funeral plan is that it will keep the money you pay into it securely ring-fenced, and will, when the time comes, use that money to carry out your wishes precisely. The cost of funerals has risen by more than the rate of inflation in recent years and seems set to continue doing so in the future. By investing in a funeral plan, you ensure that no matter how much prices rise, the funds to carry out your wishes will be available. </p>
    </div>
    <br />
    <h2 class="underline">How Will I Pay?</h2>
    <div class="padding-left">
        <p>Most funeral plans offer flexible options when it comes to payment. If you wish, you can pay for the plan in full up front, or else pay a deposit and then make monthly payments over a period of years, usually running from one year to ten. Having set up a simple standing order you can relax in the knowledge that the costs of your funeral will all be taken care of. If you should pass away before a payment plan is complete, many providers offer the service paid for if your relatives cover the remaining balance.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Types of Plan </h2>
    <div class="padding-left">
        <p>Most providers of funeral plans offer a range of plans at various prices. Each plan will feature differing options and services depending upon the price. Even the most basic plan, for example, will include the fees for the Funeral Director’s services, whilst aspects such as the number of limousines provided for the funeral, the type of coffin, and whether floral tributes are included will vary from plan to plan. You can also include as much detail as you wish in terms of personal wishes, selecting aspects such as which flowers you’d like, where you want the service to be held and the music and readings you’d like to include. By adding these details you spare your family the stress of worrying if they’ve made all of the right choices, and many plans allow you to amend the details as the years go by.</p>
        <p>A funeral plan differs from either life insurance or a savings account in two ways; it guarantees to cover the cost of the funeral you’ve chosen, paid for at current prices, no matter how much those prices rise in the future. It also allows you to save your loved ones the stress and upset of having to worry about making arrangements. When you do pass away, all they will need to do is make one simple phone call to the funeral plan provider. If you’re interested in purchasing a funeral plan, or have any further questions, don’t hesitate to contact us. You can email us at (Email) or call us on 0100 000 0000.</p>
    </div>


</div>', N'Funeral Plans', N'FUNERAL-PLANS', N'banner-about67235.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4062, N'
<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Funerals</h2>
    <div class="padding-left">
        <p>The funeral you choose following the death of a loved one will be your chance to mark their passing and celebrate their life. Although there are many different aspects involved in arranging a funeral, a lot of people find that the process itself is somewhat therapeutic, offering a degree of ‘closure’ and giving them something to focus their emotions upon in the immediate aftermath of the death.</p>
        <p>Here at Burialplots.co.uk we offer access to the widest possible range of advice and help for people coping with the issue of bereavement. This includes emotional support, practical matters and an affordable, accessible supply of burial plots across the UK. In some cases the deceased may have undertaken a degree of pre-planning where their funeral was concerned, with the aim of sparing their loved ones at least some of the stress and expense involved. Reticence around facing up to matters of mortality mean that this often isn’t the case, however, and the funeral in question has to be arranged from scratch. No matter what the particular circumstances are, there are certain basic steps which generally take place following the death of a person, and after that death has been registered. </p>
    </div>
    <br />
    <h2 class="underline">A Funeral Director</h2>
    <div class="padding-left">
        <p>In most cases, the first step in arranging a funeral will be finding a funeral director. Some people may opt for arranging the funeral themselves, due to a wish to be more personally involved, or to save on the costs of the funeral. No matter which course of action you take, the actual details of the funeral service will be entirely in your hands. It should be remembered that this is your chance to mark the loss of a loved one but also to celebrate what they meant to you and to others. This might mean, for example, selecting music which meant a lot to them to be played during the funeral service, or choosing readings of poems or other literature which you know they loved. Don’t feel restricted in your options by a sense of what’s ‘expected’ at a funeral. Different cultures, for example, mark the passing of a loved one in ways which might strike those of us who live in the developed west as being somewhat bizarre; from New Orleans Jazz Funerals to Tibetan ‘sky burial’ and the South Korean option of turning the deceased remains into shiny, colourful beads rather than ashes. In Ghana, meanwhile, people are often buried in so called ‘fantasy coffins’ which are designed and built to represent something which was important in the life of the deceased.  The results resemble parade floats more than traditional coffins, and notable examples include a Mercedes Benz, a light aircraft and a giant chicken.</p>
        <p>Whilst the details of the funeral and of the service itself are open to interpretation, there is a set pattern which funerals in the UK generally follow. In most cases the procession will start from the home of the deceased, with the coffin on one car and mourners in another travelling at slow speed to the place where the service is to be held. This is often a religious building such as a church or chapel. The coffin will be placed at the front of the room with the nearest relatives sitting closest to the front. In the case of a burial, the coffin will be taken to the grave after the initial service and a shorter service will then take place as it is lowered into the ground. The order and content of the service is something which the friends and family of the deceased charged with arranging the funeral will decide between themselves. After the funeral, mourners often gather to share refreshments, sometimes at the home of the deceased, sometimes at a location such as function room in a local hotel or pub. In many cases this is the point at which people feel better able to share their memories of the person who has died, and to begin the process of looking back at their life with joy as well as sadness.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <div class="padding-left">
        <p>In other parts of this site we’ll look at the options which are available in terms of aspects of a funeral such as flowers, memorials, music and transport. Whilst we specialise in providing access to affordable burial plots, we also advise on all other aspects of a funeral. If you’ve got any questions, please contact us via email at (Email), or by calling 0100 000 000.</p>
        </div>
    </div>', N'Funerals', N'FUNERALS', N'banner-about4181.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4063, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Healing Process</h2>
    <div class="padding-left">
        <p>The first thing to say about the healing process which takes place when you lose someone close to you is that there is no such thing as a ‘right’ or ‘wrong’ way to feel. The death of someone you love is probably the most difficult, stressful and upsetting thing you’ll ever have to deal with. In the immediate aftermath it is likely that you’ll be swamped by a devastating range of emotions, running from shock and numbness to utter despair, and it can feel as if these feelings are simply overwhelming.</p>
        <p>The positive news is that the intensity of your grief will pass in time. As painful as it might be, death is a natural part of life and the acceptance of loss of something which is hard-wired into human psychology. ‘Getting over’ a loss sounds glib, of course, and doesn’t imply that there will ever come a time when you stop missing the person you’ve lost or forget about them. Someone you love is never going to leave your heart and mind completely, but what the healing process implies is that there will come a time when you can remember them with something other than pain and sadness. It may seem impossible in the immediate aftermath of a death, but you will eventually be able to look back on the life you shared with the deceased and experience joy and happiness at the memories, as well as pain at the loss. It won’t be an entirely smooth process, and there will be periods when you feel as if you are beginning to emerge from the worse of your grief only for something to set you back again, but a degree of coming to terms with your loss will take place. </p>
    </div>
    <br />
    <h2 class="underline">Initial Stages</h2>
    <div class="padding-left">
        <p>Although every case is different, just as every person is different, grief can be broken down into stages which you’ll pass through. The initial reaction is a sense of numbness and disbelief – no matter how much we may know, on an intellectual level, that everyone close to us is one day going to die, the shock of it actually happening is massive. The balance between numbness and sheer disbelief may be effected by how unexpected the death in question was. In all cases, you are likely to spend the period immediately after a death feeling as if you are in something of a daze.  You may find it hard to concentrate on everyday tasks and will often be overwhelmed by waves of sadness so intense that the only thing you feel able to do is sit down and cry.</p>
        <p>As well as the expected feelings of grief and pain, people who have lost a loved also often report feeling angry, sometimes with the person who has left them, sometimes with fate and life in general and sometimes with whatever they blame for the death. The sheer power of the emotions you’re feeling can also lead to physical symptoms. As well as exhaustion you may feel dizzy, short of breath or even hyperactive, as if stopping and staying still will allow the grief to overwhelm you. You may experience difficulty sleeping’ leading to a painful cycle in which you’re even more exhausted the next day.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Moving On</h2>
    <div class="padding-left">
        <p>After accepting that the loss is real and experiencing the pain of grief, you’ll move through a phase of slowly coming to terms with your loss. It is during this period that it’s very important to talk about your feelings rather than trying to put a brave face on things. If you’re lucky you’ll have friends and family to talk to, but this isn’t always the case. There’s also a possibility that you’ll feel uncomfortable being completely honest with those close to you, as they’re probably also dealing with grief themselves.  This is when it can be extremely helpful to talk to one of the many organisations that have been set up especially to help people deal with bereavement. We’ve provided a list of some of these organisations <a href="helpful-Orgs.html">here</a>, and it’s likely that you’ll be able to find one which deals with your specific situation. </p>
        <p>With time, the initial extremes of pain will begin to subside, but there is no set period over which this should happen. Certain times of the year, such as Christmas, birthdays and wedding anniversaries, may feel particularly difficult to cope with. For some people, dealing with days such as these might involve taking a day off work and retreating to spend time with their thoughts, whilst others might opt to do something celebratory in nature, or perhaps try to act as if it’s just another day. The key is to do whatever you feel comfortable with. </p>
        <p>If you feel that you’re not moving on from the initial feelings of grief, or that you’re becoming overly reliant on props such as alcohol or medication, do not be afraid to speak to your GP or a counsellor. It’s possible for the natural sadness of grief to tip over into mental health problems, and if you or your family feel that your life is still being negatively impacted after you might have expected to begin moving on, you should seek some of the help available.  </p>
        <p>If you have any questions about the grieving process or about coming to terms with bereavement, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
    </div>

</div>


', N'Healing Process', N'HEALING-PROCESS', N'banner-about10245.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4064, N'
<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Helpful Advice</h2>
    <div class="padding-left">
        <p>Dealing with the death of someone close to you is perhaps the most difficult challenge that life can throw at you. Even if the person in question is older, and has been ill for a while, the finality of them actually leaving is bound to have a huge impact. We created Burialplots.co.uk in an effort to make coping with that impact just a little bit easier. </p>
        <p>There are two ways in which the death of a loved one can hit home. The first of these is the emotional effect, and the fact that grief can feel completely overwhelming. There is no ‘right’ or ‘wrong’ way of dealing with bereavement, and the precise mix of sadness, anger and shock will differ from person to person. The second major impact is perhaps more mundane but no less disruptive, at least in the short term. This is the sheer degree of practical, legal and bureaucratic effort which is involved in dealing with the death of someone close to you.</p>
    </div>
    <br />
    <h2 class="underline">Forward Planning</h2>
    <div class="padding-left">
        <p>Across this site we offer help and advice on dealing with every aspect of this process. The more a person chooses to pre-plan their funeral, the less their loved ones will have to do when they die, and Burialplots.co.uk simplifies that planning process to a huge degree. From finding and buying a plot to arranging flowers and cars, we’ve brought all aspects of funeral planning together in one place, a service which is equally applicable to pre-planning and immediate need. </p>
        <p>We’ve also included a wealth of advice on how to begin coping with the emotional impact of a death. Each case is different, and it could be that the death of someone close to you has left you needing to explain what’s happened to young children, or dealing with the extra shock of an unexpected death. As well as offering generalised tips on the grieving process and coming to terms with loss, we offer help to those facing the additional challenge of dealing with sudden death, suicide and the loss of a child. </p>
    </div>
    <br />
    <h2 class="underline">Other Help</h2>
    <div class="padding-left">
        <p>The good news is that nobody has to feel entirely alone when dealing with the loss of someone close to them. In the immediate aftermath of a death, it is likely that you’ll find friends and family rallying round to comfort you. Even if this is not the case, or if you find that people need to get on with their own lives in the long weeks and months following the funeral, help is out there. Organisations across the UK deal with bereavement in general and with specific types of loss in particular. Most of these organisations are run by people who have been through what you’re experiencing, or have the training needed to deal with a bereaved person. In either case, they will offer the chance to share feelings and emotions which you may feel uncomfortable airing in the company of people you know. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

    <div class="padding-left">
        <p>If you have any questions about the grieving process or about the various aspects involved in planning a funeral, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
        </div>
    </div>', N'Helpful Advice', N'HELPFUL-ADVICE', N'banner-about55249.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4065, N'     <div class="container">
                    <h2 class="underline">Burial Plots</h2>
                    <div class="padding-left">
                      <p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p>
                      <p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p>
                      <p>Working independantly, we are able to offer an unbiased opinion on all of the cemetries and the ancillary bereavement services that we have researched to bring to you an information led approach to the right choices.</p>
                    </div>
                    
                
                </div>', N'Helpful Organizations', N'HELPFUL-ORGANISATIONS', N'banner-about63013.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4066, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots helpful Orgs</h2>
    <div class="padding-left">
        <p>Below is a list of just a few of the organisations that may prove helpful when dealing with bereavement or arranging a funeral. The help offered by these bodies’ ranges from practical legal and financial advice to someone to talk to about your feelings of loss and grief.</p>
    </div>
    <br />
    <h2 class="underline">Bereavement Support</h2>
    <div class="padding-left">
        <p>
            <strong>Cruse Bereavement Care</strong> <br />
            <strong>Tel:</strong> <a href="tel:0808 808 1677">0808 808 1677</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.cruse.org.uk" target="_blank">www.cruse.org.uk</a> &nbsp;&nbsp;
            <strong>Address:</strong> Cruse Bereavement Care, PO Box 800,Richmond, Surrey, TW9 1RG
        </p>
        <p>
            <strong>The Samaritans</strong> <br />
            <strong>Tel:</strong> <a href="tel:116 123">116 123</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.samaritans.org" target="_blank">www.samaritans.org</a>
        </p>
        <p>
            <strong>Citizens Advice</strong> <br />
            Practical advice on the legal and financial aspects of bereavement. Find your local office at <a href="www.citizensadvice.org.uk" target="_blank">www.citizensadvice.org.uk</a>
        </p>
        <p>
            <strong>Age Concern England</strong> <br />
            <strong>Address:</strong> Astral House, 1268 London Road,London ,SW16 4ER. &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:020 8765 7200">020 8765 7200</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.ageconcern.org.uk" target="_blank">www.ageconcern.org.uk</a>
        </p>
        <p>
            <strong>The Natural Death Centre</strong> <br />
            <strong>Address:</strong> 6 Blackstock Mews, Blackstock Road, London N4 2BT &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:020 7359 8391">020 7359 8391</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.naturaldeath.org.uk" target="_blank">www.naturaldeath.org.uk</a>
        </p>
        <p>
            <strong>Bereavement Advice Centre</strong> <br />
            <strong>Address:</strong> Simplify,Heron House,Timothy''s Bridge Road,Stratford Upon Avon,CV37 9BX. &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:0800 634 9494">0800 634 9494</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.bereavementadvice.org" target="_blank">www.bereavementadvice.org</a>
        </p>
        <p>
            <strong>Government Advice:</strong> <br />
            <a href="www.gov.uk/browse/births-deaths-marriages/death" target="_blank">www.gov.uk/browse/births-deaths-marriages/death</a>
        </p>
        <h3>The Death of a Child</h3>
        <p>
            <strong>The Compassionate Friends</strong> <br />
            <strong>Address:</strong> The Compassionate Friends, 14 New King Street, Deptford, London SE8 3HS. &nbsp;&nbsp;
            <strong>Helpline:</strong> <a href="tel:0345 123 2304">0345 123 2304</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.tcf.org.uk" target="_blank">www.tcf.org.uk</a>
        </p>
        <p>
            <strong>The Child Death Helpline</strong> <br />
            <strong>Helpline:</strong> <a href="tel:0800 282 986">0800 282 986</a> / <a href="tel:0800 282 986">0800 282 986</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.childdeathhelpline.org.uk" target="_blank">www.childdeathhelpline.org.uk</a> <br />
            <strong>Phone lines open:</strong> Monday to Friday 10am to 1pm &nbsp;&nbsp; Tuesdays 1pm to 4pm &nbsp;&nbsp; Wednesdays 1pm to 4pm &nbsp;&nbsp; Every evening 7pm to 10pm
        </p>
        <p>
            <strong>The Foundation for the Study of Infant Deaths (FSID)</strong> <br />
            Support for parents whose children have died through cot death <br />
            <strong>Address:</strong> FSID, 11 Belgrave Road, London SW1V 1RB &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:0808 802 6868">0808 802 6868</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.fsid.org.uk" target="_blank">www.fsid.org.uk</a>
        </p>
        <p>
            <strong>Child Bereavement UK</strong> <br />
            Support for parents whose children have died through cot death <br />
            <strong>Address:</strong> Clare Charity Centre, Wycombe Road, Saunderton, Buckinghamshire HP14 4BF &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:01494 568 900">01494 568 900</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.childbereavementuk.org" target="_blank">www.childbereavementuk.org</a>
        </p>
        <h3>Suicide</h3>
        <p>
            <strong>Mind</strong> <br />
            Support for parents whose children have died through cot death <br />
            <strong>Address:</strong> 15-19 Broadway, Stratford, London E15 4BQ &nbsp;&nbsp;
            <strong>Tel:</strong> <a href="tel:020 8519 2122">020 8519 2122</a> &nbsp;&nbsp;
            <strong>Website:</strong> <a href="www.mind.org.uk" target="_blank">www.mind.org.uk</a>
        </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

        <div class="padding-left">
            <p>
                <strong>Rethink</strong> <br />
                Support for parents whose children have died through cot death <br />
                <strong>Address:</strong> 15th Floor, 89 Albert Embankment,London, SE1 7TP &nbsp;&nbsp;
                <strong>Tel:</strong> <a href="tel:0300 5000 927">0300 5000 927</a> &nbsp;&nbsp;
                <strong>Website:</strong> <a href="www.rethink.org" target="_blank">www.rethink.org</a>
            </p>

        </div>
    
</div>', N'Helpful Orgs', N'HELPFUL-ORGS', N'banner-about60921.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4067, N'  <div class="container">
                    <h2 class="underline">Burial Plots</h2>
                    <div class="padding-left">
                      <p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p>
                      <p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p>
                      <p>Working independantly, we are able to offer an unbiased opinion on all of the cemetries and the ancillary bereavement services that we have researched to bring to you an information led approach to the right choices.</p>
                    </div>
                    
               
                </div>', N'How to Comfort Children', N'HOW-TO-COMFORT-CHILDREN', N'banner-about31204.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4068, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Legal</h2>
    <div class="padding-left">
        <p>When someone close to you dies the impact is often felt twice over. Initially, of course, you’ll be dealing with the emotional response to losing a loved one. Even if the death comes at the end of a long illness the finality when it actually takes place can come as a shock. If the death was unexpected, of course, then this shock is compounded by the element of surprise. There’s no right or wrong way to feel when dealing with bereavement, and coming to terms with the loss, to whatever degree is possible, could take many years.</p>
        <p>The second impact comes in the form of the many practical issues which have to be dealt with. Here at Burialplots.co.uk we try to make dealing with these issues simpler than it’s ever been. By bringing the widest possible range of advice, services and help together on the one site, we aim to make funeral planning – whether immediate or in the future – less stressful than it so often is. A large part of our service involves making arrangements for the funeral itself, and in particular the provision of  available and affordable burial plots, but we’re equally committed to offering help and advice on the other issues surrounding a death, many of which are matters of a legal nature. </p>
    </div>
    <br />
    <h2 class="underline">Registering a Death</h2>
    <div class="padding-left">
        <p>The first legal obligation when a person dies is to register the death. We’ve provided details <a href="where-to-start.html">here</a> of how to go about doing this, and what documentation will be needed, and we also explain the Tell Us Once service <a href="after-funeral.html">here</a> The Tell Us Once service is available in certain parts of the country and makes it possible to contact many of the official bodies who need to be informed of a death with just a single notification. If you are unable to utilise the Tell Us Once service then the bodies which you’ll have to notify individually include the following: </p>
        <ul>
            <li>HM Revenue and Customs (HMRC)</li>
            <li>Department for Work and pensions (DWP)</li>
            <li>The Passport Office</li>
            <li>The Driver and Vehicle Licensing Agency (DVLA)</li>
            <li>The local council </li>
            <li>Any public sector or armed forces pension schemes</li>
        </ul>
    </div>
    <br />
    <h2 class="underline">Managing the Estate</h2>
    <div class="padding-left">
        <p>Other Legal Issues revolve around the estate of the person who dies, which means anything such as property, money or possessions which they might have left behind. If the deceased has left a will, then this will explain exactly what should happen to their estate in the event of their death. The will also names the ‘executors’, which is the term for whoever is responsible for dealing with the various issues of the estate. The legal right to deal with an estate is known as ‘probate’ and the executor named will have to apply to the local Probate Registry. If the deceased didn’t leave a will then the situation becomes slightly more complex, which is just one very good reason why writing a will is so important. If there is no will, then the next of kin can apply for a ‘grant of representation’, again at the Probate Registry. This will make them the administrator of the estate, and give them the right to access the bank accounts of the deceased as well as dealing with the rest of their estate. </p>
        <p>If someone does die without leaving a will, then the first £250,000 of their assets (including property) is currently automatically given to their spouse or civil partner, as well as all of their personal possessions of any value. The rest of the estate will be shared out, with 50% going to the spouse or civil partner and 50% being divided between any surviving children. </p>
        <p>Dealing with an estate, particularly one which includes complex matters such as multiple properties, stocks, shares and pension rights, is a difficult and complicated process and taking at least a small amount of legal advice is recommended. Although the specifics will vary hugely from case to case, the steps which have to be taken when dealing with the estate include the following:</p>
        <ul>
            <li>Bring together all of the assets of the estate, including the money raised by the sale of any property</li>
            <li>Pay any Inheritance Tax due on the estate – Inheritance Tax currently accounts for 40% of anything over £325,000. If the estate is left to a spouse, civil partner or charity, then Inheritance Tax does not apply. </li>
            <li>Pay any outstanding debts, such as utility bills</li>
            <li>Distribute what is left of the estate amongst the beneficiaries.</li>
        </ul>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <div class="padding-left">
        <p>Although our website contains a wealth of information on legal matters surrounding bereavement you may still have questions you’d like to ask. If this is the case, then please get in touch with us at (Email) or by calling 0100 000 0000.</p>
        </div>
    </div>
', N'Legal', N'LEGAL', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4069, N'
<div class="container">
    <h2 class="underline">Burial Plots Life Insurance</h2>
    <div class="column-block">
        <div class="column">
            <p>When people go to the time and trouble of planning a funeral in advance or writing a will they generally do so because they’re thinking of how their nearest and dearest will cope in the event of their death. Although the emotional impact of bereavement is all but impossible to avoid, the practical and financial issues can be alleviated with sufficient forethought. </p>
            <p>Planning of this kind is what Burialplots.co.uk is all about. By pulling the usually fragmented funeral market into one easily accessed portal, and making it possible to find advice and services other than via a funeral director, we intend to make forward planning a much simpler process. Beginning with purchasing a burial plot but including everything else from flowers to advice on will writing, the site allows people to enjoy the peace of mind of knowing that the stress on their loved ones will be lessened.</p>
        </div>
        <div class="column">
            <img src="/images/video.jpg" alt="">
        </div>
    </div>
    <div class="padding-left">
        <p>Any worries you might have about your family’s well-being after your death will be greatly alleviated if you take out a life insurance policy. The policy will offer financial protection for your family when you die. The amount of any pay-out and the type of policy taken will vary depending upon exactly what you want the insurance to cover. You may want insurance which covers a mortgage for example, provides for your children as they grow up, leaves an inheritance for other relatives and perhaps covers the cost of a funeral.</p>
    </div>
    <br />
    <h2 class="underline">Calculating Your Insurance</h2>
    <div class="padding-left">
        <p>Choosing the right life insurance policy will depend upon factors such as the premiums which you wish to pay and the amount of cover you’re seeking. If you want a policy which will cover your mortgage then calculating the amount needed should be fairly simple. If the intention is to provide a regular income for your family after you die, then it will be worthwhile sitting down and calculating existing outgoings in order to come up with a realistic figure for the future. If you’re aged 50 or over and want to take out life insurance to cover funeral costs and leave an inheritance, then the main factor in choosing a policy will be the amount you wish to pay in premiums.</p>
    </div>
    <br />
    <h2 class="underline">Different Types of Cover </h2>
    <div class="padding-left">
        <p><strong>Whole of life cover</strong> – this type of policy pays out to your dependants no matter when you die, and is the most expensive type of life insurance. </p>
        <p><strong>Term Life Insurance</strong> – this type of policy pays out if you die within a set time period. You may want a policy to cover the costs of a mortgage, for example, or the time when your children are likely to still be in education or living at home. The premiums for this type of policy will be lower than for whole life cover.</p>
        <p>It should be noted that a term life insurance policy won’t pay out anything if you happen to die after the term of the policy. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <div class="padding-left">
        <p>As well as the type of cover you’re seeking, other factors which might impact upon the premiums you have to pay include your age, health, lifestyle and family medical history, as well as things such as dangerous occupations and hobbies.</p>
        <p>If you’ve got any questions about the different types of life insurance available, or would like advice on options such as setting up a life insurance policy in trust in order to reduce inheritance tax, then contact us at (Email) or by calling 0100 000 0000.</p>
        </div>
    </div>', N'Life Insurance', N'LIFE-INSURANCE', N'banner-about38184.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4070, N'
   
    <h2 class="underline">Burial Plots Memorials </h2>
    <div class="padding-left">
        <p>Whilst every individual will deal with the loss of a loved one in their own personal manner, one thing which many people find comforting is the presence of a lasting memorial to the deceased. The most common form of memorial is probably a headstone at the grave itself, but, circumstances allowing, it can take whatever form you wish it to take. The key to choosing a memorial is selecting something which you’ll be able to visit when you wish to feel closer to the person you’ve lost. Although the deceased is probably in your mind much of the time, the memorial will offer a sanctuary from day to day life and a specific focus for your thoughts, feelings and memories. </p>
        <p>Burialplots.co.uk was created in order to alleviate the problems which people are encountering more and more often when attempting to purchase a burial plot. Whether the plot in question is required for a loved one who has just passed away, or is being purchased as part of the pre-planning for a funeral, the fact of the matter is that demand is far out-stripping supply in many parts of the country. We’ve applied the latest technology to making it easier to find a burial plot in the location of your choice, and a selection of payment options which offer flexibility and affordability. We’ve also brought together the wide range of help and information needed when some passes away and that includes the range of memorials available. </p>
    </div>
    <br />
    <h2 class="underline">Headstone</h2>
    <div class="padding-left">
        <p>If you opt to choose a traditional headstone as a memorial for the deceased you should find out what regulations the cemetery in question has in place.  There are likely to be rules regarding aspects such as the size and shape of the stone as well as its’ colour and the type of wording allowed.  Please bear in mind, also, that you may have to wait some time after the burial before the stone can be safely put in place. </p>
    </div>
    <br />
    <h2 class="underline">Alternatives</h2>
    <div class="padding-left">
        <p>If a headstone isn’t a viable option, or you personally feel that it wouldn’t be appropriate, there is a range of other options which are often available. Many people opt for a simple plaque in a garden of remembrance, or perhaps a plaque on a bench or seat within the garden. Another alternative is to plant a tree or other plant as a living memorial. The options offered by different cemeteries or places of worship will vary and it may be that you opt to have a memorial placed elsewhere. You might choose to remember your loved one by having a memorial such as a plaque, sundial, birdbath or bench put in a place which you know was special to them, and which you can visit when you wish to feel close to them again. Another possibility is to donate in their name to a community building project or organisation which relies upon charitable donations. In many cases, the building in question will mark the gift with an inscribed brick, tile or plaque. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Online Memorials</h2>
    <div class="padding-left">
        <p>As technology advances, more and more people are taking advantage of the fact that it is now possible to create an online memorial. Dedicated memorial websites will allow you to create a home page featuring a picture of the person in question and the words you choose to write about them. The advantage of such a site is that other people can also visit and add their own tributes and memories over time. Different sites offer various options in terms of being able to upload items such as video clips and music and some also have security options allowing you to control and limit availability. For reassurance on the long term viability of your online memorial ask if the site in question has signed up to the voluntary code of conduct known as The Memorial Code.</p>
        <p>Whatever type of memorial you choose to create in memory of your loved one, you should take your time making the choice and should always feel that you have complete control over the end result. If you’d like to know more about the options on offer then please contact us via email at (Email) or by calling 0100 000 0000.</p>
    </div>
', N'Memorials', N'MEMORIALS', N'banner-about31519.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4071, N' <div class="container">
                    <h2 class="underline">Burial Plots Press and News</h2>
                    <div class="padding-left">
                      <p>Below you’ll find just a few of the examples of the impact which Burialplots.co.uk has been making in the media. We look upon ending the taboo surrounding death and funerals, and starting the conversation about bereavement, as being part of our remit: </p>
                    </div>
                    <br />
                    <ul id="myList">
                      <li>
                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-1.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-2.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-3.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-4.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-5.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-6.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-7.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-8.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-9.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-10.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->
                      </li>
                      <li>
                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-1.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-2.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-3.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-4.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-5.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-6.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-7.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-8.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-9.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-10.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->
                      </li>
                      <li>
                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-1.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-2.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-3.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-4.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-5.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-6.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-7.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-8.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->

                        <div class="blocks">
                            <div class="block-article column-50">
                                <div class="image-block">
                                    <a href="javascript:void(0)">
                                      <p class="blog-title">Blog Title Here</p>
                                      <img src="images/article-50-3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="round-block"></div>
                                <p class="author-name">Joe Bloggs</p>
                                <p>“Aliquam quis pulvinar purus. Etiam cursus ipsum quis enim faucibus, quis posuere orci ornare. Duis mattis sagittis fringilla.” <a href="#">...read more</a></p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-9.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                            <div class="block-article">
                                <div class="image-block">
                                    <a href="javascript:void(0)"><img src="images/article-10.jpg" alt=""></a>
                                </div>
                                <h4>Blog title goes here. Page 1 </h4>
                                <p class="sub-title">Joe Bloggs</p>
                            </div><!-- block -->
                        </div><!-- blocks -->
                      </li>



                    </ul>
                    <div id="loadMore" class="load-btn">Load more</div>
                    <div id="showLess" class="load-less-btn">Show less</div>

                </div>', N'Press And News', N'PRESS-AND-NEWS', N'banner-14798.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4072, N'<h2 class="ql-align-center">BURIAL PLOTS NEWSFEED</h2>
<p class="ql-align-center">Keep up to date with latest developments in the field of funeral planning using the Burialplots.co.uk newsfeed.</p><p><br></p>', N'Newsfeed', N'NEWSFEED', N'banner-about8208.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4073, N'  <div class="container">
                    <h2 class="underline">Burial Plots Now</h2>
                    <div class="padding-left">
                      <p>In the immediate aftermath of losing a loved one, when the feelings of shock and grief are at their most raw, it can come as something of a shock to find out just how much is involved in arranging a funeral. Aside from the cost, which can run to several thousand pounds, there are the multiple practicalities which need to be dealt with. From legal matters such as registering the death and sorting out issues of inheritance and probate, to choosing a coffin and arranging the details of a funeral service, the thousand and one demands can be all but overwhelming. A funeral director will provide assistance but will also add substantially to the overall cost, and many people like to handle the details themselves, feeling it’s the last thing they can do for the individual concerned.</p>
                      <p>Even if the death didn’t come as a complete surprise there are certain aspects of funeral planning which can prove particularly difficult, and chief amongst these is finding a burial plot. Although 75% of the UK population now opt for cremation, the remaining 25% which favours burial still represents a significant number of people, and this demand shows no signs of dropping away in the future. Indeed, the ongoing demand, coupled with a shortage of supply, means that finding a burial plot which is available and affordable is more difficult than it’s ever been. Many local authorities across the UK are reporting that they have run out of burial plots already, or are due to do so in years to come, and it is against this backdrop the Burialplots.co.uk is seeking to revolutionise provision.</p>
                      <p>In the midst of coping with bereavement it’s only natural that you should want to be able to source a burial plot quickly and easily, and our service has been custom built to make that possible. Within our website you’ll be able to search the UK by area, finding a cemetery which meets your requirements in terms of location and then checking the plots which are available there. The details of each individual burial plot are made instantly available, from size to type and price. We’ve taken the principle of online commerce and applied it to an area which is all too often dominated by tradition instead of efficient customer service. From a laptop, tablet, smartphone or PC, you can deal with one of the more difficult aspects of funeral planning in a matter of moments, finding a burial plot which is perfect for your needs. Our service does two things; it opens up the market, introducing choice and competition and therefor lowering prices, and it provides the kind of convenience that goes at least a little way towards lessening the stress of bereavement.</p>
                      <p>Once you’ve chosen a burial plot you can explore the rest of our site to access advice and services on literally every single aspect of arranging a funeral. If you’d like to know more about purchasing a burial plot or have questions about our other services, simply ring us on 0100 000 000 or send us an email at (Email) and we’ll be happy to help. </p>
                    </div>
                    
                  
                </div>', N'Burial Plots Now', N'BURIAL-PLOTS-NOW', N'banner-about57196.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4075, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Parental Grief</h2>
    <div class="padding-left">
        <p>Any death of someone close to you is distressing and difficult to cope with, but the death of a child represents a particularly painful loss. When parents lose a child they lose a part of themselves and they lose the future they had planned for their child. Losing a parent or elderly relative is genuinely painful but, on some level, fits into what we regard as the ‘natural’ way of things. Even losing a partner, awful though it may be, is something which we accept is always a possibility. Losing a child, on the other hand, feels ‘wrong’ and unnatural on a very primitive and instinctive level. For those reasons, it is one of the hardest types of bereavement for any person to come to terms with. </p>
    </div>
    <br />
    <h2 class="underline">The Age of the Child</h2>
    <div class="padding-left">
        <p>Whilst losing a young child may seem like the cruellest blow of all, even the death of a grown up child can have a huge impact, as parents often talk of a part of themselves dying with their child. Almost all of the normal aspects of grief will be magnified when a child dies, but in particular the sense of unfairness and the feelings of anger that are felt. Couples may find that the intensity of the grief they are feeling and any difference in the way they respond drives a wedge between them. For some people, grief might be dealt with by bottling up the emotions and trying to put a brave face on things, whilst others may express the pain they feel in graphic terms. When this difference occurs between two halves of a couple they can end up resenting each other for not grieving ‘properly’. The truth is that there is no ‘right’ way to mourn the passing of a child, and that parents should give each other the space to process the emptions they’re feeling in their own way. In the aftermath of the loss, of course, this is easier said than done.</p>
    </div>
    <h2 class="underline">Other Children</h2>
    <div class="padding-left">
        <p>The presence of other children in the family may provide some solace when a child dies, not least because the parent will feel a sense of duty to carry on looking after the rest of their family, as well as helping them to cope with the loss of a brother or sister. In the longer term, parents may feel themselves behaving in an over protective manner toward any remaining children. This is a natural response, but mustn’t be allowed to get in the way of those children living their lives to the full. It can be some comfort to a parent to feel that the best tribute they can pay to their dead child would be to ensure that any other children grow up to lead the fullest and happiest lives possible. </p>
    </div>
    

    <h2 class="underline">Child Funeral</h2>
    <div class="padding-left">
        <p>When an older relative dies the funeral you arrange can, in part, function as a celebration of their life. The shock of a child dying means this is less likely to be the case, as the focus will naturally be on the life not lived, rather than the years enjoyed. A funeral still serves a useful function, however, in that it gives the parents a focus for their grief and provides an opportunity for friends and family to rally round. Talking to parents about the child that they’ve lost may feel difficult, awkward and painful, but the truth of the matter is that conversations of this kind will actually help.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <div class="padding-left">
        <p>If you need help to deal with the loss of a child then don’t hesitate to contact one of the specialist organisations which have been set up to provide that help. One of the worst aspects of this kind of loss is the sense of loneliness, and that nobody else can possibly understand what you are going through. Speaking to someone who has also been a bereaved parent, and hearing that what you’re feeling is normal and natural, can be incredibly helpful.</p>
        <p>If you have any questions about the grieving process, about coming to terms with the loss of a child or helping someone who has been bereaved in this way, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
    </div>
    </div>

', N'Parental Grief', N'PARENTAL-GRIEF', N'banner-about44905.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4076, N'<div class="container">
    <h2 class="underline">Burial Plots Press Coverage </h2>
    <div class="padding-left">
        <p>You don’t have to take our word for how much we’ve revolutionised the field of funeral planning. Take a look at the press coverage below and you’ll see just how much of an impact our refreshing, innovative and user friendly approach has made. We think we offer a new way of dealing with the trauma of loss, and we’re happy to see that plenty of people agree. </p>
    </div>
</div>', N'Press Coverage', N'PRESS-COVERAGE', N'banner-about26964.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4077, N'<div class="container">
    <h2 class="underline">Burial Plots Probate</h2>
    <div class="padding-left">
        <p>Dealing with the legal issues which arise when somebody dies can be a hugely complex matter. On the one hand, it can include relatively straightforward matters such as registering the death and informing relevant bodies like HMRC, the passport office and the local council. On the other, however, the death of a person means that those who are left behind have to manage the estate of the deceased.</p>
        <p>If the person in question left a will then it will be clear exactly how they wish the assets they left behind to be shared out amongst their beneficiaries, but even in cases such as this the process of probate must be followed. In simple terms, the term ‘probate’ involves giving someone legal permission to bring together all of the assets of the deceased, value those assets and then pass the estate on.</p>
    </div>
    <br />
    <h2 class="underline">Dealing With Probate</h2>
    <div class="padding-left">
        <p>In order to access and then distribute the assets of the deceased you may first need to be issued with a grant of representation, a legal document which banks and other financial institutions will want to see before allowing access to the funds in question. There are exceptions to this rule. You may not need a grant of representation if the estate in question is valued at less than £5,000 and doesn’t include any shares, property or land ownership. You will also not need a grant if the estate was held in joint names with a surviving spouse or civil partner and passes directly to them.</p>
        <p>If a will is involved, then the person dealing with probate will have been named in the will as executor. If not, then an executor will be appointed and will generally be the closest living relative of the deceased. </p>
    </div>
    <br />
    <h2 class="underline">Valuing the Estate</h2>
    <div class="padding-left">
        <p>In order to value the estate, the executor of the will has to bring together information on all of the assets of the deceased. This will include bank and building society accounts, properties, investments, personal belongings such as jewellery and works of art, motor vehicles, pensions and life insurance policies. The value of each asset at the time the person dies will have to be established. This will mean contacting the providers of any financial products and having properties valued by an estate agent or independent valuer.  You will also need to discover and calculate any debts owing, such as credit cards, loans, mortgages and personal debts, and the cost of a funeral can also be deducted from the value of the estate. The figure left when you deduct debts from assets will represent the value of the estate, and will determine whether inheritance tax needs to be paid.</p>
    </div>
    <br />
    <h2 class="underline">Inheritance Tax</h2>
    <div class="padding-left">
        <p>Certain estates don’t have to pay inheritance tax. These include estates which are worth less than the current threshold of £325,000, and those which are exempt because they have been left to a spouse or civil partner or to a qualifying charity.</p>
        <p>New laws introduced in April 2010 mean that the estate in question will also fall outside Inheritance Tax if it is worth less than £650,000 and 100% of the unused Inheritance Tax allowance from a late spouse or civil partner can be transferred to the deceased.</p>
        <p>Even if Inheritance Tax isn’t owed, you will still need to fill in a Return of Estate Information form for HMRC, and if it is owed, or the estate is not exempt, then the much longer IHT400 form needs to be filled in, detailing all of the assets and debts of the deceased.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Obtaining Probate</h2>
    <div class="padding-left">
        <p>Once the forms have been filled in they have to be sent to HMRC and the Probate Registry and any Inheritance Tax which is due has to be paid. Following this, the executor needs to attend a Probate venue or the office of a commissioner of oaths – generally a solicitor – to swear an oath in person. The grant of representation will then be provided, allowing the executor to access the assets of the deceased, pay any debts and distribute the estate to the beneficiaries. </p>
        <p>As can be gathered from this fairly brief description, probate can be a complex and lengthy process, often taking up to a year if not longer to complete. You may, as executioner, opt to place probate entirely in the hands of a legal professional, or undertake the majority of the work yourself and then ask a solicitor to check the forms and details before submitting them. </p>
        <p>If you have any questions about probate or the other legal processes surrounding bereavement then please contact us at (Email) or phone Burialplots.co.uk on 0100 000 0000.</p>
    </div>

</div>', N'Probate', N'PROBATE', N'banner-about71771.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4078, N'<div class="container">
    <h2 class="underline">Burial Plots Services</h2>
    <div class="column-block">
        <div class="column">
            <p>Dealing with the death of a loved one is always going to be a difficult experience, particularly when the emotions involved are compounded by a range of complex practical and legal issues. Forward planning – such as writing a will, arranging a funeral or taking out life insurance – can minimise such problems, but there are always going to be matters which have to be dealt with. </p>
            <p>One of the main aims of Burialplot.co.uk is to make dealing with matters of this kind much simpler. By bringing together all of the advice and help you’ll need in one place, as well as access to the relevant services, we make it easy to find out exactly what needs to be done when a person dies, and which aspects you’re likely to need professional help with.</p>
        </div>
        <div class="column">
            <img src="/images/video.jpg" alt="">
        </div>
    </div>
    <div class="padding-left">
        <p>This is particularly true when it comes to the legal matters involved in dealing with a person’s estate. The issue of acting as an executor of a will and dealing with probate is dealt with elsewhere on the site, as is writing a will. Whilst, in some cases, it is simpler to handle these aspects of estate management yourself, the more complex estates might call for professional input; those estates which are valuable enough to warrant inheritance tax, for example, or when a person has died without leaving a will specifying how they want their estate to be divided.</p>
    </div>
    <br />
    <h2 class="underline">Probate Services</h2>
    <div class="padding-left">
        <p>If you’ve agreed to execute a will and feel that the task is simply too complicated to handle, or that you can’t spare the time and effort involved, then you may wish to enlist the aid of a professional probate service. A probate service of this kind is generally offered by a solicitor or accountant, although there are some firms which run as dedicated probate specialists. All will charge a fee for handling probate, and it is best to shop around to get the best fee possible. Some specialists, for example, offer an estimated fee which may rise higher as the process develops, whilst others work for a fixed percentage of the value of the estate. It may seem simpler to work with the solicitors who drew up or stored the will, but there is no obligation to do so, and you may be able to find a better deal elsewhere. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Type of Service</h2>
    <div class="padding-left">
        <p>Depending upon the complexity of the estate in question you may opt for either of two types of service, a Full Estate Administration or a Grant Only service. A Full Estate Administration service will deal with all aspects of probate on your behalf, from valuing the estate through preparing all necessary paperwork and paying liabilities to distributing the estate to the beneficiaries. A Grant Only probate service will expect you to gather all the relevant information regarding the estate, after which they will prepare the necessary paperwork and gain the grant of representation.  The grant will then be given to you, enabling you to deal with the estate. If you use a Grant Only service you will save money in fees but bear full responsibility for aspects such as finalising the tax position, paying taxes and distributing the estate.</p>
        <p>Planning carefully in advance can minimise the complexity and stress of estate management, as can accessing the correct services following a death. For advice on either of these, contact us at (Email) or by calling 0100 000 0000.</p>
    </div>

</div>', N'Search for Services', N'SERVICES', N'banner-about73860.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4079, N'
<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Shock of Sudden Death</h2>
    <div class="padding-left">
        <p>Any death of a loved one is a traumatic and painful experience, but a sudden or violent death presents a unique set of challenges. When someone close to you dies at the end of a long illness the sense of sadness, grief and shock is completely genuine, but some consolation may be felt by the fact that, for example, you might have had a chance to say goodbye to the person in question. Those who have lost someone in this manner often speak of the comfort they draw from knowing that they were able to tell the deceased that they loved them, for example, and that the deceased was able to put there affairs in order and experience a degree of peace of mind before dying.</p>
        <p>In the event of a sudden or violent death, on the other hand, none of this applies. The initial feeling of numbness, shock and despair will be joined by a searing sense of anger and unfairness. Even if nobody was directly responsible for the death, you will naturally begin to look around, desperate for someone or something to blame. This is perfectly natural, as are feelings of guilt that you are still alive while your loved one has been taken.</p>
    </div>
    <br />
    <h2 class="underline">The Facts</h2>
    <div class="padding-left">
        <p>It’s important to try to find out as much as you can about the circumstances of the death in question. Your natural instinct may be to shield yourself from the more unpleasant aspects which often accompany a sudden or violent death, but the things you’ll find yourself imagining will often be just as bad as the truth. In addition to this, you may well feel haunted in years to come by the knowledge that you don’t know exactly what was happening during your loved ones final moments. </p>
    </div>
    <br />
    <h2 class="underline">Official Matters</h2>
    <div class="padding-left">
        <p>When someone dies unexpectedly, no matter what the cause, there will have to be official enquiries. These may involve medical practitioners, the police, the coroner and other bodies. This may make you feel as though your loved one has become other people’s property, though it may also provide a focus which helps you with your grief. A determination to discover exactly what happened may drive you through the early stages of loss, but you need to be aware that when the investigations have been completed you will be alone with your emotions, and this could be when the pain hits especially hard.</p>
    </div>
    <br />
    <h2 class="underline">Moving On</h2>
    <div class="padding-left">
        <p>As with any grieving process, moving on from the initial shock and disbelief of a sudden or violent death can take a long time, and will vary from person to person. There is a difference between coming to terms with what has happened and getting over it completely. The sense of unfairness and loss may never leave you, but coming to terms with what happened will mean accepting those emotions and still being able to live the rest of your life. As with all bereavements, talking to other people can be incredibly helpful. Friends and family may rally round, but it’s often easier to open up and give full rein to your emotions with strangers. Specialist organisations, created to help people deal with sudden of violent death, provide exactly this opportunity, and it’s an opportunity which should be utilised as fully as possible.</p>
        
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

    <div class="padding-left">
        <p>If you have any questions about the grieving process, or about coming to terms with a sudden or violent death, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
    </div>
</div>

', N'Shock of Sudden Death', N'SHOCK-OF-SUDDEN-DEATH', N'banner-about51114.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4080, N'
<h2 class="underline">Burial Plots Stonemasons</h2>
<div class="column-block">
    <div class="column">
        <p>The role which a memorial plays in the grieving process can’t be overstated. Helping to create a permanent physical reminder of the person you’ve lost can provide a source of comfort during the difficult days following their death. Having to select the nature, design and wording of any memorial will allow you to concentrate on your feelings, providing a practical focal point for the huge range of emotions which are bound to be impacting upon you at this time.</p>
        <p>Here at Burialplots.co.uk we do everything we can to ease the process of bereavement as far as it is possible to do so. Whilst the grief, sadness and even anger that many people feel following a death can’t be avoided, the wealth of practical issues which have to be addressed can be simplified, and that’s exactly what we do. This begins with offering access to affordable burial plots across the UK – something which people are otherwise finding increasingly difficult to find – and also includes advice, help and links to the kind of services you’ll need following a death, or if you decide to pre-plan a funeral. </p>
    </div>
    <div class="column">
        <img src="/images/video.jpg" alt="">
    </div>
</div>
<div class="padding-left">
    <p>Any death of a loved one is a traumatic and painful experience, but a sudden or violent death presents a unique set of challenges. When someone close to you dies at the end of a long illness the sense of sadness, grief and shock is completely genuine, but some consolation may be felt by the fact that, for example, you might have had a chance to say goodbye to the person in question. Those who have lost someone in this manner often speak of the comfort they draw from knowing that they were able to tell the deceased that they loved them, for example, and that the deceased was able to put there affairs in order and experience a degree of peace of mind before dying.</p>
    <p>In the event of a sudden or violent death, on the other hand, none of this applies. The initial feeling of numbness, shock and despair will be joined by a searing sense of anger and unfairness. Even if nobody was directly responsible for the death, you will naturally begin to look around, desperate for someone or something to blame. This is perfectly natural, as are feelings of guilt that you are still alive while your loved one has been taken.</p>
</div>
<br />
<h2 class="underline">Types of Memorial</h2>
<div class="padding-left">
    <p>The role of a stonemason is to turn your vision of the kind of memorial you’d like to create for your loved one into a reality. A stonemason will be able to advise, for example, exactly what kind of rules and regulations the cemetery in question applies to memorials. Different cemeteries will have different rules regarding the size, shape and wording of a memorial, as well as factors such as the colour and finish of any stone. Most cemetery memorials come in one of two designs:</p>
    <ul>
        <li><strong>Full memorials</strong> – also known as ‘Traditional Memorials’, these take the form of a headstone and a slab which runs along the full length of the grave</li>
        <li><strong>Lawn memorials</strong> – this is a headstone resting on a matching base at the head of the grave</li>
    </ul>
</div>
<br />
<h2 class="underline">Types of Material</h2>
<div class="padding-left">
    <p>The material chosen for your memorial will be governed, to a degree, by the regulations of the cemetery in question. The most common materials are granite, marble and stone. Each material has its own qualities; stone often blends seamlessly with the natural environment, white marble, usually imported from Italy, offers a gentler appearance whilst polished black granite offers perhaps the most traditional aesthetic. Your stonemason will talk you through the options available, advising, for example, on the range of colours and finishes on offer and pointing out possible problems such as a marble memorial being marked by leaves dropping from a nearby tree.</p>
</div>
<br />
<h2 class="underline">Engraving</h2>
<div class="padding-left">
    <p>Your stone mason will offer a selection of lettering styles and fonts to choose from, as well as options such as lead lettering for marble stones and gilded lettering which is particularly effective on polished black granite. Once you’ve made all of these choices, your memorial will be created and put in place, although there may be a delay while the ground around the grave settles.</p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Aftercare</h2>
<div class="padding-left">
    <p>Once in place, the memorial will have to be cleaned from time to time on order to maintain the best possible appearance. It’s also advisable to take out insurance on the stone on case of vandalism or accidental damage.</p>
    <p>Designed and put together with skill, care and dedication, a memorial created by a stonemason will provide a fitting tribute to the person you loved, and a comforting place to visit when you wish to think about them in years to come. For more information on the options available, and how to find the right stonemason, contact us at (Email) or by calling 0100 000 0000.</p>
</div>

', N'StoneMasons', N'STONEMASONS', N'banner-about73480.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4081, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Suicide</h2>
    <div class="padding-left">
        <p>The death of someone close to you through suicide is an almost uniquely painful form of bereavement. The normal feelings of loss and pain will be compounded by a sense of guilt that you couldn’t stop it happening, and anger toward the deceased themselves. </p>
    </div>
    <br />
    <h2 class="underline">Causes</h2>
    <div class="padding-left">
        <p>Pin-pointing the cause of a suicide can feel like an incredibly difficult thing to do. This is because, in the majority of cases, there isn’t anything as simple as a single cause. One of the hardest things for those left behind after a suicide to come to terms with is the degree of pain which their loved one must have been feeling in order to decide that death was the only possible answer. For most people, no problem is so severe that the only solution could be taking their own life. The person who took their life was clearly in a state of pain so acute that this seemed like a logical decision. Those left behind will often torment themselves with the thought that they could have done more, or didn’t spot the signs. The truth of the matter, however, is that a suicidal person will be in a state of mind which is beyond reasoning or persuasion. Although they may present a calm and reasonable face to the world, within themselves they will feel that they have failed in some massively fundamental manner. </p>
    </div>
    <br />
    <h2 class="underline">Reaction</h2>
    <div class="padding-left">
        <p>One of the most difficult aspects of dealing with a death by suicide is the reaction of other people. The fact that there will have to be an investigation, a coroner’s inquest and perhaps even some media coverage will mean that you are aware that everyone else knows what happened. Unfair as it may be, the idea of suicide is still seen as something of a taboo, and people may find it much more difficult to talk about than they would any other kind of death. Talking about the suicide, however, is one of the most useful things you can do when trying to come to terms with it. In truth, nobody will necessarily have answers to the questions you’re asking, but simply being able to voice them aloud can be hugely therapeutic. It can be comforting, as well, to hear that other people who were closed to the deceased failed to spot the signs of how much pain they were in or, conversely, that they feel the suicide was inevitable and could not have been stopped by anyone. If you don’t feel able to talk to people close to you about the suicide then take advantage of the many organisations which offer specialist counselling advice and listening services focused on this topic. The chance to explain how you’re feeling to someone who has been through the same thing, or has been trained to deal with the repercussions, often marks the first step on the long road to recovery.</p>
    </div>
    <br />
    <h2 class="underline">Moving On</h2>
    <div class="padding-left">
        <p>In many ways the only way to come to terms with the suicide of someone close to you is to accept that, on one level, you will never truly understand what made them do it. You may never quite get over the fact that they chose to leave you but, in time, you may come to realise that the choice was theirs to make, and that you couldn’t have stopped them no matter how hard you tried. Perhaps you’ll be able to draw some small amount of comfort from the fact that the pain they were clearly in has, at least, been ended for them. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

    <div class="padding-left">
        <p>If you have any questions about the grieving process, or about coming to terms with a death by suicide, then please contact us by email at (Email) or by calling 0100 000 0000.</p>
        </div>
    </div>', N'Suicide', N'SUICIDE', N'banner-about29612.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4082, N'<h2 class="ql-align-center">Burial Plots Team</h2><p class="ql-align-center">Any business is only as good as the people working for it, and that’s why Burialplots.co.uk is home to the best. From top to bottom, the team running our business is dedicated to offering the best customer services, driven by a desire to help people through one of the most difficult moments of their life and fully aware of the range of emotional and practical issues which arranging or pre-planning a funeral can involve. Ultimately, any funeral is all about people – the people left behind, and person who has died. The people at Burialplots.co.uk understand this, and that’s why we’re proud to tell you a little bit more about them.</p>', N'Team', N'TEAM', N'banner-about3649.jpg', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4083, N'    
<div class="col-sm-12 col-md-12 testimonial-block">
    <div class="testimonial-icon">
        <span>“</span>
    </div>
    <div class="padding-left testimonial-text">
        <h3><strong>Graham Rowen</strong> <br /> <span>Chairman</span></h3>
        <p>“ Our Chairman has extensive experience in the property and investment world where he runs <strong>Elite Investor Club</strong>, a global network of sophisticated and high net worth investors. An author, speaker and television personality, in the last 2 years he has been invited to speak at the United Nations in New York, Harvard Business School in Boston and both houses of Parliament in the UK. A serial entrepreneur, he also owns Who’s Who Publications, is a partner in a TV production company and is playing a leading role in developing a bilateral crowdfunding platform between the UK and China. ”</p>
    </div>
</div>
<div class="col-sm-12 col-md-12 testimonial-block">
    <div class="testimonial-icon">
        <span>“</span>
    </div>
    <div class="padding-left testimonial-text">
        <h3><strong>Jason Oakley</strong> <br /> <span>MD</span></h3>
        <p>“ Jason built the lending business in Metro Bank as Managing Director Commercial Banking from £65m to over £2.3bn in less than 3 years with an income stream of approximately £100m and market leading margins. Prior to this he was Head of SME for NatWest & RBS with over 3,000 relationship managers looking after over 1m clients and over £1bn of revenue. Since leaving Metro in 2015 Jason set up Commercial Finance brokerage Mantra Capital which has closed over £260m of loans since inception in August 2015. He added directly regulated FCA permissions to Mantra''s proposition. ”</p>
    </div>
</div>
<div class="col-sm-12 col-md-12 testimonial-block">
    <div class="testimonial-icon">
        <span>“</span>
    </div>
    <div class="padding-left testimonial-text">
        <h3><strong>Christian Hipkiss</strong> <br /> <span>CEO</span></h3>
        <p>“ With a proven track record in the sales industry, Christian has spent the last 12 years running a number of assetbacked  investment businesses showing investors how to increase their yields, protecting growth and minimising losses. In addition he previously owned and operated a successful company with offices in multiple locations in the UK, before being head hunted for the investment industry. He has been involved in the acquisition of two UK cemeteries in the last 2 years ”</p>
    </div>
</div>
<div class="col-sm-12 col-md-12 testimonial-block">
    <div class="testimonial-icon">
        <span>“</span>
    </div>
    <div class="padding-left testimonial-text">
        <h3><strong>Debby Cavill</strong> <br /> <span>Non Executive</span></h3>
        <p style="margin-bottom:-180px;">“ Debby is  best known for being instrumental in developing Jewellery TV in the UK and across Europe. Successfully taking two jewellery businesses to market, the first still being one of the largest IPO’s ever on the Hong Kong Stock Exchange. Well adversed in the e-commerce sector, her current business interests include the largest e-commerce jewellery business in Europe. Debby other businesses include a rehab centre in Thailand, property / development companies, manufacturing outlets and strategic land purchases. ”</p>
    </div>
</div>', N'Testimonials', N'TESTIMONIALS', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4084, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots  Where to Start</h2>
    <div class="padding-left">
        <p>When somebody close to you dies the first challenge is to deal with the grief, pain, anger and numbness that can feel all but overwhelming in the initial aftermath of bereavement. What shocks many people, however, are the number of issues which also have to be dealt with immediately following a death. For some, these bureaucratic and practical matters can feel all but overwhelming, whilst others find that having a focus of this kind actually helps them to get through the first few  days of bereavement. The number of agencies which have to be liaised with, and the documentation and red tape involved, can be minimised through a degree of pre-planning, particularly in terms of arranging a funeral, but every death brings with it a range of legal and administrative tasks. </p>
        <p>At Burialplots.co.uk we’ve pulled together the full range of information needed in the case of bereavement. From the moment that a person dies, through finding a burial plot and arranging a funeral, to coping with the aftermath of life moving forward, you’ll find all of the information and advice you need within this website.  This begins with the steps which need to be taken immediately following the death of a loved one.</p>
    </div>
    <br />
    <h2 class="underline">Register the Death</h2>
    <div class="padding-left">
        <p>In the majority of cases, the death has to be registered within five days. The best place to do so is at the local register office, as this means that you’ll receive the documents needed on the same day. The process should take no more than 30 minutes, and you may need to arrange an appointment beforehand. The death can be registered by:</p>
        <ul>
            <li>A relative of the deceased</li>
            <li>A person present at the death</li>
            <li>An administrator from the hospital (if the death occurred in hospital)</li>
            <li>The person who found the body (if death took place elsewhere)</li>
            <li>The person in charge of making arrangements with the funeral directors</li>
        </ul>
        <p>You’ll need to take the certificate showing the cause of death, signed by a doctor, and it would be useful, although not compulsory, to take any or all of the following documents:</p>
        <ul>
            <li>The birth certificate</li>
            <li>A council tax bill</li>
            <li>The driving licence</li>
            <li>A marriage or civil partnership certificate</li>
            <li>An NHS medical card</li>
            <li>A passport</li>
            <li>Proof of address such as a utility bill</li>
        </ul>
        <p>You will need to tell the registrar the full name of the deceased at the time when they died, as well as any maiden name. You will also need to provide details of their date and place of birth, last residential address and occupation, if applicable. The registrar will also need to know the name, date of birth and occupation of any spouse or civil partner, whether surviving or deceased, and you will have to provide details of any state pension or other benefits the deceased was receiving.</p>
        <p>When the process is complete, the registrar will provide you with a Certificate for Burial or Cremation, known as a ‘green form’ and a form BD8 which is the Certificate of Registration of Death. If the deceased was in receipt of a state pension of other benefits, the BD8 will have to be filled in and sent off in the pre-paid envelope provided. </p>
        <p>Copies of the Death Certificate can be purchased from the registrar for a small fee, and these will be needed when sorting out the affairs of the deceased.</p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">If a Coroner is Involved </h2>
    <div class="padding-left">
        <p>In some cases, such as when the cause of death remains unknown or was violent or unnatural, the doctor involved may report the death to the coroner. If this is the case, the process of registering the death may take longer. In some cases the coroner may decide that the cause of death is obvious, in which case the doctor can sign the death certificate as before and the coroner will issue a separate certificate stating that a post mortem isn’t needed. If a post mortem examination is required this will cause a delay in issuing the death certificate, particularly if the post mortem is inconclusive and the coroner decides to hold an inquest. In cases such as this, you can be issued with an interim death certificate which can be used to prove that the person has died when dealing with various organisations.</p>
        <p>Once the death has been registered, it is possible to begin the process of arranging a funeral. For advice on this or any other post bereavement issues, please contact us via email at (Email) or by calling 0100 000 000. </p>
    </div>

</div>', N'Where to Start', N'WHERE-TO-START', N'banner-where-to-start456.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4085, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Who and Why</h2>
    <h3>Who?</h3>
    <div class="padding-left">
        <p>Burialplots.co.uk is a company dedicated to updating, simplifying and transforming the market in funeral provision. Arranging a funeral is something which people have traditionally been reluctant to think about until it’s too late, at which point their nearest and dearest are left facing up to the reality of funeral planning. This reality is that, at a time when you are struggling to cope with the emotional impact of bereavement, you also have to deal with the numerous practical issues and expenses inherent in dealing with the death of a loved one.</p>
        <p>We’ve set out to transform the task of arranging a funeral, whether the need is immediate, or the person arranging is planning for the future. In both cases we’ve taken the range of advice and services normally only accessible via a Funeral Director and brought them together in one place. Using Burialplots.co.uk as a portal it is possible to access every aspect of a funeral, from purchasing a coffin to getting advice on writing a eulogy. By also providing the contact details of organisations which specialise in helping people to deal with the practical and emotional aspects of bereavement, we’ve developed a genuine one stop destination.</p>
        <p>The other key aspect of our offer, as the name suggests, is the provision of burial plots. A traditional cemetery burial is still the option of choice for 25% of the UK population. Growing demands on land space, and a reluctance to re-use existing plots, has created a situation in which many local authorities are reporting a dwindling supply of available plots. In some parts of the country it is even being predicted that provision will run out completely in the next decade or so. Against this backdrop we have acquired, and will continue to acquire, burial plots across the UK. By combining this provision with the latest point and click – or tap and swipe – technology, we’ve made it incredibly easy to find the burial plot you need in the location of your choice. Combine this with flexible payment options which mix upfront payment with affordable plans and you have a service which blends provision with convenience and affordability. </p>
        <h3>Why?</h3>
        <p>Whether you’re planning for your own funeral or dealing with the death of a loved one, it can be a complicated and difficult process. The fragmented nature of the market can mean you have to deal with a number of different agencies or businesses simultaneously, something which is difficult enough when pre-planning but particularly stressful if you’ve recently been bereaved. By using our website you’ll find the whole process has been simplified and speeded up, at the same time as making sure that you get the best possible deal. Wanting to do the best for the family you’ll leave behind, or for a loved one who has just died, can leave people open to exploitation. By comparing the range of services and providers accessible through our site you’ll be able to arrange exactly the funeral you want without paying any more than you should. A funeral is a celebration of a life, an expression of love and a vital part of the grieving process. By simplifying so many of the practical matters, Burialplots.co.uk makes it easier to concentrate on the emotions that really matter. If you have any questions about the services we provide, or any aspects of arranging a funeral, please contact us as (Email) or by calling 0100 000 0000.</p>
    </div>


</div>', N'Who And Why', N'WHO-AND-WHY', N'banner-about41924.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4086, N'
<h2 class="underline">Burial Plots Wills</h2>
<div class="padding-left">
    <p>One of the most difficult aspects of coping with the death of a loved one is the emotional impact of losing someone close to you. There’s no escaping the emotions involved, of course, but the practical issues which also come to the fore when someone dies can be minimised greatly by a degree of forward planning.</p>
    <p>If somebody dies at a younger age than expected then planning a funeral in advance is perhaps less likely to have occurred to them, but for many people it is an option which would help to ease much of the stress bearing down upon those who have been left behind. One of the main aims of Burialplots.co.uk is to make that kind of planning much simpler. In the first instance, we offer a supply of burial plots for purchase in locations around the UK. With the demand for such plots greatly outstripping the supply, burial plots have become difficult to find and much more expensive in recent years. By offering simple search options and flexible payment plans, we intend to redress this situation and make it much simpler for people to find the burial plot they want. </p>
    <p>The other major purpose of the site is to act as a one stop portal for all aspects of funeral planning. This extends from offering links to services such as florists, stonemasons and purchasing coffins to supplying advice on the legal aspects of coping with bereavement. One of these aspects is dealing with the estate of the deceased, and this is made much simpler if they took the time to write a will.</p>
</div>
<br />
<h2 class="underline">Why write a will?</h2>
<div class="padding-left">
    <p>There are many good reasons for going to the trouble of writing a will. Setting down exactly what you want to leave and who you want to leave it to will ensure that your estate is passed on as you wish and should, if done properly, prevent any disputes following your death. Careful planning of a will, perhaps with the help of a lawyer, can also help to minimise any Inheritance Tax bill, and a will is often the perfect place to set down a few details about what kind of funeral you would like. </p>
</div>
<br />
<h2 class="underline">What you need to make a will</h2>
<div class="padding-left">
    <p>In order to write a will effectively you first need to value your estate. This means siting down and working out how much your total assets are worth, including items such as:</p>
    <ul>
        <li>Any properties you own</li>
        <li>Investments, such as stocks and shares</li>
        <li>Money saved in bank and building society accounts</li>
        <li>Insurance policies</li>
        <li>Motor vehicles</li>
        <li>Pension funds which pay out a lump sum at death</li>
        <li>Personal possessions, such as jewellery, antiques artworks etc</li>
    </ul>
    <p>It is important to get these assets valued regularly as the worth of some, such as stocks and property, could fluctuate. In certain parts of the UK your house may have risen dramatically in value over the years, for example, and this might affect the provisions of your will.</p>
</div>
<br />
<h2 class="underline">What you should include</h2>
<div class="padding-left">
    <p>You should set out exactly where you want the various parts of your estate to go. Many people, for example, bequest certain items to individual people whilst leaving the bulk of their estate to a spouse. Others might leave their main home and half of their estate to a spouse or civil partner, and share the rest between any children they have. Your will should also include details of what you would like to happen if any of the beneficiaries die before you do.</p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Validity</h2>
<div class="padding-left">
    <p>In order to be valid, a will must be in writing and it must be signed by you and two witnesses. You must have the mental capacity at the time of writing the will to understand what it means. If there is any doubt about this – if you’ve been given a diagnosis of dementia, for example – then you need to have what is called ''testamentary capacity'', which may require a statement signed by a medical practitioner. The will should state that it takes the place of all other wills, and any previous wills should be destroyed. </p>
    <p>The two witnesses must be adults who sign the will in your presence. It should be noted that the witnesses and their spouses or civil partners will not be allowed to benefit from the will. The rest of the will is still valid if anything is left to a witness, but they will not be entitled to take what you intended them to have. The executor chosen for your estate is allowed to witness the will, but cannot be a beneficiary.</p>
    <p>Once the will has been completed minor changes can be made. These are called codicils, and must be added to the will and signed and witnessed as the original will was, although the two witnesses don’t have to be the same. No changes should be made by altering the actual will, only by adding codicils, and any major changes will require a new will being written.</p>
    <p>Your will should be stored in a safe place, perhaps with a solicitor or bank or with the Probate Service. If you have any questions about wills or the other legal processes surrounding bereavement then please contact us at (Email) or phone Burialplots.co.uk on 0100 000 0000.</p>
</div>
', N'Wills', N'WILLS', N'banner-about86364.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4087, N'<h2 class="underline">Burial Plots Will Writing</h2>
<div class="column-block">
    <div class="column">
        <p>Writing a will is something which saves a great deal of time and trouble following your death. Your loved ones will know exactly how you wanted your estate to be divided, thereby stopping any possible arguments, and you may even choose add a few details covering what you’d like your funeral to include. You can never minimise the emotional impact of bereavement, but a will can help to reduce the financial, logistical and practical problems which often arise. </p>
        <p>This is only the case, of course, if the will in question is written in the correct manner. Elsewhere in this site we’ve outlined exactly what a will has to <a href="wills.html">contain</a>, but any mistakes will only lead to more stress and expense for the people left behind. You may save money on the fees a solicitor or specialist firm would charge, but you won’t enjoy the peace of mind derived from knowing that your will was put together by someone with specialist knowledge in the fields of will writing and probate. </p>


    </div>
    <div class="column">
        <img src="/images/video.jpg" alt="">
    </div>
</div>
<div class="padding-left">
    <p>The use of specialist help when writing a will is particularly advised if:</p>
    <ul>
        <li>Your estate is going to be liable to Inheritance Tax</li>
        <li>You have a complex family structure such as one which involves children from a previous partnership, or a dependent who will need extra help due to illness or disability</li>
        <li>You have overseas assets, such as a holiday home</li>
        <li>You own a business which will make up part of your estate</li>
    </ul>
</div>

<h2 class="underline">Using a Solicitor</h2>
<div class="padding-left">
    <p>If you use a solicitor to draw up your will, the fee they charge will depend upon the complexity of your estate, but will generally fall somewhere between £100-£200. Shop around for the best deal and make sure that any quote you’re given includes VAT. You should think about what you want to include in the will and who you wish to leave the various assets to before you meet with your solicitor, as this will save time and money. They will explain your options and offer confidential advice, before setting down your wishes in the correct manner. Using a solicitor will mean that mistakes are less likely to be made and that you can seek redress with the solicitors firm or the Legal Ombudsman if mistakes do occurr. It also means that you’ll receive expert advice on complicated aspects of estate management such as Inheritance Tax and trusts. You may also opt to appoint the solicitor who draws up your will to be its’ executor. </p>
</div>
<br />
<h2 class="underline">Using a will writing service</h2>
<div class="padding-left">
    <p>You should consider using a will writing service if your will is going to be fairly simple and you already understand some of the basics of writing a will, but not enough to feel fully confident writing your own. A will writing service may visit you at your own home, and some offer an online option. The main advantages of will writing services are that there are enough of them for you to be able to shop around, and you can therefore be certain to find the best possible price. The disadvantages are that a will writing service will not be able to store your will as safely as a solicitor, and the industry regulation doesn’t offer the same protection as that given to solicitors. Although will writers aren’t usually fully legally qualified, they will be trained in wills and estate planning, as long as the service is a member of one of the following organisations: </p>
    <ul>
        <li> The Society of Will Writers</li>
        <li> The Institute of Professional Will Writers</li>
    </ul>
    <p>Membership of these bodies means that their training is regularly updated and they are insured to cover legal costs in the event of your will being challenged. </p>
    <p>If you have any questions regarding writing wills, probate or any other legal issue pertaining to bereavement, please contact us at (Email) or by calling 0100 000 0000. </p>
</div>
<br />
<h2 class="underline">What you need to make a will</h2>
<div class="padding-left">
    <p>In order to write a will effectively you first need to value your estate. This means siting down and working out how much your total assets are worth, including items such as:</p>
    <ul>
        <li>Any properties you own</li>
        <li>Investments, such as stocks and shares</li>
        <li>Money saved in bank and building society accounts</li>
        <li>Insurance policies</li>
        <li>Motor vehicles</li>
        <li>Pension funds which pay out a lump sum at death</li>
        <li>Personal possessions, such as jewellery, antiques artworks etc</li>
    </ul>
    <p>It is important to get these assets valued regularly as the worth of some, such as stocks and property, could fluctuate. In certain parts of the UK your house may have risen dramatically in value over the years, for example, and this might affect the provisions of your will.</p>
</div>
<br />
<h2 class="underline">What you should include</h2>
<div class="padding-left">
    <p>You should set out exactly where you want the various parts of your estate to go. Many people, for example, bequest certain items to individual people whilst leaving the bulk of their estate to a spouse. Others might leave their main home and half of their estate to a spouse or civil partner, and share the rest between any children they have. Your will should also include details of what you would like to happen if any of the beneficiaries die before you do.</p>
</div>
<br />
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>
<h2 class="underline">Validity</h2>
<div class="padding-left">
    <p>In order to be valid, a will must be in writing and it must be signed by you and two witnesses. You must have the mental capacity at the time of writing the will to understand what it means. If there is any doubt about this – if you’ve been given a diagnosis of dementia, for example – then you need to have what is called ''testamentary capacity'', which may require a statement signed by a medical practitioner. The will should state that it takes the place of all other wills, and any previous wills should be destroyed. </p>
    <p>The two witnesses must be adults who sign the will in your presence. It should be noted that the witnesses and their spouses or civil partners will not be allowed to benefit from the will. The rest of the will is still valid if anything is left to a witness, but they will not be entitled to take what you intended them to have. The executor chosen for your estate is allowed to witness the will, but cannot be a beneficiary.</p>
    <p>Once the will has been completed minor changes can be made. These are called codicils, and must be added to the will and signed and witnessed as the original will was, although the two witnesses don’t have to be the same. No changes should be made by altering the actual will, only by adding codicils, and any major changes will require a new will being written.</p>
    <p>Your will should be stored in a safe place, perhaps with a solicitor or bank or with the Probate Service. If you have any questions about wills or the other legal processes surrounding bereavement then please contact us at (Email) or phone Burialplots.co.uk on 0100 000 0000.</p>
</div>

', N'Will Writers', N'WILL-WRITING', N'banner-about19665.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4088, N'<div class="container">
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <h2 class="underline">Burial Plots Writing Eulogies</h2>
    <div class="padding-left">
        <p>The funeral of a person closed to you serves a very useful role in the grieving process. In the initial stages of losing a loved one, you can often feel bewildered, lost and somewhat numb. The many practical and legal issues involved in dealing with a person’s death can help to provide a focus to get you through those first difficult days, whilst planning the details of the funeral will allow you to think in depth about the person you’ve lost.</p>
        <p>Many people pre-plan aspects of their funeral in advance and the chances are that you’ll be extremely grateful for this. After all, the funeral is your chance to say a final goodbye whilst celebrating their life, and the knowledge that details such as the music, the flowers and even the burial plot itself were chosen by the deceased will set your mind at ease. The feeling that ‘It’s what they would have wanted’ is more than a cliché, it’s an immensely comforting thought.</p>
    </div>
    <br />
    <h2 class="underline">The Purpose of the Eulogy</h2>
    <div class="padding-left">
        <p>If the funeral service as a whole is designed to capture and reflect the personality of the deceased, the eulogy sits at the very heart of this process. It is your chance to set down and express exactly what they meant to you. Many services are presided over by someone – often a religious figure – who may not have actually known the person in question. Whilst you may be able to provide a few personal details, nothing can come close to s speech, written from the heart, which has been designed to tell the world exactly what was so special about the person who has died. </p>
    </div>
    <br />
    <h2 class="underline">Getting Started</h2>
    <div class="padding-left">
        <p>The first thing to do is sit down and think about the person you’ve lost. You want to tell the world what made them so special, so start by remembering what made them special to you. Whilst this may be painful, it will also be comforting, and people who’ve written eulogies often comment that it was the first time since the death of their loved one that they found themselves smiling at their memory. Don’t worry if you don’t consider yourself to be a talented writer or to have a particular way with words. People aren’t looking for great literature or poetic phrase making. They’re looking for something which comes from the heart, expresses how you feel and reminds them of the person they’re here to remember. It can be difficult to focus your thoughts so it is best to decide upon a structure for the eulogy. It could run in chronological order through their life, concentrate on a particular theme such as their sense of humour or kind-hearted nature, or pick upon two or three key events in their life. A eulogy doesn’t have to be overly sombre in nature. Many of the warmest memories of a person are those which involved laughter, and your eulogy can be as amusing as it is sad. </p>
    </div>
    <br />
    <h2 class="underline">Content</h2>
    <div class="padding-left">
        <p>The main aim of a eulogy should be to bring your loved back to life for a few moments, preferably by presenting facets of their personality which everyone will recognise and remember. You could do this by listing their achievements, mentioning quirks of personality or sayings they used to come out with, detailing the way they coped with bad times as well as good, talking about how their influence lives on in subsequent generations and discussing the impact they had on the wider community. </p>
    </div>
    <br />
    <h2 class="underline">Tone</h2>
    <div class="padding-left">
        <p>Don’t feel compelled to use language such as ‘We are gathered here today’. Speak in a way that feels natural to you and is honestly reflective of the deceased. If you think they’d have cringed at hearing their praises being sung, or conversely agreed with every word, then don’t shy away from saying so. Ask other people who knew them to share their memories with you as well, as you may discover things which can be used to make the portrait you’re painting richer and fuller. Don’t make the eulogy too long, especially if you’re unused to speaking in public. Anything longer than five minutes and people may naturally start to lose interest. </p>
    </div>
    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>

    <div class="padding-left">
        <p>As with all aspects of a funeral there is no right or wrong way to write a eulogy. Speak from the heart, talk about the person you loved and why you loved them and take the chance to say a last fond farewell and you’re bound to produce something which touches all of those who hear it.</p>
    </div>
</div>', N'Writing Eulogies', N'WRITING-EULAGIES', N'banner-about16863.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4090, N'       <div class="container">
                    <h2 class="underline">Burial Plots Pre Need </h2>
                    <div class="padding-left">
                      <p>Planning for a funeral is something which people often shy away from, fearing that it may be distressing. The truth of the matter, however, is that people who’ve made arrangements for what will happen in the event of their death generally experience much more peace of mind having done so. After all, nobody wants to think of leaving their loved ones with a financial, emotional and practical burden when they’ve gone. That’s why people write wills and take out life insurance policies. The same forethought can be applied to planning and paying for a funeral, and with the average UK burial funeral now costing £4,136*, anything which can be purchased or planned in advance will help to ease the bereavement process for those left behind.</p>
                    </div>
                <br /> <br />
                    <h2 class="underline">Shortage of Burial Plots</h2>
                    <div class="padding-left">
                    <p>In recent years one of the most difficult aspects of arranging a funeral has been finding and purchasing a burial plot. The fact that the supply of viable burial plots within the UK has been running low has been acknowledged for some years now, and with the demand for burials remaining strong, both choice and cost have been adversely affected. Burialplots.co.uk was created to address this need, and to do so in a way which offerss convenience and simplicity. We’ve gathered together a selection of plots located in cemeteries across the UK. By accessing our simple search page you can locate the cemetery of your choice and then view the plots available within that cemetery.</p>
                    <p>Information such as size, type and cost is provided, and you even have the choice of two different payment options; pay in advance or set up a payment plan. We offer the full range of plots, from single plots to companion plots and even plots for burying cremated remains. Over time, we plan to expand our range into every part of the UK, and to arrange provision in our own dedicated cemeteries. </p>
                    </div>
                <br /> <br />
                  
                      <h2 class="underline">Forward Planning </h2>
                      <div class="padding-left">
                      <p>Once you’ve found the plot which exactly meets your requirements, you can use the rest of our site to arrange all of the other aspects of a funeral.  From memorial stones and cars to flowers and eulogies, we offer advice and links to all the services needed to pre-plan a funeral in full. Although a funeral director can and will handle all the details – including securing a burial plot – it makes much more sense to pre plan as much of it as possible. Think of pre-planning as the last gift you leave to your loved ones. By purchasing a plot and making arrangements ahead of time you’ll be freeing them from the stress and cost of having to do so whilst coping with losing you. Purchasing a burial plot in advance will deal with one of the trickiest aspects of funeral planning, allowing your nearest and dearest to get on with marking your passing and celebrating your life.</p>
                      <p>*The Royal London National Funeral Cost Index Report 2016</p>
                      </div>   
              
                </div>
            </div><!-- section -->', N'Pre Need Burial Plots', N'PRENEED', N'banner-search77659.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4091, N'    <div class="container">
                    <h2 class="underline">At Need</h2>
                    <div class="padding-left">
                      <p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p>
                      <p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p>
                      <p>Working independantly, we are able to offer an unbiased opinion on all of the cemetries and the ancillary bereavement services that we have researched to bring to you an information led approach to the right choices.</p>
                    </div>
                    
                  
                </div>', N'At Need Burial Plots', N'ATNEED', N'banner-search22357.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4093, N'<p class="ql-align-center ql-indent-1"><br></p><p class="ql-align-center">Dealing with the loss of someone close to you is always bound to be a traumatic and difficult experience. On top of the emotional impact of the loss itself, the death of a loved one or close friend also means having to negotiate a complex and daunting set of processes. At the very moment when you feel least equipped to focus on practical, legal or financial issues, you find yourself having to do precisely that.</p><p class="ql-align-center">Here at Burialplots.co.uk we set out to minimise the stress which all of this involves by doing two things. The first of these is to offer access to affordable burial plots across the UK, bringing choice, flexibility and convenience to a market place which is currently failing to meet demand. The second is to provide a source of information and help to anyone who finds themselves having to arrange a funeral, or wishes to remove uncertainty by making plans for the future.</p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><h2 class="ql-align-center">Burial Plots</h2><p class="ql-align-center">Although cremation is an option, many people, for cultural religious or personal reasons, prefer burial, and this is leading to a situation in which demand outstrips supply and prices rise at more than the rate of inflation every year. As land across the UK is taken up by the need for more housing and infrastructure, local authorities are finding it harder and harder to offer access to burial plots. In some parts of the country provision has all but stopped, whilst many authorities are predicting that access to burial plots will become increasingly scarce in the years to come. Against this backdrop, Burialplots.co.uk is able to offer the reassurance of certainty. Rather than having to wait and hope that a plot will be available when the time comes, our clients can plan ahead with clarity and assurance. Many people take comfort in knowing they have a plot or plots pre-purchased, particularly if they desire a final resting place which is close to members of their family or people with the same religious beliefs. By offering provision above and beyond the traditional funeral director model, we enable our clients to make arrangements such as these, and maximise availability by offering a choice between advance payment and payment plan options.</p><p class="ql-indent-1 ql-align-center"><br></p><div class="front-div"><div style="width:62%"><h2 class="ql-align-center">Services</h2><p class="ql-indent-1 ql-align-center">Services Of course, there’s more to the process of bereavement than simply purchasing a burial plot, and our site offers access to all of the information an individual in this situation might need. Whether dealing with a sudden loss or planning for the future, visitors can access information on topics like making a will, handling probate, choosing a coffin, writing a eulogy and dealing with the details of a funeral such as flowers, cars and stonemasons. By bringing all of this information together in one place we can minimise the stress of dealing with loss and help individuals to cope with the immediate aftermath or enjoy the security of planning for the future. If you have any questions about purchasing a burial plot or anything else which dealing with a bereavement entails, please don’t hesitate to contact us via email at (Email), or by calling 0100 000 000. Our experts are ready and waiting to provide the advice and information you’re looking for.a</p><p class="ql-indent-1 ql-align-center"><a class="btn" href="http://localhost:6465/Admin/Page/PageView/Burial-Plots" target="_blank">MORE</a></p></div><div style="margin-right:30px"><iframe class="ql-video ql-align-center" allowfullscreen="true" src="https://www.youtube.com/embed/elE6iSytJks" width="560" height="315" frameborder="0"></iframe></div></div><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p>', N'Index', N'Index', N'banner-about16863.jpg', N'<p class="ql-align-center">آپ کے قریب کسی کے نقصان سے نمٹنے کے لئے ہمیشہ تکلیف دہ اور مشکل تجربہ ہونا پڑے گا. نقصان خود کے جذباتی اثرات کے اوپر، ایک پیارے یا قریبی دوست کی موت کا مطلب یہ ہے کہ عمل کے پیچیدہ اور مشکل سیٹ پر بات چیت کرنا ہے. اس وقت جب آپ عملی طور پر، قانونی یا مالی معاملات پر توجہ مرکوز کرنے کے لئے کم از کم لیس محسوس کرتے ہیں، تو آپ اپنے آپ کو صحیح طریقے سے کرنا پڑتا ہے.</p><p class="ql-align-center"><br></p><p class="ql-align-center">یہاں Burialplots.co.uk میں ہم نے اس کشیدگی کو کم سے کم کرنے کے لئے مقرر کیا جس میں یہ سب دو چیزوں کی طرف سے شامل ہیں. ان میں سے سب سے پہلے برطانیہ بھر سستی دفن پلاٹوں تک رسائی فراہم کرنا ہے، جو مارکیٹ کی جگہ پر انتخاب، لچکدار اور سہولت فراہم کرتی ہے جس میں فی الحال طلباء کو پورا کرنے میں ناکامی ہے. دوسرا معلومات کسی ذریعہ فراہم کرنے اور کسی کو مدد فراہم کرنے والا ہے جو اپنے آپ کو جنازہ کا انتظام کرنا چاہتا ہے، یا مستقبل کے منصوبوں کی بناء سے غیر یقینیی کو ختم کرنا چاہتا ہے.</p><p class="ql-align-center">دفاتر</p><p class="ql-align-center"><br></p><p class="ql-align-center">اگرچہ یہودیوں کو ثقافتی مذہبی یا ذاتی وجوہات کے لئے ایک اختیار ہے، بہت سے لوگ، دفن کو ترجیح دیتے ہیں، اور یہ ایک ایسی صورت حال کا باعث بنتی ہے جس میں ہر سال انفراسٹرکچر کی شرح سے کہیں زیادہ فراہمی اور قیمتیں بڑھتی جارہی ہے. جیسا کہ برطانیہ بھر میں زمین زیادہ ہاؤسنگ اور بنیادی ڈھانچے کی ضرورت سے اٹھائے جاتے ہیں، مقامی حکام دفن کرنے کے لئے محیط اور مشکل پیش کرنے کے لئے محنت کر رہے ہیں. ملک کے کچھ حصوں میں سب کچھ بند کر دیا گیا ہے، لیکن بہت سے حکام نے پیش گوئی کی ہے کہ دفاتر کے دورے تک رسائی آنے والے برسوں میں تیزی سے کم ہو جائے گی. اس پس منظر کے خلاف، Burialplots.co.uk یقین کی یقین دہانی کرانے کے قابل ہے. بجائے اس وقت انتظار کرنے اور امید ہے کہ جب ایک پلاٹ دستیاب ہو تو اس وقت ہمارے گاہکوں کو واضح اور یقین دہانی کے ساتھ آگے بڑھا سکتے ہیں. بہت سے لوگوں کو یہ جاننا ہے کہ ان کے پاس پہلے سے خریدا ایک پلاٹ یا پلاٹ ہے، خاص طور پر اگر وہ حتمی آرام دہ جگہ کی خواہش رکھتے ہیں جو ان کے خاندان کے ارکان کے قریب ہے یا اسی مذہبی عقائد کے ساتھ. روایتی جنازہ کے ڈائریکٹر ماڈل کے اوپر یا اس سے باہر کی فراہمی کی پیشکش کرتے ہوئے، ہم اپنے گاہکوں کو اس طرح کے انتظامات بنانے میں مدد دیتے ہیں، اور پیشگی ادائیگی اور ادائیگی کی منصوبہ بندی کے اختیارات کے درمیان انتخاب کی پیشکش کی طرف سے دستیابی کو زیادہ سے زیادہ بنانے کے لئے.</p><p class="ql-align-center">خدمات</p><p class="ql-align-center"><br></p><p class="ql-align-center">بلاشبہ، صرف دفن کرنے کے بجائے محاصرہ کے عمل میں زیادہ ہے، اور ہماری سائٹ اس صورت حال میں ایک فرد کو ان تمام معلومات تک رسائی فراہم کرتا ہے جو اس صورت حال کی ضرورت ہو سکتی ہے. چاہے مستقبل کے لئے اچانک نقصان یا منصوبہ بندی کا سامنا کرنا پڑتا ہے تو، سیاحوں کو موضوعات، معلومات کو سنبھالنے، امتحان کو سنبھالنے، ایک تابکاری کو منتخب کرنے، صوفیانہ لکھنے اور پھولوں، کاروں اور استحکام کے طور پر جنازہ کی تفصیلات سے نمٹنے کے بارے میں معلومات تک رسائی حاصل ہوسکتی ہے. اس تمام معلومات کو ایک جگہ میں لانے کے ذریعے ہم نقصان سے نمٹنے کے دباؤ کو کم کر سکتے ہیں اور افراد کو فوری طور پر بعد میں نمٹنے کے لئے یا مستقبل کے لئے منصوبہ بندی کی حفاظت سے لطف اندوز کرنے میں مدد کر سکتے ہیں.</p><p class="ql-align-center"><br></p><p class="ql-align-center">اگر آپ کے پاس دفن دفاتر خریدنے یا کسی اور پر جوش و غضب سے نمٹنے کے بارے میں کوئی سوال نہیں ہے تو، براہ کرم ہم (ای میل) پر ای میل کے ذریعے یا 0100 000 000 فون کرکے ہم سے رابطہ کرنے میں ہچکچاہٹ نہ کریں. ہمارے ماہرین تیار ہیں اور فراہم کرنے کے منتظر ہیں. آپ مشورہ اور معلومات تلاش کر رہے ہیں.</p><p class="ql-align-center"><br></p><p class="ql-align-center"><a href="http://localhost:6465/Admin/Page/PageView/Burial%20Plots" target="_blank">MORE</a></p><p class="ql-align-center">&lt;iframe width="560" height="315" src="https://www.youtube.com/embed/elE6iSytJks" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p><br></p>', N'<p class="ql-align-center">आपके पास किसी के नुकसान के साथ लेनदेन हमेशा एक दर्दनाक और मुश्किल अनुभव होने के लिए बाध्य है। नुकसान के भावनात्मक प्रभाव के ऊपर, किसी प्रियजन या करीबी दोस्त की मौत का भी अर्थ है कि जटिल और जटिल प्रक्रियाओं के लिए बातचीत करना है। बहुत ही क्षण में जब आपको व्यावहारिक, कानूनी या वित्तीय मुद्दों पर ध्यान केंद्रित करने के लिए कम से कम लग रहा है, तो आप को ठीक से ऐसा <strong>करना पड़ता है।</strong></p><p class="ql-align-center"><br></p><p class="ql-align-center">यहां पर बरिअलप्लॉट्स.कॉ.के. में हम तनाव को कम करने के लिए तैयार हैं, जिसमें ये सभी दो चीजें करते हैं। इनमें से सबसे पहले ब्रिटेन भर में सस्ती दफन भूखंडों तक पहुंच की पेशकश करना है, जो बाजार की जगह के लिए विकल्प, लचीलापन और सुविधा ला रहा है, जो वर्तमान में मांग को पूरा करने में असफल रहा है। दूसरा, जानकारी के स्रोत और किसी को भी मदद करता है जो खुद को अंतिम संस्कार की व्यवस्था कर लेता है, या भविष्य के लिए योजना बनाकर अनिश्चितता को दूर करना चाहता है।</p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><br></p><p class="ql-align-center"><strong>दफ़नाने वाले प्लॉट्स</strong></p><p class="ql-align-center"><br></p><p class="ql-align-center">हालांकि अंतिम संस्कार एक विकल्प है, कई लोग, सांस्कृतिक धार्मिक या व्यक्तिगत कारणों से, दफनाना पसंद करते हैं, और यह ऐसी स्थिति में आगे बढ़ रही है जिसमें मांग की आपूर्ति की जा रही है और कीमतें हर साल मुद्रास्फीति की दर से अधिक बढ़ जाती हैं। चूंकि यूके में जमीन अधिक आवास और बुनियादी ढांचे की जरूरत से ऊपर ले जाती है, स्थानीय प्राधिकारी इसे कब्रदार भूखंडों तक पहुंच की पेशकश करना कठिन और मुश्किल पाते हैं देश के कुछ हिस्सों में प्रावधान सभी को रोक दिया गया है, जबकि कई अधिकारी भविष्यवाणी कर रहे हैं कि आने वाले वर्षों में कब्र के भूखंडों तक पहुंच बढ़ने से कम हो जाएगा। इस पृष्ठभूमि के खिलाफ, Burialplots.co.uk निश्चितता का आश्वासन देने में सक्षम है। इंतजार और उम्मीद है कि एक साजिश जब समय आता है उपलब्ध हो जाएगा के बजाय, हमारे ग्राहकों को स्पष्टता और आश्वासन के साथ आगे की योजना बना सकते हैं। बहुत से लोग यह जानते हुए कि वे एक भूखंड या भूखंड खरीदते हैं, में आराम करते हैं, खासकर यदि वे अंतिम विश्राम की जगह चाहते हैं जो अपने परिवार के सदस्यों या समान धार्मिक मान्यताओं वाले लोगों के करीब है। पारंपरिक अंतिम संस्कार के निदेशक मॉडल से ऊपर और उससे अधिक प्रावधान प्रदान करके, हम अपने ग्राहकों को इस तरह की व्यवस्था करने के लिए सक्षम करते हैं, और अग्रिम भुगतान और भुगतान योजना विकल्पों के बीच एक विकल्प प्रदान करके उपलब्धता को अधिकतम करते हैं।</p><p class="ql-align-center">सेवाएं</p><p class="ql-align-center"><br></p><p class="ql-align-center">बेशक, बस एक दफनाने की साजिश खरीदते हुए शोक की प्रक्रिया के लिए और अधिक है, और हमारी साइट की सभी जानकारियों तक पहुंच की सुविधा है, इस स्थिति में एक व्यक्ति की आवश्यकता हो सकती है। चाहे भविष्य में अचानक नुकसान या नियोजन के साथ काम करना, विज़िटर एक इच्छा बनाने, प्रोबेट को संभालने, कॉफ़िन का चयन करना, स्तम्भ लिखना और अंतिम संस्कार जैसे फूल, कारों और पत्थरवाहों के विवरण के साथ काम करना जैसे विषयों पर जानकारी का उपयोग कर सकते हैं। एक साथ सभी सूचनाओं को एक साथ लाने के द्वारा हम नुकसान से निपटने के तनाव को कम कर सकते हैं और व्यक्तियों को तत्काल परिणाम के साथ सामना करने या भविष्य की योजना बनाने की सुरक्षा का आनंद उठा सकते हैं।</p><p class="ql-align-center"><br></p><p class="ql-align-center">यदि आपके पास कब्र के कथनों को खरीदने के बारे में कोई सवाल है या किसी शोक से निपटने के लिए जो कुछ भी हो, तो कृपया ईमेल (ईमेल) पर ईमेल करें, या 0100 000 000 पर कॉल करके हमसे संपर्क करने में संकोच न करें। हमारे विशेषज्ञ तैयार हैं और उपलब्ध कराने का इंतजार कर रहे हैं सलाह और जानकारी जिसे आप ढूंढ रहे हैं</p><p class="ql-align-center"><a href="http://localhost:6465/Admin/Page/PageView/Burial%20Plots" target="_blank">MORE</a></p><pre class="ql-syntax ql-align-center" spellcheck="false">&lt;iframe width="560" height="315" src="https://www.youtube.com/embed/elE6iSytJks" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;
</pre><p class="ql-align-center"><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4094, N'    <h2 class="underline">Burial Plots Contact</h2>
                    <div class="padding-left">
                        <p>If you’d like to get in touch with us to discuss any aspect of purchasing a burial plot or planning a funeral, please contact us using the details below:</p>
                    </div>
                    <br/>
                    <p>
                        Address here <br>
                        Telephone number here <br>
                        Email address here
                    </p>', N'Contact Us', N'Contact-Us', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4096, N'<h2 class="underline">Headstones</h2>
<div class="padding-left">
    <p>If you opt to choose a traditional headstone as a memorial for the deceased you should find out what regulations the cemetery in question has in place.  There are likely to be rules regarding aspects such as the size and shape of the stone as well as its’ colour and the type of wording allowed.  Please bear in mind, also, that you may have to wait some time after the burial before the stone can be safely put in place. </p>
</div>
<br />
<h2 class="underline">Alternatives</h2>
<div class="padding-left">
    <p>If a headstone isn’t a viable option, or you personally feel that it wouldn’t be appropriate, there is a range of other options which are often available. Many people opt for a simple plaque in a garden of remembrance, or perhaps a plaque on a bench or seat within the garden. Another alternative is to plant a tree or other plant as a living memorial. The options offered by different cemeteries or places of worship will vary and it may be that you opt to have a memorial placed elsewhere. You might choose to remember your loved one by having a memorial such as a plaque, sundial, birdbath or bench put in a place which you know was special to them, and which you can visit when you wish to feel close to them again. Another possibility is to donate in their name to a community building project or organisation which relies upon charitable donations. In many cases, the building in question will mark the gift with an inscribed brick, tile or plaque. </p>
</div>
<br />
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
    <a href="/Home/SearchbyPostCodeApi">
        <img src="/images/Banners/burialplot.jpg" />
    </a>
</p>', N'Headstones', N'Headstones', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4097, NULL, N'Solicitors', N'Solicitors', N'banner-about101.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4098, N'<p><a href="/Home/SearchbyPostCodeApi" target="_blank"> <img src="/images/Banners/burialplot.jpg"> </a></p><h2>Your Checklist</h2><p>Not everyone want to think about their own demise in later life for one reason or anothe. But making plans for the future is vital – be it looking into potential healthcare options, financial planning, or plans / wishes for your children and their future. In addition to the normal legal and financial arrangements, we should all have a plan for the end of our livesin the form of a memorial or funeral making it known your desire to be cremated or buried — is equally critical. All family members or loved ones would want to respect your wishes on your passing so making them aware of this in advance is critical.</p><p>Our checklist has been put together to make the plans much easier to make and allows you the peace of mind that everything has either been dealt with or thought of in advance and no additional burden is placed on loved ones left behind.</p><p><br></p><h2>Health care</h2><ul><li>If diagnosed with a terminal illness, Think about where/how you would like to die; who do you want with you? And in what surroundings?</li><li>Do you wish to stay at home, or prefer the care and attention given in one of the fantastic Hospices in the UK</li><li>Prepare your advance healthcare directive.</li></ul><p><br></p><h2>Financial Plans</h2><ul><li>Put together a financial factsheet, detailing bank accounts, pensions, shareholdings, gas/ electric providers etc.</li><li>Speak with a tax advisor ref inheritance tax planning, if your estate has assets over £325,000 the sooner this is looked at the better.</li><li>If the worst is to happen and you are no longer capable to make decisions, who will make financial decisions on your behalf.</li><li>Arrange your will, this is more important if you are married or with children. It will help avoid any family conflict and ensure your partner and children are provided for.</li></ul><p><br></p><h2>Personal Items</h2><ul><li>What do you want to happen with your personal belongings?</li><li>Where are specific, special items going and who to? This will include items of value monetary or personal like photos.</li><li>Who is going to be guardian for your children for the immediate time after your death? Have you arranged and sorted paperwork for where my children will go permanently?</li><li>If you have children, have you left letters or videos to them? Creating a video for children and loved ones allows them to remain connected with you, and also allows you to say exactly how you feel if its something you would normally struggle to do. It also acts as a keepsake for future generations of the family to review and give a sense of who you are.</li><li>Do you have passwords for computers and financials that you need to give additional access to?</li></ul><p><br></p><p><br></p><p><a href="/Home/SearchbyPostCodeApi" target="_blank"> <img src="/images/Banners/burialplot.jpg"> </a></p><h2>Funeral planning and logistics</h2><ul><li>Where do you want your body to be taken? Which funeral home/mortuary? Local or is there one in particular you wish to use?</li><li>Do you want to be embalmed? Buried? Cremated? Religion will dictate this to most but if there is no religion, what is your choice?</li><li>What are your burial/casket preferences?</li><li>Who do you want notified of my death?</li><li>Do you want to write my own obituary? Or is there someone in particular you would prefer to write for you?</li><li>Do you want a headstone or memorial? what information do you want on the stone?</li><li>Do you have any special requirements for your ceremony? Military? Religious? Other?</li></ul>', N'A Checklist', N'A-Checklist', N'banner-about51114.jpg', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4099, NULL, N'Planning a Head', N'Planning-a-Head', N'banner-about51114.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4100, NULL, N'Cremation and Cremated Remains', N'Cremation-and-Cremated-Remains', N'banner-about51114.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4114, N'<h2>Burial Plots Pre Need</h2><p>Planning for a funeral is something which people often shy away from, fearing that it may be distressing. The truth of the matter, however, is that people who’ve made arrangements for what will happen in the event of their death generally experience much more peace of mind having done so. After all, nobody wants to think of leaving their loved ones with a financial, emotional and practical burden when they’ve gone. That’s why people write wills and take out life insurance policies. The same forethought can be applied to planning and paying for a funeral, and with the average UK burial funeral now costing £4,136*, anything which can be purchased or planned in advance will help to ease the bereavement process for those left behind.</p><p><br></p><p> </p><h2>Shortage of Burial Plots</h2><p>In recent years one of the most difficult aspects of arranging a funeral has been finding and purchasing a burial plot. The fact that the supply of viable burial plots within the UK has been running low has been acknowledged for some years now, and with the demand for burials remaining strong, both choice and cost have been adversely affected. Burialplots.co.uk was created to address this need, and to do so in a way which offerss convenience and simplicity. We’ve gathered together a selection of plots located in cemeteries across the UK. By accessing our simple search page you can locate the cemetery of your choice and then view the plots available within that cemetery.</p><p>Information such as size, type and cost is provided, and you even have the choice of two different payment options; pay in advance or set up a payment plan. We offer the full range of plots, from single plots to companion plots and even plots for burying cremated remains. Over time, we plan to expand our range into every part of the UK, and to arrange provision in our own dedicated cemeteries...</p><p><br></p><p> </p><p><a href="/Home/SearchbyPostCodeApi" target="_blank"> <img src="/images/Banners/burialplot.jpg"> </a></p><h2>Forward Planning</h2><p>Once you’ve found the plot which exactly meets your requirements, you can use the rest of our site to arrange all of the other aspects of a funeral. From memorial stones and cars to flowers and eulogies, we offer advice and links to all the services needed to pre-plan a funeral in full. Although a funeral director can and will handle all the details – including securing a burial plot – it makes much more sense to pre plan as much of it as possible. Think of pre-planning as the last gift you leave to your loved ones. By purchasing a plot and making arrangements ahead of time you’ll be freeing them from the stress and cost of having to do so whilst coping with losing you. Purchasing a burial plot in advance will deal with one of the trickiest aspects of funeral planning, allowing your nearest and dearest to get on with marking your passing and celebrating your life.</p><p>*The Royal London National Funeral Cost Index Report 2016</p>', N'Future Burial Plot Purchase', N'Future-Burial-Plot-Purchase', N'banner-search.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4115, N'<h2>At Need</h2><p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p><p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p><p>Working independantly, we are able to offer an unbiased opinion on all of the cemetries and the ancillary bereavement services that we have researched to bring to you an information led approach to the right choices.</p><p><br></p><p><br></p><p><a href="/Home/SearchbyPostCodeApi" target="_blank"> <img src="/images/Banners/burialplot.jpg"> </a></p>', N'Purchase a Burial Plot Nows', N'Purchase-a-Burial-Plot-Now', N'banner-search.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4124, N'
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <div class="section sell-block text-left-align">
                <div class="container">
                    <div class="col-sm-12 col-md-8">
                        <h2 class="underline text-left-align">Burial Plots Team</h2>
                        <p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p>
                        <p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p>
                        <p>Working independantly, we are able to offer an unbiased opinion on all of the cemetries and the ancillary bereavement services that we have researched to bring to you an information led approach to the right choices.</p>
                        <a href="#" data-toggle="modal" data-target="#enquiry-form" class="enquiry-btn">Enquiry</a>
                        <br><br>
                        <h3>Multiple Burial Plot Owners</h3>
                        <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</p>
                        <p>Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.</p>
                        <p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus.</p>
                        <a href="#" data-toggle="modal" data-target="#enquiry-form" class="enquiry-btn">Enquiry</a>
                        <br><br>
                        <h3>Individual Burial Plot Owners</h3>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                        <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
                        <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere </p>
                        <br>
                        <a href="#" data-toggle="modal" data-target="#enquiry-form" class="enquiry-btn">Enquiry</a>
                    </div>
                    <div class="col-sm-12 col-md-4">
                        <div class="sell-contact-form">
                            <h3>ENQUIRY FORM</h3>
                            <form action="~/Home/EnquiryFormSellForm" method="Post">
                                <ul class="contact-form">
                                    <li>
                                        <label>Name <span style="color:red">*</span>:</label>
                                        <input name="" id="txtFname" placeholder="" required="" class="aside-text" type="text">
                                        <input name="" id="txtLname" placeholder="" required="" class="aside-text" type="text">
                                    </li>
                                    <li>
                                        <label>Email <span style="color:red">*</span>:</label>
                                        <input name="" id="txtEmail" placeholder="" required="" type="email">
                                    </li>
                                    <li>
                                        <label>Mobile <span style="color:red">*</span>:</label>
                                        <input name="" id="txtMobile" placeholder="" required="" type="text">
                                    </li>
                                    <li>
                                        <label>Message <span style="color:red">*</span>:</label>
                                        <textarea name="" id="txtMessage" required=""></textarea>
                                    </li>
                                    <li>
                                        <input value="Submit" onclick="submitEnquiry()" type="submit">
                                    </li>
                                </ul>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section text-center-align purple-bg">
                <div class="container">
                    <h2>How it Works</h2>
                    <div class="row how-it-works">
                        <div class="col-sm-12 col-md-4">
                            <div class="image-how-it-works">
                                <span class="count-icon">1</span>
                                <a href="#"><img src="/images/enquiry-pic.jpg" alt="" width="169"></a>
                            </div>
                            <h3>Enquire</h3>
                            <p>Maecenas imperdiet nisi lorem, sed fermentum tortor pretium eget. Sed mollis lacus quis nunc cursus cursus. Quisque et magna sit amet sapien fermentum scelerisque eu id massa. </p>
                        </div>
                        <div class="col-sm-12 col-md-4">
                            <div class="image-how-it-works">
                                <span class="count-icon">2</span>
                                <a href="#"><img src="/images/agree-price.jpg" alt="" width="169"></a>
                            </div>
                            <h3>Agree Price</h3>
                            <p>Maecenas imperdiet nisi lorem, sed fermentum tortor pretium eget. Sed mollis lacus quis nunc cursus cursus. Quisque et magna sit amet sapien fermentum scelerisque eu id massa. </p>
                        </div>
                        <div class="col-sm-12 col-md-4">
                            <div class="image-how-it-works">
                                <span class="count-icon">3</span>
                                <a href="#"><img src="/images/sell-pic.jpg" alt="" width="169"></a>
                            </div>
                            <h3>Sell</h3>
                            <p>Maecenas imperdiet nisi lorem, sed fermentum tortor pretium eget. Sed mollis lacus quis nunc cursus cursus. Quisque et magna sit amet sapien fermentum scelerisque eu id massa. </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section text-center-align">
                <div class="container">
                    <h2 class="underline">Sales</h2>
                    <p>BurialPlots.co.uk is a new and innovative way to source a burial plot in the UK. Whether you are considering the purchase of a plot for somebody who has just passed or you are future proofing your own plans by purchasing a pre-need burial plot for you and your family, our interactive guide will help you make the important choice of finding the perfect resting place.</p>
                    <p>Whether it be a grandiose family size mausoleum, a burial at sea, a natural burial or even a tribute to the remembrance of cremated remains, we will help guide you through the process with the minimum of fuss and help you to personalise your wishes.</p>
                    <p><strong>If you need anymore information on the sale of you burial plots please get in touch on 0121 000 000 or fill in one of our enquiry forms</strong></p>
                    <br>
                    <a href="#" data-toggle="modal" data-target="#enquiry-form" class="enquiry-btn">Enquiry</a>
                </div>
            </div>
        </main>
    </div>
<script src="~/js/Market/sell_your_plot.js"></script>
<span>
    <span>
        <span>
            <span>
                <h3 class="text-center-align">Enquiry Form</h3>
                <a href="#" class="js-modal-close close" data-dismiss="modal" style="margin-top:-40px;">×</a>

                <span>
                    <li class="col-sm-12 col-md-4">
                        <label>First Name <span class="red">*</span>: </label>
                        <input name="" id="fName" placeholder="" class="radio1" required="" type="text">
                    </li>
                    <li class="col-sm-12 col-md-4">
                        <label>Last Name <span class="red">*</span>: </label>
                        <input name="" id="lName" class="radio1" placeholder="" required="" type="text">
                    </li>
                    <li class="col-sm-12 col-md-4">
                        <label>Date of Birth <span class="red">*</span>: </label>
                        <div class="input-group date" id="datetimepicker1">
                            <input class="form-control radio1 datepicker" id="DOB" type="text">
                            <span class="input-group-addon">
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                        </div>
                    </li>
                    <li class="col-md-12">
                        <div class="checkbox-block">
                            <span class="labels">Religion :</span>
                            <label>
                                <input class="radio" value="Muslim" name="" id="Muslim" type="checkbox">Muslim
                            </label>
                            <label>
                                <input class="radio" value="Christian" name="" id="Christian" type="checkbox">Christian
                            </label>
                            <label>
                                <input class="radio" value="Catholic" name="" id="Catholic" type="checkbox">Catholic
                            </label>
                            <label>
                                <input class="radio" value="Jewish" name="" id="Jewish" type="checkbox">Jewish
                            </label>
                            <label>
                                <input class="radio" value="Buddhism" name="" id="Buddhism" type="checkbox">Buddhism
                            </label>
                            <label>
                                <input class="radio" value="Hinduism" name="" id="Hinduism" type="checkbox">Hinduism
                            </label>
                            <label>
                                <input class="radio" value="Gnosticism" name="" id="Gnosticism" type="checkbox">Gnosticism
                            </label>
                            <label>
                                <input class="radio" value="Other" name="" id="Other" type="checkbox">Other
                            </label>
                        </div>
                    </li>
                    <li class="col-sm-12 col-md-6">
                        <label>Email <span class="red">*</span>: </label>
                        <input name="" placeholder="" class="radio1" required="" id="Email" type="email">
                    </li>
                    <li class="col-sm-12 col-md-6">
                        <label>Telephone <span class="red">*</span>: </label>
                        <input name="" placeholder="" class="radio1" required="" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" id="Telephone" type="tel">
                    </li>
                    <li class="col-md-12">
                        <label>Address : </label>
                        <textarea name="" id="Address" class="radio1"></textarea>
                    </li>
                    <li class="col-md-12">
                        <div class="checkbox-block">
                            <span class="labels">Current Funeral Plan Provider :</span>
                            <label>
                                <input class="radio" name="" value="Avalon" id="Avalon" type="checkbox">Avalon
                            </label>
                            <label>
                                <input class="radio" name="" value="Dignity" id="Dignity" type="checkbox">Dignity
                            </label>
                            <label>
                                <input class="radio" name="" value="Golden Charter" id="Golden" type="checkbox">Golden Charter
                            </label>
                            <label>
                                <input class="radio" value="from 50" name="" id="from" type="checkbox">from 50
                            </label>
                            <label>
                                <input class="radio" value="Golden Leaves" name="" id="gLeaves" type="checkbox">Golden Leaves
                            </label>
                            <label>
                                <input class="radio" name="" value="Co-operative" id="CoOperative" type="checkbox">Co-operative
                            </label>
                            <label>
                                <input class="radio" value="None" name="" id="None" type="checkbox">None
                            </label>
                        </div>
                    </li>
                    <li class="col-md-12">
                        <label>Cemetery interested : </label>
                        <textarea name="" id="cemeteryInterested" class="radio1"></textarea>
                    </li>
                    <li class="col-md-12">
                        <div class="checkbox-block">
                            <span class="labels">Number of plots :</span>
                            <label>
                                <input class="radio" value="1-2" name="" id="plot2" type="checkbox">1-2
                            </label>
                            <label>
                                <input class="radio" value="2-4" name="" id="plot4" type="checkbox">2-4
                            </label>
                            <label>
                                <input class="radio" value="4-6" name="" id="plot6" type="checkbox">4-6
                            </label>
                            <label>
                                <input class="radio" value="6+" name="" id="plotMore" type="checkbox">6+
                            </label>
                        </div>
                    </li>
                    <li class="col-md-12">
                        <span>Submit</span>
                        @*<span></span>*@
                    </li>
                </span><p>

            </p></span><p>
        </p></span><p>
    </p></span><p>
</p></span>', N'Sell Your Burial Plots', N'Sell-Your-Burial-Plots', N'banner-about94602.jpg', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'اپنے پلاٹ فروخت کریں', N'अपने दफ़नाने वाले भूखंडों को बेचें', N'賣你的埋葬地塊', N'بيع مؤامرات الدفن الخاص بك', N'Vendi i tuoi appezzamenti di sepoltura', N'Mezar Arsalarınızı Satabilirsiniz', N'আপনার পুরাতন প্লট বিক্রয়', N'למכור את המגרשים קבורה')
INSERT [dbo].[Page] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [BodyUrdu], [BodyHindi], [BodyChinese], [BodyArabic], [BodyItalian], [BodyTurkish], [BodyBengali], [BodyHebrew], [TitleUrdu], [TitleHindi], [TitleChinese], [TitleArabic], [TitleItalian], [TitleTurkish], [TitleBengali], [TitleHebrew]) VALUES (4126, N'<p> </p>', N'FAQs', N'FAQs', N'banner-where-to-start51808.jpg', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'<p><br></p>', N'', N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[PageBox] ON 

INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (7, 4045, 1032, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (9, 4045, 1034, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (18, 4051, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (19, 4051, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (20, 4051, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (21, 4051, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (22, 4051, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (23, 4051, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (24, 4051, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (25, 4051, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (26, 4051, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (27, 4051, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (28, 4051, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (40, 4053, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (41, 4053, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (42, 4053, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (43, 4054, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (44, 4054, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (45, 4054, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (46, 4055, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (47, 4055, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (48, 4055, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (49, 4055, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (50, 4055, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (51, 4055, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (52, 4055, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (53, 4055, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (54, 4055, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (55, 4055, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (56, 4055, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (68, 4057, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (69, 4057, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (70, 4057, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (71, 4057, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (72, 4057, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (73, 4057, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (74, 4057, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (75, 4057, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (76, 4057, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (77, 4057, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (78, 4057, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (79, 4058, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (80, 4058, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (81, 4058, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (82, 4058, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (83, 4058, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (84, 4058, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (85, 4058, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (86, 4058, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (87, 4058, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (88, 4058, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (89, 4058, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (90, 4059, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (91, 4059, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (92, 4059, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (93, 4059, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (94, 4059, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (95, 4059, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (96, 4059, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (97, 4059, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (98, 4059, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (99, 4059, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (100, 4059, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (101, 4060, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (102, 4060, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (103, 4060, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (104, 4060, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (105, 4060, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (106, 4060, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (107, 4060, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (108, 4060, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (109, 4060, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (110, 4060, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (111, 4060, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (112, 4061, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (113, 4061, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (114, 4061, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (115, 4061, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (116, 4061, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (117, 4061, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (118, 4061, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (119, 4061, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (120, 4061, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (121, 4061, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (122, 4061, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (123, 4062, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (124, 4062, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (125, 4062, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (126, 4062, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (127, 4062, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (128, 4062, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (129, 4062, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (130, 4062, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (131, 4062, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (132, 4062, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (133, 4062, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (134, 4063, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (135, 4063, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (136, 4063, 1038, NULL)
GO
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (137, 4063, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (138, 4063, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (139, 4063, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (140, 4063, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (141, 4063, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (142, 4063, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (143, 4063, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (144, 4063, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (145, 4064, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (146, 4064, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (147, 4064, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (148, 4064, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (149, 4064, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (150, 4064, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (151, 4064, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (152, 4064, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (153, 4064, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (154, 4064, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (155, 4064, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (156, 4065, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (157, 4065, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (158, 4065, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (159, 4065, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (160, 4065, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (161, 4065, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (162, 4065, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (163, 4065, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (164, 4065, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (165, 4065, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (166, 4065, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (167, 4066, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (168, 4066, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (169, 4066, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (170, 4066, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (171, 4066, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (172, 4066, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (173, 4066, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (174, 4066, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (175, 4066, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (176, 4066, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (177, 4066, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (178, 4067, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (179, 4067, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (180, 4067, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (181, 4067, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (182, 4067, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (183, 4067, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (184, 4067, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (185, 4067, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (186, 4067, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (187, 4067, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (188, 4067, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (189, 4068, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (190, 4068, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (191, 4068, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (192, 4068, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (193, 4068, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (194, 4068, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (195, 4068, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (196, 4068, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (197, 4068, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (198, 4068, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (199, 4068, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (200, 4069, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (201, 4069, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (202, 4069, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (203, 4069, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (204, 4069, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (205, 4069, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (206, 4069, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (207, 4069, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (208, 4069, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (209, 4069, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (210, 4069, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (211, 4070, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (212, 4070, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (213, 4070, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (214, 4070, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (215, 4070, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (216, 4070, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (217, 4070, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (218, 4070, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (219, 4070, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (220, 4070, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (221, 4070, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (222, 4071, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (223, 4072, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (224, 4072, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (225, 4072, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (226, 4072, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (227, 4072, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (228, 4072, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (229, 4072, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (230, 4072, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (231, 4072, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (232, 4072, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (233, 4072, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (256, 4075, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (257, 4075, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (258, 4075, 1038, NULL)
GO
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (259, 4075, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (260, 4075, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (261, 4075, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (262, 4075, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (263, 4075, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (264, 4075, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (265, 4075, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (266, 4075, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (267, 4076, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (268, 4076, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (269, 4076, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (270, 4076, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (271, 4076, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (272, 4076, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (273, 4076, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (274, 4076, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (275, 4076, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (276, 4076, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (277, 4076, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (278, 4077, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (279, 4077, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (280, 4077, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (281, 4077, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (282, 4077, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (283, 4077, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (284, 4077, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (285, 4077, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (286, 4077, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (287, 4077, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (288, 4077, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (289, 4078, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (290, 4078, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (291, 4078, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (292, 4078, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (293, 4078, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (294, 4078, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (295, 4078, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (296, 4078, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (297, 4078, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (298, 4078, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (299, 4078, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (300, 4079, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (301, 4079, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (302, 4079, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (303, 4079, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (304, 4079, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (305, 4079, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (306, 4079, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (307, 4079, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (308, 4079, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (309, 4079, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (310, 4079, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (311, 4080, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (312, 4080, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (313, 4080, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (314, 4080, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (315, 4080, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (316, 4080, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (317, 4080, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (318, 4080, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (319, 4080, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (320, 4080, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (321, 4080, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (322, 4081, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (323, 4081, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (324, 4081, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (325, 4081, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (326, 4081, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (327, 4081, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (328, 4081, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (329, 4081, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (330, 4081, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (331, 4081, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (332, 4081, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (355, 4084, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (356, 4084, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (357, 4084, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (358, 4084, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (359, 4084, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (360, 4084, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (361, 4084, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (362, 4084, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (363, 4084, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (364, 4084, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (365, 4084, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (366, 4085, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (367, 4085, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (368, 4085, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (369, 4085, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (370, 4085, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (371, 4085, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (372, 4085, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (373, 4085, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (374, 4085, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (375, 4085, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (376, 4085, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (377, 4086, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (378, 4086, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (379, 4086, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (380, 4086, 1039, NULL)
GO
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (381, 4086, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (382, 4086, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (383, 4086, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (384, 4086, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (385, 4086, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (386, 4086, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (387, 4086, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (388, 4087, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (389, 4087, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (390, 4087, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (391, 4087, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (392, 4087, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (393, 4087, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (394, 4087, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (395, 4087, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (396, 4087, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (397, 4087, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (398, 4087, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (399, 4088, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (400, 4088, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (401, 4088, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (402, 4088, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (403, 4088, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (404, 4088, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (405, 4088, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (406, 4088, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (407, 4088, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (408, 4088, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (409, 4088, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (421, 4090, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (422, 4090, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (423, 4090, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (424, 4091, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (425, 4091, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (426, 4091, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (428, 2038, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (429, 2038, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (430, 2038, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (431, 2038, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (432, 2038, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (433, 2038, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (434, 2038, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (435, 2038, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (436, 2038, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (437, 2038, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (438, 2038, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (439, 4094, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (440, 4094, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (441, 4094, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (442, 4094, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (443, 4094, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (444, 4094, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (445, 4094, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (446, 4094, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (447, 4094, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (448, 4094, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (449, 4094, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (456, NULL, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (478, 4073, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (479, 4073, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (480, 4073, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (481, 4073, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (482, 4073, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (483, 4073, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (484, 4073, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (485, 4073, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (486, 4073, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (487, 4073, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (488, 4073, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (489, 1029, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (490, 1029, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (491, 1029, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (492, 1029, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (493, 1029, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (494, 1029, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (495, 1029, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (496, 1029, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (497, 1029, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (498, 1029, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (499, 1029, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (500, 4096, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (501, 4096, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (502, 4096, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (503, 4096, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (504, 4096, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (505, 4096, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (506, 4096, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (507, 4096, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (508, 4096, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (509, 4096, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (510, 4096, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (511, 4097, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (512, 4097, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (513, 4097, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (514, 4097, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (515, 4097, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (516, 4097, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (517, 4097, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (518, 4097, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (519, 4097, 1045, NULL)
GO
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (520, 4097, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (521, 4097, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (537, 4099, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (538, 4099, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (539, 4099, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (540, 4099, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (541, 4099, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (542, 4099, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (543, 4099, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (544, 4099, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (545, 4099, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (546, 4099, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (547, 4099, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (548, 4100, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (549, 4100, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (550, 4100, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (551, 4100, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (552, 4100, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (553, 4100, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (554, 4100, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (555, 4100, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (556, 4100, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (557, 4100, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (558, 4100, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (559, 4054, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (560, 4054, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (561, 4054, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (562, 4054, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (563, 4054, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (564, 4054, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (565, 4054, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (566, 4054, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (573, 4114, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (574, 4114, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (575, 4114, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (576, 4115, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (577, 4115, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (578, 4115, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (583, NULL, 1036, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (584, NULL, 1037, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (585, NULL, 1038, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (586, NULL, 1039, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (587, NULL, 1040, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (588, NULL, 1041, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (589, NULL, 1042, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (590, NULL, 1043, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (591, NULL, 1044, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (592, NULL, 1045, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (593, NULL, 1046, 2)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (685, 4124, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (686, 4124, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (687, 4124, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (688, 4124, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (689, 4124, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (690, 4124, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (691, 4124, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (692, 4124, 1046, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (708, 4098, 1036, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (709, 4098, 1037, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (710, 4098, 1038, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (711, 4098, 1039, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (712, 4098, 1040, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (713, 4098, 1041, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (714, 4098, 1042, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (715, 4098, 1043, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (716, 4098, 1044, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (717, 4098, 1045, NULL)
INSERT [dbo].[PageBox] ([Id], [Page], [Box], [UrduPage]) VALUES (718, 4098, 1046, NULL)
SET IDENTITY_INSERT [dbo].[PageBox] OFF
SET IDENTITY_INSERT [dbo].[PartnerPlan] ON 

INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(22 AS Decimal(18, 0)), N'Sponsored Listing (Position 1)', N' SPONSORED LISTINGS APPEAR ABOVE ALL OVER LISTINGS FOR EVERY SEARCH IN A COUNTY AND REMAIN IN THE POSITION FOR EVERY POST TOWN WITH IN A COUNTY. THEY INCLUDE ALL OF THE FEATURES OF A PRIORITY LISTING BUT WITH THE ADDTIONAL FEATURE OF THE BUSINESSES LOGO.', 150, 1, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(23 AS Decimal(18, 0)), N'Sponsored  Listing (Position 2)', N' SPONSORED LISTINGS APPEAR ABOVE ALL OVER LISTINGS FOR EVERY SEARCH IN A COUNTY AND REMAIN IN THE POSITION
                            FOR EVERY POST TOWN WITH IN A COUNTY.
                            THEY INCLUDE ALL OF THE FEATURES OF A PRIORITY LISTING BUT WITH THE ADDTIONAL FEATURE OF THE BUSINESSES LOGO.', 120, 2, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(24 AS Decimal(18, 0)), N'Sponsored  Listing (Position 3)', N'  SPONSORED LISTINGS APPEAR ABOVE ALL OVER LISTINGS FOR EVERY SEARCH IN A COUNTY AND REMAIN IN THE POSITION
                            FOR EVERY POST TOWN WITH IN A COUNTY.
                            THEY INCLUDE ALL OF THE FEATURES OF A PRIORITY LISTING BUT WITH THE ADDTIONAL FEATURE OF THE BUSINESSES LOGO.', 90, 3, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(25 AS Decimal(18, 0)), N'Priority Listing', N'            PIORITY LISTINGS APPEAR ABOVE STANDARD LISTINGS AND INCLUDE ADDITIONAL FEATURES.6 BULLET POINTS TO DESCRIBE

                            YOUR BUSINESS & A WEBSITE LINK TO YOUR BUSINESS WEB ADDRESS.', 130, NULL, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(26 AS Decimal(18, 0)), N'Additional Coverage', N' YOUR BUSINESS LISTED ON BURIAL PLOTS.CO.UK IN ADDIONAL POST TOWNS CHOSEN BY BUSINESS,PRICE BASED ON PER POST TOWN CHOSEN.', 80, NULL, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(27 AS Decimal(18, 0)), N'Additional Coverage (Metro)', N'LONDON
BIRMINGHAM
MANCHESTER', 0, NULL, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(28 AS Decimal(18, 0)), N'Standard Listing', N'YOUR BUSINESS LISTED ON BURIAL PLOTS.CO.UK WITH COMPNAY NAME,ADDRESS & TELEPHONE NUMBER.', 99, NULL, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(29 AS Decimal(18, 0)), N'Lead Purchase', N'BURIAL PLOTS.CO.UK GENERATES LEADS THROUGH A VARIETY OF METHODS,BUSIINESSES CAN PURCHASE THESE LEADS
                            SPECIFIC TO THEIR INDUSTRY FROM USERS READY TO BUY.', 50, NULL, 6, 6)
INSERT [dbo].[PartnerPlan] ([Id], [Title], [Description], [Price], [Position], [PlanPeriods], [FreeListingPeriod]) VALUES (CAST(30 AS Decimal(18, 0)), N'Free Listing', N'This is free plan for add listing with zero price', 0, NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[PartnerPlan] OFF
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Role], [Picture], [PartnerPlanId]) VALUES (CAST(5 AS Decimal(18, 0)), N'Ali', N'Raza', NULL, N'2U0CTxOOyygEfAEmY2s8HJX/M1WCXKXMZFmVGC8V3nTvSbcZAdv7ngoxQQoqmkzC', N'1234', N'wzO3pHoqmCBUOGgRTeJobRfC977vswr3PkSEIUF0t0A=', 1, N'Partner', N'ecigarette36339933.jpg', CAST(22 AS Decimal(18, 0)))
INSERT [dbo].[Partners] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Role], [Picture], [PartnerPlanId]) VALUES (CAST(8 AS Decimal(18, 0)), N'Joan', N'Rae', NULL, N'MBLrYo4WoqoWFVPHL/eKHSJ5x3xaxOQlVS/+BhTn9K0RhGbt2iz6dCh+8IsG7pyv', N'noreply', N'lKmdnJNGcinVm2mYsu907XNq8kIhaFzB8IHiiIMtyj0=', 1, N'Partner', NULL, NULL)
INSERT [dbo].[Partners] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Role], [Picture], [PartnerPlanId]) VALUES (CAST(11 AS Decimal(18, 0)), N'a', N'a', NULL, N'00kxrqUQJyVeJiR9Yqd/ZNsse6TypK5r/9vKFkxNc7I=', N'123', N'bYvlmQPHdNq6pVAg8/iaow==', 0, N'Partner', NULL, NULL)
INSERT [dbo].[Partners] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Role], [Picture], [PartnerPlanId]) VALUES (CAST(12 AS Decimal(18, 0)), N'aa', N'ss', NULL, N'+zB9WxJZ3R4P/p2K3FVgdt4GVLXqNKOn7MnmplhV5DI=', N'12345', N'X4GRZ9M6VewHOJt9VcbYpAqhjkpomZePiBZpBamvLr0=', 1, N'Partner', NULL, NULL)
INSERT [dbo].[Partners] ([Id], [Fname], [Lname], [Username], [Email], [Password], [CellNo], [Active], [Role], [Picture], [PartnerPlanId]) VALUES (CAST(13 AS Decimal(18, 0)), N'dani', N'khan', N'ddk', N'usobNyhZoke4GNw6lKTOkltb+qZ89al+oq98g6ntpn4=', N'123', N'Ml6++tOeikc5U31IpSXCUaOzsO36nTb9Imc3tCLxktA=', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Partners] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([Id], [Name], [InstallationId], [Active]) VALUES (CAST(8 AS Decimal(18, 0)), N'World Pay', N'1212518', 1)
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
SET IDENTITY_INSERT [dbo].[PostCodes] ON 

INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10049 AS Decimal(18, 0)), N'LU1', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10050 AS Decimal(18, 0)), N'LU3', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10051 AS Decimal(18, 0)), N'LU4', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10052 AS Decimal(18, 0)), N'LU5', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10053 AS Decimal(18, 0)), N'LU6', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10054 AS Decimal(18, 0)), N'LU7', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10055 AS Decimal(18, 0)), N'MK17', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10056 AS Decimal(18, 0)), N'MK40', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10057 AS Decimal(18, 0)), N'MK41', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10058 AS Decimal(18, 0)), N'MK42', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10059 AS Decimal(18, 0)), N'MK43', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10060 AS Decimal(18, 0)), N'MK44', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10061 AS Decimal(18, 0)), N'MK45', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10062 AS Decimal(18, 0)), N'NN10', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10063 AS Decimal(18, 0)), N'NN29', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10064 AS Decimal(18, 0)), N'PE18', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10065 AS Decimal(18, 0)), N'PE19', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10066 AS Decimal(18, 0)), N'SG15', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10067 AS Decimal(18, 0)), N'SG16', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10068 AS Decimal(18, 0)), N'SG17', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10069 AS Decimal(18, 0)), N'SG18', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10070 AS Decimal(18, 0)), N'SG19', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10071 AS Decimal(18, 0)), N'SG5', NULL, CAST(N'2017-09-29' AS Date), CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10072 AS Decimal(18, 0)), N'GU47', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10073 AS Decimal(18, 0)), N'OX12', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10074 AS Decimal(18, 0)), N'RG1', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10075 AS Decimal(18, 0)), N'RG10', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10076 AS Decimal(18, 0)), N'RG12', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10077 AS Decimal(18, 0)), N'RG14', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10078 AS Decimal(18, 0)), N'RG17', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10079 AS Decimal(18, 0)), N'RG18', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10080 AS Decimal(18, 0)), N'RG19', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10081 AS Decimal(18, 0)), N'RG2', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10082 AS Decimal(18, 0)), N'RG20', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10083 AS Decimal(18, 0)), N'RG30', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10084 AS Decimal(18, 0)), N'RG31', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10085 AS Decimal(18, 0)), N'RG4', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10086 AS Decimal(18, 0)), N'RG40', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10087 AS Decimal(18, 0)), N'RG41', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10088 AS Decimal(18, 0)), N'RG42', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10089 AS Decimal(18, 0)), N'RG45', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10090 AS Decimal(18, 0)), N'RG5', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10091 AS Decimal(18, 0)), N'RG7', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10092 AS Decimal(18, 0)), N'RG8', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10093 AS Decimal(18, 0)), N'RG9', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10094 AS Decimal(18, 0)), N'SL1', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10095 AS Decimal(18, 0)), N'SL3', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10096 AS Decimal(18, 0)), N'SL4', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10097 AS Decimal(18, 0)), N'SL5', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10098 AS Decimal(18, 0)), N'SL6', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10099 AS Decimal(18, 0)), N'SL7', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10100 AS Decimal(18, 0)), N'TW19', NULL, CAST(N'2017-09-29' AS Date), CAST(10036 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10101 AS Decimal(18, 0)), N'BS1', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10102 AS Decimal(18, 0)), N'BS10', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10103 AS Decimal(18, 0)), N'BS11', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10104 AS Decimal(18, 0)), N'BS13', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10105 AS Decimal(18, 0)), N'BS16', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10106 AS Decimal(18, 0)), N'BS4', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10107 AS Decimal(18, 0)), N'BS6', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10108 AS Decimal(18, 0)), N'BS7', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10109 AS Decimal(18, 0)), N'BS8', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10110 AS Decimal(18, 0)), N'BS9', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10111 AS Decimal(18, 0)), N'BS99', NULL, CAST(N'2017-09-29' AS Date), CAST(10037 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10112 AS Decimal(18, 0)), N'HP10', NULL, CAST(N'2017-09-29' AS Date), CAST(10038 AS Decimal(18, 0)))
INSERT [dbo].[PostCodes] ([Id], [Code], [Description], [AddedDate], [CountyId]) VALUES (CAST(10113 AS Decimal(18, 0)), N'HP11', NULL, CAST(N'2017-09-29' AS Date), CAST(10038 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[PostCodes] OFF
SET IDENTITY_INSERT [dbo].[PurchaseBoxImage] ON 

INSERT [dbo].[PurchaseBoxImage] ([Id], [Image]) VALUES (CAST(1 AS Decimal(18, 0)), N'mainBg75164.jpg')
SET IDENTITY_INSERT [dbo].[PurchaseBoxImage] OFF
SET IDENTITY_INSERT [dbo].[Relgion] ON 

INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(1 AS Decimal(18, 0)), N'Muslim', N'pin77655.png')
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(2 AS Decimal(18, 0)), N'Jewish ', N'samsung78705.png')
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(3 AS Decimal(18, 0)), N'Christian', NULL)
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(4 AS Decimal(18, 0)), N'Buddhism', NULL)
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(5 AS Decimal(18, 0)), N'Hinduism', NULL)
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(6 AS Decimal(18, 0)), N'Gnosticism', NULL)
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(7 AS Decimal(18, 0)), N'Others', NULL)
INSERT [dbo].[Relgion] ([Id], [RelgionName], [Picture]) VALUES (CAST(8 AS Decimal(18, 0)), N'All', NULL)
SET IDENTITY_INSERT [dbo].[Relgion] OFF
SET IDENTITY_INSERT [dbo].[ServiceBox] ON 

INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (34, N'Fir KUb Giigke', N'blog-pic260980.jpg', 1029, N'sdf asdf sdf sdf dg fdfgh dgfhfghdg', 1, N'https://www.google.com.pk/?gws_rd=cr&ei=o9zoWLD8FsOnaKaOoqgO', 0, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (35, N'for wiht othth', N'block-pic228853.jpg', 1029, N'sdf asdf sdf sdf dg fdfgh dgfhfghdg', 1, N'http://www.google.com', 0, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (36, N'for wiht othth', N'block-pic191563.jpg', 1029, N'', 0, N'http://www.google.com', 0, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (37, N'for wiht othth', N'block-pic341239.jpg', 1029, N'', 0, N'CARS', 1, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1032, N'Google', N'banner-173174.jpg', NULL, N'This Is For GOolge', 1, N'CARS', 1, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1034, N'Where To Start', N'banner-where-to-start71728.jpg', NULL, N'', 0, N'WHERE-TO-START', 1, NULL, NULL)
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1036, N'Burial Plots', N'block-pic139558.jpg', NULL, N'', 1, N'BURIAL-PLOTS ', 1, N'تدفین کے پلاٹس', N'PIANI BURALI')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1037, N'Helpful Advice', N'burial-block-pic294194.jpg', NULL, N'', 1, N'HELPFUL-ADVICE', 1, N'مفید مشورہ', N'CONSIGLI HELPFUL')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1038, N'Legal', N'burial-block-pic364378.jpg', NULL, N'', 1, N'LEGAL', 1, N'قانونی طریقہ', N'LEGALE')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1039, N'Where To start', N'service-block157003.jpg', NULL, N'', 0, N'WHERE-TO-START', 1, N'کہاں سے شروع', N'Dove iniziare')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1040, N'Checklist', N'service-block230307.jpg', NULL, N'', 0, N'A-Checklist', 1, N'ایک چیک لسٹ', N'lista di controllo')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1041, N'Funerals', N'service-block336849.jpg', NULL, N'', 0, N'FUNERALS', 1, N'جنازہ', N'Funerale')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1042, N'Funeral Directors', N'service-block421892.jpg', NULL, N'', 0, N'FUNERAL-DIRECTORS', 1, N'جنازے کے ڈائریکٹرز', N'DIRETTORI FUNERALI')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1043, N'After funeral', N'service-block524191.jpg', NULL, N'', 0, N'AFTER-FUNERAL', 1, N'جنازے کے بعد', N'DOPO FUNERALE')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1044, N'Memorial', N'service-block637336.jpg', NULL, N'', 0, N'MEMORIALS', 1, N'یادگار', N'MEMORIALS')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1045, N'Stonemasons', N'service-block766368.jpg', NULL, N'', 0, N'STONEMASONS', 1, N'سنگتراش', N'Aziende scalpellini')
INSERT [dbo].[ServiceBox] ([Id], [BoxName], [BoxPic], [BoxUrl], [BoxDescription], [BoxStatus], [ServiceUrl], [UrlStatus], [BoxNameInUrdu], [BoxNameInItalian]) VALUES (1046, N'Services', N'service-block887525.jpg', NULL, N'', 0, N'SERVICES', 1, N'خدمات', N'Servizi')
SET IDENTITY_INSERT [dbo].[ServiceBox] OFF
SET IDENTITY_INSERT [dbo].[ServiceListingPlans] ON 

INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(15 AS Decimal(18, 0)), CAST(10089 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)), CAST(30069 AS Decimal(18, 0)), CAST(N'2017-04-23' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(23 AS Decimal(18, 0)), CAST(10089 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(30073 AS Decimal(18, 0)), CAST(N'2017-04-23' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(24 AS Decimal(18, 0)), CAST(10089 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), CAST(30073 AS Decimal(18, 0)), CAST(N'2018-04-23' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(31 AS Decimal(18, 0)), CAST(10089 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(30077 AS Decimal(18, 0)), CAST(N'2018-04-25' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(32 AS Decimal(18, 0)), CAST(10090 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(30077 AS Decimal(18, 0)), CAST(N'2017-10-25' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(33 AS Decimal(18, 0)), CAST(10089 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(30078 AS Decimal(18, 0)), CAST(N'2018-10-25' AS Date))
INSERT [dbo].[ServiceListingPlans] ([Id], [CountyId], [BusinessId], [PlanId], [ServiceListId], [ExpiryDate]) VALUES (CAST(34 AS Decimal(18, 0)), CAST(10090 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(28 AS Decimal(18, 0)), CAST(30079 AS Decimal(18, 0)), CAST(N'2018-10-25' AS Date))
SET IDENTITY_INSERT [dbo].[ServiceListingPlans] OFF
SET IDENTITY_INSERT [dbo].[ServicesListingApproval] ON 

INSERT [dbo].[ServicesListingApproval] ([Id], [Status]) VALUES (CAST(1 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[ServicesListingApproval] OFF
SET IDENTITY_INSERT [dbo].[SeviceListing] ON 

INSERT [dbo].[SeviceListing] ([Id], [BusinessName], [PostCode], [Address], [PhoneNo], [Website], [BusinessClassification], [FuneralServiceId], [Picture], [IsApproved], [Address1], [Address2], [Number], [Town], [County], [Country], [Latitude], [Longitude], [ServicesAndProducts], [BusinessDescription], [PartnerId], [PaymentGateways], [SocialIcons], [FacebookLink], [TwitterLink], [GooglePlusLink], [CountiesId], [CountiesName], [NationWide], [LinkedIn]) VALUES (CAST(30069 AS Decimal(18, 0)), N'will writer in sli', N'gu229ft', N'15 Jelley Way, , , , , Woking, Surrey gu229ft', N'12341234', N'sdfsd.com', NULL, NULL, N'article-1010515.jpg', 1, N'15 Jelley Way', NULL, NULL, N' Woking', N'Surrey', N'UK', N'51.2976140634296', N'-0.556136230495062', N'this is solicitor', N'this is business', CAST(8 AS Decimal(18, 0)), N'Electron,Solo', NULL, N'facebook.com', N'twitter.com', N'gmail.com', NULL, NULL, NULL, N'linkedin.com')
INSERT [dbo].[SeviceListing] ([Id], [BusinessName], [PostCode], [Address], [PhoneNo], [Website], [BusinessClassification], [FuneralServiceId], [Picture], [IsApproved], [Address1], [Address2], [Number], [Town], [County], [Country], [Latitude], [Longitude], [ServicesAndProducts], [BusinessDescription], [PartnerId], [PaymentGateways], [SocialIcons], [FacebookLink], [TwitterLink], [GooglePlusLink], [CountiesId], [CountiesName], [NationWide], [LinkedIn]) VALUES (CAST(30073 AS Decimal(18, 0)), N'Testing', N'gu229ft', N'', N'12341234', N'', NULL, NULL, N'', NULL, N'10 Jelley Way', NULL, NULL, N'Woking', N'Surrey', N'UK', N'', N'', N'aaaa
bbbb
ccccc
dddd', N'aaa bbb ccc dd ee', CAST(5 AS Decimal(18, 0)), N'Visa,Electron,Solo', NULL, N'facebook.com', N'', N'gmail.com', NULL, NULL, NULL, N'linkedin')
INSERT [dbo].[SeviceListing] ([Id], [BusinessName], [PostCode], [Address], [PhoneNo], [Website], [BusinessClassification], [FuneralServiceId], [Picture], [IsApproved], [Address1], [Address2], [Number], [Town], [County], [Country], [Latitude], [Longitude], [ServicesAndProducts], [BusinessDescription], [PartnerId], [PaymentGateways], [SocialIcons], [FacebookLink], [TwitterLink], [GooglePlusLink], [CountiesId], [CountiesName], [NationWide], [LinkedIn]) VALUES (CAST(30077 AS Decimal(18, 0)), N'Techbro', N'61010', N'', N'3085287903', N'werw', NULL, NULL, N'677097.jpg', 1, N'fvsdv', NULL, NULL, N'sfdvsdfv', N'sdfvsdf', N'gbrg', N'', N'', N'fvsdfv
sdbgfb
sdfvsdfvs
dsd
sgbsgdb', N'sdfvsdf sdfsg sfg sefsdg sfsdg aff ssdf ', CAST(5 AS Decimal(18, 0)), N'Visa,Maestro,Electron,Solo', NULL, N'wevfwe', N'werfwer', N'dfvsdf', NULL, NULL, NULL, N'werggb')
INSERT [dbo].[SeviceListing] ([Id], [BusinessName], [PostCode], [Address], [PhoneNo], [Website], [BusinessClassification], [FuneralServiceId], [Picture], [IsApproved], [Address1], [Address2], [Number], [Town], [County], [Country], [Latitude], [Longitude], [ServicesAndProducts], [BusinessDescription], [PartnerId], [PaymentGateways], [SocialIcons], [FacebookLink], [TwitterLink], [GooglePlusLink], [CountiesId], [CountiesName], [NationWide], [LinkedIn]) VALUES (CAST(30078 AS Decimal(18, 0)), N'Techbro', N'61010', N'', N'sdfbsf', N'dfgbgn', NULL, NULL, N'', 1, N'dvfbdfb', NULL, NULL, N'sdfbsdfb', N'punjabfghnf', N'fhnfg', N'', N'', N'sdfsgbfdbg', N'sfgsdf', CAST(5 AS Decimal(18, 0)), N'Visa,Maestro,Electron', NULL, N'dfgbdfg', N'dfgf', N'sfdg', NULL, NULL, NULL, N'sdfg')
INSERT [dbo].[SeviceListing] ([Id], [BusinessName], [PostCode], [Address], [PhoneNo], [Website], [BusinessClassification], [FuneralServiceId], [Picture], [IsApproved], [Address1], [Address2], [Number], [Town], [County], [Country], [Latitude], [Longitude], [ServicesAndProducts], [BusinessDescription], [PartnerId], [PaymentGateways], [SocialIcons], [FacebookLink], [TwitterLink], [GooglePlusLink], [CountiesId], [CountiesName], [NationWide], [LinkedIn]) VALUES (CAST(30079 AS Decimal(18, 0)), N'Techbro', N'61010', N'', N'3085287903', N'sfgd', NULL, NULL, N'', 1, N'burewala vehari', NULL, NULL, N'burewala', N'punjab', N'Pakistan', N'', N'', N'sdfvsd', N'sdfgsdf', CAST(5 AS Decimal(18, 0)), N'Visa,Electron', NULL, N'sdf', N'sdfsdf', N'sdfsd', NULL, NULL, NULL, N'fdgg')
SET IDENTITY_INSERT [dbo].[SeviceListing] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([Id], [Name], [SlideImages]) VALUES (CAST(4 AS Decimal(18, 0)), NULL, N'banner-1788446659.jpg')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Caption], [Image], [SliderId], [CaptionUrdu], [CaptionArabic], [CaptionHindi], [CaptionChinese], [CaptionItalian], [CaptionTurkish], [CaptionBengali], [CaptionHebrew]) VALUES (CAST(4 AS Decimal(18, 0)), N'Burial Plots', N'BURIAL SPACE IN THE UK COULD
RUN OUT WITHIN THE NEXT 20 YEARS', N'banner-burial7863.jpg', CAST(4 AS Decimal(18, 0)), N'برطانیہ میں تدفین کی جگہ اگلے
20 سال میں ختم ہو جائے گی۔', N'بوريال الفضاء في المملكة المتحدة يمكن
تشغيل في غضون السنوات ال 20 المقبلة', N'यूके में बॉरियल स्पेस हो सकता है
अगले 20 वर्षों में बाहर निकलें', N'英國的空氣空間可能
在下一個20年內運行', N'IL PAESAGGIO BURALE IN UK HA POTATO
FACCIAMO NEL 20 GIORNI SUCCESSIVI', N'İngiltere''de yargısız alan, ölecek
SONRAKİ 20 YILDA ÇALIŞTIRILMIŞTIR', N'যুক্তরাজ্যের বৌদ্ধ ভাস্কর্যটি হতে পারে
পরের 20 বছরের মধ্যে রান আউট', N'מרחב חילוני בבריטניה
תרוץ בתוך 20 השנים הבאות')
INSERT [dbo].[Slides] ([Id], [Name], [Caption], [Image], [SliderId], [CaptionUrdu], [CaptionArabic], [CaptionHindi], [CaptionChinese], [CaptionItalian], [CaptionTurkish], [CaptionBengali], [CaptionHebrew]) VALUES (CAST(10 AS Decimal(18, 0)), N'Burial Plots', N'BURIAL SPACE IN THE UK COULD
RUN OUT WITHIN THE NEXT 20 YEARS', N'banner-about67144.jpg', CAST(4 AS Decimal(18, 0)), N'برطانیہ میں تدفین کی جگہ اگلے
20 سال میں ختم ہو جائے گی۔', N'بوريال الفضاء في المملكة المتحدة يمكن
تشغيل في غضون السنوات ال 20 المقبلة', N'यूके में बॉरियल स्पेस हो सकता है
अगले 20 वर्षों में बाहर निकलें', N'英國的空氣空間可能
在下一個20年內運行', N'IL PAESAGGIO BURALE IN UK HA POTATO
FACCIAMO NEL 20 GIORNI SUCCESSIVI', N'İngiltere''de yargısız alan, ölecek
SONRAKİ 20 YILDA ÇALIŞTIRILMIŞTIR', N'যুক্তরাজ্যের বৌদ্ধ ভাস্কর্যটি হতে পারে
পরের 20 বছরের মধ্যে রান আউট', N'מרחב חילוני בבריטניה
תרוץ בתוך 20 השנים הבאות')
INSERT [dbo].[Slides] ([Id], [Name], [Caption], [Image], [SliderId], [CaptionUrdu], [CaptionArabic], [CaptionHindi], [CaptionChinese], [CaptionItalian], [CaptionTurkish], [CaptionBengali], [CaptionHebrew]) VALUES (CAST(30 AS Decimal(18, 0)), N'Burial Plots', N'Burial Space In the uk could
run out within the next 20 years', N'banner-where-to-start69727.jpg', CAST(4 AS Decimal(18, 0)), N'برطانیہ میں تدفین کی جگہ اگلے
20 سال میں ختم ہو جائے گی۔', N'بوريال الفضاء في المملكة المتحدة يمكن
تشغيل في غضون السنوات ال 20 المقبلة', N'यूके में बॉरियल स्पेस हो सकता है
अगले 20 वर्षों में बाहर निकलें', N'英國的空氣空間可能
在下一個20年內運行', N'IL PAESAGGIO BURALE IN UK HA POTATO
FACCIAMO NEL 20 GIORNI SUCCESSIVI', N'İngiltere''de yargısız alan, ölecek
SONRAKİ 20 YILDA ÇALIŞTIRILMIŞTIR', N'যুক্তরাজ্যের বৌদ্ধ ভাস্কর্যটি হতে পারে
পরের 20 বছরের মধ্যে রান আউট', N'מרחב חילוני בבריטניה
תרוץ בתוך 20 השנים הבאות')
INSERT [dbo].[Slides] ([Id], [Name], [Caption], [Image], [SliderId], [CaptionUrdu], [CaptionArabic], [CaptionHindi], [CaptionChinese], [CaptionItalian], [CaptionTurkish], [CaptionBengali], [CaptionHebrew]) VALUES (CAST(33 AS Decimal(18, 0)), N'Burial Plots', N'BURIAL SPACE IN THE UK COULD 
RUN OUT WITHIN THE NEXT 20 YEARS', N'banner-178844.jpg', CAST(4 AS Decimal(18, 0)), N'برطانیہ میں تدفین کی جگہ اگلے
20 سال میں ختم ہو جائے گی۔', N'بوريال الفضاء في المملكة المتحدة يمكن
تشغيل في غضون السنوات ال 20 المقبلة', N'यूके में बॉरियल स्पेस हो सकता है
अगले 20 वर्षों में बाहर निकलें', N'英國的空氣空間可能
在下一個20年內運行', N'IL PAESAGGIO BURALE IN UK HA POTATO
FACCIAMO NEL 20 GIORNI SUCCESSIVI', N'İngiltere''de yargısız alan, ölecek
SONRAKİ 20 YILDA ÇALIŞTIRILMIŞTIR', N'যুক্তরাজ্যের বৌদ্ধ ভাস্কর্যটি হতে পারে
পরের 20 বছরের মধ্যে রান আউট', N'מרחב חילוני בבריטניה
תרוץ בתוך 20 השנים הבאות')
SET IDENTITY_INSERT [dbo].[Slides] OFF
SET IDENTITY_INSERT [dbo].[SubChlidMenu] ON 

INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (15, 1024, N'AFTER FUNERAL', N'AFTER FUNERALS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (16, 1024, N'MEMORIALS', N'MEMORIALS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (17, 1024, N'STONEMASONS', N'STONEMASONS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (39, 1024, N'BURIAL PLOTS NOW', N'BURIAL PLOTS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (57, 1024, N'Bereavement', N'BERAVEMENT')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (58, 1025, N'AFTER FUNERAL', N'AFTER FUNERAL')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (59, 1025, N'STONEMASONS', N'STONEMASONS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (60, 1026, N'ARRANGING', N'ARRANGING')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (61, 1027, N'SERVICES', N'SERVICES')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (62, 1027, N'Coffins', N'COFFINS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (63, 1027, N'FLORISTS', N'FLORISTS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (64, 1027, N'CARS', N'CARS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (65, 1027, N'FUNERAL PLANS', N'FUNERAL PLANS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (69, 1030, N'DEALING WITH LOSS OF A CHILD', N'DEALING WITH CHILDREN')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (70, 1030, N'PARENTAL GRIEF', N'PARENTAL GRIEF')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (71, 1030, N'SHOCK OF SUDDEN DEATH', N'SHOCK OF SUDDEN DEATH')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (72, 1030, N'SUICIDE', N'SUICIDE')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (73, 1030, N'HELPFUL ORGS', N'HELPFUL ORGS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (74, 1033, N'WILLS', N'WILLS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (75, 1033, N'LIFE INSURANCE', N'LIFE INSURANCE')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (76, 1033, N'WILL WRITING', N'WILL WRITING')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (77, 1033, N'SERVICES', N'SERVICES')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (78, 1034, N'PRESS COVERAGE', N'PRESS COVERAGE')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (79, 1034, N'NEWSFEED', N'NEWSFEED')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1074, 2033, N'WHO AND WHY', N'WHO AND WHY')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1075, 2033, N'TEAM', N'TEAM')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1076, 2033, N'TESTIMONIALS', N'TESTIMONIALS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1077, 1025, N'MEMORIALS', N'MEMORIALS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1078, 1030, N'WRITING EULAGIES', N'WRITING EULAGIES')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1079, 1030, N'HEALING PROCESS', N'HEALING PROCESS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1080, 1030, N'FAQs', N'FAQS')
INSERT [dbo].[SubChlidMenu] ([Id], [MenuId], [PageUrl], [PageTitle]) VALUES (1083, 1024, N'CARS', N'Test Menu')
SET IDENTITY_INSERT [dbo].[SubChlidMenu] OFF
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1024, 20, N'/Admin/Page/PageView/LEGAL', N'REGIONS')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1025, 21, N'/Admin/Page/PageView/WHERE TO START', N'WHERE TO START')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1026, 21, N'FUNERALS', N'FUNERALS')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1027, 21, N'FUNERAL DIRECTORS', N'FUNERAL DIRECTORS')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1030, 23, N'/Admin/Page/PageView/HELPFUL ADVICE', N'HELPFUL ADVICE')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1033, 1024, N'/Admin/Page/PageView/PROBATE', N'PROBATE')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (1034, 1025, N'/Admin/Page/PageView/PRESS AND NEWS', N'PRESS & NEWS')
INSERT [dbo].[submenu] ([Id], [menuId], [pageurl], [pagetitle]) VALUES (2033, 22, N'/Admin/Page/PageView/ABOUTUS', N'ABOUT US')
SET IDENTITY_INSERT [dbo].[submenu] OFF
SET IDENTITY_INSERT [dbo].[SubRelgion] ON 

INSERT [dbo].[SubRelgion] ([Id], [SubRelgionName], [RelgioId]) VALUES (CAST(1 AS Decimal(18, 0)), N'Sunni', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[SubRelgion] ([Id], [SubRelgionName], [RelgioId]) VALUES (CAST(2 AS Decimal(18, 0)), N'Shia', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[SubRelgion] ([Id], [SubRelgionName], [RelgioId]) VALUES (CAST(3 AS Decimal(18, 0)), N'abc', CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[SubRelgion] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(2 AS Decimal(18, 0)), N'Graham Rowen', N'Our Chairman has extensive experience in the property and investment world where he runs Elite Investor Club, a global network of sophisticated and high net worth investors. An author, speaker and television personality, in the last 2 years he has been invited to speak at the United Nations in New York, Harvard Business School in Boston and both houses of Parliament in the UK. A serial entrepreneur, he also owns Who’s Who Publications, is a partner in a TV production company and is playing a leading role in developing a bilateral crowdfunding platform between the UK and China. ', N'Chairman', N'chairman39517.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(3 AS Decimal(18, 0)), N'Jason Oakley', N'Jason built the lending business in Metro Bank as Managing Director Commercial Banking from £65m to over £2.3bn in less than 3 years with an income stream of approximately £100m and market leading margins. Prior to this he was Head of SME for NatWest & RBS with over 3,000 relationship managers looking after over 1m clients and over £1bn of revenue. Since leaving Metro in 2015 Jason set up Commercial Finance brokerage Mantra Capital which has closed over £260m of loans since inception in August 2015. He added directly regulated FCA permissions to Mantra''s proposition.', N'Non Executive director', N'jason49959.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(4 AS Decimal(18, 0)), N'Christian Hipkiss', N'With a proven track record in the sales industry, Christian has spent the last 12 years running a number of assetbacked investment businesses showing investors how to increase their yields, protecting growth and minimising losses. In addition he previously owned and operated a successful company with offices in multiple locations in the UK, before being head hunted for the investment industry. He has been involved in the acquisition of two UK cemeteries in the last 2 years', N'CEO', N'christian75822.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(5 AS Decimal(18, 0)), N'Gerard Gordon', N'Gerard spent three years working as governance director for an investment company in Canary Wharf, gaining invaluable experience and contacts. He has successfully negotiated the acquisition of over 10,000 burial plots for various religious groups in the last 3 years.

Gerard is self-directing, assertive and attentive to detail, and absolutely focused on professionalism, honesty and transparency in business.', N'COO', N'gerard19458.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(6 AS Decimal(18, 0)), N'Debby Cavill', N'Debby is best known for being instrumental in developing Jewellery TV in the UK and across Europe. Successfully taking two jewellery businesses to market, the first still being one of the largest IPO’s ever on the Hong Kong Stock Exchange. Well adversed in the e-commerce sector, her current business interests include the largest e-commerce jewellery business in Europe. Debby other businesses include a rehab centre in Thailand, property / development companies, manufacturing outlets and strategic land purchases.', N'Non Executive director', N'debby95535.jpg')
INSERT [dbo].[Teams] ([Id], [Name], [Description], [Post], [Image]) VALUES (CAST(7 AS Decimal(18, 0)), N'Adam Hicken', N'Adam is a marketing expert with over 10 years experience in his field. Having already held CTO roles in an international group of companies he brings a wealth of knowledge in how to build, develop and roll out a new online portal to the market, having already rolled out a number of multi million pound projects.

As well as being an expert in this type of technology Adam also has vast experience in online and offline marketing having worked for some of the largest companies in the UK specialising in this field.', N'CTO', N'adam67370.jpg')
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[Tiers] ON 

INSERT [dbo].[Tiers] ([Id], [Name], [Description]) VALUES (CAST(1 AS Decimal(18, 0)), N'Normal', NULL)
INSERT [dbo].[Tiers] ([Id], [Name], [Description]) VALUES (CAST(2 AS Decimal(18, 0)), N'Premium', NULL)
INSERT [dbo].[Tiers] ([Id], [Name], [Description]) VALUES (CAST(3 AS Decimal(18, 0)), N'Gold', NULL)
SET IDENTITY_INSERT [dbo].[Tiers] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10443 AS Decimal(18, 0)), N'Ampthill', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10444 AS Decimal(18, 0)), N'Apsley End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10445 AS Decimal(18, 0)), N'Arlesey', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10446 AS Decimal(18, 0)), N'Aspley Guise', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10447 AS Decimal(18, 0)), N'Aspley Heath', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10448 AS Decimal(18, 0)), N'Astwick', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10449 AS Decimal(18, 0)), N'Ballingdon Bottom', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10450 AS Decimal(18, 0)), N'Barton-le-Clay', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10451 AS Decimal(18, 0)), N'Battlesden', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10452 AS Decimal(18, 0)), N'Beadlow', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10453 AS Decimal(18, 0)), N'Bedford', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10454 AS Decimal(18, 0)), N'Beecroft', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10455 AS Decimal(18, 0)), N'Beeston', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10456 AS Decimal(18, 0)), N'Biddenham', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10457 AS Decimal(18, 0)), N'Bidwell', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10458 AS Decimal(18, 0)), N'Biggleswade', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10459 AS Decimal(18, 0)), N'Billington', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10460 AS Decimal(18, 0)), N'Birchmoor Green', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10461 AS Decimal(18, 0)), N'Biscot', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10462 AS Decimal(18, 0)), N'Bletsoe', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10463 AS Decimal(18, 0)), N'Blunham', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10464 AS Decimal(18, 0)), N'Bolnhurst', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10465 AS Decimal(18, 0)), N'Bougton End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10466 AS Decimal(18, 0)), N'Bourne End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10467 AS Decimal(18, 0)), N'Box End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10468 AS Decimal(18, 0)), N'Brickhill', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10469 AS Decimal(18, 0)), N'Bridge End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10470 AS Decimal(18, 0)), N'Broad Green', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10471 AS Decimal(18, 0)), N'Brogborough', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10472 AS Decimal(18, 0)), N'Bromham', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10473 AS Decimal(18, 0)), N'Brook End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10474 AS Decimal(18, 0)), N'Broom', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10475 AS Decimal(18, 0)), N'Bury End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10476 AS Decimal(18, 0)), N'Bury Park', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10477 AS Decimal(18, 0)), N'Bushmead', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10478 AS Decimal(18, 0)), N'Caddington', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10479 AS Decimal(18, 0)), N'Cam (Rhee)', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10480 AS Decimal(18, 0)), N'Campton', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10481 AS Decimal(18, 0)), N'Cardington', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10482 AS Decimal(18, 0)), N'Carlton', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10483 AS Decimal(18, 0)), N'Caulcott', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10484 AS Decimal(18, 0)), N'Chadwell End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10485 AS Decimal(18, 0)), N'Chalgrave', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10486 AS Decimal(18, 0)), N'Chalton', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10487 AS Decimal(18, 0)), N'Chapel End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10488 AS Decimal(18, 0)), N'Chaul End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10489 AS Decimal(18, 0)), N'Chawston', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10490 AS Decimal(18, 0)), N'Chellington', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10491 AS Decimal(18, 0)), N'Chicksands', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10492 AS Decimal(18, 0)), N'Chiltern Green', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10493 AS Decimal(18, 0)), N'Church End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10494 AS Decimal(18, 0)), N'Clapham', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10495 AS Decimal(18, 0)), N'Clapham Green', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10496 AS Decimal(18, 0)), N'Clifton', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10497 AS Decimal(18, 0)), N'Clipstone', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10498 AS Decimal(18, 0)), N'Clipstone Brook', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10499 AS Decimal(18, 0)), N'Cliton Manor', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10500 AS Decimal(18, 0)), N'Clophill', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10501 AS Decimal(18, 0)), N'Cockayne Hatley', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10502 AS Decimal(18, 0)), N'Cockernhoe', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10503 AS Decimal(18, 0)), N'Colesden', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10504 AS Decimal(18, 0)), N'Colmworth', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10505 AS Decimal(18, 0)), N'Colworth Ho', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10506 AS Decimal(18, 0)), N'Cople', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10507 AS Decimal(18, 0)), N'Cotton End', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
INSERT [dbo].[Towns] ([Id], [Name], [Description], [AddedDate], [CountyId]) VALUES (CAST(10508 AS Decimal(18, 0)), N'Covington', NULL, N'9/29/2017', CAST(10035 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Towns] OFF
SET IDENTITY_INSERT [dbo].[UrduPage] ON 

INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (1, N' <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ – یادگاریں</h2>
                    <div class="padding-left">
                      <p>حالانکہ ہر فرد اپنے پیارے کے کھونے کے معاملات اپنے ذاتی طریقے سے  کرے گا، ایک چیز جس میں لوگ مرحوم کے لئے ہمیشہ رہنے والی یادگار کی موجودگی میں آرام تلاش کرتےہیں۔ یادگار کی سب سے عام شکل غالباً ایک ہے جو قبر پر ہوتی ہے اگر حالات اجازت دیتے ہیں اس کو کوئی بھی شکل دی جاسکتی ہے جیسی آپ چاہیں۔ یادگار کے انتخاب میں پسند کرنے کی اہم چیز وہ ہے جو آپ کو وہاں لے کر جائے جب آپ خواہش محسوس کریں قریب ترین جانے کی جسے آپ کھوچکے ہیں۔ چونکہ مرحوم غالباً زیادہ تر آپ کے ذہن میں موجود ہوتا ہے، روزمرہ کی زندگی میں یادگار پاکیزگی فراہم کرتی ہے اور آپ کی سوچوں، احساسات اور یادوں پر خاص توجہ دیتی ہے۔  </p>
                      <p>Burialplots.co.uk مشکلات کو ختم کرنے کے لئے بنائی گئی تھی جب لوگ تدفین کے پلاٹ خریدنے کی کوشش کرتے تو انہیں اکثر زیادہ اور بہت زیادہ پریشانی کا سامنا کرتے۔ چاہے زیر بحث پلاٹ کسی عزیز کے لئے درکار ہو جس نے ابھی وفات پائی ہے یا یہ خریدا ہو جنازے کے لئے پیشگی منصوبہ بندی میں حصہ کے طور پر، اس مسئلے کی حقیقت یہ ہے کہ ملک کے کئی حصوں میں مانگ فراہمی سے کہیں زیادہ بڑھ گئی ہے۔ ہم نے جدید ترین ٹیکنالوجی استعمال کر کےآپ کی پسند کے مقام پر تدفین کے پلاٹ کی تلاش اور ادائیگی کے انتخاب کو پسند کرنے کے لئے اسے آسان تر کیا ہے جو سستی اور آسان فراہمی ہے۔ ہم مدد اور درکار معلومات کا وسیع سلسلہ بھی جمع کرکے لائے ہیں جب کسی کی وفات ہو اور اس میں دستیاب یادگاروں کی بڑی تعداد شامل ہے۔  </p>
                    </div>
                    <br />
                    <h2 class="underline">کتبہ</h2>
                    <div class="padding-left">
                      <p>اگر آپ مرحوم کے لئے یادگار کے طور پر روایتی کتبے کی تلاشکو چنتے ہیں تو آپ کو زیر بحث جگہ پر قبرستان کے قواعد دیکھنے چاہئیے۔ قواعد کے بارے میں کئی پہلو ہوسکتے ہیں جیسے پتھر کا سائز اور شکل  اس کے ساتھ ساتھ اس کا رنگ اور لفظوں کے قسم کی اجازت۔ مہربانی فرما کر یہ بھی ذہن میں رکھیں کہ بعض اوقات آپ کو تدفین کے بعد پتھر کو حفاظت سے جگہ پر رکھنے سے پہلے انتظار کرنا پڑسکتا ہے۔</p>
                    </div>
                      <br />
                    <h2 class="underline">متبادل</h2>
                    <div class="padding-left">
                      <p>اگر کتبہ ایک قابل عمل انتخاب نہ ہو یا آپ ذاتی طور پر محسوس کرتے ہیں کہ یہ مناسب نہیں ہوگا تو یہاں دوسرے چیزوں کا بڑا سلسلہ ہے جو اکثر دستیاب ہوتی ہیں۔ کئی لوگ صرف یاد کے باغ میں تختی لگانے کو پسند کرتے ہیں یا شاید بینچ پر ایک تختی یا باغ کے اندر نشست پر۔ دوسرا متبادل درخت لگانا یا دوسرے پودا بطور زندہ یادگار ہے۔ انتخابات مختلف قبرستانوں یا عبادت گاہوں کی جگہوں سے فراہم کیے جاتے ہیں جو مختلف ہوں گے اور یہ بھی ہوسکتا ہے کہ آپ یادگار جگہ کسی اور جگہ کے لئے پسند کریں۔ آپ یادگار سے جیسے تختی، دھوپ گھڑی، پرندوں کے نہانے کا برتن یا بینچ  اپنے عزیز کو یاد کرنے کے لئے وہاں رکھنا پسند کرتے ہیں جو آٌپ جانتے ہیں کہ ان کے لئے خاص تھی اور جس میں آپ جب چاہیں دوبارہ انہیں قریب محسوس کرنے کے لئے جاسکتے ہیں۔ دوسرے ممکنات میں ان کے نام پر کمیونٹی کی عمارت کے پروجیکٹ یا تنظیم کے لئے عطیہ دیں جو خیراتی عطیات پر بھروسہ کرتی ہیں۔ بہت سے معاملات میں، زیر بحث عمارت کے نشان والی بمعہ مقش اینٹیں، ٹائل یا تختی کے تحفے ہوں گے۔</p>
                    </div>
                    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                    <h2 class="underline">آن لائن یادگاریں</h2>
                    <div class="padding-left">
                      <p>جیسے جیسے ٹیکنالوجی آگے بڑھ رہی ہے، زیادہ سے زیادہ لوگ حقیقت سے فائدہ اٹھا رہے ہیں کہ آن لائن یادگار بنانا اب ممکن ہے۔ وقف شدہ یادگاری ویب سائٹیں پر آپ ایک ہوم پیج بنا سکتے ہیں جس کی خصوصیات میں زیر بحث شخص کی تصویر اور الفاظ جو آپ ان کے بارے میں لکھنا پسند کریں۔ اس طرح کی کسی سائٹ کا فائدہ یہ ہے کہ دوسرے لوگ بھی آسکتےہیں اور وہ اس میں اپنا خراج تحسین شامل کرسکتےہیں اور یادیں عرصے تک رہتی ہیں۔ مختلف سائٹس مختلف انتخاب فراہم کرتی ہیں اس حوالے سے اپ لوڈ کرنے کے لئے چیزیں جیسے ویڈیو کے ٹکڑے، موسیقی اور کچھ تحفظ کے انتخاب جو آپ کو دستیابی کی حد اور قابو پانے کی اجازت دیتے ہیں۔ آپ کی آن لائن یادگار کے لمبے عرصے  تک قابل عمل  رہنے کی یاددہانی کے لئے پوچھیں اگر زیر بحث سائٹ پر رضا کارانہ ضابطہ اخلاق کے لئے سائن اپ کریں جسے دی میموریل کوڈ سے جانا جاتا ہے۔ </p>
                      <p>جس قسم کی بھی آپ یادگار اپنے کسی عزیز کی یاد میں بنانے کے لئے پسند کریں، آپ کو اپنی پسند کے لئے وقت لینا چاہئیے اور ہمیشہ محسوس کرنا چاہئیے کہ آپ کو آخری نتائج پر مکمل اختیار حاصل ہے۔ اگر آپ پیشکش کے انتخابات کے بارے میں مزید جاننا چاہتے ہیں تو مہربانی فرما کر بذریعہ ای-میل ہم سے رابطہ کریں (Email) یا فون کریں 0100 000 0000</p>
                    </div>
                                </div>', N'یادگار', N'یادگار', N'banner-about31519.jpg', N'MEMORIALS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (2, N'  <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ فیونرل ڈائریکٹر</h2>
                    <div class="padding-left">
                      <p>کسی جنازے کے انتظام کو عمل میں لانا اکثر سب کچھ نظر آسکتا ہے لیکن کسی کے پیارے کی موت کے فوری بعد بہت زیادہ ہوتا ہے۔ فوتگی کے رجسٹرکرانے کے قانونی مسائل سے یقینی بنانا کے لئے کہ تمام متعلقہ لوگوں کو مطلع کردیا گیا ہے اور پھر خود جنازے کی تفصیلات کو طے کرنا، کئی مختلف ایجنسیوں کے ساتھ تعاون کرنے کی ضرورت انتہائی مشکل ہوسکتی ہے جب آپ تمام اس شخص کے بارے میں سوچنا چاہتے ہیں جسے آپ نے ابھی کھویا ہے۔</p>
                      <p>Burialplots.co.uk بنائی گئی تھی، بہت کم حد میں، اس عمل کو سادہ تر بنانے کے لئے۔ پہلے مرحلے میں ہم نے تدفین کے پلاٹ کی خریداری اور تلاش کے لئے آسان تر بنایا ہے، چاہے آپ کو براہ راست پلاٹ کی ضرورت ہو یا مستقبل کی سوچ رہے ہوں۔ یو کے میں تدفین کے پلاٹوں کی فراہمی  میں پہلے سے کہیں زیادہ کمی ہے اور ہم کسی کی تلاش کو آسان بنا رہے ہیں بالکل اس مقام کے لئے جہاں آپ کو اس کی ضرورت ہے جب کہ ہماری قیمیتیں نسبتاً کم ہیں اور ہماری ادائیگی کے پلان کے اختیارات بھی زیادہ لچکدار ہیں۔ سب سے بڑھ کر یہ کہ ہم نے تمام معلومات نکال کر جمع کی ہے جس کی آپ کو ضرورت ہوگی جب جنازے کی تیاری کریں گے، پھولوں کے پسند کرنے سے لے کچھ تعریفانہ تحریر اور قانونی مسائل کو حل کرنے تک۔ ہم سمجھتے ہیں کہ محرورمی کو محسوس کیا جاسکتا ہے جیسے کوئی اکیلی جگہ اور ہم رابطے کا مقام فراہم کرتے ہیں جو قابل پہنچ اور جامع ہے۔ تنظیموں کے رابطے کی تفصیلات سے جو آپ کے نقصان کو کم کرنے میں آپ کی مدد کریں گے فیونرل ڈائریکٹر کے بارے میں معلومات تک، ہم محرورمی کو کم از کم کسی حد تک آسان ترکرنے کے لئے ضرورت کی ہر چیز فراہم کرتے ہیں۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">فیونرل ڈائریکٹرز</h2>
                    <div class="padding-left">
                      <p>ایک فیونرل ڈائریکٹر کسی جنازے کے انتظام کے لئے کئی لوگوں کے لئے پہلی بندرگاہ ہے۔ حالانکہ یہ ممکن ہے کہ آپ خود انتظامات کریں اور اس سائٹ پر تفصیلات آپ کو تمام متعلقہ ایجنسیوں سے رابطے میں رکھے گی، کئی لوگ اس میں آسانی پاتے ہیں کہ کسی کے تجربے پر پیچھے ہوجائیں جو زندگی گزارنے کے لئے یہ انتظامات کرتے ہیں۔</p>
                      <p>
آپ کی اپنی صحت مندی کے احساس کے لئے یہ ضروری ہے کہ کوئی فیونرل ڈائریکٹر کا انتخاب کریں جو درج ذیل اداروں کا ایک رکن ہو۔</p>
                      <ul>
                          <li>نیشنل ایسوسی ایشن آف فیونرل ڈائرکٹرز</li>
                          <li>نیشنل فیڈریشن آف فیونرل ڈائرکٹرز</li>
                          <li>سوسائٹی آف الائیڈ اینڈ انڈیپنڈنٹ فیونرل ڈائریکٹرز</li> 
                      </ul>
                      <p>اس کا مطلب ہے کہ وہ بہت سختی سے عمل کے ضابطے کی پیروی کرتے ہوں گے۔ جنازے کا انتظام بہت مہنگا بھی ہوسکتا ہے اور شامل جذبات آپ کو استحصال کا شکار بھی کر سکتے ہیں۔ مثال کے طور پر، فیونرل ڈائریکٹر جو ان اداروں میں سے کسی ایک کا رکن ہے جسے آپ کو مانگنے پر قیمتوں کی فہرست مہیا کرنا پڑے گی اور آپ یقین کرسکتے ہیں کہ وہ ہمیشہ آپ سے انتہائی طریقے اور حساسیت کے ساتھ پیش آئیں گا۔ ہر انفرادی صارف کی منفرد ضروریات کے جواب میں ادائیگی کے حصہ کے طور پر کسی فیونرل ڈائریکٹر کا اصل کردار ایک سے دوسرے معاملے میں مختلف ہوتا ہے۔ دوسرے فرائض میں جو وہ عام طور پر ادا کریں گے درج ذیل ہوں گی:</p>
                      <ul>
                          <li>مرحوم کو ہسپتال سے جنازہ گھر لے جانا یا انتظامات کرنے میں مدد کرنا اگر آپ انہیں جنازے سے پہلے گھر پر رکھنا چاہتے ہیں</li>
                          <li>اگر خواہش ہے کہ تدفین سے پہلے فیملی کے ارکان اور دوسروں کے لئے مرحوم کو دیکھنا ممکن بنانا ہے۔</li>
                          <li>مقامی اور قومی اخبارات میں یا کسی ضروری مساوی آن لائن پر اعلانات کروائیں</li>
                          <li>کاغذی کاروائی پر کام کرتے ہیں</li>
                          <li>موزوں تابوت کو پسند کرنے میں آپ کی مدد کرتے ہیں</li>
                          <li>جنازے کی تفصیلی انتظام میں مدد کے لئے مثلاً موسیقی کی گزارش، چھپائی کی خدمت کا کہنا، پھولوں کا کہنا اور پھولوں کی دیکھ بھال براہ راست جنازہ گھر کے لئے پہنچاتے ہیں</li>
                          <li>پھولوں کی جگہ پر خیراتی چندہ کو جمع کرنے کا انتظام کرتے ہیں </li>
                          <li>جگہ پر انتظامات میں مدد کرنا اور جنازے کے بعد کسی جگہ اجتماع کے لئے کھانے پینے کا بندوبست کرتے ہیں</li>
                      </ul>
                      </div>
                        <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
    <br />
                      <div class="padding-left">
                      <p>کوئی بات نہیں کہ آپ فیونرل ڈائریکٹر کی فراہم کردہ مدد کے لئے کتنے احسان مند ہوسکتےہیں ہمیشہ یاد رکھیں کہ وہ اپنی خدمات کی ادائیگی لیتے ہیں، اگرچہ ہوسکتا ہے کہ مشکل ہو،آپ کو اپنی معاملات ایک مالیاتی لین دین کے طور پر دیکھنے پڑتے ہیں۔ جیسے رائج تمام درج قیمتوں کے لئے اگر ضرورت پڑے تو درج قیمتیں ایک سے زائد کمپنی سے حاصل کریں۔ جہاں تک تمام کمپنیاں پہلے ذکر کی گئی ایسوسی ایشنوں کی ارکان ہیں آپ کو ضمانت دی جائے یقیناً کم سے کم معیارات کی، اور آپ کو حقیقت بھولنا  نہیں چاہئیے کہ آپ ان مسائل کو جتنا جلدی ممکن ہوسکے طے کرنا پسند کرتے ہیں جو آپ کو اس کا فائدہ اٹھانے دیتے ہیں۔ اگر آپ جنازے کے انتظام کے بارے میں مزید جاننا چاہتے ہیں یا فیونرل ڈائریکٹر سے آپ کیا توقع رکھتے ہیں  تو مہربانی فرما کر ہم سے رابطہ کریں (Email) یا ہماری ٹیم سے فون پر 0100 000 000</p>
                      <p>جب فیونرل ڈائریکٹر کا انتخاب کریں:</p>
                      <ul>
                          <li>جب درج قیمت حاصل کریں تو لاگت کی تفصیلی وضاحت کے لئے پوچھیں</li>
                          <li>جب درج قیمت کسی فون پر پوچھیں تو یقینی بنائیں کہ اسے لکھ بھی لیا ہے۔ </li>
                          <li>ایک سے زائد کمپنی سے درج قیمت حاصل کرنے کے لئے یقین ہو اور معلوم کریں اگر وہ کسی تجارتی ایسوسی ایشن کا رکن ہے۔</li>
                          <li>اگر آپ فیونرل ڈائریکٹروں کی عمارت میں ہیں تو اپنے اختیارات پر غور کریں اور چھوڑنے سے نہ گھبرائیں</li>
                          <li>صرف یہ یاد رکھیں کیوں کہ کوئی فرم جو کئی سالوں سے ہے اس کا یہ مطلب نہیں کہ یہ ابھی تک کسی فیملی کی ملکیت ہے۔ اگر آپ کے لئے یہ ضروری ہے تو پوچھئیے مالک کون ہے بلکہ اس سے ملنے کا بھی کہہ دیں! ایک خاندانی ملکیت کی فرم اپنے مالک کی عکاسی کرے گی۔</li>
                          <li>فیونرل ڈائریکٹر بہت سے کھلے پیشہ وروں میں سے ہیں۔ یہ عام طور پر مقامی آبادی میں مضبوط ہوتے ہیں۔ آپ فیونرل کے انتظامات کے بارے میں کھل کر بات کرسکتے ہیں جو آپ کرنا چاہتے ہیں۔</li>
                      </ul>
                    </div>

                    
                   
                </div>
', N'جنازے کے ڈائریکٹرز', N'جنازے کے ڈائریکٹرز', N'banner-about18552.jpg', N'FUNERAL DIRECTORS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (3, N'<div class="container">
<p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                    <h2 class="underline">تدفین کے پلاٹ بچوں کے ساتھ معاملات</h2>
                    <div class="padding-left">
                      <p>بحیثیت بالغ محرومی کے درد کو قبول کرنا ایک مشکل اور الجھا ہواعمل ہے۔ اس وقت یہ تصورکرنا مشکل ہوتا ہے کہ صرف قریبی فیملی کے رکن کے نقصان کی کتنی زیادہ تکلیف ہوسکتی ہے جب کسی بچے کی نظر سے دیکھتے ہیں۔</p>
                      <p>جیسے جیسے ہم بڑے ہوتے ہیں، ہم آہستہ آہستہ موت کے تصور کے قبول کرنے کے لئے سمجھتے جاتے ہیں اور حقیقت ہے کہ ہرایک نے آخرکار مرنا ہے۔ ایک بچہ جو اپنے کسی پیارے کی موت کا سامنا کرتا ہے وہ اس تصور کا پہلی بار سامنا کررہا ہوتا ہے اور بحیثیت بالغ یہ آپ کا کردار ہے کہ انہیں جذبات کے ذریعے جو وہ محسوس کرتے ہیں سمجھانے کی کوشش کریں اور وہ انہیں بات کرنے دیں انتقال سے ان پر پڑنے والے اثرات کے بارے میں۔</p>
                    </div>
                    <br />
                    <h2 class="underline">بچوں کو بتائیں</h2>
                    <div class="padding-left">
                      <p>یہ ضروری ہے کہ بچوں کو جتنا جلدی ہوسکے بتائیں ان کے کسی قریبی کے مرنے کے بارے میں۔ یہ انہیں بے خبری کی نعمت میں رکھنے کے لئے کوشش ہوسکتی ہے لیکن بری خبر میں دیران کے لئے خطرے کو بڑھادیتی ہے جو انہیں حادثاتی طور پر کسی اور غیر ہمدردانہ طریقے سے معلوم ہوتی ہے۔ بچے کو نیچے بیٹھاتے ہوئے اور پرسکوں طریقے سے وضاحت کرتے ہوئے اور تحمل سے جو ہوچکا ہے آپ اس مشکل لمحے کو آسان بنانے کی کوشش کریں گے جیسے بھی ممکن ہوسکے۔ چاپلوسی کے استعمال سے بچنے کی کوشش کریں جیسے "سونے کے لئے جائیں"، اس سے بچہ ہوسکتا ہے حیرانی میں پڑھ جائے جب شخص شک میں ہو دوبارہ جاگنے کے لئے جارہاتھا جب وہ خود سونے جانے کے بارے میں بلا ذکر کیے پریشان ہوتے ہیں۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">سوالات کے جواب دیں</h2>
                    <div class="padding-left">
                      <p>عام اصول ہے، اگر بچے میں اتنی پختگی آگئی ہے تو محرومی کے تصور اور مرنے کے بارے میں سوال پوچھے تو اس میں اتنی پختگی آگئی ہے کہ اسے سچائی کے ساتھ جواب دئیےجائیں۔ اپنے جوابوں کو اتنا مختصر اور آسان رکھنے کی کوشش کریں جتنا آپ کرسکتے ہیں لیکن ہمیشہ اپنے ذہن میں رکھیں کہ یہ واقع بچے کی زندگی پر اثر انداز ہواہے جس کا اثر اس کی بقیہ زندگی پر رہے گا۔ کچھ سوالات دوسروں سے بہت مشکل ہوتےہیں، جیسے کیوں لوگوں کو مرنا پڑتا ہے، یقیناً لیکن بچے کو حوالے کے لئے مفید معلومات ان کے گرد قدرتی دنیا کی اور واقعات جیسے سردیوں میں درختوں کا اپنے پتے کھونے کے بارے میں بتایا جاسکتا ہے۔ آپ کا بچہ ہوسکتا ہے پوچھے کہ لوگوں کے لئے کہ جب وہ مرجاتے ہیں تو کیا ہوتا ہے۔ اگر آپ کا مذہبی عقیدہ ہے تو آپ دونوں اطمینان سے جنت اور اس کے بعد کی زندگی کے تصور پر توجہ دے سکتے ہیں، اگر نہیں تو آپ اشارہ کرسکتے ہیں کہ مرحوم زندہ ہوتا ہے آپ کے پاس دلوں اور ذہنوں دونوں میں اور آپ یادوں میں بھی رکھتے ہیں اور آپ باتیں کرتے ہیں۔</p>
                    </div>
                    <br />
                    <h2 class="underline">مرحوم کے بارے میں باتیں کرنا</h2>
                    <div class="padding-left">
                      <p>مرحوم کے بارے میں باتیں کرنا اور آپ کے بچے کی یہ یادیں غمکین عمل کا ایک اہم حصہ ہے۔ کچھ لوگ "یاد کا بکس" چھوڑ جاتے ہیں جب وہ سمجھتے ہیں کہ وہ مرنے جارہے ہیں لیکن اگر ایسا نہیں ہے تو آپ ہمیشہ اپنے بچوں کے لئے ایک بکس ساتھ رکھ سکتے ہیں، جو تصویروں اور فوری یاد داشتیں اور باتیں ان کے لئےدوسری یادگار چیزیں۔ کوئی بھی چیز جو بچے کو احساس دلائے اس شخص سے جڑے رہنے کا جنہیں وہ کھو چکے ہیں ان کے احساسات کو ٹھیک رکھنے کے لئے مدد کرے گا۔ وضاحت کریں غم کے احساس کےلئے کہ یہ بالکل قدرتی ہے اور وقت پر رونا چاہیں لیکن یہ احساسات گزر جائیں گے۔ اگر آپ دیکھیں کہ کسی بچے کو جو آپ کا قریبی ہے دکھی عمل کے ساتھ سمجھانے کے لئے مشکل ہورہی ہے تو گھبرائیں نہیں تنظیموں کے کسی ماہرین سے رابطہ کریں جو صرف اسی صورت حال میں مدد کرنے لئے بنائی گئیں ہیں۔</p>
                    </div>
                    <br />
                    <h2 class="underline">جنازے کےلئے جانا</h2>
                    <div class="padding-left">
                      <p>فیصلہ کرنا کہ بچوں کو جنازے میں شامل ہونا چاہئیے ایک مشکل سوال ہے اور ایک جو آپ کی اپنی معلومات پر بھروسہ کرتا ہے بچہ غیر یقینی ہے۔ اگر کوئی بچہ جانے کےلئے کہتا ہے اور آپ محسوس کرتے ہیں کہ یہ سمجھنے کی صلاحیت رکھتا ہے تو آپ کو اسے اجازت دینی چاہئیے۔ اگر وہ اپنے تصورات کو حاصل نہیں کرتے تو وہ فساد کھڑا کرسکتے ہیں۔ انہیں وضاحت کے ساتھ جنازے کے لئے تیار کریں کہ حقیقت میں کیا ہوگا اور تنبیہ کریں کہ وہ دوسرے بالغ لوگوں کو دیکھنے کے لئے جارہے ہیں وہ پیار کرتے ہیں اور افسردہ ہونے پر انحصار کرتے ہیں۔ یقینی بنائیں کہ جنازے کے دوران بچوں کے ساتھ کوئی ہے جن کے وہ بالکل ساتھ ہیں، وضاحت کرنے کے لئے کہ کیا ہورہا ہے ہر سوال کا جواب دیں اور اطمینان سے پیشکش کریں۔ </p>
                      <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                      <p>اگر آپ کے پاس غمزدہ عمل کے بارے میں یا محرومی کو سمجھنے کے لئے بچوں کی مدد کے بارے میں کوئی سوال ہے تو برائے مہربانی ہم سے رابطہ کریں بذریعہ ای-میل (Email) یا بذریعہ فون 0100 000 0000</p>
                    </div>
                    
                </div>', N'ایک بچے کی موت کے ساتھ سمجھوتا', N'ایک بچے کی موت کے ساتھ سمجھوتا', N'banner-about66176.jpg', N'DEALING WITH LOSS OF A CHILD')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (4, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ جنازے کا منصوبہ &pound;</h2>
                    <div class="padding-left">
                      <p>پیشگی جنازے کا کچھ انتظام کرنے کے بارے میں سوچنے سے لوگ روایتی طور پر ہچکچاتے ہیں۔ وجوہات صاف ہیں؛ جیسے وصیت لکھنا یا لائف انشورنس خریدنا، جنازے کے منصوبے کو خریدنا بھی قبول کرنے والی ایک حقیقت ہے کہ آپ کو ایک دن اپنے پیاروں کو اپنے پیچھے چھوڑ کر جانا ہے۔ اسی لئے وصیت لکھنے کی طرح جنازے کے منصوبے کی خریداری یقینی بنانے کا ایک طریقہ ہے جس سے آپ کے کھونے کی تکلیف کسی حد تک کم ہو جائے گی۔ کسی پیارے کی موت کے ساتھ معاملات طے کرنا ایک جذباتی اثرات اور عملی مسائل کا الجھا ہوا مرکب ہے۔ پیشگی منصوبہ بنانے  سے جہاں تک ممکن ہوں آپ اپنے کسی پیارے کی ان عملی مسائل کو طے کرنے کی ذمہ داری سے سبکدوش ہونے کے قابل ہوں گے انہیں آپ کے گزرنے کے سوگ پر توجہ دینے کے لئے آزاد چھوڑ دیں اور آپ کی زندگی کو منانےدیں۔ حقیقت ہے کہ ایک منصوبہ یقینی بنائے گا کہ آپ کی فیملی آپ کے گزرنے کے موقع پر کئی مہنگے بلوں سے متاثر نہیں ہوئی ہے جو زبردست ذہنی سکون بھی دیتا ہے۔ </p>
                      <p>یہاں Burialplots.co.uk پر ہم نے ایک جگہ بنائی ہے جو کسی جنازے کی پیشگی منصوبہ بندی کرنے کو پہلے سے  کہیں زیادہ آسان تر کرتی ہے  تمام مدد، معلومات اور خدمات کو ایک جگہ جمع کر کے جن کی آپ کو ضرورت ہوگی جب آپ اپنے انتظامات کرتے ہیں، ہم نے ایک بار رکنے کے پورٹل کو قابل رسائی اورمفید بنایا ہے۔ کئی مختلف ایجنسیوں اور کاروبار کے ساتھ معاملات طے کرنے کے بجائے آپ اپنی ضرورت کی تمام معلومات بالکل یہاں پا سکے گے آپ کی پسند کے مقام پر تدفین کے پلاٹ کی خریداری سے لے کر جنازے کی منصوبہ بندی کے سلسلے تک کی رسائی حاصل کرنے کی۔</p>
                    </div>
                    <br />
                    <h2 class="underline">ایک جنازے کا منصوبہ کیا ہے؟</h2>
                    <div class="padding-left">
                      <p>یہ سادہ اصطلاح ہے کہ جنازے کی منصوبہ بندی ایک مالیاتی انتظام ہے جس سے آپ اپنے پیشگی جنازے کے انتظامات کے فیصلہ کرسکتے ہیں اور ان انتظامات کی ادائیگی کے لئے رقم کو ایک طرف رکھتے ہیں۔ جنازے کے منصوبے کے تحفظ کی پیش کش کے لئے کنجی ہے جو اس رقم کو جو آپ ادا کریں گے قلعہ بند انگوٹھی میں محفوظ رکھتے ہیں اور جب وقت آئے گا اس رقم کو آپ کی خواہشات کے عین مطابق استعمال کرتے ہیں۔ حالیہ سالوں میں جنازوں کی لاگت شرح افراط زر سے کہیں زیادہ بڑھ چکی ہیں  اور یہی سلسلہ مستقبل میں بھی جاری رہتا نظر آرہا ہے۔ جنازے کے منصوبے میں سرمایہ کاری سے آپ یقینی بناتے ہیں کہ کوئی مسئلہ نہیں قیمتیں کتنی ہی بڑھ جائیں آپ کی خواہشات کو پورا کرنے کے لئے دستیاب رہیں گی۔  </p>
                    </div>
                    <br />
                    <h2 class="underline">میں کیسے ادائیگی کروں گا؟</h2>
                    <div class="padding-left">
                      <p>بہت سے جنازے کے منصوبے سستے اختیار کی پیش کش کرتے ہیں جب یہ ادائیگی کے لئے آتے ہیں۔ اگر آپ چاہیں تو آپ منصوبے کی تمام ادائیگی پیشگی کرسکتے ہیں یا اور رقم بھی جمع کراسکتے ہیں اور پھر سالوں پر محیط ماہانہ ادائیگی بھی کرسکتے ہیں، عام طور پر ایک سے دس سال تک ہوتی ہے۔ صرف ایک قائم حکم سے بنا کر آپ ذہنی طور پر یہ جان کر سکون محسوس کرسکتے ہیں کہ آپ کے جنازے کی لاگت کی تمام دیکھ بھال ہوگی۔ اگر ادائیگی کے منصوبے کے مکمل ہونے سے پہلے آپ گزر گئے تو رقم ادا کرنے والے خدمت کی ادائیگی کرنے کے لئے پیشکش کرتے ہیں اگر آپ کے رشتہ دار بقایا رقم پوری کریں۔</p>
                    </div>
                    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                    <h2 class="underline">منصوبہ بندی کی اقسام </h2>
                    <div class="padding-left">
                      <p>بہت سے جنازے کے منصوبے کی فراہمی کرنے والے  مختلف قیمتوں کے منصوبوں کے رینج فراہم کرتے ہیں۔ ہر منصوبے کی خصوصیات کے مختلف اختیار اور خدمات ہوں گی جن کا انحصار قیمت پر ہے۔ مثال کے طور پر بنیادی منصوبہ میں معاوضہ شامل ہوگا فیونرل ڈائریکٹر کی خدمات کا جب کہ دوسری چیزیں  جیسے جنازے کے لئے فراہم کی جانے والی لیمازن کی تعداد، تابوت کی قسم اور چاہے پھولوں کا خراج تحسین پیش کرنا شامل ہے تو یہ ایک سے دوسرے منصوبے میں مختلف ہوگی۔ آپ اس میں مزید جتنی چاہیں ذاتی خواہش کے مطابق تفصیلات بھی شامل کرسکتے ہیں۔ انتخاب کے پہلو جیسے کون سے پھول آپ کو پسند ہوں گے، کہاں آپ خدمت کرانا چاہتے ہیں اور موسیقی اور کتاب جو آپ کو پسند تھی شامل کریں۔ ان کو اپنی تفصیلات میں شامل کر کے آپ نے اپنی فیملی کو پریشانی کے دباؤ سے فارغ کردیا اگر وہ تمام صحیح انتخاب کرتے ہیں اور سال بہ سال کئی منصوبوں میں آپ ترمیم کرسکتے ہیں ۔</p>
                      <p>کوئی جنازے کا منصوبہ لائف انشورنس یا سیونگ اکاؤنٹ سے دو طرح مختلف ہوتا ہے؛ یہ ضمانت دے جنازے پر آنے والی لاگت کا جو آپ نے  منتخب کی ہے، حالیہ قیمتوں پر ادائیگی کی ہے، کوئی مسئلہ نہیں کہ مستقبل میں قیمتیں کتنی بڑھتی ہیں۔ اس سے آپ انتظامات کرنے کے بارے میں اپنے عزیزوں کے دباؤ میں اور پریشانیوں میں آنے سے افسردہ ہونے سے محفوظ رہتے ہیں۔ جب آپ کا انتقال ہوتا ہے، ان تمام کو ضروت ہوگی جنازے کے منصوبے کی فراہمی کے لئے صرف ایک فون کرنے کی۔ اگر آپ جنازے کے منصوبے کی خریداری میں دلچسپی رکھتے ہیں یا کوئی مزید سوالات ہیں تو ہم سے رابطہ کرنے سے نہیں ہچکچائیں ۔ آپ ہمیں ای-میل کرسکتے ہیں (Email) یا ہمیں فون کریں: 0100 000 0000</p>
                    </div>
                    
                   
                </div>', N'جنازے کی منصوبہ بندی ', N'جنازے کی منصوبہ بندی ', N'banner-about67235.jpg', N'FUNERAL PLANS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (5, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ – شفاءیابی کا عمل</h2>
                    <div class="padding-left">
                      <p>شفاءیابی کے عمل کے بارے میں کہنے کے لئے جو پہلی چیز ہوتی ہے جب آپ نے کسی عزیزترین کو کھویا ہو تو آپ کے لئے کوئی ایسی چیز نہیں ہوتی ہے جیسے ''صحیح'' یا ''غلط'' کاطریقہ محسوس کرنے کے لئے۔ آپ کے کسی پیارے کی وفات شاید مشکل ترین، دباؤ سے بھرپور اور افسردہ چیز ہوتی ہے آپ کو ہمیشہ اس سے نمٹنا پڑےگا۔ اس کے فوری بعد میں ایسا ہوتا ہے کہ آپ جذبات کے تباہ کن سلسلے میں ڈوب جائیں گے، صدمے اور بے حسی سے لے کر بالکل مایوس ہونے تک اور یہ محسوس ہوسکتا ہے  ایسے اگر یہ احساسات بہت زیادہ ہوں تو۔</p>
                      <p>مثبت خبریں ہیں کہ وقت کے ساتھ ساتھ آپ کا غم بڑھ جاتا ہے۔ اتنا تکلیف دہ جتنا ہوسکتا ہے موت زندگی کا ایک قدرتی حصہ ہے اور کسی چیز کے کھوجانے کو قبول کرنا جو انسان کی نفسیات میں پیدائشی ہوتا ہے۔ یقیناً ''قابو پائیں'' زیادہ کھونے کی چاپلوسی پر اور اس کا مطلب یہ نہیں ہے کہ کبھی وقت آئے گا جب آپ کھو جانے والے شخص کو یاد کرنا بند کردیں یا ان کے بارے میں بھول جائیں۔ کوئی جس سے آپ پیار کرتے ہیں کبھی بھی مکمل آپ کے دل اور ذہن سے نہیں جاتا ہے لیکن شفاء یابی کے عمل کا مطلب ہے کہ ایک وقت آئے گا جب آپ انہیں دوسروں کے ساتھ تکلیف اور افسوس کے علاوہ انہیں یاد کرسکتے ہیں۔ ایسا وفات کے فوراً بعد ناممکن نظر آسکتا ہے  لیکن آخر کار آپ کو زندگی کی طرف پیچھے دیکھنے کے قابل ہونا ہو گا جو آپ نے مرحوم کے ساتھ گزارے اور یادوں میں خوشیوں بھرے ساتھ اور مزے، اس کے ساتھ ساتھ کھونے پر تکلیف۔ یہ مکمل ہموار عمل نہ ہوگا اور دورانیے ہوں گے جب آپ محسوس کرتےہیں کہ جیسے آپ اپنے بدترین دکھ سے باہر نکلنا شروع ہورہے ہیں صرف کچھ چیزوں کے لئے آپ کو دوبارہ ترتیب دینے کے لئے لیکن آپ کے نقصان کے متعلق کسی حد تک شدت رہے گی۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">ابتدائی مراحل</h2>
                    <div class="padding-left">
                      <p>حالانکہ ہر معاملہ مختلف ہے، اسی طرح جیسے ہر شخص مختلف ہے، غم مراحل میں توڑ سکتا ہے جس سے آپ گزریں گے۔ ابتدائی ردعمل بے حسی اور بے اعتباری کا احساس ہے- کوئی مسئلہ نہیں کہ ہم کتنا جان سکتے ہیں ایک دانشورانہ سطح پر کہ ہر ایک جوہمارے ساتھ ہیں ایک دن مرنا ہے، اس کا صدمہ حقیقت میں بہت زیادہ ہوتا ہے۔ بے حسی اور صرف بے اعتباری کے درمیان توازن پر اثر ڈال سکتی ہے کہ کیسے زیر بحث غیر متوقع فوتگی ہوئی تھی ۔ تمام معاملات میں، آپ کو وفات کے فوراً بعد عرصہ گزارنا پڑسکتا ہے اس احساس کے ساتھ جیسے آپ کچھ ردعمل کا اظہار کرنے سے قاصر ہوں۔ آٌپ اسے یوں پاسکتے ہیں جیسے آپ کو روزمرہ کاموں پر توجہ دینا مشکل ہو اور غم کی لہر سے اکثر یہ بڑھ جائے گا توشدت جو واحد شے ہے جو آپ محسوس کرنے کے قابل ہیں تو بیٹھ جائیں اور روئیں۔ </p>
                      <p>اس کے ساتھ ساتھ غم اور تکلیف کے ممکنہ احساسات، جو لوگ اپنے پیاروں کو کھو چکے ہیں اکثر غصے کے احساس کی بھی حالت ہوتی ہے، بعض اوقات اس شخص کے ساتھ جو انہیں چھوڑ کر جاچکا ہوتا ہے۔ بعض اوقات قسمت اور زندگی کو عام طور پر اور بعض اوقات کسی کوبھی موت کے لئے الزام دیتے ہیں۔ صرف جذبات کی طاقت جو آپ محسوس کرتے ہیں جسمانی علامات کی بھی باعث بن سکتی ہے۔ اس کے ساتھ ساتھ تھکن سے آپ چکر محسوس کرسکتے ہیں، سانس کا پھولنا یا انتہائی فعال بھی جیسے اگر رکے اور ساکن ٹھہرے تو غم آپ پر بڑھ  جائے گا۔ آپ کو سونے میں پریشانی ہوتی ہے جو تکلیف دے چکر کا باعث ہوتی ہے جس میں آپ اگلے دن اور زیادہ تھک جاتے ہیں۔</p>
                    </div>
                    <br />
    <br />
    <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px;">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                    <h2 class="underline">چلتے رہیں</h2>
                    <div class="padding-left">
                      <p>یہ ماننے کے بعد کہ نقصان حقیقی ہے اور غم کی تکلیف سے گزرتے ہوئے آپ کے نقصان کو کم کرنے کے لئے آہستگی سے مرحلے سے گزریں گے۔ یہ ہے اس عرصے کے دوران جو بہت اہم ہے اپنے احساسات کے بارے میں بات کرنے کے لئے نہ کہ کوشش کریں کہ بہادر طریقے سے چیزوں کا مقابلہ کریں۔ اگر آپ خوش قسمت ہیں تو آپ کے پاس دوست اور فیملی ہوگی باتیں کرنے کے لئے لیکن ہمیشہ ایسا معاملہ نہیں ہوتا ہے۔ یہ بھی ممکن ہے کہ آپ بے چینی محسوس کررہے ہوں مکمل سچے ہونے کے ان کے ساتھ جو آپ کے قریب ہیں جیسے وہ بھی شاید خود دکھ سے گزر رہے ہوتے ہیں۔ ایسا ہے جب کئی تنظیموں میں سے کوئی ایک بات کرنے کے لئے انتہائی مددگار ہوسکتی ہو جو خاص طور پر محرومی کے ساتھ لوگوں کے معاملات کو حل کرنے میں مدد کرنے کے لئے بنائی جاتی ہیں۔ ہم نے ان تنظیموں میں کچھ کی ایک فہرست یہاں فراہم کی ہے (Link to ‘Helpful  Orgs’ page)، اور یہ بھی ہوسکتا ہے کہ آپ کسی کو پائیں جو آپ کی خصوصی صورت حال کو حل کردے گا </p>
                      <p>وقت کے ساتھ، ابتدا کی انتہائی تکلیف کم ہونا شروع ہوگی لیکن کوئی عرصہ مختص نہیں ہے کہ کب یہ ہونا چاہئیے۔ سال میں بعض اوقات جیسے کرسمس، سالگراہیں اور شادی کی سالگراہیں ہوسکتا ہے خاص احساس مشکل کے ساتھ کم ہوتا ہے۔ کچھ لوگوں کا دنوں کے ساتھ کم کرنا جیسے یہ ہوسکتا ہے کام سے چھٹی لیں اور اپنی سوچوں کے ساتھ وقت گزارنے کے لئے ہارجانا شامل ہے، جب کہ دوسرے ہوسکتاہے قدرت میں کرنا منتخب کریں یا شاید کوشش کریں کہ یہ عمل کریں جیسے اگر یہ صرف ایک اور دن ہو۔ اہم یہ ہے جو کچھ بھی کریں آپ اطمینان محسوس کرنے کے ساتھ کریں۔  </p>
                      <p>اگر آپ محسوس کرتے ہیں کہ آپ ابتدائی غم کے احساسات سے نہیں نکل پا رہے ہیں یا آپ کسی سہارے پر بہت زیادہ انحصار کرنے لگے ہیں جیسا کہ الکوحل یا ادویات، تو اپنے جنرل فزیشن یا کسی مشیر کو بتانے سے ڈریں نہیں۔ یہ غم کی قدرتی افسردگی کے لئے ممکن ہے جو ذہنی صحت کے مسائل میں پلٹ جاتی ہے اور اگر آپ یا آپ کی فیملی محسوس کرتی ہے کہ آپ کی زندگی پر ابھی تک منفی اثرات پڑرہے ہیں اس کے بعد کہ جن کی امید کی جاسکتی تھی کہ یہ گزرنے شروع ہوچکے ہوں گے تو آپ کو کچھ دستیاب مدد تلاش کرنی چاہئیے۔   </p>
                      <p>اگر آپ کے پاس غمزدہ عمل کے بارے میں یا محرومی کو قبول کرنے کے بارے میں سوالات ہیں تو برائے مہربانی ہم سے بذریعہ ای-میل رابطہ کریں (Email) یا فون کریں 0100 000 0000</p>
                    </div>
                    
                </div>', N'شفا یابی کا عمل', N'شفا یابی کا عمل', N'banner-about10245.jpg', N'HEALING PROCESS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (6, N'<div class="container">
 <p class="col-md-10 col-md-offset-1" style="margin-bottom:45px; margin-top:-43px">
        <a href="/Home/SearchbyPostCodeApi">
            <img src="/images/Banners/burialplot.jpg" />
        </a>
    </p>
                    <h2 class="underline">تدفین کے پلاٹ - مددگار تنظیمیں</h2>
                    <div class="padding-left">
                      <p>درج ذیل فہرست صرف چند تنظیموں کی ہے جو جنازے کا انتظام یا محرومی میں سنبھلنے میں مددگار ثابت ہوسکتی ہیں۔ ان اداروں کی مدد کی فراہمی کا سلسلہ عملی قانونی اور مالیاتی تجویز سے لے کر آپ کے کھونے اورغم کے احساسات کے بارے میں کسی کی بات کرنے تک ہوتا ہے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">دکھ میں معاونت</h2>
                    <div class="padding-left">
                      <p><strong>کروس بریومنٹ کئیر</strong> <br/>
                      <strong>فون:</strong> <a href="tel:0808 808 1677">0808 808 1677</a> &nbsp;&nbsp;
                      <strong>ویب سائٹ:</strong> <a href="www.cruse.org.uk" target="_blank">www.cruse.org.uk</a> &nbsp;&nbsp;
                      <strong>Address:</strong> پتہ: کروس بریومنٹ کئیر، پی او بکس 800، رچمنڈ، سرے، ٹی ڈبلیو9 1آرجی 
                      </p>
                      <p><strong>دی سمیریٹینز</strong> <br/>
                      <strong>فون:</strong> <a href="tel:116 123">116 123</a> &nbsp;&nbsp;
                      <strong>ویب سائٹ:</strong> <a href="www.samaritans.org" target="_blank">www.samaritans.org</a>
                      </p>
                      <p><strong>سٹیزن ایڈوائس</strong> <br />
                         دکھ کے قانونی اور مالیاتی پہلوؤں پر عملی تجویز۔ اپنا مقامی آفس تلاش کریں اس پر <a href="www.citizensadvice.org.uk" target="_blank">www.citizensadvice.org.uk</a>
                      </p>
                      <p><strong>ایج کنسرن انگلینڈ</strong> <br/>
                      <strong>پتہ:</strong> ایسٹرل ہاؤس، 1268 لندن روڈ، لندن، ایس ڈبلیو16 4ای آر۔ &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:020 8765 7200">020 8765 7200</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.ageconcern.org.uk" target="_blank">www.ageconcern.org.uk</a>                       
                      </p>
                      <p><strong>دی نیچرل ڈیتھ سینٹر</strong> <br/>
                      <strong>پتہ:</strong>  6 بلیک اسٹاک میؤس، بلیک اسٹاک روڈ، لندن این4 2بی ٹی &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:020 7359 8391">020 7359 8391</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.naturaldeath.org.uk" target="_blank">www.naturaldeath.org.uk</a>                       
                      </p>
                      <p><strong>بریومنٹ ایڈوائس سینٹر</strong> <br/>
                      <strong>پتہ:</strong>  سمپلیفائی ہیرون ہاؤس، ٹیموتھی برج روڈ، اسٹراٹفورڈ اپان ایوون، سی وی37 9بی ایکس &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:0800 634 9494">0800 634 9494</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.bereavementadvice.org" target="_blank">www.bereavementadvice.org</a>                       
                      </p>
                      <p><strong>سرکاری نصیحت</strong> <br/>
                      <a href="www.gov.uk/browse/births-deaths-marriages/death" target="_blank">www.gov.uk/browse/births-deaths-marriages/death</a>                       
                      </p>
                      <h3>بچے کی وفات</h3>
                      <p><strong>دی کیمپیشینیٹ فرینڈز</strong> <br/>
                      <strong>پتہ:</strong> دی کیمپیشینیٹ فرینڈز، 14 نیو کنگ اسٹریٹ، ڈیپ فورڈ، لندن ایس ای8 3ایچ ایس &nbsp;&nbsp;
                      <strong>ہیلپ لائن:</strong> <a href="tel:0345 123 2304">0345 123 2304</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.tcf.org.uk" target="_blank">www.tcf.org.uk</a>                       
                      </p>
                      <p><strong>دی چائلڈ ڈیتھ ہیلپ لائن</strong> <br/>                      
                      <strong>ہیلپ لائن:</strong> <a href="tel:0800 282 986">0800 282 986</a> / <a href="tel:0800 282 986">0800 282 986</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.childdeathhelpline.org.uk" target="_blank">www.childdeathhelpline.org.uk</a> <br />   
                      <strong>Phone lines open:</strong> پیر سے جمعہ 10 بجے صبح سے 1 بجے دوپہر &nbsp;&nbsp; منگل 1 بجے دوپہر سے 4 بجے سہ پہر &nbsp;&nbsp; بدھ  1 بجے دوپہر سے 4 بجے سہ پہر &nbsp;&nbsp; ہر شام 7 بجے سے 10 بجے
                      </p>
                      <p><strong>دی فاؤنڈیشن فار دی اسٹڈی آف انفینٹ ڈیتھس (ایف ایس آئی ڈی)</strong> <br/>
                      والدین کی مدد کے لئے جن کے بچے اچانک نومولودگی میں مرجاتے ہیں۔ <br />
                      <strong>پتہ:</strong>ایف ایس آئی ڈی، 11 بیلگریو روڈ، لندن ایس ڈبلیو1وی 1آربی &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:0808 802 6868">0808 802 6868</a> &nbsp;&nbsp;
                      <strong>ویب سائٹ:</strong> <a href="www.fsid.org.uk" target="_blank">www.fsid.org.uk</a>                       
                      </p>
                      <p><strong>چائلڈ بریومنٹ یوکے</strong> <br/>
                      Support for parents whose children have died through cot death <br />
                      <strong>پتہ:</strong>  کلیر چیریٹی سینٹر، وائی کومب روڈ، ساؤنڈرٹن، 
بکنگھم شائر ایچ پی14 4بی ایف &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:01494 568 900">01494 568 900</a> &nbsp;&nbsp;
                      <strong>ویب:</strong> <a href="www.childbereavementuk.org" target="_blank">www.childbereavementuk.org</a>                       
                      </p>
                      <h3>خودکشی</h3>
                      <p><strong>مائنڈ</strong> <br/>
                      Support for parents whose children have died through cot death <br />
                      <strong>پتہ:</strong>19-15 براڈوے، اسٹریٹ فورڈ، لندن ای15 4بی کیو &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:020 8519 2122">020 8519 2122</a> &nbsp;&nbsp;
                      <strong>ویب سائٹ:</strong> <a href="www.mind.org.uk" target="_blank">www.mind.org.uk</a>                       
                      </p>
                      <p><strong>ری تھنک</strong> <br/>
                      Support for parents whose children have died through cot death <br />
                      <strong>پتہ:</strong> 15th Floor, 89 Albert Embankment,London, SE1 7TP &nbsp;&nbsp;
                      <strong>فون:</strong> <a href="tel:0300 5000 927">0300 5000 927</a> &nbsp;&nbsp;
                      <strong>ویب سائٹ:</strong> <a href="www.rethink.org" target="_blank">www.rethink.org</a>                       
                      </p>
                    </div>
                  
                </div>', N' مفید ORG', N' مفید ORG', N'banner-about60921.jpg', N'HELPFUL ORGS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (7, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ غمگین والدین</h2>
                    <div class="padding-left">
                      <p>آپ کے کسی عزیز کی وفات ذہنی دباؤ کا شکار کرتی ہے اور اس پر قابو پانا مشکل ہوتا ہے لیکن کسی بچے کی وفات سے ایک خاص تکلیف دہ نقصان کی نمائندگی کرتی ہے۔ جب والدین کسی بچے کو کھوتے ہیں تو وہ اپنا ایک حصہ کھوتے ہیں اور وہ اپنا مستقبل کھوتے ہیں جو انہوں نے اپنے بچے کے لئے سوچا ہوا تھا۔ والدین یا بوڑھے رشتہ دار کا نقصان حقیقی طور پر تکلیف دہ ہے لیکن کسی حد پر ہم اس بارے میں برداشت کرلیتے ہیں بطور “قدرتی” چیز ہے۔ دوسری طرف بچے کے کھونے کا احساس ابتدائی اورقدرتی سطح پر ‘غلط’ اور غیر فطری ہوتا ہے۔ ان وجوہات کی بنائ پر یہ محرومی کی اقسام میں ایک سخت ترین قسم ہے کسی شخص کو اسے قبول کرنا کے لئے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">بچے کی عمر</h2>
                    <div class="padding-left">
                      <p>چونکہ بچے کا کھونا تمام کے لئے سنگین دھچکا ہو سکتا ہے یہاں تک کہ بڑے ہوتے بچے کی وفات کہیں زیادہ اثرانداز ہوسکتی ہے بحیثیت والدین اکثر ان کی باتوں میں اپنے بچے کے مرنے کا حصہ ہوتا ہے۔ جب بچے کی وفات ہوتی ہےتقریباً تمام غم کے عام پہلو بڑھ جائیں گے لیکن خاص طور پر ناانصافی اور غصہ کے احساس کے ساتھ جسے محسوس ہوتے ہیں۔ جوڑے دیکھ سکتے ہیں غم کی شدت جو وہ محسوس کرتے ہیں  اور اس دوران کسی بھی اختلاف کے جواب میں وہ ایک دوسرے کو الزام دیتے ہیں۔ کچھ لوگوں جذبات پر قابو پا کر غم کو برداشت کرسکتے ہوں اور چیزوں پر خوشی کا اظہار کرنے کی کوشش کرتے ہیں ، جب کہ دوسرے غم کا اظہار میں وہ گراف کی اصطلاحات محسوس کر سکتے ہیں۔ جب یہ فرق کسی جوڑے کے دونوں شریک حیات میں واقع ہو تو وہ مناسب غمزدہ نہ ہونے پر ایک دوسرے سے نفرت کا اظہار ختم کرسکتے ہیں۔ حقیقت یہ ہے کہ بچے کے گزرنے کے سوگ کے لئے کوئی ‘صحیح’ طریقہ نہین ہے اور یہ کہ والدین کو ایک دوسرے کے جذبات کے لئے گنجائش رکھنی چاہئیے جو اپنے اپنے طریقے سے محسوس کرتے ہیں۔ بلاشبہ کھونے کے نتیجے میں یہ کہنا کرنے سے زیادہ آسان  ہوتا ہے۔</p>
                    </div>
                    <h2 class="underline">دوسرے بچے</h2>
                    <div class="padding-left">
                      <p>فیملی میں دوسرے بچوں کی موجودگی کسی بچے کے مرنے پر کچھ تسلی فراہم کرسکتی ہے کم سے کم نہیں کیوں کہ والدین اپنی بقیہ فیملی کا خیال رکھنے کے لئے احساس ذمہ داری محسوس کریں گے اور اس کے ساتھ ساتھ ان کے بھائی یا بہن کےکھونے پر صبر کرنے میں مدد کریں گے۔ لمبے عرصے میں والدین اپنے رویے میں کسی بقیہ بچے کے لئے ضرورت سے زیادہ محفوظ طریقہ اپنا سکتے ہیں۔ یہ قدرتی ردعمل ہے، لیکن ایسا ہونے سے رکا جائے تا کہ بچے اپنی زندگیاں اپنی پوری زندہ دلی کے ساتھ گزاریں۔ والدین کے لئے یہ اطمینان کا باعث ہوسکتا ہے کہ وہ اپنے فوت شدہ بچے کے لئے بہترین خراج تحسین کرنے کو یقینی بنائیں گے کہ کوئی دوسرا بچہ ممکنہ مکمل ترین اور خوشیوں بھری زندگیوں کا باعث بننے کے لئے بڑا ہورہا ہے۔</p>
                    </div>
                    <h2 class="underline">بچے کا جناز</h2>
                    <div class="padding-left">
                      <p>جب کوئی بوڑھا عزیز وفات پاتا ہے تو جنازہ حصے میں آپ فنکشن کا انتظام کرسکتے ہیں بطور ان کی زندگی کی تقریب کے طور پر۔ بچے کی وفات کا صدمہ مطلب ایسے معاملات کم ہوتے ہیں اس لئے زندگی پر توجہ قدرتی ہو گی نہ کہ زندہ رہنے کے لئے بجائے سالوں خوشیاں مناتے ہیں۔ اسی لئے ایک جنازہ ابھی تک مفید فنکشن کے طور پر کام کررہا ہے اس میں یہ والدین کو ان کےغم کی طرف متوجہ کرتا ہے اور ایک موقع فراہم کرتا ہے دوستوں اور فیملی کو ان کے گرد انحصار کے لئے۔ بچوں کے بارے میں والدین سے بات کریں کہ جو انہوں نے کھویا ہے اسے محسوس کرنا مشکل، عجیب اور تکلیف دہ ہے لیکن مسئلے کی سچائی ہے کہ اس قسم کی گفتگو حقیقت میں مدد کرے گی۔</p>
                      <p>اگر آپ کو بچے کی وفات پر صبر کرنے کے لئے مدد کی ضرورت ہے تو آرگنازیشنز کے ایک ماہر سے رابطہ کرنے سے ہچکچائیں نہیں جو اس لئے بنائی گئیں ہیں کہ اپ کی مدد کرسکیں۔ ایک سب سے برا پہلو اس قسم کے نقصان کا تنہائی کا احساس یوتا ہے اور جو کوئی دوسرا ممکن نہیں ہے سمجھ سکے کہ آپ پر کیا گزر رہی ہے۔ کسی سے بات کرنا جو خود بھی غمزدہ والدین ہوں اور سننے میں جو ناقابل یقین حد تک مددگار ہوسکتا ہے کہ جو آپ عام اور قدرتی طور پر محسوس کرتے ہیں۔</p>
                      <p>اگر آپ کے پاس غمزدہ عمل کے بارے میں کوئی سوالات ہیں کہ کیسے کسی بچے کے نقصان پر قابو پایا جائے یا اسی طرح کسی کو مدد درکار ہے جو دکھی ہے تو مہربانی فرما کر ہم سے ای۔میل کے ذریعے رابطہ کریں (Email) یا فون کے ذریعے 0100 000 0000۔</p>
                    </div>
                    
                </div>', N'والدین کا غم', N'والدین کا غم', N'banner-about44905.jpg', N'PARENTAL GRIEF')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (8, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ پروبیٹ</h2>
                    <div class="padding-left">
                      <p>کسی کے مرنے پر اٹھنے  والے قانونی مسائل کو حل کرنا بہت ہی پیچیدہ مسئلے ہوسکتے ہیں۔ ایک طرف تو اس میں براہ راست متعلقہ مسائل شامل ہوسکتے ہیں جیسے موت کی رجسٹریشن اور متعلقہ حکام کو مطلع کرنا جیسے ایچ ایم آر سی، دی پاسپورٹ آفس اور مقامی کونسل۔ اسی طرح دوسری طرف کسی کی موت کا مطلب کہ پیچھے رہ جانے والوں کو مرحوم کی ملکیت کا انتظام کرنا پڑتا ہے۔</p>
                      <p>اگر زیر بحث شخص وصیت چھوڑ کر گیا ہے تو یہ بالکل صاف ہوگیا کہ کیسے وہ پیچھے چھوڑ کر گئے اثاثوں کو اپنے وارثوں میں تقسیم ہوں لیکن پھر بھی معاملات میں ایسا ہوتا جس میں اس پروبیٹ کے عمل کی لازمی پیروی کرنی ہوتی ہے۔ سادہ لفظوں میں، ‘پروبیٹ’ اصطلاح میں کسی کو قانونی اجازت دی جاتی ہے کہ وہ مرحوم کے تمام اثاثوں کو جمع کرکے لائے، ان اثاثوں کی قیمت لگائے اور پھر آگےملکیت کو بڑھا دیں۔</p>
                    </div>
                    <br />
                    <h2 class="underline">پروبیٹ کا معاملات طے کرنا</h2>
                    <div class="padding-left">
                      <p>مرحوم کے اثاثوں کی رسائی اور پھر تقسیم کے لئے آپ کو مسائل کے لئے پہلے ضرورت ہوگی نمائندگی کی منظوری کی، زیر بحث محفوظ رقم کی رسائی کی اجازت دینے سے پہلے قانونی کاغذات جو بنک اور دوسرے مالیاتی ادارے دیکھنا چاہیں گے۔ اس قانون کے لئے استثناء ہیں۔ آپ کو نمائندگی کی منظوری کی ضرورت نہیں ہوسکتی ہے اگر زیر بحث ملکیت کی قیمت £5,000 سے کم ہے اور اس میں کوئی شئیر، جائداد یا زمین کی ملکیت شامل نہیں ہے۔ آپ کو منظوری کی ضرورت نہیں ہوگی اگر ملکیت مشترکہ ناموں سے تھی زندہ شریک حیات یا شہری پارٹرن اور براہ راست ان کی ہوجائے گی۔ </p>
                      <p>اگر ایک وصیت شامل ہے تو پھر جو شخص وصیت کے پروبیٹ کے ساتھ معاملات طے کررہا ہے اس کا نام وصیت میں بطور وصی ہوگا۔ اگر نہیں تو پھر ایک وصی رکھا جائے گا اور وہ عام طور پر مرحوم کے قریب ترین حیات رشتہ داروں میں سے ہوگا۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">ملکیت کی قیمت نکالنا</h2>
                    <div class="padding-left">
                      <p>ملکیت کی قیمت معلوم کرنے کےلئے، وصیت کے وصی کو مرحوم کے تمام اثاثوں کی معلومات ایک جگہ پر اکٹھی کرنی پڑتی ہے۔ اس میں شامل بنک اور بلڈنگ سوسائٹی کے اکاؤنٹس، جائدادیں، سرمایہ کاریاں، ذاتی چیزیں جیسے زیور اور فن کا کام، موٹر گاڑیاں، پنشنیں اور لائف انشورنس پالیسیاں۔ ہر اثاثے کی قیمت اس وقت پر قائم ہوں گی جس وقت شخص کا انتقال ہوا تھا۔ اس وصیت کا مطلب کسی مالیاتی اشیاء کے فراہم کرنے والوں سے اور جائدادوں کی قیمت کے لئے اسٹیٹ ایجنٹوں یا آزاد قیمت لگانے والوں سے رابطہ کرتے ہیں۔ آپ کو کسی واجب الاداء قرضے کے دریافت اور حساب لگانے کی ضرورت ہوگی جیسے کریڈٹ کارڈ، بنک قرضے، گروی اور ذاتی قرضے اور جنازے کی لاگت ملکیت کی قیمت میں سے کاٹی جاسکتی ہے۔ اعداد وشمار رہ جائے گا اثاثے میں سے قرضوں کو منہا کرنے سے بقیہ ملکیت کی قیمت کو ظاہر کرے گی اور معلوم کیا جائے گا کہ وراثت کا ٹیکس ادا کرنی کی ضرورت ہے۔</p>
                    </div>
                    <br />
                    <h2 class="underline">وراثت ٹیکس</h2>
                    <div class="padding-left">
                      <p>کچھ ملکیتوں پر وراثت ٹیکس کی ادائیگی نہیں کرنی پڑتی ہے۔ ان میں شامل ملکیتیں جن کی قیمت حالیہ حد £325,000 سے کم ہو اور وہ جو مستثنٰی ہوں کیوں کہ وہ کسی شریک حیات یا شہری پارٹنر کےلئے یا اہل خیرات کے لئے چھوڑ کر گئے ہیں۔</p>
                      <p>اپریل 2010 میں نئے قوانین متعارف ہوئے جس کا مطلب ہے کہ زیر بحث ملکیت کو وراثت ٹیکس سے بھی باہر رکھا جائے گا اگر اس کی قیمت £650,000 سے کم ہو اور 100% غیر استعمال وراثت ٹیکس الاؤنس مرحوم شریک حیات یا سول پارٹنر کی طرف سے مرحوم کے لئے بھیجے جاسکتے ہیں۔</p>
                      <p>یہاں تک کہ اگر وراثت ٹیکس واجب الادا نہیں ہے، پھر بھی آپ کو ایچ ایم آر سی کے لئے Return of Estate Information form بھرنے کی ضرورت ہوگی اور اگر واجب الادا ہے ملکیت مستثنٰی نہیں ہے تو پھر زیادہ طویل IHT400 فارم بھرنے کی ضرورت ہوگی جس میں مرحوم کی اثاثوں اور قرضوں کی تفصیلات ہو گی۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">پروبیٹ حاصل کرنا</h2>
                    <div class="padding-left">
                      <p>ایک بار فارموں کو بھرکر ایچ ایم آر ایس اور پرہبیٹ رجسٹری  اور کسی وراثت ٹیکس کو بھیجتے ہیں جو ادا کرنا واجب الادا ہوگی۔ اس کے بعد وصی کو پروبیٹ کی جگہ یا اوتھ کمشنر کے دفتر ۔ عام طور پر وکیل ۔ ذاتی طور پر حلف کی قسم کے لئے۔
نمائندگی کی منظوری پھر ہی فراہم کی جائے گی، وصی کو مرحوم کے اثاثوں کی رسائی کی اجازت دی جائے گی، کسی ادھار کی ادائیگی اور ورثہ کو ملکیت کی تقسیم کریں۔ </p>
                      <p>جیسے یہ منصفانہ مختصر تفصیل جمع کی جاسکتی ہے، پروبیٹ پیچیدہ اور لمبا عمل بھی ہوسکتا ہے جس میں اکثر سال لگ جاتا ہے اگر مکمل نہ ہو تو۔ آپ بحیثیت وصی ہوسکتا ہے پسند کریں پروبیٹ کو رکھنے کے لئے مکمل قانونی پیشہ ور کے حوالے کردیتے ہیں یا زیادہ تر کام خود کرتے ہیں اور پھر وکیل سے فارموں کو جمع کرانے سے پہلے ان کا معائنہ کرنے اور تفضیلات کے لئے پوچھتے ہیں۔ </p>
                      <p>اگر پروبیٹ کے بارے میں یا محرومی کے سارے دوسرے قانونی کاموں کے بارے میں آپ کے پاس کوئی سوالات ہوں تو Burialplots.co.uk  ہم سے رابطہ کریں (Email) یا فون پر0100 000 0000 
</p>
                    </div>
                  
                </div>', N'وصیت نامہ', N'وصیت نامہ', N'banner-about71771.jpg', N'PROBATE')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (9, N'   <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ – اچانک موت کا صدمہ</h2>
                    <div class="padding-left">
                      <p>کسی پیارے کا مرنا ایک شدید صدمہ اور تکلیف دہ تجربہ ہے لیکن اچانک اور پرتشدد موت ایک منفرد چیلنجوں کے سیٹ کو پیش کرتا ہے۔ جب کوئی آپ کا قریبی لمبی بیماری کے اختتام پر وفات پاتا ہے تو افسردگی، غم اور صدمے کا احساس مکمل خالص ہوتا ہے لیکن مثال کے طور پر کچھ حقیقت سے آرام محسوس کرسکتے ہیں کہ آپ کے پاس زیر بحث شخص کو خدا حافظ کہنے کا موقع حاصل ہوسکا ہے۔ مثال کے طور پر وہ جو کسی کو اس طرح کھوتے ہیں کہ اکثر اطمینان سے بات کرتے ہوئے وہ جانتے ہوئے اپنی طرف متوجہ کرتے ہیں کہ وہ  مرحوم کو بتانے کے قابل تھے کہ وہ ان سے پیار کرتے تھے اور یہ کہ مرحوم بھی اس قابل تھے کہ وہ مرنے سے پہلے اپنے معاملات صحیح رکھتے اور کسی حد تک ذہنی سکون حاصل کرتے۔</p>
                      <p>اچانک اور پرتشدد موت کے موقع پر ایسا کچھ نہیں ہوتا ہے۔ ابتدا میں بےحسی، صدمے اور مایوسی کا احساس کے ساتھ غصے اور ناانصافی کے جھلسا دینے والے احساس ملیں گے۔ یہاں تک کہ اگر کوئی بھی براہ راست موت کے لئے ذمہ دار نہ تھا، قدرتی طور پر آپ اپنے اطراف نظر ڈالنا شروع کریں گے۔ کسی پر یا کسی چیز کو الزام دینے سے مایوس۔ یہ بالکل قدرتی ہے  جیسے غلطی کا احساس ہو کہ آپ ابھی تک زندہ ہیں جب کہ آپ کا کوئی پیارا لے جایا جاچکا ہے۔</p>
                    </div>
                    <br />
                    <h2 class="underline">حقائق</h2>
                    <div class="padding-left">
                      <p>یہ ضروری ہے کہ زیربحث موت کے حالات کے بارے میں جہاں تک ہوسکے آپ تلاش کرنے کی کوشش کریں۔ مزید ناخوشگوار صورت حال سے آپ کی قدرتی جبلت آپ کے لئے ڈھال ہوسکتی ہے جو اکثر اچانک اور پرتشدد موت کے ساتھ ہوتے ہیں لیکن چیزیں جو آپ اپنے تصورسے جانیں گے اکثر اتنی بڑی ہوں گی جتنی سچائی۔ اس میں مزید، آپ کو اچھی طرح آنے والوں سالوں میں بار بار احساس ہوسکتا ہے اس معلومات سے کہ آپ کو بالکل صحیح نہیں معلوم کہ کیا ہوا تھا آپ کے پیارے کے آخری لمحات کے دوران۔  </p>
                    </div>
                    <br />
                    <h2 class="underline">Official Matters</h2>
                    <div class="padding-left">
                      <p>جب کوئی غیر متوقع طورپر وفات پاتا ہے تو بجز اس کے کیا وجہ ہے اس کی سرکاری پوچھ گچھ کرنی پڑے گی اس میں میڈیکل پریکٹیشنرز، پولیس، کورونر اور دوسرے ادارے شامل ہوسکتے ہیں۔ اس سے آپ کو احساس ہوسکتا ہے کہ جیسے آپ کا کوئی پیارا دوسرے لوگوں کی ملکیت بن چکا ہے حالانکہ اس میں آپ کو توجہ بھی فراہم ہوسکتی ہے کون آپ کے ساتھ آپ کے غم میں مدد کرتا ہے۔ جاننا کہ حقیقت میں کیا ہوا تھا ہوسکتا ہے آپ کو کھونے کے ابتدائی مراحل تک لے کر چلا جائے لیکن آپ کو آگاہ رہنے کی ضرورت ہے کہ جب تفتیش مکمل ہوجائے تو آپ اپنے جذبات کے ساتھ اکیلے ہوں گے اور جب بھی یہ ہوگا خاص طور پر بڑا تکلیف دہ ہوگا۔</p>
                    </div>
                    <br />
                    <h2 class="underline">آگے بڑھیں</h2>
                    <div class="padding-left">
                      <p>جیسے کسی بھی غم کے عمل میں ہوتا ہے، ابتدائی صدمہ اور اچانک اور پرتشدد موت کی بے اعتباری لمبا عرصہ لے سکتی ہے اور یہ ایک شخص سے دوسرے میں مختلف ہوگی اس سے آگے بڑھتے ہیں۔ یہ سمجھنا کہ کیا ہو چکا ہے اور مکمل اس سے گزرنے میں فرق ہے۔ ناانصافی کا احساس اور نقصان ہوسکتا ہے کہ آپ کو کبھی بھی نہ چھوڑے لیکن یہ سمجھنا کہ کیا ہوا تھا کا مطلب ہوگا کہ ان جذبات کو قبول کررہیں ہیں اور ابھی بقیہ اپنی زندگی گزارنے کے قابل ہیں۔ اسی طرح تمام محرومیوں کے ساتھ دوسرے لوگوں کے ساتھ باتیں کرنا ناقابل حد تک مددگار ہوسکتا ہے۔ دوست اور فیملی آپ کے ساتھ ہوسکتی ہے لیکن اکثر اجنبیوں کے ساتھ اپنے جذبات کو بلا تحقیق کھولنا آسان ہوتا ہے۔ ماہر تنظیمیں اچانک یا پرتشدد موت کے معاملات کے لئے لوگوں کی مدد کے لئے بنائی ہیں جو بالکل یہ موقع فراہم کرتی ہیں اور اس موقعے کو جہاں تک ممکن ہوسکے استعمال کرنا چاہئیے۔</p>
                      <p>اگر آپ کے پاس غم کے عمل کے بارے میں یا اچانک یا پرتشدد موت کو سمجھنے کے بارے میں کوئی سوالات ہوں تو مہربانی فرما کر ہم سے بذریعہ ای-میل رابطہ کریں (Email) یا بذریعہ فون 0100 000 0000۔</p>
                    </div>
                 
                </div>', N'اچانک موت کا صدمے', N'اچانک موت کا صدمے', N'banner-about51114.jpg', N'SHOCK OF SUDDEN DEATH')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (10, N'  <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ خودکشی</h2>
                    <div class="padding-left">
                      <p>آپ کے کسی عزیز کی موت خود کشی کے ذریعے تقریباً ایک انفرادی طور محرومی کی دردناک شکل ہے۔ کھونے کا عام احساس اور درد غلطی کے احساس کے ساتھ بڑھ جاتا ہے کہ آپ ایسا ہونے سے روک نہ سکے اور غصہ خود مرحوم پر بھی ہوتا ہے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">وجوہات</h2>
                    <div class="padding-left">
                      <p>خودکشی کی وجہ تلاش کرنا ایسا ہوسکتا ہے جیسے ناقابل یقین حد تک مشکل چیز کا کرنا ہے۔ ایسا ہے کیوں کہ اکثریت معاملات میں ہر چیز اتنی سادہ نہیں ہوتی ہے جیسے صرف کوئی  ایک وجہ ہو۔ خود کشی کے بعد پیچھے رہ جانے والوں کے لئے سب سے سخت ترین چیزیں میں سے ایک ہے درد کی حد کو سمجھنا جو ان کے کسی پیارے کو لازمی محسوس کی تھیں فیصلہ کرنے کے لئے کہ ممکنہ جواب صرف موت تھی۔ وہ شخص جو اپنی زندگی لیتا ہے صاف طور پر درد کی حالت میں تھا اتنا شدید کہ یہ ایک منطقی فیصلے کی طرح دیکھائی دیتا ہے۔ پیچھے رہ جانے والے اکثر آپ اپنے عذاب میں ہوں گے اس سوچ کے ساتھ کہ وہ کچھ زیادہ کرسکتے یا کوئی اشارہ بھی نہ ملا۔ اسی لئے مسئلے کی سچائی ہے کہ ایک خودکشی کرنے والا شخص ذہن کی ایک حالت پر ہوگا جو وجوہات اور قائل کرنے کی حد سے آگے ہوتی ہے۔ حالانکہ وہ بظاہر پرسکون اور مناسب دنیا کا سامنا کرتا ہے خود میں وہ محسوس کرتا ہے کہ وہ کچھ بڑے بنیادی انداز میں ناکام ہوچکا ہے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">ردعمل</h2>
                    <div class="padding-left">
                      <p>سب سے مشکل ترین پہلوؤں میں ایک خودکشی سے مرنے کے ساتھ دوسرے لوگوں کا ردعمل ہوتا ہے۔ حقیقت ہے کہ تفتیش، کورونر کے سوالات کا سامنا کرنا پڑے گا اور شاید کچھ میڈیا کوریج بھی اس کا مطلب ہوگا کہ آپ جانتے ہیں کہ ہر ایک اور بھی جانتا ہے کہ کیا ہوا تھا۔ یہ ناانصافی بھی ہوسکتی ہے، خودکشی کے خیال کو ابھی تک بطور کچھ حرام سا دیکھا جاتا ہے اور لوگ اس کے بارے میں بات کرنا بہت زیادہ مشکل پا سکتے ہیں کہ وہ کسی دوسرے قسم کی موت پر بات کریں۔ اسی لئے خودکشی کے بارے میں بات کرنا ایک سب سے مفید چیزوں میں سے ہے جو آپ کرسکتے ہیں جب آپ اس کا سامنا کرنے کی کوشش کرتے ہیں۔ حقیقت میں، کوئی بھی ضروری نہیں کہ آپ کے پوچھے گئے سوالات کے جوابات دے لیکن صرف آواز اٹھانے کے قابل ہونا ایک بڑا تدارک ہوسکتا ہے۔ اسی طرح، یہ آپ کو اطمینان دلاسکتا ہے کہ دوسرے لوگ جو مرحوم کے قریب تھے کوئی نشان دیکھنے میں ناکام رہیں کہ انہیں کتنی تکلیف تھی یا اس کے الٹ کہ وہ محسوس کرتے ہیں کہ خودکشی ناگزیر تھی اور کوئی اسے روک نہیں سکتا تھا۔ اگر آپ محسوس کرتے ہیں کہ آپ اپنے قریبی لوگوں سے خود کشی کے بارے میں بات نہیں کرسکتے ہیں تو پھر کئی تنظیموں سے فائدہ اٹھائیں جو ماہرانہ مشاورت کی تجویز پیش کرتی ہیں اور سننیں اس موضوع پر مرکوز خدمات۔ وضاحت کرنے کا موقع کہ کیسے آپ کسی کے لئے محسوس کرتے ہیں جو اسی چیز کو کرنے جارہا ہو یا تربیت حاصل ہوتی ہے نتائج کا سامنا کرنے کی اکثر بحالی کے لئے پہلے قدم پر نشانات لگائیں لمبی سڑک پر۔</p>
                    </div>
                    <br />
                    <h2 class="underline">آگے بڑھیں</h2>
                    <div class="padding-left">
                      <p>کئی طریقوں میں صرف طریقہ سمجھنے کے لئے ہے کسی کی خود کشی کو جو آپ کے قریب  ہے قبول کرتے ہوئے کہ ایک سطح پر آپ کبھی بھی حقیقت میں نہیں سمجھ پائیں گے کہ انہیں کیا ہوا تھا جو یہ کیا۔ آپ کبھی حقیقت کو بھلا نہیں سکتے ہیں کہ اس نے آپ کو چھوڑنا پسند کیوں کیا لیکن وقت پر آپ سمجھ سکتے ہیں کہ اس کے لئے یہی انتخاب تھا اور یہ آپ انہیں روک نہیں سکتے تھے چاہے آپ کتنی بھی کوشش کرلیتے۔ شاید آپ توجہ دے سکتے ہوں گے حقیقت سے کچھ کم اطمینان حاصل کرنے پر کہ کم از کم درد صاف طور پر اندر ان کے لئے ختم ہوچکا ہے۔ </p>
                      <p>اگر آپ کے پاس غم کے دوران کے بارے میں کوئی سوالات ہیں یا خودکشی کی موت کو سمجھنے کے بارے میں  تو برائے مہربانی ہم سے بذریعہ ای۔میل رابطہ کریں (Email) یا بذریعہ فون 0100 000 0000</p>
                    </div>
                  
                </div>', N'خودکشی', N'خودکشی', N'banner-about29612.jpg', N'SUICIDE')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (11, N'<div class="container">
                    <h2 class="underline">تدفین پلاٹ ۔ ٹیم</h2>
                    <div class="padding-left">
                      <p>کوئی کاروبار صرف اتنا اچھا ہوسکتا ہے جتنا لوگ اس کے لئے کام کرتے ہیں اور یہی وجہ ہے کہ Burialplots.co.uk بہترین لوگوں کے لئے گھر ہے۔ اوپر سے نیچے تک ٹیم ہمارا کاروبار چلارہی ہے جو بہترین صارفین کی خدمات کے لئے وقف ہیں، لوگوں کی مدد کرنے کی خواہش سے کام کرتے ہیں جن کی زندگی میں مشکل ترین لمحوں میں سے ایک کے ذریعے اور پوری طرح جذباتی اور عملی مسائل کے سلسلے سے واقف ہوتےہیں جس میں جنازے کا انتظام یا پیشگی منصوبہ بندی بھی شامل ہوسکتی ہے۔ دوسری صورت میں، کوئی جنازہ تمام لوگوں کے بارے میں ہوتا ہے ۔ جو لوگ پیچھے رہ جاتے ہیں اور شخص جو مر چکا ہے۔ Burialplots.co.uk پر لوگ اسے سمجھتے ہیں اور اسی وجہ سے ہم فخر کرتے ہیں آپ کو ان کے بارے میں کچھ تھوڑا زیادہ بتاتے ہوئے۔</p>
                    </div>
                    <br />
                    <h2 class="underline">سوانح حیات:</h2>
                    

                   
                </div>', N'ٹیم', N'ٹیم', N'banner-about3649.jpg', N'TEAM')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (12, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ شواہد</h2>
                    <div class="padding-left">
                      <p>ہم سمجھنا پسند کرتے ہیں کہ ہم بہترین ممکن خدمت فراہم کریں ہر ایک کے لئے جو ہم سے رابطہ کرتے ہیں۔ جنازے کا انتظام یا پیشگی منصوبہ بندی کرنے کا عملی اور جذباتی دونوں صورتوں میں مشکل چیز ہے۔ ہم جو مدد کی پیش کش کرتے ہیں شامل ذہنی دباؤ کو آسان کرنے کے لئے ڈیزائن کرتے ہیں اور ذہنی سکون فراہم کرتے ہیں۔ درج ذیل حوالے لوگوں سے لئے ہیں جن کی ہم نے ماضی میں مدد کی تھی، صرف واضح کرنا کہ پہلے قیمت کی خدمت کی پیشکش کرنا کتنا مشکل کام ہے:</p>
                    </div>
                    <br />
                    <h2 class="underline">صارفین سے قیمتیں:</h2>
                    

                   
                </div>', N'تعریف', N'تعریف', N'banner-about101.jpg', N'TESTIMONIALS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (13, N'  <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ – کون اور کیوں</h2>
                    <h3>کون؟</h3>
                    <div class="padding-left">
                      <p>Burialplots.co.uk ایک کمپنی ہے جو جنازے کی فراہمی میں مارکیٹ کو جدید، سادہ اور بدلنے کے لئے کام کررہی ہے۔ جنازے کا انتظام کرنا کچھ ہے جس میں لوگ روایتی طور پر اس بارے میں سوچنے میں ہچکچاتے ہیں جب تکہ بہت دیر ہوجائے، اس موقع پر ان کے قریب ترین اور پیارے ترین جنازے کی منصوبہ بندی کی حقیقت کا سامنا کرتے رہ جاتے ہیں۔ یہ حقیقت ہے کہ اس وقت جب آپ محرومی کے جذباتی اثر کا سامنا کرنے کی کوشش کررہے ہوتے ہیں، آپ کو کئی عملی مسائل اور اخراجات کا سامنا کرنا پڑتا ہے جو کسی پیارے کی وفات سے جڑے ہوتے ہیں۔ </p>
                      <p>ہم نے جنازے کے انتظام کے کام کو بدلنے کے لئے شروع کیا ہے، چاہے ضرورت فوری ہو یا کوئی شخص مستقبل کے لئے انتظام کی منصوبہ بندی کررہا ہو ۔ دونوں صورتوں میں ہم نے تجویز اور خدمات کی رینج کو حاصل کی جن کی عام طور پر صرف فیونرل ڈائریکٹر کے ذریعے رسائی ملتی ہے اور انہیں اکھٹا کرکے ایک جگہ پر لائے ہیں۔ Burialplots.co.uk کے بطور پورٹل استعمال سے کسی جنازے کے ہر پہلو پر پہنچ کے لئے یہ ممکن ہے تابوت کی خریداری سے تعریفانہ تحریر پر تجویز حاصل کرنے تک۔ تنظیموں کے رابطے کی تفصیلات بھی فراہم کرکے جو محرومی کے عملی اور جذباتی پہلوؤں کا سامنا کرنے کے لئے لوگوں کی مدد کرنے میں ماہر ہیں، ہم نے واقعی ایک اسٹاپ منزل تیار کی ہے۔ </p>
                      <p>دوسرے اہم امور پر ہماری فراہمی جیسا کہ نام سے ظاہر ہے تدفین کے پلاٹ کی فراہمی ہے۔ یوکے کی آبادی کی 25%  ابھی تک روایتی قبرستان کا انتخاب کرتی ہے۔ زمین کے ٹکڑے کی بڑھتی ہوئی مانگ اور موجودہ پلاٹوں کو دوبارہ استعمال کرنے سے ہچکچانے نے ایک صورت حال پیدا کردی ہے جس میں کئی مقامی اتھارٹیز نے دستیاب پلاٹوں کی فراہمی کی کمی کی رپورٹ دی ہے۔ ملک کے کچھ حصوں میں یہاں تک پیشن گوئی ہے کہ اگلے عشرے میں یا اس کے بعد فراہمی بالکل ختم ہوجائے گی۔ اس پس منظر کے خلاف ہم نے پورے یوکے  سے تدفین کے پلاٹ حاصل کیے اور کررہے ہیں۔ اس فراہمی اور جدید نقاط کو ملائیں اور کلک کریں – دبائیں اور ہاتھ پھیریں – ٹیکنالوجی کے ساتھ ہم نے اسے ناقابل یقین حد تک تدفین کے پلاٹ کو ڈھونڈنا آسان بنایا ہےجس کی آپ کو ضرورت ہے آپ کی پسند کے مقام پر۔ آسان ادائیگی کا انتخاب جو مرکب ہیں واضح ادائیگی کے سستے منصوبوں کے ساتھ اور حاصل خدمت جوفراہمی کو آسان اور سستا ہونے کے ساتھ فراہمی کو ملاتا ہے۔  </p>
                      <h3>کیوں؟</h3>
                      <p>ایک جنازہ زندگی کی تقریب ہے ایک پیار کا اظہار اور غم کے عمل کا اہم حصہ ہے۔ کئی عملی مسائل کو آسان کرتے ہوئے، Burialplots.co.uk نے جذبات پر متوجہ ہونے کو آسان تر کردیا ہے جو حقیقی مسئلہ ہے۔ اگر آپ کے پاس خدمات کے بارے میں جو ہم فراہم کرتے ہیں یا کسی جنازے کے انتظام کے کسی پہلو کے بارے میں کوئی سوالات ہیں تو مہربانی فرمائیں ہم سے رابطہ کریں اس (Email) پر یا فون کریں 0100 000 0000۔</p>
                    </div>               

                    
                </div>', N'کون اور کیوں', N'کون اور کیوں', N'banner-about41924.jpg', N'WHO AND WHY')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (14, N' <div class="container">
                   
                    <h2 class="underline">تدفین کے پلاٹ ۔ وصیتیں</h2>
                    <div class="padding-left">
                      <p>سب سے مشکل پہلوؤں میں ایک آپ کے لئے کسی قریبی کے کھونے کا جذباتی اثر کسی پیارے کی موت کوقبول کرنا ہے۔ حقیقت میں شامل جذبات سے نکلنے کا کوئی راستہ نہیں ہے لیکن عملی مسائل جو ضروری ہوتے ہیں جب کوئی وفات پاتا ہے کسی حد تک پیشگی منصوبہ بندی سے انہیں کافی کم سے کم کرسکتے ہیں۔</p>
                      <p>اگر کوئی توقع سے پہلے چھوٹی عمر میں وفات پاجاتا ہے تو ایک جنازے کی پیشگی منصوبہ بندی کرنے کے لئے شاید ان کے لئے کم واقع ہوتا ہے لیکن بہت سے لوگوں کے لئے یہ ایک اختیار ہے جو پیچھے رہ جانے والوں پر ذہنی دباؤ کافی کم کرنے میں مدد کرے گا۔  Burialplots.co.uk کے اہم مقاصد میں سے ایک ہے کہ اس قسم کی منصوبہ بندی کو سادہ تر بنانے کے لئے۔ پہلے موقع پر، یوکے کے ہر مقامات پر خریداری کے لئے تدفین کے پلاٹوں کو فراہمی پیش کرتے ہیں۔ ان پلاٹوں کی مانگ فراہمی سے کہیں زیادہ بڑھ گئی ہے، حالیہ سالوں میں تدفین کے پلاٹ تلاش کرنے کے لئے ٓمشکل  اور بہت زیادہ مہنگے ہوچکے ہیں۔ صرف تلاش کے اختیار کی فراہمی اور مناسب ادائیگی کے منصوبوں سے ہم اس صورت حال کا ازالہ کرنے کی کوشش کررہے ہیں اور تدفین کا پلاٹ ڈھونڈنے کے لئے جو آپ چاہتے ہیں اسے لوگوں کے لئے بہت آسان بنایا ہے۔ </p>
                      <p>سائٹ کا دوسرا بڑا مقصد جنازے کی منصوبہ بندی کے تمام پہلوؤں کے لئے ایک اسٹاپ پورٹل کے طورپر کام کرنا ہے۔ اس کو بڑھانا ہے خدمات کے لنکس کی پیشکش جیسے گل فروش، سنگ تراش اور تابوتوں کی خریداری سے لے کر محرومی کو کم کرنے کے قانونی پہلوؤں پر تجویز فراہم کرنا ہے۔ ان پہلوؤں میں سے ایک مرحوم کی ملکیت کے معاملات کو طے کرنا اور اسے بہت زیادہ سادہ بنایا ہے اگر وہ وصیت لکھنے کے لئے وقت نکالتے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">وصیت کیوں لکھیں؟</h2>
                    <div class="padding-left">
                      <p>وصیت لکھنے کی مصیبت میں جانے کے لئے کئی اچھی وجوہات ہیں۔ نیچے بیٹیں بالکل آپ کیا چھوڑنا چاہتے ہیں اور آپ کسے  اس کے لئے چھوڑنا چاہتے ہیں وصیت کو یقینی بنائیں کہ آپ کی ملکیت آپ کی خواہش کے مطابق دی جائے گی اور دینی چاہئیے، اگروصیت مناسب طریقے سے کی گئی ہے آپ کے مرنے کے بعد کسی جھگڑے سے بچتے ہوئے۔ وصیت کا احتیاط سے منصوبہ بندی، شاید کسی وکیل کی مدد کے ساتھ  کسی وراثت ٹیکس بل کو کم سے کم کرنے میں مدد مل سکتی ہے اور وصیت اکثرایک مکمل جگہ ہے چند تفصیلات کو رکھنے کے لئے اس بارے میں کہ کس قسم کا جنازہ آپ پسند کریں گے۔ </p>
                    </div>
                    <br />
                    <h2 class="underline">ایک وصیت بنانے کے لئے آپ کو کس کی ضرورت ہے</h2>
                    <div class="padding-left">
                      <p>ایک مؤثر وصیت لکھنے کے لئے آپ کی پہلی ضرورت آپ کی ملکیت کی قدر ہے۔ اس کا مطلب ہے نیچے بیٹھ جائیں اور حساب لگائیں آپ کے تمام اثاثے کتنی مالیت کے ہیں، بشمول اشیاٗ جیسے:</p>
                      <ul>
                          <li>کوئی جائداد جو آپ کی ہو</li>
                          <li>سرمایہ کاریاں جیسے اسٹاک اور شئیرز</li>
                          <li>بینک میں اور بلڈنگ سوسائئٹی اکاؤنٹس میں محفوظ رقم</li>
                          <li>انشورنس پالیسیاں</li>
                          <li>موٹر گاڑیاں</li>
                          <li>پینشن فنڈز جو مرنے پر ایک ساتھ ادا ہوتا ہے</li>
                          <li>ذاتی مال جیسے زیورات، قدیم چیزوں کا فنی کام وغیرہ</li>
                      </ul>
                      <p>یہ اہم ہوتا ہے کہ باقاعدگی سے ان اثاثوں کی قدر کچھ رقم کے طور پر معلوم کرتے رہیں جیسے اسٹاک اور جائداد، اوپر نیچے ہوسکتی ہیں۔ مثال کے طور پریو کے کے کچھ حصوں میں آپ کا گھر قدر کے لحاظ سے سالوں میں ڈرامائی انداز میں بڑھ سکتا ہے اور یہ ہوسکتا ہے آپ کی وصیت کی فراہمیوں پر اثر انداز ہوسکتا ہے۔</p>
                    </div>
                    <br />
                    <h2 class="underline">آپ کیا شامل کرنا چاہتے ہیں</h2>
                    <div class="padding-left">
                      <p>آپ کو شروع کرنا چاہئیے بالکل وہاں سے جہاں سے آپ چاہتے آپ کی ملکیت کے مختلف حصوں جاتے ہیں۔ مثال کے طور پر کئی لوگ متروکہ مال کی کچھ چیزیں انفرادی لوگوں کو جبکہ ان کی زیادہ تر ملکیت اپنے شریک حیات کے لئے چھوڑتے ہیں۔ دوسرے اپنا بڑا گھر اور اپنی آدھی ملکیت شریک حیات یا شہری ساتھی کے لئے چھوڑسکتے ہیں اور بقیہ اپنے بچوں کے درمیان شئیر کرتے ہیں۔</p>
                    </div>
                    <br />
                    <h2 class="underline">درستگی</h2>
                    <div class="padding-left">
                      <p>درست ہونے کے لئے، ایک وصیت لازمی تحریری ہو اور اس پر لازمی آپ کے اور دو گواہان کے دستخط ہوں۔ وصیت تحریر کرتے وقت لازمی آپ کی ذہنی حالت وصیت کوسمجھنے کے قابل ہو کہ اس کا کیا مطلب ہے۔ اگر اس بارے میں کوئی شک ہے ۔ مثال کے طور پر اگر آپ کو ڈیمینشیا تشخیص کی گئی ہے تو آپ کو ضرورت ہے اس کی جو “وصیت کرنے کی صلاحیت” کہلاتی ہے، جس کے لئے میڈیکل پریکٹیشنر کے دستخط شدہ ایک بیان درکار ہوسکتا ہے۔ وصیت میں بیان کرنا چاہئیے کہ اسے تمام دوسری وصیتوں کے بدلے رکھا جائے اور ہر پچھلی وصیتیں ضائع کردینی چاہئیے۔ </p>
                      <p>دو گواہان لازمی بالغ ہوں جو آپ کی موجودگی میں وصیت پر دستخط کریں۔ یہ یاد رکھنا چاہئیے کہ گواہان اور ان کے شریک حیات یا شہری ساتھی کو وصیت سے فائدہ لینے کی اجازت نہیں دی جائے گی۔ بقیہ وصیت جب تک درست ہوگی اگر کچھ کسی گواہ کے لئے چھوڑا نہیں گیا لیکن وہ رکھنے کے حقدار نہیں ہوں گے جو آپ کا انہیں دینے کا ارادہ ہے۔ وصی آپ کی ملکیت کے لئےانتخاب کرتا ہے کہ وصیت کے گواہ کے لئے اجازت دی جائے لیکن وہ جانشین نہیں ہوسکتے ہیں۔ </p>
                      <p>ایک بار وصیت مکمل ہونے پر معمولی تبدیلیاں کی جاسکتی ہیں۔ یہ وصیت کا ضمیمہ کہلاتا ہے اور لازمی وصیت کے ساتھ شامل کیاجاتا ہے دستخط اور گواہیوں کے ساتھ جیسے حقیقی وصیت تھی اگرچی دو گواہان کا ایک جیسے ہونا ضروری نہیں ہے ۔ کوئی تبدیلی نہیں ہونی چاہئیے جو حقیقی وصیت کو تبدیل کردے، صرف وصیت کے ضمیمے کو شامل کریں اور کسی بڑی تبدیلیوں کے لئے نئی وصیت تحریر کرنے کی ضرورت ہوگی۔</p>
                      <p>آپ کو وصیت کو محفوظ جگہ پر رکھنی چاہئیے، ہوسکے تو وکیل کے پاس یا بینک میں یا پروبیٹ کی خدمات کے پاس۔  اگر آپ کے پاس وصیتوں کے یا محرورمی کے حوالے سے دوسرے قانونی  کاموں کے بارے میں کوئی سوالات ہوں تو مہربانی فرما کر ہم سے رابطہ کریں (Email) پر یا فون کریں   Burialplots.co.uk  پر  0100 000 0000۔</p>
                    </div>
                   
                </div>', N'پرعزم', N'پرعزم', N'banner-about86364.jpg', N'WILLS')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (15, N'<h2 class="ql-align-center">تدفین کے پلاٹ ۔ خبریں</h2><p class="ql-align-center">جنازے کی منصوبہ بندی کے میدان میں تازہ ترین ترقی کے ساتھ جڑے رہنے کے لئے Burialplots.col.uk کی خبریں استعمال کریں۔</p><p><br></p>', N'نیوز فیڈ', N'نیوز فیڈ', N'banner-about8208.jpg', N'NEWSFEED')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (16, N'     <div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ پریس کوریج </h2>
                    <div class="padding-left">
                      <p>آپ کو ہمارا یقین کرنے کی ضروری نہیں پڑتی ہے کیوں کہ ہم جنازے کی منصوبہ بندی کے میدان میں اتنا انقلاب لاچکے ہیں۔ درج ذیل پریس کوریج پر ایک نظر ڈالیں اور آپ کو معلوم ہوگا کہ صرف ہماری تازہ، جدید اور صارف دوست طریقے نے کتنا رسائی پر اثر ڈالا ہے۔ ہم سمجھتے ہیں کہ ہم کھونے کے صدمے کا حل نئے طریقے سے پیش کررہے ہیں اور ہم یہ دیکھ کر خوش ہیں کہ کئی لوگ اس سے متفق ہیں۔ </p>
                    </div>
                    
                </div>', N'پریس کوریج', N'پریس کوریج', N'banner-about26964.jpg', N'PRESS COVERAGE')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (17, N'<div class="container">
                    <h2 class="underline">تدفین کے پلاٹ ۔ قصیدہ نویسی</h2>
                    <div class="padding-left">
                          <p>
آپ کے عزیز شخص کے جنازے کی خدمات غم کے دوران بہت مفید کردار ادا کرتی ہیں۔ کسی پیارے سے محرومی کی ابتدائی سطح پرآپ اکثر الجھے ہوئے، کھوئے اور کچھ بے حس محسوس کرسکتے ہیں۔ کسی شخص کی وفات پر شامل کئی عملی اور قانونی مسائل میں توجہ کی فراہمی کے لئے مدد کی جاسکتی ہے ان پہلے مشکل دنوں میں آپ کو انتظام کرنے کے لئے، جب کہ جنازے کے کاموں کی منصوبہ بندی  آپ کو اس شخص کے بارے میں جسے آپ نے کھویا ہے گہرائی میں سوچنے پر مجبور کرتی ہے۔  
</p>
                          <p>کئی لوگ پہلے ہی اپنے جنازے کے کاموں کا پیشگی منصوبہ بناتے ہیں اور توقع ہوتی ہیں کہ آپ اس کے لئے ان کے انتہائی شکرگزار ہوں گے۔ آخر کوجنازہ آپ کے لئے موقع ہے آخری بار خدا حافظ کہنے کے لئے جب کہ ان کی زندگی منائی جارہی ہے اور معلومات جو تفصیلات ہیں جیسا کہ موسیقی، پھول اور یہاں تک کہ تدفین کا پلاٹ از خود مرحوم نے خود پسند کئے ہیں جو آپ کے ذہن کو آسان کردے گا۔ احساس کہ بہت زیادہ اضافی کرنے سے ''وہ کیا چاہتے ہوں گے'' زیادہ ہے، یہ سوچ کافی حد تک اطمینان بخش ہے۔ </p>
                    </div>             
                    <br />
                    <h2 class="underline">قصیدے کا مقصد</h2>
                    <div class="padding-left">
                      <p>اگر جنازے کی خدمت اس طرح مکمل بنائی گئی ہے جس میں مرحوم کی شخصیت نظر آتی ہو اور اس کی عکاس ہو، قصیدہ گوئی اس عمل کا دل ہے۔ یہ آپ کے لئے ایک موقع ہے نیچے بیٹھیں اور اظہار کریں بالکل اس کا کہ آپ کے لئے ان کا کیا مطلب ہے۔ کئی خدمات کسی کی طرف سے سربراہی کرتی ہیں – اکثر کوئی مذہبی شخصیت – جو حقیقت میں زیر بحث شخص کو ہوسکتا ہے نہ جانتے ہوں۔ جب کہ آپ انہیں چند ذاتی تفصیلات فراہم کرسکتے ہیں، تقریر کےجیسا کچھ نہیں ہوسکتا ہے، دل سے لکھی، جو دنیا کو بتانے کے لئے بنائی گئی ہے بالکل ویسی ہی اس شخص کے بارے میں جو وفات پا چکا ہے جو بہت خاص تھا۔</p>
                    </div>
                    <br />
                    <h2 class="underline">شروع کرتے ہیں</h2>
                    <div class="padding-left">
                      <p>پہلی چیز کرنے کے لئے ہے کہ بیٹھ جائیں اور اس شخص کے بارے میں سوچیں جسے آپ کھوچکے ہیں۔ آپ دنیا کو بتانا چاہتے ہیں انہوں نے کتنا خاص کیا ہے، تو یاد کرنے سے شروع کریں جو انہیں نے آپ کے لئے خاص کیا تھا۔ حالانکہ یہ تکلیف دہ ہوسکتا ہے، یہ اطمینان بخش بھی ہوگا اور لوگ جو قصیدے اکثر تبصرہ لکھتے ہیں کہ ان کے کسی پیارے کے انتقال کے بعد یہ پہلی بار  ہوا تھا کہ وہ انہیں اپنی یاد میں مسکراتے ہوئے ملے۔ پریشان نہ ہوں اگر آپ خود کو باصلاحیت مصنف نہیں سمجھتے ہیں یا آپ کے پاس لفظوں کا خاص طریقہ نہیں ہے۔ لوگ زبردست ادب یا شاعرانہ فقرہ بنانے کو نہیں دیکھتے ہیں۔ وہ کچھ ایسا دیکھنا چاہتے ہیں جو دل سے نکلتا ہو، آپ کے احساس کو ظاہر کرتا ہو اور وہ شخص کو دہراتے ہیں جسے یہاں یاد کرنے کے لئے ہیں۔ اپنی سوچوں پر توجہ دینے کے لئے یہ مشکل ہوسکتا ہے تو قصیدے کے لئے اس کے ڈھانچے پر فیصلہ کرنا بہترین ہے۔ ان کی زندگی کو ترتیب وار دیکھ سکتے ہیں خاص سوچ پر توجہ دیں جیسا کہ ان کے حس مزاح یا نرم دل طبیعت یا ان کی زندگی کے دو یا تین واقعات لیں۔ کوئی قصیدہ حقیقت میں ضرورت سے زیادہ افسردہ نہ ہو۔ کسی شخص کی کئی جوش وخروش کی یادیں ہوتی ہیں جن میں ہنسی شامل ہوتی ہے اور آپ کا قصیدہ اتنا مزاحیہ ہوسکتا ہے جتنا یہ دکھ ہے </p>
                    </div>
                    <br />
                    <h2 class="underline">مواد</h2>
                    <div class="padding-left">
                      <p>قصیدہ لکھنے کا مقصد آپ کے پیارے کو زندگی میں کچھ لمحوں کے لئے واپس لانا ہوتا ہے خاص طور پر ان کی شخصیت کی جہتیں ظاہر کرنے کے لئے جو ہر ایک پہچانے اور یاد رکھے گا۔ آپ یہ کرسکتے ہیں ان کی کامیابیوں کی فہرست، شخصیت کا منفرد ذکر یا باتیں جو وہ اکثر استعمال کرتے تھے برے وقت کے ساتھ ساتھ اچھے وقت کی تفصیل کہ  کیسے نبھاتے تھے، باتیں جو آنے والی نسلوں کی زندگیوں پر کیسے اثر انداز ہوسکتی ہیں اور ان کی گفتگو کا اثر جو وسیع برادری پر ہوچکا تھا۔</p>
                    </div>
                    <br />
                    <h2 class="underline">لب و لہجہ</h2>
                    <div class="padding-left">
                      <p>ایسی زبان کو استعمال کرنے کی مجبوری محسوس نہ کریں جیسے ''آج ہم یہاں جمع ہوئے ہیں''۔ اس طریقے سے بات کریں جیسے آپ قدرتی طور پر محسوس کرتے ہیں اور مرحوم کی خالص عکاسی ہو۔ اگر آپ سمجھتے ہیں ان کے پاس ان کی تعریف گانے میں سننے میں عاجزی ہے یا اس کے برعکس ہر لفظ سے متفق ہیں تو یہ کہنے سے شرمائیں نہیں۔ دوسرے لوگوں سے آپ ان کی یادوں پر باتیں  کرنے کے لئے پوچھیں جو انہیں جانتے ہوں اس طرح آپ کو چیزیں ملیں گی جو آپ تصویر بنانے کے لئے استعمال کرسکتے ہیں آپ کی پینٹنگ بھرپورہے۔ قصیدے کو زیادہ طویل نہ کریں خاص طور پر اگر آپ عوام میں بات کرنے کے عادی  نہیں ہیں۔ پانچ منٹ سے زیادہ کوئی چیز ہو تو لوگ قدرتی طور پر دلچسپی کھونا شروع کرسکتے ہیں۔</p>
                      <p>جیسا کہ جنازے کے تمام پہلوؤں کے ساتھ قصیدے کو لکھنے کے لئے کوئی صحیح یا غلط طریقہ نہیں ہے۔ دل سے بات کریں، اپنے پیارے شخص کے بارے میں بات کریں اور کیوں آپ ان سے پیار کرتے تھے اور آخری الوداعی شوق کہنے کا موقع لیں اور آپ پابند ہیں کچھ دینے کے لئے جو ان سب کو چھوتا ہے جو اسے سنتے ہیں۔ </p>
                    </div>

                </div>', N'قصیدہ نویسی', N'قصیدہ نویسی', N'banner-about16863.jpg', N'WRITING EULAGIES')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (18, N'<div class="container">
                    <h2 class="underline">Burial Plots  Where to Start</h2>
                    <div class="padding-left">
                      <p>When somebody close to you dies the first challenge is to deal with the grief, pain, anger and numbness that can feel all but overwhelming in the initial aftermath of bereavement. What shocks many people, however, are the number of issues which also have to be dealt with immediately following a death. For some, these bureaucratic and practical matters can feel all but overwhelming, whilst others find that having a focus of this kind actually helps them to get through the first few  days of bereavement. The number of agencies which have to be liaised with, and the documentation and red tape involved, can be minimised through a degree of pre-planning, particularly in terms of arranging a funeral, but every death brings with it a range of legal and administrative tasks. </p>
                      <p>At Burialplots.co.uk we’ve pulled together the full range of information needed in the case of bereavement. From the moment that a person dies, through finding a burial plot and arranging a funeral, to coping with the aftermath of life moving forward, you’ll find all of the information and advice you need within this website.  This begins with the steps which need to be taken immediately following the death of a loved one.</p>
                    </div>
                    <br />
                    <h2 class="underline">Register the Death</h2>
                    <div class="padding-left">
                      <p>In the majority of cases, the death has to be registered within five days. The best place to do so is at the local register office, as this means that you’ll receive the documents needed on the same day. The process should take no more than 30 minutes, and you may need to arrange an appointment beforehand. The death can be registered by:</p>
                      <ul>
                          <li>A relative of the deceased</li>
                          <li>A person present at the death</li>
                          <li>An administrator from the hospital (if the death occurred in hospital)</li>
                          <li>The person who found the body (if death took place elsewhere)</li>
                          <li>The person in charge of making arrangements with the funeral directors</li>
                      </ul>
                      <p>You’ll need to take the certificate showing the cause of death, signed by a doctor, and it would be useful, although not compulsory, to take any or all of the following documents:</p>
                      <ul>
                          <li>The birth certificate</li>
                          <li>A council tax bill</li>
                          <li>The driving licence</li>
                          <li>A marriage or civil partnership certificate</li>
                          <li>An NHS medical card</li>
                          <li>A passport</li>
                          <li>Proof of address such as a utility bill</li>
                      </ul>
                      <p>You will need to tell the registrar the full name of the deceased at the time when they died, as well as any maiden name. You will also need to provide details of their date and place of birth, last residential address and occupation, if applicable. The registrar will also need to know the name, date of birth and occupation of any spouse or civil partner, whether surviving or deceased, and you will have to provide details of any state pension or other benefits the deceased was receiving.</p>
                      <p>When the process is complete, the registrar will provide you with a Certificate for Burial or Cremation, known as a ‘green form’ and a form BD8 which is the Certificate of Registration of Death. If the deceased was in receipt of a state pension of other benefits, the BD8 will have to be filled in and sent off in the pre-paid envelope provided. </p>
                      <p>Copies of the Death Certificate can be purchased from the registrar for a small fee, and these will be needed when sorting out the affairs of the deceased.</p>
                    </div>
                    <br />
                    <h2 class="underline">If a Coroner is Involved </h2>
                    <div class="padding-left">
                      <p>In some cases, such as when the cause of death remains unknown or was violent or unnatural, the doctor involved may report the death to the coroner. If this is the case, the process of registering the death may take longer. In some cases the coroner may decide that the cause of death is obvious, in which case the doctor can sign the death certificate as before and the coroner will issue a separate certificate stating that a post mortem isn’t needed. If a post mortem examination is required this will cause a delay in issuing the death certificate, particularly if the post mortem is inconclusive and the coroner decides to hold an inquest. In cases such as this, you can be issued with an interim death certificate which can be used to prove that the person has died when dealing with various organisations.</p>
                      <p>Once the death has been registered, it is possible to begin the process of arranging a funeral. For advice on this or any other post bereavement issues, please contact us via email at (Email) or by calling 0100 000 000. </p>
                    </div>
                    
                </div>', N'کہاں سے شروع', N'WHERE TO START', N'banner-where-to-start456.jpg', N'WHERE TO START')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (19, N'
            <header id="masthead" class="site-header" role="banner">
                <div class="site-header-main">
                    <div class="banner" style="background-image: url(''images/banner-where-to-start.jpg'');">
                    
                    </div><!-- banner -->
                    <!-- .site-header-menu -->
                </div>
                <!-- .site-header-main -->
            </header>
            <!-- .site-header -->
         
                                <h2 class="underline">Burial Plots After Funeral</h2>
                                <div class="padding-left">
                                    <p>For many people, the period immediately following the funeral represents one of the hardest stages of the grieving process. Arranging the funeral, as complex as it might be, can provide a focus which is lacking in the immediate aftermath. At the same time, the loss of your loved one is still recent and the feelings fairly raw, whilst the help and support provided by other people may not be as forthcoming. </p>
                                    <p>Here at Burialplots.co.uk we work to make the bereavement process as simple as possible. We do that by offering easy and affordable access to burial plots at a time when the supply of plots is falling far behind the demand. We also bring together all the help and advice you might need following the loss of someone close to you, from dealing with the psychological impact to offering access to the practical help and services needed. Whilst the funeral itself marks one particular phase of the grieving process, the period immediately following marks the beginning of the rest of your life without the presence of the deceased. Elsewhere on the site you’ll find advice on how to cope with grief in the longer term, and the details of organisations which can help with this. Immediately following the funeral, however, there are a number of practical steps which you may have to take. </p>
                                </div>
                                <br />
                                <h2 class="underline">Tell Us Once</h2>
                                <div class="padding-left">
                                    <p>Although you will have informed friends and family at the time loss itself, there are other organisations and bodies which will need to be notified in the longer term. Some of this may have been dealt with when the death was registered. In some areas the Tell Us Once service is available. If it is then the registrar will provide a unique reference number which can be used online or when you phone the Tell Us Once helpline. You will need to provide the following information to Tell Us Once:</p>
                                    <ul>
                                        <li>The date of birth of the deceased</li>
                                        <li>Their National Insurance Number</li>
                                        <li>Their driving licence number (if applicable)</li>
                                        <li>Their passport number (if applicable) </li>
                                        <li>Details of any benefits they were receiving, such as a State Pension</li>
                                        <li>Details of council services they accessed, such as the Blue Badge scheme</li>
                                        <li>The name and address of the next of kin</li>
                                        <li>The name and address of any spouse or civil partner, if different from the next of kin</li>
                                        <li>If a person or company, such as a law firm, is administering the estate of the deceased, which includes anything such as property, valuables and money, then you will need to provide their name, address and contact details </li>
                                        <li>The details of any armed forces or public sector pension schemes they were a party to. </li>
                                    </ul>
                                    <p>Please note that you’ll need the permission of the next of kin, any person dealing with their estate (generally referred to as the ‘executor’ or ‘administrator’) and anyone who was in joint receipt of entitlements or benefits, before you give their details to Tell Us Once. </p>
                                    <p>Once you’ve given the relevant details to Tell Us Once, they will inform the following organisations:</p>
                                    <ul>
                                        <li>HM Revenue and Customs (HMRC)</li>
                                        <li>Department for Work and pensions (DWP)</li>
                                        <li>The Passport Office</li>
                                        <li>The Driver and Vehicle Licensing Agency (DVLA)</li>
                                        <li>The local council </li>
                                        <li>Any public sector or armed forces pension schemes</li>
                                    </ul>
                                    <p>At the time of writing, the following local authorities don’t offer the Tell Us Once service, meaning that you will have to contact the relevant bodies yourself:</p>
                                    <ul>
                                        <li>Brighton and Hove</li>
                                        <li>Croydon</li>
                                        <li>East Sussex</li>
                                        <li>Eastbourne</li>
                                        <li>Hammersmith and Fulham</li>
                                        <li>Harrow</li>
                                        <li>Hastings</li>
                                        <li>Highland</li>
                                        <li>Lewes</li>
                                        <li>Liverpool</li>
                                        <li>Manchester</li>
                                        <li>Medway</li>
                                        <li>Portsmouth</li>
                                        <li>Rother</li>
                                        <li>Salford</li>
                                        <li>Wealden</li>
                                    </ul>
                                </div>
                                <br />
                                <h2 class="underline">Other Organisations</h2>
                                <div class="padding-left">
                                    <p>Whether you use Tell Us Once or not, you will also need to inform any banks or building societies which the deceased used so that accounts can be closed down or modified. You will also have to notify the following bodies or organisations:</p>
                                    <ul>
                                        <li>Any employer of the deceased</li>
                                        <li>The Social Services, specifically to cancel any services which were being provided</li>
                                        <li>Medical organisations such as a hospital, doctors or dentists in order to cancel any appointments and return equipment where applicable</li>
                                        <li>Legal representatives such as solicitors</li>
                                        <li>Any bodies providing voluntary services, such as meals on wheels or Care and Repair</li>
                                    </ul>
                                    <p>The precise details will differ from person to person, but you may also need to get in touch with a private landlord, a mortgage provider, insurance companies, utility companies (i.e. water, gas and electric) a telephone company (mobile or landline), TV Licensing, companies from which the deceased rented household appliances such as digital TV boxes, internet providers, credit card or other loan companies. You may also need to cancel the membership of organisations such as libraries, social clubs, unions and professional organisations. If any children in the family were close to the deceased then it may be a good idea to inform their school, allowing teachers to deal with any reactions in a sensitive and informed manner. </p>
                                </div>
                                <br />
                                <h2 class="underline">Your Own Circumstances</h2>
                                <div class="padding-left">
                                    <p>The death of someone close to you may lead to a change in your personal circumstances. If this is the case, you may be eligible for certain benefits or entitlements. Your local Social Security or DWP office should be able to advise if this is the case, as will the Citizens Advice Bureau. </p>
                                    <p>The number of practical issues which emerge following the death of someone close to you can feel almost overwhelming. The good news is that help is available, and if you don’t find the information you’re looking for on this site then please contact us, via email at (Email) or by calling 0100 000 0000. </p>
                                </div>

                              ', N'جنازے کے بعد', N'AFTER FUNERAL', N'banner-where-to-start85273.jpg', N'AFTER FUNERAL')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (20, N'<header id="masthead" class="site-header" role="banner">
    <div class="site-header-main">
        <div class="banner" style="background-image: url(''images/banner-where-to-start.jpg'');">
       
        </div><!-- banner -->
        <!-- .site-header-menu -->
    </div>
    <!-- .site-header-main -->
</header>
<!-- .site-header -->

                    <h2 class="underline">Burial Plots Arranging</h2>
                    <div class="padding-left">
                        <p>Here at Burialplots.co.uk our main aim is to make arranging a funeral simpler than it’s ever been. To that end we’ve made it easier to find your perfect burial plot. The precise location of a final resting place is of huge importance to anyone who wishes to be buried, but the truth of the matter is that the supply of burial plots in the UK is at historically low levels. This has two effects – it drives up prices and it makes finding your preferred location incredibly difficult. We’ve created an online solution that gathers plots from around the UK in one place. We’ve made searching for the perfect plot incredibly simple and we offer a choice of payment options, from advanced payment to setting up a payment plan. Whether you’re need is urgent or you’re planning for the future, we’ll give you peace of mind. </p>
                        <p>As well as providing burial plots we make the task of arranging a funeral much simpler in general terms. Across the site you’ll find advice, help and links dealing with every aspect of bereavement, from the psychological impact of losing a loved one to the practical matter of registering a death. While most people place arranging a funeral in the experienced hands of a funeral director, it’s still vital to have a clear idea of just what the funeral in question is going to involve. Although thinking about it may seem difficult at the time, the funeral is your chance to say goodbye and celebrate the life of the deceased. As time goes by the fact that you gave them the farewell they deserved will come to be a source of great comfort.</p>
                    </div>
                    <br />
                    <h2 class="underline">The Arrangements</h2>
                    <div class="padding-left">
                        <p>Every funeral will be different, representing the person who has died and the feelings of those left behind. That’s why, even when working with a funeral director, it’s helpful to have an idea in your head of what the various components of the average funeral are. Practical matters such as choosing a casket and memorial, or arranging the purchase of flowers, are dealt with elsewhere on Burialplots.co.uk. Pulling together the details of the funeral service is a deeply personal matter, and a few of the factors to bear in mind are the following:</p>
                        <ul>
                            <li><strong>The venue for the funeral</strong> – it’s generally assumed that funeral services take place in a church or some other religious building. It can take place in any suitable venue or even a private home, however, which may be more apt for someone without strong religious beliefs.</li>
                            <li><strong>The service</strong> – once again, the assumption is that the service will be led by a religious figure such as a minister or priest. It could, however, be led by a humanist, the funeral director you’ve hired or even by someone close to the deceased.</li>
                            <li><strong>Content</strong> – the words actually spoken are very important. If, as is often the case, the person leading the service didn’t know the deceased, make sure you provide them with the details needed to personalise the service. You can also have other people reading out things such as poems, prayers or anything else which you think helps to reflect the personality and life of the deceased.</li>
                            <li><strong>Music</strong> – hymns are traditionally the music featured at funerals, but in recent years it has become increasingly popular to include other types of music. This is generally played via CD’s or downloads of favourite songs, but live music is also an option.</li>
                            <li><strong>Order of Service</strong> – a printed order of service will serve two purposes. It will make it easier for those attending the funeral to follow the proceedings, and it will give everyone a memento to keep, reminding them of the person they are saying goodbye to. The order of service could also be sent to those friends and family members who are unable to attend on the day. </li>
                        </ul>
                        <p>You’ll also need to consider arrangements around the funeral itself. Transport to and from the funeral will usually consist of a hearse and cars arranged by the funeral director. Like any other aspect, however, this can be personalised. Some people prefer a horse drawn carriage, whilst others might opt for a mode of transport linked to the deceased, up to and including vans, truck and motorbikes. </p>
                        <p>Arranging a funeral means thinking about the life of the person you’ve just lost and how you’d like to mark it. It’s often a therapeutic process, marking the first step towards healing the pain of bereavement. If you’d like to discuss the process then please contact us by email at (Email) or call us on 0100 000 000. </p>
                    </div>

                    ', N'انتظام کرنا', N'ARRANGING', N'banner-where-to-start11492.jpg', N'ARRANGING')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (21, N'<div class="container">
                    <h2 class="underline">Burial Plots Services</h2>
                    <div class="column-block">
                      <div class="column">
                           <p>Dealing with the death of a loved one is always going to be a difficult experience, particularly when the emotions involved are compounded by a range of complex practical and legal issues. Forward planning – such as writing a will, arranging a funeral or taking out life insurance – can minimise such problems, but there are always going to be matters which have to be dealt with. </p>
                          <p>One of the main aims of Burialplot.co.uk is to make dealing with matters of this kind much simpler. By bringing together all of the advice and help you’ll need in one place, as well as access to the relevant services, we make it easy to find out exactly what needs to be done when a person dies, and which aspects you’re likely to need professional help with.</p>
                      </div>
                      <div class="column">
                          <img src="/images/video.jpg" alt="">
                      </div>
                    </div>
                    <div class="padding-left">
                      <p>This is particularly true when it comes to the legal matters involved in dealing with a person’s estate. The issue of acting as an executor of a will and dealing with probate is dealt with elsewhere on the site, as is writing a will. Whilst, in some cases, it is simpler to handle these aspects of estate management yourself, the more complex estates might call for professional input; those estates which are valuable enough to warrant inheritance tax, for example, or when a person has died without leaving a will specifying how they want their estate to be divided.</p>
                    </div>
                    <br />
                    <h2 class="underline">Probate Services</h2>
                    <div class="padding-left">
                      <p>If you’ve agreed to execute a will and feel that the task is simply too complicated to handle, or that you can’t spare the time and effort involved, then you may wish to enlist the aid of a professional probate service. A probate service of this kind is generally offered by a solicitor or accountant, although there are some firms which run as dedicated probate specialists. All will charge a fee for handling probate, and it is best to shop around to get the best fee possible. Some specialists, for example, offer an estimated fee which may rise higher as the process develops, whilst others work for a fixed percentage of the value of the estate. It may seem simpler to work with the solicitors who drew up or stored the will, but there is no obligation to do so, and you may be able to find a better deal elsewhere. </p>
                    </div>
                    <br />
                    <h2 class="underline">Type of Service</h2>
                    <div class="padding-left">
                      <p>Depending upon the complexity of the estate in question you may opt for either of two types of service, a Full Estate Administration or a Grant Only service. A Full Estate Administration service will deal with all aspects of probate on your behalf, from valuing the estate through preparing all necessary paperwork and paying liabilities to distributing the estate to the beneficiaries. A Grant Only probate service will expect you to gather all the relevant information regarding the estate, after which they will prepare the necessary paperwork and gain the grant of representation.  The grant will then be given to you, enabling you to deal with the estate. If you use a Grant Only service you will save money in fees but bear full responsibility for aspects such as finalising the tax position, paying taxes and distributing the estate.</p>
                      <p>Planning carefully in advance can minimise the complexity and stress of estate management, as can accessing the correct services following a death. For advice on either of these, contact us at (Email) or by calling 0100 000 0000.</p>
                    </div>
               
                </div>', N'خدمات', N'SERVICES', N'banner-about73860.jpg', N'SERVICES')
INSERT [dbo].[UrduPage] ([Id], [Body], [PageTittle], [Pageurl], [FeatureImage], [ServiceTitle]) VALUES (22, N'<div class="section customMarginMediaQuery" id="MainSection">
    <div class="container" style="text-align:center;">
        <!-- <h2>Burial Plots</h2> -->
        <p>کسی قریبی عزیز کی کھونے کے ساتھ معاملہ آپ کے لئے ہمیشہ شدید صدمے اور مشکل دور سے باندھ دیتا ہے۔ کھونے کے جذباتی اثر کی حالت کو جانتے ہوئے، کسی پیارے یا قریبی دوست کی وفات کا مطلب بھی بات چیت کے لئے پیچیدہ اور بددل عملوں کا جوڑا ہے۔ اسی لمحے جب آپ محسوس کرتے ہوں کہ آپ عملی، قانونی یا مالیاتی مسائل پر توجہ دینے کے قابل نہیں ہیں تو آپ تلاش کرتے ہیں کہ آپ خود اسے مختصراً کریں۔</p>
        <p>یہاں Burialplots.co.uk پر ہم ذہنی دباؤ کو کم کرنے کے لئے دو چیزیں کرتے ہیں جو تمام اس میں شامل ہوتے ہیں۔ ان میں پہلی چیز پورے یو کے میں تدفین کے سستے پلاٹوں کے لئے رسائی کی فراہمی  کرتا ہے، انتخاب لاتا ہے، مناسب اور آسان بازار کے لئے جو حالیہ ضرورت کو پورا کرنے میں ناکام ہیں۔ دوسری ہے معلومات کے ذرائع کی فراہمی اور مدد ہر ایک کے لئے جو مستقبل کے لئے منصوبے بنا کرخود جنازے کے انتظام کرتے ہیں یا بے یقینی کو ہٹانے کی خواہش رکھتے ہیں، </p>
        <br /> <br />
        <h2 style="color:darkslategray;">تدفین کے پلاٹ </h2>
        <p>حالانکہ قبرستان کئی لوگ کا انتخاب ہے ثقافتی مذہبی یا ذاتی وجوہات کی بناء پر تدفین کو ترجیح دیتے ہیں اور یہی صورت حال جس سے ضرورت فراہمی پر سبقت لے جانے کا اور ہر سال قیمت شرح افراط زر سے زیادہ بڑھنے کا باعث بن رہی ہے۔ پورے یو کے میں زمین مزید گھر اور بنیادی ڈھانچے کی ضرورت کے لئے رکھی گئی ہے، مقامی اتھارٹیز تدفین کے پلاٹوں کے لئے رسائی کو فراہم کرنا مشکل تر سے مشکل تر پارہے ہیں۔ ملک کے کچھ حصوں میں اس کی فراہمی تمام ہوچکی ہے بلکہ رک چکی ہے جب کہ کئی اتھارٹیز کا اندازہ ہے کہ آنے والے سالوں میں تدفین کے پلاٹوں کے لئے رسائی بڑی حد تک نایاب ہوجائے گی۔ اس پس منظر کے خلاف Burialplots.co.uk یقین کی  یقین دھانی فراہم کرنے کے قابل ہے۔ بجائے انتظار کرنے اور امید کرنے کے کہ جب وقت آئے گا پلاٹ دستیاب ہوگا، ہمارے صارفین پہلے سے شفاف اور یقین کے ساتھ منصوبہ بناسکتےہیں۔ بہت سے لوگ مطمئن رکھتے ہیں یہ جانتے ہوئے کہ ان کے پاس ایک پلاٹ ہے یا پہلے سے خریدے ہوئے پلاٹ ہیں، خاص طور پر اگر ان کی آخری آرام گاہ ان کے فیملی کے ارکان کے قریب یا ایک ہی مذہبی عقائد رکھنے والوں کے ساتھ ہونے کی خواہش رکھتے ہیں۔ ہم اپنے صارفین کو انتظامات کرنے کے قابل کرتے ہیں جیسے روایتی فیونرل ڈائریکٹر کے نمونوں کی ضرورت سے زیادہ فراہمی کی پیشکش اور پیشگی ادائیگی اور ادائیگی کے منصوبے کے اختیارات کے درمیان پسند کی پیش کش سے زیادہ سے زیادہ دستیابی۔ </p>



        <div class="col-md-6" style="margin-top:50px;">
            <h2 style="text-align:center" ;>خدمات</h2>
            <p style="text-align:left;">بلاشبہ، یہاں صرف تدفین کے پلاٹ کی خریداری سے زیادہ مزید محرومی  کے عمل کے لئے مزید کچھ ہے اور ہماری سائٹ اس صورت حال میں کسی فرد کو ضرورت ہوسکتی ہے اس تمام معلومات کے لئےرسائی کی پیشکش کرتی ہے۔ چاہے اچانک کھونے کے ساتھ کا معاملہ ہو یا مستقبل کے لئے منصوبہ بندی، آنے والے موضوعات پر معلومات حاصل کرسکتے ہیں جیسے وصیت کا بنانا، پروبیٹ کا معاملہ، تابوت کو پسند کرنا، تعریفانہ تحریر اور جنازے کی تفصیلات جیسے پھولوں، کاروں اور سنگ تراشوں کے معاملات کو طے کرنا ہے۔ اس تمام معلومات کو جمع کر کے ایک جگہ پر لانے سے ہم کھونے کے ساتھ سنبھالنے کے دباؤ کو کم سے کم کرسکتا ہے اور افراد کی وفات کے فوراً بعد سے قابو پانے کے لئے یا مستقبل کی منصوبہ بندی کے تحفظ سے لطف اندوز ہونے میں مدد کرتا ہے۔  </p>
            <p style="text-align:left;">اگر آپ کے پاس کسی تدفین کے پلاٹ کے بارے میں کوئی سوالات ہیں یا کوئی اور چیز جو دکھ کے ساتھ نمٹنے کے لئے لازمی ہو، مہربانی فرما کر تردد نہ کریں ہم سے بذریعہ ای-میل رابطے کے لئے (Email) پر، یا فون کریں 0100 000 000۔ ہمارے ماہرین تیار ہیں اور تجویز اور آپ کی مطلوبہ معلومات فراہم کرنے کے انتظار میں ہیں۔ </p> <br /><br />
            <a href="/Home/More" class="btn border-btn pull-left">مزید</a>
        </div>

        <div class="col-md-6">
            <iframe width="560" height="315" style="margin-top:30px" src="https://www.youtube.com/embed/elE6iSytJks" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
</div>', N'Index', N'Index', N'banner-about16863.jpg', N'Index')
SET IDENTITY_INSERT [dbo].[UrduPage] OFF
ALTER TABLE [dbo].[BillingShipping]  WITH CHECK ADD  CONSTRAINT [FK_BillingShipping_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[BillingShipping] CHECK CONSTRAINT [FK_BillingShipping_Item]
GO
ALTER TABLE [dbo].[BillingShipping]  WITH CHECK ADD  CONSTRAINT [FK_BillingShipping_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([Id])
GO
ALTER TABLE [dbo].[BillingShipping] CHECK CONSTRAINT [FK_BillingShipping_Member]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogCategory1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[BlogCategory] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_BlogCategory1]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Item]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Member]
GO
ALTER TABLE [dbo].[Cemetery]  WITH CHECK ADD  CONSTRAINT [FK_Cemetery_Origins] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Origins] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cemetery] CHECK CONSTRAINT [FK_Cemetery_Origins]
GO
ALTER TABLE [dbo].[CemeteryImages]  WITH CHECK ADD  CONSTRAINT [FK_CemeteryImages_Cemetery] FOREIGN KEY([CemeteryId])
REFERENCES [dbo].[Cemetery] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CemeteryImages] CHECK CONSTRAINT [FK_CemeteryImages_Cemetery]
GO
ALTER TABLE [dbo].[CemeteryLayers]  WITH CHECK ADD  CONSTRAINT [FK_CemeteryLayers_Graves] FOREIGN KEY([CemeteryId])
REFERENCES [dbo].[Graves] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CemeteryLayers] CHECK CONSTRAINT [FK_CemeteryLayers_Graves]
GO
ALTER TABLE [dbo].[Counties]  WITH CHECK ADD  CONSTRAINT [FK_Counties_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Counties] CHECK CONSTRAINT [FK_Counties_Countries]
GO
ALTER TABLE [dbo].[FuneralProduct]  WITH CHECK ADD  CONSTRAINT [FK_FuneralProduct_FuneralServices] FOREIGN KEY([FuneralServiceId])
REFERENCES [dbo].[FuneralServices] ([Id])
GO
ALTER TABLE [dbo].[FuneralProduct] CHECK CONSTRAINT [FK_FuneralProduct_FuneralServices]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_Cemetery] FOREIGN KEY([SectionId])
REFERENCES [dbo].[MainSections] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_Cemetery]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_Graves] FOREIGN KEY([Id])
REFERENCES [dbo].[Graves] ([Id])
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_Graves]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_Graves1] FOREIGN KEY([Id])
REFERENCES [dbo].[Graves] ([Id])
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_Graves1]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_Relgion] FOREIGN KEY([ReligionId])
REFERENCES [dbo].[Relgion] ([Id])
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_Relgion]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_SubRelgion] FOREIGN KEY([SectId])
REFERENCES [dbo].[SubRelgion] ([Id])
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_SubRelgion]
GO
ALTER TABLE [dbo].[Graves]  WITH CHECK ADD  CONSTRAINT [FK_Graves_Tiers] FOREIGN KEY([TierId])
REFERENCES [dbo].[Tiers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Graves] CHECK CONSTRAINT [FK_Graves_Tiers]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[MainSections]  WITH CHECK ADD  CONSTRAINT [FK_MainSections_Cemetery] FOREIGN KEY([CemeteryId])
REFERENCES [dbo].[Cemetery] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MainSections] CHECK CONSTRAINT [FK_MainSections_Cemetery]
GO
ALTER TABLE [dbo].[OrderCemetery]  WITH CHECK ADD  CONSTRAINT [FK_OrderCemetery_Graves] FOREIGN KEY([CemeteryId])
REFERENCES [dbo].[Graves] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderCemetery] CHECK CONSTRAINT [FK_OrderCemetery_Graves]
GO
ALTER TABLE [dbo].[OrderCemetery]  WITH CHECK ADD  CONSTRAINT [FK_OrderCemetery_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderCemetery] CHECK CONSTRAINT [FK_OrderCemetery_Orders]
GO
ALTER TABLE [dbo].[OrderPlan]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlan_Partners] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderPlan] CHECK CONSTRAINT [FK_OrderPlan_Partners]
GO
ALTER TABLE [dbo].[OrderPlan]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlan_SeviceListing] FOREIGN KEY([ServiceListingId])
REFERENCES [dbo].[SeviceListing] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderPlan] CHECK CONSTRAINT [FK_OrderPlan_SeviceListing]
GO
ALTER TABLE [dbo].[OrderPlanItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlanItem_OrderPlan] FOREIGN KEY([OrderPlanId])
REFERENCES [dbo].[OrderPlan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderPlanItem] CHECK CONSTRAINT [FK_OrderPlanItem_OrderPlan]
GO
ALTER TABLE [dbo].[OrderPlanItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlanItem_ServiceListingPlans] FOREIGN KEY([ServiceListingPlanId])
REFERENCES [dbo].[ServiceListingPlans] ([Id])
GO
ALTER TABLE [dbo].[OrderPlanItem] CHECK CONSTRAINT [FK_OrderPlanItem_ServiceListingPlans]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[PageBox]  WITH CHECK ADD  CONSTRAINT [FK_PageBox_Page] FOREIGN KEY([Page])
REFERENCES [dbo].[Page] ([Id])
GO
ALTER TABLE [dbo].[PageBox] CHECK CONSTRAINT [FK_PageBox_Page]
GO
ALTER TABLE [dbo].[PageBox]  WITH CHECK ADD  CONSTRAINT [FK_PageBox_ServiceBox] FOREIGN KEY([Box])
REFERENCES [dbo].[ServiceBox] ([Id])
GO
ALTER TABLE [dbo].[PageBox] CHECK CONSTRAINT [FK_PageBox_ServiceBox]
GO
ALTER TABLE [dbo].[PageBox]  WITH CHECK ADD  CONSTRAINT [FK_PageBox_UrduPage] FOREIGN KEY([UrduPage])
REFERENCES [dbo].[UrduPage] ([Id])
GO
ALTER TABLE [dbo].[PageBox] CHECK CONSTRAINT [FK_PageBox_UrduPage]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnerPlan] FOREIGN KEY([PartnerPlanId])
REFERENCES [dbo].[PartnerPlan] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PartnerPlan]
GO
ALTER TABLE [dbo].[PaymentCard]  WITH CHECK ADD  CONSTRAINT [FK_PaymentCard_BillingShipping] FOREIGN KEY([BillId])
REFERENCES [dbo].[BillingShipping] ([Id])
GO
ALTER TABLE [dbo].[PaymentCard] CHECK CONSTRAINT [FK_PaymentCard_BillingShipping]
GO
ALTER TABLE [dbo].[PaymentCard]  WITH CHECK ADD  CONSTRAINT [FK_PaymentCard_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([Id])
GO
ALTER TABLE [dbo].[PaymentCard] CHECK CONSTRAINT [FK_PaymentCard_Member]
GO
ALTER TABLE [dbo].[PostCodes]  WITH CHECK ADD  CONSTRAINT [FK_PostCodes_Counties] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Counties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostCodes] CHECK CONSTRAINT [FK_PostCodes_Counties]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Members] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Members]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_SeviceListing1] FOREIGN KEY([ServiceListingId])
REFERENCES [dbo].[SeviceListing] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_SeviceListing1]
GO
ALTER TABLE [dbo].[ServiceBox]  WITH CHECK ADD  CONSTRAINT [FK_ServiceBox_Page] FOREIGN KEY([BoxUrl])
REFERENCES [dbo].[Page] ([Id])
GO
ALTER TABLE [dbo].[ServiceBox] CHECK CONSTRAINT [FK_ServiceBox_Page]
GO
ALTER TABLE [dbo].[ServiceListingPlans]  WITH CHECK ADD  CONSTRAINT [FK_ServiceListingPlans_Counties] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Counties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceListingPlans] CHECK CONSTRAINT [FK_ServiceListingPlans_Counties]
GO
ALTER TABLE [dbo].[ServiceListingPlans]  WITH CHECK ADD  CONSTRAINT [FK_ServiceListingPlans_FuneralServices] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[FuneralServices] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceListingPlans] CHECK CONSTRAINT [FK_ServiceListingPlans_FuneralServices]
GO
ALTER TABLE [dbo].[ServiceListingPlans]  WITH CHECK ADD  CONSTRAINT [FK_ServiceListingPlans_PartnerPlan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[PartnerPlan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceListingPlans] CHECK CONSTRAINT [FK_ServiceListingPlans_PartnerPlan]
GO
ALTER TABLE [dbo].[ServiceListingPlans]  WITH CHECK ADD  CONSTRAINT [FK_ServiceListingPlans_SeviceListing] FOREIGN KEY([ServiceListId])
REFERENCES [dbo].[SeviceListing] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceListingPlans] CHECK CONSTRAINT [FK_ServiceListingPlans_SeviceListing]
GO
ALTER TABLE [dbo].[SeviceListing]  WITH CHECK ADD  CONSTRAINT [FK_SeviceListing_FuneralServices1] FOREIGN KEY([FuneralServiceId])
REFERENCES [dbo].[FuneralServices] ([Id])
GO
ALTER TABLE [dbo].[SeviceListing] CHECK CONSTRAINT [FK_SeviceListing_FuneralServices1]
GO
ALTER TABLE [dbo].[SeviceListing]  WITH CHECK ADD  CONSTRAINT [FK_SeviceListing_Partners] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([Id])
GO
ALTER TABLE [dbo].[SeviceListing] CHECK CONSTRAINT [FK_SeviceListing_Partners]
GO
ALTER TABLE [dbo].[Slides]  WITH CHECK ADD  CONSTRAINT [FK_Slides_Slider] FOREIGN KEY([SliderId])
REFERENCES [dbo].[Slider] ([Id])
GO
ALTER TABLE [dbo].[Slides] CHECK CONSTRAINT [FK_Slides_Slider]
GO
ALTER TABLE [dbo].[SubCate]  WITH CHECK ADD  CONSTRAINT [FK_SubCate_Category] FOREIGN KEY([MainCate])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCate] CHECK CONSTRAINT [FK_SubCate_Category]
GO
ALTER TABLE [dbo].[SubChlidMenu]  WITH CHECK ADD  CONSTRAINT [FK_SubChlidMenu_submenu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[submenu] ([Id])
GO
ALTER TABLE [dbo].[SubChlidMenu] CHECK CONSTRAINT [FK_SubChlidMenu_submenu]
GO
ALTER TABLE [dbo].[submenu]  WITH CHECK ADD  CONSTRAINT [FK_submenu_submenu] FOREIGN KEY([menuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[submenu] CHECK CONSTRAINT [FK_submenu_submenu]
GO
ALTER TABLE [dbo].[SubRelgion]  WITH CHECK ADD  CONSTRAINT [FK_SubRelgion_Relgion] FOREIGN KEY([RelgioId])
REFERENCES [dbo].[Relgion] ([Id])
GO
ALTER TABLE [dbo].[SubRelgion] CHECK CONSTRAINT [FK_SubRelgion_Relgion]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Counties] FOREIGN KEY([CountyId])
REFERENCES [dbo].[Counties] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Counties]
GO
ALTER TABLE [dbo].[UrduPage]  WITH CHECK ADD  CONSTRAINT [FK_UrduPage_UrduPage] FOREIGN KEY([Id])
REFERENCES [dbo].[UrduPage] ([Id])
GO
ALTER TABLE [dbo].[UrduPage] CHECK CONSTRAINT [FK_UrduPage_UrduPage]
GO
USE [master]
GO
ALTER DATABASE [BurialPlots] SET  READ_WRITE 
GO
