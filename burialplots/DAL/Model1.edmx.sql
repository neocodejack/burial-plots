
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/24/2018 21:34:56
-- Generated from EDMX file: E:\avishek-git-projects\burial-plots\BurialPlots\DAL\Model1.edmx
-- --------------------------------------------------
CREATE DATABASE [BurialPlots]
SET QUOTED_IDENTIFIER OFF;
GO
USE [BurialPlots];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BillingShipping_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillingShipping] DROP CONSTRAINT [FK_BillingShipping_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_BillingShipping_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BillingShipping] DROP CONSTRAINT [FK_BillingShipping_Member];
GO
IF OBJECT_ID(N'[dbo].[FK_Blog_BlogCategory1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Blog] DROP CONSTRAINT [FK_Blog_BlogCategory1];
GO
IF OBJECT_ID(N'[dbo].[FK_Cart_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_Cart_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK_Cart_Member];
GO
IF OBJECT_ID(N'[dbo].[FK_Cemetery_Origins]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cemetery] DROP CONSTRAINT [FK_Cemetery_Origins];
GO
IF OBJECT_ID(N'[dbo].[FK_CemeteryImages_Cemetery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CemeteryImages] DROP CONSTRAINT [FK_CemeteryImages_Cemetery];
GO
IF OBJECT_ID(N'[dbo].[FK_CemeteryLayers_Graves]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CemeteryLayers] DROP CONSTRAINT [FK_CemeteryLayers_Graves];
GO
IF OBJECT_ID(N'[dbo].[FK_Counties_Countries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Counties] DROP CONSTRAINT [FK_Counties_Countries];
GO
IF OBJECT_ID(N'[dbo].[FK_FuneralProduct_FuneralServices]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FuneralProduct] DROP CONSTRAINT [FK_FuneralProduct_FuneralServices];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_Cemetery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_Cemetery];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_Graves]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_Graves];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_Graves1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_Graves1];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_Relgion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_Relgion];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_SubRelgion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_SubRelgion];
GO
IF OBJECT_ID(N'[dbo].[FK_Graves_Tiers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Graves] DROP CONSTRAINT [FK_Graves_Tiers];
GO
IF OBJECT_ID(N'[dbo].[FK_Item_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Item] DROP CONSTRAINT [FK_Item_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_MainSections_Cemetery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MainSections] DROP CONSTRAINT [FK_MainSections_Cemetery];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderCemetery_Graves]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderCemetery] DROP CONSTRAINT [FK_OrderCemetery_Graves];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderCemetery_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderCemetery] DROP CONSTRAINT [FK_OrderCemetery_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderPlan_Partners]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderPlan] DROP CONSTRAINT [FK_OrderPlan_Partners];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderPlan_SeviceListing]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderPlan] DROP CONSTRAINT [FK_OrderPlan_SeviceListing];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderPlanItem_OrderPlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderPlanItem] DROP CONSTRAINT [FK_OrderPlanItem_OrderPlan];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderPlanItem_ServiceListingPlans]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderPlanItem] DROP CONSTRAINT [FK_OrderPlanItem_ServiceListingPlans];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_Members]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Members];
GO
IF OBJECT_ID(N'[dbo].[FK_PageBox_Page]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PageBox] DROP CONSTRAINT [FK_PageBox_Page];
GO
IF OBJECT_ID(N'[dbo].[FK_PageBox_ServiceBox]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PageBox] DROP CONSTRAINT [FK_PageBox_ServiceBox];
GO
IF OBJECT_ID(N'[dbo].[FK_PageBox_UrduPage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PageBox] DROP CONSTRAINT [FK_PageBox_UrduPage];
GO
IF OBJECT_ID(N'[dbo].[FK_Partners_PartnerPlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Partners] DROP CONSTRAINT [FK_Partners_PartnerPlan];
GO
IF OBJECT_ID(N'[dbo].[FK_PaymentCard_BillingShipping]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentCard] DROP CONSTRAINT [FK_PaymentCard_BillingShipping];
GO
IF OBJECT_ID(N'[dbo].[FK_PaymentCard_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentCard] DROP CONSTRAINT [FK_PaymentCard_Member];
GO
IF OBJECT_ID(N'[dbo].[FK_PostCodes_Counties]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostCodes] DROP CONSTRAINT [FK_PostCodes_Counties];
GO
IF OBJECT_ID(N'[dbo].[FK_Reviews_Members]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_Reviews_Members];
GO
IF OBJECT_ID(N'[dbo].[FK_Reviews_SeviceListing1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_Reviews_SeviceListing1];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceBox_Page]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceBox] DROP CONSTRAINT [FK_ServiceBox_Page];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceListingPlans_Counties]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceListingPlans] DROP CONSTRAINT [FK_ServiceListingPlans_Counties];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceListingPlans_FuneralServices]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceListingPlans] DROP CONSTRAINT [FK_ServiceListingPlans_FuneralServices];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceListingPlans_PartnerPlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceListingPlans] DROP CONSTRAINT [FK_ServiceListingPlans_PartnerPlan];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceListingPlans_SeviceListing]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceListingPlans] DROP CONSTRAINT [FK_ServiceListingPlans_SeviceListing];
GO
IF OBJECT_ID(N'[dbo].[FK_SeviceListing_FuneralServices1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SeviceListing] DROP CONSTRAINT [FK_SeviceListing_FuneralServices1];
GO
IF OBJECT_ID(N'[dbo].[FK_SeviceListing_Partners]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SeviceListing] DROP CONSTRAINT [FK_SeviceListing_Partners];
GO
IF OBJECT_ID(N'[dbo].[FK_Slides_Slider]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Slides] DROP CONSTRAINT [FK_Slides_Slider];
GO
IF OBJECT_ID(N'[dbo].[FK_SubCate_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubCate] DROP CONSTRAINT [FK_SubCate_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_SubChlidMenu_submenu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubChlidMenu] DROP CONSTRAINT [FK_SubChlidMenu_submenu];
GO
IF OBJECT_ID(N'[dbo].[FK_submenu_submenu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[submenu] DROP CONSTRAINT [FK_submenu_submenu];
GO
IF OBJECT_ID(N'[dbo].[FK_SubRelgion_Relgion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubRelgion] DROP CONSTRAINT [FK_SubRelgion_Relgion];
GO
IF OBJECT_ID(N'[dbo].[FK_Towns_Counties]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Towns] DROP CONSTRAINT [FK_Towns_Counties];
GO
IF OBJECT_ID(N'[dbo].[FK_UrduPage_UrduPage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UrduPage] DROP CONSTRAINT [FK_UrduPage_UrduPage];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AdministrativeEmail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdministrativeEmail];
GO
IF OBJECT_ID(N'[dbo].[AdminLogin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdminLogin];
GO
IF OBJECT_ID(N'[dbo].[BillingShipping]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BillingShipping];
GO
IF OBJECT_ID(N'[dbo].[Blog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Blog];
GO
IF OBJECT_ID(N'[dbo].[BlogCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BlogCategory];
GO
IF OBJECT_ID(N'[dbo].[Cart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cart];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Cemetery]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cemetery];
GO
IF OBJECT_ID(N'[dbo].[CemeteryImages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CemeteryImages];
GO
IF OBJECT_ID(N'[dbo].[CemeteryLayers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CemeteryLayers];
GO
IF OBJECT_ID(N'[dbo].[Counties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Counties];
GO
IF OBJECT_ID(N'[dbo].[Countries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Countries];
GO
IF OBJECT_ID(N'[dbo].[FAQs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FAQs];
GO
IF OBJECT_ID(N'[dbo].[Footer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Footer];
GO
IF OBJECT_ID(N'[dbo].[FuneralProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FuneralProduct];
GO
IF OBJECT_ID(N'[dbo].[FuneralServices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FuneralServices];
GO
IF OBJECT_ID(N'[dbo].[Graves]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Graves];
GO
IF OBJECT_ID(N'[dbo].[ItalianPage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ItalianPage];
GO
IF OBJECT_ID(N'[dbo].[Item]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Item];
GO
IF OBJECT_ID(N'[dbo].[MainSections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MainSections];
GO
IF OBJECT_ID(N'[dbo].[Member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Member];
GO
IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[Menu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Menu];
GO
IF OBJECT_ID(N'[dbo].[NewsManagement]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewsManagement];
GO
IF OBJECT_ID(N'[dbo].[OrderCemetery]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderCemetery];
GO
IF OBJECT_ID(N'[dbo].[OrderPlan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderPlan];
GO
IF OBJECT_ID(N'[dbo].[OrderPlanItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderPlanItem];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Origins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Origins];
GO
IF OBJECT_ID(N'[dbo].[Page]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Page];
GO
IF OBJECT_ID(N'[dbo].[PageBox]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PageBox];
GO
IF OBJECT_ID(N'[dbo].[PartnerPlan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartnerPlan];
GO
IF OBJECT_ID(N'[dbo].[Partners]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Partners];
GO
IF OBJECT_ID(N'[dbo].[PaymentCard]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentCard];
GO
IF OBJECT_ID(N'[dbo].[PaymentMethods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentMethods];
GO
IF OBJECT_ID(N'[dbo].[PostCodes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostCodes];
GO
IF OBJECT_ID(N'[dbo].[PurchaseBoxImage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseBoxImage];
GO
IF OBJECT_ID(N'[dbo].[Relgion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Relgion];
GO
IF OBJECT_ID(N'[dbo].[Reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews];
GO
IF OBJECT_ID(N'[dbo].[ServiceBox]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceBox];
GO
IF OBJECT_ID(N'[dbo].[ServiceListingPlans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceListingPlans];
GO
IF OBJECT_ID(N'[dbo].[ServicesListingApproval]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServicesListingApproval];
GO
IF OBJECT_ID(N'[dbo].[SeviceListing]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SeviceListing];
GO
IF OBJECT_ID(N'[dbo].[Slider]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Slider];
GO
IF OBJECT_ID(N'[dbo].[Slides]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Slides];
GO
IF OBJECT_ID(N'[dbo].[SubCate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubCate];
GO
IF OBJECT_ID(N'[dbo].[SubChlidMenu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubChlidMenu];
GO
IF OBJECT_ID(N'[dbo].[submenu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[submenu];
GO
IF OBJECT_ID(N'[dbo].[SubRelgion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubRelgion];
GO
IF OBJECT_ID(N'[dbo].[Teams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Teams];
GO
IF OBJECT_ID(N'[dbo].[Tiers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tiers];
GO
IF OBJECT_ID(N'[dbo].[Towns]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Towns];
GO
IF OBJECT_ID(N'[dbo].[UrduPage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UrduPage];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AdministrativeEmails'
CREATE TABLE [dbo].[AdministrativeEmails] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Email] varchar(max)  NULL,
    [AddBy] varchar(max)  NULL
);
GO

-- Creating table 'AdminLogins'
CREATE TABLE [dbo].[AdminLogins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [Role] varchar(50)  NULL
);
GO

-- Creating table 'BillingShippings'
CREATE TABLE [dbo].[BillingShippings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(max)  NULL,
    [LastName] varchar(max)  NULL,
    [Addressone] varchar(max)  NULL,
    [Addresstwo] varchar(max)  NULL,
    [City] varchar(max)  NULL,
    [State] varchar(max)  NULL,
    [Zip] varchar(max)  NULL,
    [ItemId] int  NULL,
    [ItemQty] int  NULL,
    [UserId] int  NULL,
    [Information] varchar(50)  NULL
);
GO

-- Creating table 'Blogs'
CREATE TABLE [dbo].[Blogs] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Title] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [FeaturedImage] varchar(max)  NULL,
    [CategoryId] decimal(18,0)  NULL,
    [IsApproved] bit  NULL,
    [IsFeatured] bit  NULL,
    [PublishedDate] datetime  NULL
);
GO

-- Creating table 'BlogCategories'
CREATE TABLE [dbo].[BlogCategories] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL
);
GO

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ItemId] int  NULL,
    [ItemName] varchar(max)  NULL,
    [ItemPicture] varchar(max)  NULL,
    [ItemQty] varchar(max)  NULL,
    [ItemPrice] varchar(max)  NULL,
    [UserId] int  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Code] varchar(max)  NULL,
    [CateName] varchar(max)  NULL,
    [CatPic] varchar(max)  NULL,
    [Active] bit  NULL
);
GO

-- Creating table 'Cemeteries'
CREATE TABLE [dbo].[Cemeteries] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Code] varchar(max)  NULL,
    [OriginalCode] varchar(max)  NULL,
    [AddedDate] datetime  NULL,
    [Image] varchar(max)  NULL,
    [RegionId] decimal(18,0)  NULL,
    [IsFeatured] bit  NULL,
    [Description] varchar(max)  NULL,
    [KeyInformation] varchar(max)  NULL,
    [MapLocation] varchar(max)  NULL,
    [LocationDescription] varchar(max)  NULL,
    [WhyChoose] varchar(max)  NULL,
    [Latitude] float  NULL,
    [Longitude] float  NULL
);
GO

-- Creating table 'CemeteryImages'
CREATE TABLE [dbo].[CemeteryImages] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Image] varchar(max)  NULL,
    [OriginalImage] varchar(max)  NULL,
    [CemeteryId] decimal(18,0)  NULL
);
GO

-- Creating table 'CemeteryLayers'
CREATE TABLE [dbo].[CemeteryLayers] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [CemeteryId] decimal(18,0)  NULL,
    [IsBooking] bit  NULL,
    [Price] decimal(19,4)  NULL
);
GO

-- Creating table 'Counties'
CREATE TABLE [dbo].[Counties] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [AddedDate] datetime  NULL,
    [CountryId] decimal(18,0)  NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [AddedDate] datetime  NULL
);
GO

-- Creating table 'Footers'
CREATE TABLE [dbo].[Footers] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [CopyRight] varchar(max)  NULL,
    [Branding] varchar(max)  NULL,
    [PubDate] datetime  NULL
);
GO

-- Creating table 'FuneralProducts'
CREATE TABLE [dbo].[FuneralProducts] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [ProductName] varchar(50)  NULL,
    [ProductPrice] decimal(18,0)  NULL,
    [PrdoctDescription] varchar(max)  NULL,
    [Image] varchar(max)  NULL,
    [FuneralServiceId] decimal(18,0)  NULL
);
GO

-- Creating table 'FuneralServices'
CREATE TABLE [dbo].[FuneralServices] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [Date] datetime  NULL,
    [Picture] varchar(max)  NULL
);
GO

-- Creating table 'Graves'
CREATE TABLE [dbo].[Graves] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Address] varchar(max)  NULL,
    [Image] varchar(max)  NULL,
    [SKU] varchar(max)  NULL,
    [PlotName] varchar(max)  NULL,
    [PlotNo] varchar(max)  NULL,
    [PlotType] varchar(max)  NULL,
    [Size] varchar(max)  NULL,
    [Location] varchar(max)  NULL,
    [TierId] decimal(18,0)  NULL,
    [ShortDescription] varchar(max)  NULL,
    [FullDescription] varchar(max)  NULL,
    [Internement] varchar(max)  NULL,
    [InternementFee] decimal(18,0)  NULL,
    [Lease] varchar(max)  NULL,
    [Maintenance] varchar(max)  NULL,
    [SpotId] varchar(max)  NULL,
    [SectionId] decimal(18,0)  NULL,
    [ReligionId] decimal(18,0)  NULL,
    [SectId] decimal(18,0)  NULL,
    [IsEnabled] bit  NULL
);
GO

-- Creating table 'ItalianPages'
CREATE TABLE [dbo].[ItalianPages] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Body] nvarchar(max)  NULL,
    [PageTittle] nvarchar(max)  NULL,
    [Pageurl] nvarchar(max)  NULL,
    [FeatureImage] varchar(max)  NULL,
    [ServiceTitle] nvarchar(max)  NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ItemNo] varchar(max)  NULL,
    [ItemName] varchar(max)  NULL,
    [ItemQty] int  NULL,
    [ItemCprice] decimal(19,4)  NULL,
    [ItemRprice] decimal(19,4)  NULL,
    [ItemActive] bit  NULL,
    [ItemFeature] bit  NULL,
    [ItemImage] varchar(max)  NULL,
    [CateId] decimal(18,0)  NULL,
    [ItemDescription] varchar(max)  NULL
);
GO

-- Creating table 'MainSections'
CREATE TABLE [dbo].[MainSections] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [CemeteryId] decimal(18,0)  NULL,
    [Name] varchar(max)  NULL,
    [Code] varchar(max)  NULL,
    [OriginalCode] varchar(max)  NULL,
    [SpotId] varchar(max)  NULL,
    [Image] varchar(max)  NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [Suspend] nvarchar(50)  NULL,
    [Status] bit  NULL
);
GO

-- Creating table 'Members1'
CREATE TABLE [dbo].[Members1] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Fname] varchar(max)  NULL,
    [Lname] varchar(max)  NULL,
    [Username] varchar(max)  NULL,
    [Email] varchar(max)  NULL,
    [Password] varchar(max)  NULL,
    [CellNo] varchar(max)  NULL,
    [Active] bit  NULL,
    [Picture] varchar(max)  NULL,
    [Role] varchar(max)  NULL
);
GO

-- Creating table 'Menus'
CREATE TABLE [dbo].[Menus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Pageurl] varchar(max)  NULL,
    [Category] varchar(max)  NULL
);
GO

-- Creating table 'NewsManagements'
CREATE TABLE [dbo].[NewsManagements] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Title] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [PubDate] datetime  NULL,
    [ExpiryDate] datetime  NULL,
    [TitleUrdu] nvarchar(max)  NULL,
    [TitleArabic] nvarchar(max)  NULL,
    [TitleChinese] nvarchar(max)  NULL,
    [TitleHindi] nvarchar(max)  NULL,
    [TitleItalian] nvarchar(max)  NULL,
    [TitleBengali] nvarchar(max)  NULL,
    [TitleHebrew] nvarchar(max)  NULL,
    [DescriptionUrdu] nvarchar(max)  NULL,
    [DescriptionArabic] nvarchar(max)  NULL,
    [DescriptionChinese] nvarchar(max)  NULL,
    [DescriptionHindi] nvarchar(max)  NULL,
    [DescriptionItalian] nvarchar(max)  NULL,
    [DescriptionBengali] nvarchar(max)  NULL,
    [DescriptionHebrew] nvarchar(max)  NULL,
    [TitleTurkish] nvarchar(max)  NULL,
    [DescriptionTurkish] nvarchar(max)  NULL
);
GO

-- Creating table 'OrderCemeteries'
CREATE TABLE [dbo].[OrderCemeteries] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [CemeteryId] decimal(18,0)  NULL,
    [OrderId] decimal(18,0)  NULL,
    [Quantity] int  NULL,
    [Price] decimal(19,4)  NULL,
    [PreNeed] bit  NULL,
    [AtNeed] bit  NULL
);
GO

-- Creating table 'OrderPlans'
CREATE TABLE [dbo].[OrderPlans] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NULL,
    [PartnerId] decimal(18,0)  NULL,
    [Status] varchar(max)  NULL,
    [FirstName] varchar(max)  NULL,
    [Address] varchar(max)  NULL,
    [Country] varchar(max)  NULL,
    [CellNo] varchar(max)  NULL,
    [AmountStatus] bit  NULL,
    [ServiceListingId] decimal(18,0)  NULL,
    [CartId] varchar(max)  NULL
);
GO

-- Creating table 'OrderPlanItems'
CREATE TABLE [dbo].[OrderPlanItems] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [OrderPlanId] decimal(18,0)  NULL,
    [Title] varchar(max)  NULL,
    [Price] decimal(19,4)  NULL,
    [Description] varchar(max)  NULL,
    [ServiceListingPlanId] decimal(18,0)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NULL,
    [MemberId] decimal(18,0)  NULL,
    [Status] varchar(max)  NULL,
    [FirstName] varchar(max)  NULL,
    [LastName] varchar(max)  NULL,
    [Address] varchar(max)  NULL,
    [Country] varchar(max)  NULL,
    [CellNo] varchar(max)  NULL,
    [AmountStatus] bit  NULL,
    [CartId] varchar(max)  NULL
);
GO

-- Creating table 'Origins'
CREATE TABLE [dbo].[Origins] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [AddedDate] datetime  NULL
);
GO

-- Creating table 'Pages'
CREATE TABLE [dbo].[Pages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Body] varchar(max)  NULL,
    [PageTittle] varchar(max)  NULL,
    [Pageurl] varchar(max)  NULL,
    [FeatureImage] varchar(max)  NULL,
    [BodyUrdu] nvarchar(max)  NULL,
    [BodyHindi] nvarchar(max)  NULL,
    [BodyChinese] nvarchar(max)  NULL,
    [BodyArabic] nvarchar(max)  NULL,
    [BodyItalian] nvarchar(max)  NULL,
    [BodyTurkish] nvarchar(max)  NULL,
    [BodyBengali] nvarchar(max)  NULL,
    [BodyHebrew] nvarchar(max)  NULL,
    [TitleUrdu] nvarchar(max)  NULL,
    [TitleHindi] nvarchar(max)  NULL,
    [TitleChinese] nvarchar(max)  NULL,
    [TitleArabic] nvarchar(max)  NULL,
    [TitleItalian] nvarchar(max)  NULL,
    [TitleTurkish] nvarchar(max)  NULL,
    [TitleBengali] nvarchar(max)  NULL,
    [TitleHebrew] nvarchar(max)  NULL
);
GO

-- Creating table 'PageBoxes'
CREATE TABLE [dbo].[PageBoxes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Page] int  NULL,
    [Box] int  NULL,
    [UrduPage] int  NULL
);
GO

-- Creating table 'PartnerPlans'
CREATE TABLE [dbo].[PartnerPlans] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Title] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [Price] float  NULL,
    [Position] int  NULL,
    [PlanPeriods] int  NULL,
    [FreeListingPeriod] int  NULL
);
GO

-- Creating table 'Partners'
CREATE TABLE [dbo].[Partners] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Fname] varchar(max)  NULL,
    [Lname] varchar(max)  NULL,
    [Username] varchar(max)  NULL,
    [Email] varchar(max)  NULL,
    [Password] varchar(max)  NULL,
    [CellNo] varchar(max)  NULL,
    [Active] bit  NULL,
    [Role] varchar(max)  NULL,
    [Picture] varchar(max)  NULL,
    [PartnerPlanId] decimal(18,0)  NULL
);
GO

-- Creating table 'PaymentCards'
CREATE TABLE [dbo].[PaymentCards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CardNo] varchar(max)  NULL,
    [CardName] varchar(max)  NULL,
    [ExpMonth] datetime  NULL,
    [ExpYear] datetime  NULL,
    [CvcNo] int  NULL,
    [UserId] int  NULL,
    [BillId] int  NULL
);
GO

-- Creating table 'PaymentMethods'
CREATE TABLE [dbo].[PaymentMethods] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [InstallationId] varchar(max)  NULL,
    [Active] bit  NULL
);
GO

-- Creating table 'PostCodes'
CREATE TABLE [dbo].[PostCodes] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Code] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [AddedDate] datetime  NULL,
    [CountyId] decimal(18,0)  NULL
);
GO

-- Creating table 'Relgions'
CREATE TABLE [dbo].[Relgions] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [RelgionName] varchar(max)  NULL,
    [Picture] varchar(max)  NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [PartnerId] decimal(18,0)  NULL,
    [Description] nvarchar(max)  NULL,
    [ServiceListingId] decimal(18,0)  NULL,
    [Date] datetime  NULL,
    [Status] bit  NULL
);
GO

-- Creating table 'ServiceBoxes'
CREATE TABLE [dbo].[ServiceBoxes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BoxName] varchar(max)  NULL,
    [BoxPic] varchar(max)  NULL,
    [BoxUrl] int  NULL,
    [BoxDescription] varchar(max)  NULL,
    [BoxStatus] bit  NULL,
    [ServiceUrl] varchar(max)  NULL,
    [UrlStatus] bit  NULL,
    [BoxNameInUrdu] nvarchar(max)  NULL,
    [BoxNameInItalian] nvarchar(max)  NULL
);
GO

-- Creating table 'ServiceListingPlans'
CREATE TABLE [dbo].[ServiceListingPlans] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [CountyId] decimal(18,0)  NULL,
    [BusinessId] decimal(18,0)  NULL,
    [PlanId] decimal(18,0)  NULL,
    [ServiceListId] decimal(18,0)  NULL,
    [ExpiryDate] datetime  NULL
);
GO

-- Creating table 'ServicesListingApprovals'
CREATE TABLE [dbo].[ServicesListingApprovals] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Status] bit  NULL
);
GO

-- Creating table 'SeviceListings'
CREATE TABLE [dbo].[SeviceListings] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [BusinessName] varchar(max)  NULL,
    [PostCode] varchar(max)  NULL,
    [Address] varchar(max)  NULL,
    [PhoneNo] varchar(max)  NULL,
    [Website] varchar(max)  NULL,
    [BusinessClassification] varchar(max)  NULL,
    [FuneralServiceId] decimal(18,0)  NULL,
    [Picture] varchar(max)  NULL,
    [IsApproved] bit  NULL,
    [Address1] varchar(max)  NULL,
    [Address2] varchar(max)  NULL,
    [Number] varchar(max)  NULL,
    [Town] varchar(max)  NULL,
    [County] varchar(max)  NULL,
    [Country] varchar(max)  NULL,
    [Latitude] varchar(max)  NULL,
    [Longitude] varchar(max)  NULL,
    [ServicesAndProducts] varchar(max)  NULL,
    [BusinessDescription] varchar(max)  NULL,
    [PartnerId] decimal(18,0)  NULL,
    [PaymentGateways] varchar(max)  NULL,
    [SocialIcons] varchar(max)  NULL,
    [FacebookLink] varchar(max)  NULL,
    [TwitterLink] varchar(max)  NULL,
    [GooglePlusLink] varchar(max)  NULL,
    [CountiesId] varchar(max)  NULL,
    [CountiesName] varchar(max)  NULL,
    [NationWide] bit  NULL,
    [LinkedIn] varchar(max)  NULL
);
GO

-- Creating table 'Sliders'
CREATE TABLE [dbo].[Sliders] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [SlideImages] varchar(max)  NULL
);
GO

-- Creating table 'Slides'
CREATE TABLE [dbo].[Slides] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Caption] varchar(max)  NULL,
    [Image] varchar(max)  NULL,
    [SliderId] decimal(18,0)  NULL,
    [CaptionUrdu] nvarchar(max)  NULL,
    [CaptionArabic] nvarchar(max)  NULL,
    [CaptionHindi] nvarchar(max)  NULL,
    [CaptionChinese] nvarchar(max)  NULL,
    [CaptionItalian] nvarchar(max)  NULL,
    [CaptionTurkish] nvarchar(max)  NULL,
    [CaptionBengali] nvarchar(max)  NULL,
    [CaptionHebrew] nvarchar(max)  NULL
);
GO

-- Creating table 'SubCates'
CREATE TABLE [dbo].[SubCates] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [MainCate] decimal(18,0)  NULL,
    [SubName] nchar(10)  NULL
);
GO

-- Creating table 'SubChlidMenus'
CREATE TABLE [dbo].[SubChlidMenus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MenuId] int  NULL,
    [PageUrl] varchar(max)  NULL,
    [PageTitle] varchar(max)  NULL
);
GO

-- Creating table 'submenus'
CREATE TABLE [dbo].[submenus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [menuId] int  NULL,
    [pageurl] varchar(max)  NULL,
    [pagetitle] varchar(max)  NULL
);
GO

-- Creating table 'SubRelgions'
CREATE TABLE [dbo].[SubRelgions] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [SubRelgionName] varchar(max)  NULL,
    [RelgioId] decimal(18,0)  NULL
);
GO

-- Creating table 'Tiers'
CREATE TABLE [dbo].[Tiers] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL
);
GO

-- Creating table 'Towns'
CREATE TABLE [dbo].[Towns] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [AddedDate] varchar(max)  NULL,
    [CountyId] decimal(18,0)  NULL
);
GO

-- Creating table 'UrduPages'
CREATE TABLE [dbo].[UrduPages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Body] nvarchar(max)  NULL,
    [PageTittle] nvarchar(max)  NULL,
    [Pageurl] nvarchar(max)  NULL,
    [FeatureImage] varchar(max)  NULL,
    [ServiceTitle] nvarchar(max)  NULL
);
GO

-- Creating table 'PurchaseBoxImages'
CREATE TABLE [dbo].[PurchaseBoxImages] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Image] varchar(max)  NULL
);
GO

-- Creating table 'Teams'
CREATE TABLE [dbo].[Teams] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Name] varchar(max)  NULL,
    [Description] varchar(max)  NULL,
    [Post] varchar(max)  NULL,
    [Image] varchar(max)  NULL
);
GO

-- Creating table 'FAQs'
CREATE TABLE [dbo].[FAQs] (
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [Question] varchar(max)  NULL,
    [Answer] varchar(max)  NULL,
    [AddedDate] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AdministrativeEmails'
ALTER TABLE [dbo].[AdministrativeEmails]
ADD CONSTRAINT [PK_AdministrativeEmails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AdminLogins'
ALTER TABLE [dbo].[AdminLogins]
ADD CONSTRAINT [PK_AdminLogins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BillingShippings'
ALTER TABLE [dbo].[BillingShippings]
ADD CONSTRAINT [PK_BillingShippings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Blogs'
ALTER TABLE [dbo].[Blogs]
ADD CONSTRAINT [PK_Blogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BlogCategories'
ALTER TABLE [dbo].[BlogCategories]
ADD CONSTRAINT [PK_BlogCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cemeteries'
ALTER TABLE [dbo].[Cemeteries]
ADD CONSTRAINT [PK_Cemeteries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CemeteryImages'
ALTER TABLE [dbo].[CemeteryImages]
ADD CONSTRAINT [PK_CemeteryImages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CemeteryLayers'
ALTER TABLE [dbo].[CemeteryLayers]
ADD CONSTRAINT [PK_CemeteryLayers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Counties'
ALTER TABLE [dbo].[Counties]
ADD CONSTRAINT [PK_Counties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Footers'
ALTER TABLE [dbo].[Footers]
ADD CONSTRAINT [PK_Footers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FuneralProducts'
ALTER TABLE [dbo].[FuneralProducts]
ADD CONSTRAINT [PK_FuneralProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FuneralServices'
ALTER TABLE [dbo].[FuneralServices]
ADD CONSTRAINT [PK_FuneralServices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [PK_Graves]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ItalianPages'
ALTER TABLE [dbo].[ItalianPages]
ADD CONSTRAINT [PK_ItalianPages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MainSections'
ALTER TABLE [dbo].[MainSections]
ADD CONSTRAINT [PK_MainSections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members1'
ALTER TABLE [dbo].[Members1]
ADD CONSTRAINT [PK_Members1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Menus'
ALTER TABLE [dbo].[Menus]
ADD CONSTRAINT [PK_Menus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewsManagements'
ALTER TABLE [dbo].[NewsManagements]
ADD CONSTRAINT [PK_NewsManagements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderCemeteries'
ALTER TABLE [dbo].[OrderCemeteries]
ADD CONSTRAINT [PK_OrderCemeteries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderPlans'
ALTER TABLE [dbo].[OrderPlans]
ADD CONSTRAINT [PK_OrderPlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderPlanItems'
ALTER TABLE [dbo].[OrderPlanItems]
ADD CONSTRAINT [PK_OrderPlanItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Origins'
ALTER TABLE [dbo].[Origins]
ADD CONSTRAINT [PK_Origins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pages'
ALTER TABLE [dbo].[Pages]
ADD CONSTRAINT [PK_Pages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PageBoxes'
ALTER TABLE [dbo].[PageBoxes]
ADD CONSTRAINT [PK_PageBoxes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PartnerPlans'
ALTER TABLE [dbo].[PartnerPlans]
ADD CONSTRAINT [PK_PartnerPlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Partners'
ALTER TABLE [dbo].[Partners]
ADD CONSTRAINT [PK_Partners]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentCards'
ALTER TABLE [dbo].[PaymentCards]
ADD CONSTRAINT [PK_PaymentCards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentMethods'
ALTER TABLE [dbo].[PaymentMethods]
ADD CONSTRAINT [PK_PaymentMethods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostCodes'
ALTER TABLE [dbo].[PostCodes]
ADD CONSTRAINT [PK_PostCodes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Relgions'
ALTER TABLE [dbo].[Relgions]
ADD CONSTRAINT [PK_Relgions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServiceBoxes'
ALTER TABLE [dbo].[ServiceBoxes]
ADD CONSTRAINT [PK_ServiceBoxes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServiceListingPlans'
ALTER TABLE [dbo].[ServiceListingPlans]
ADD CONSTRAINT [PK_ServiceListingPlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServicesListingApprovals'
ALTER TABLE [dbo].[ServicesListingApprovals]
ADD CONSTRAINT [PK_ServicesListingApprovals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SeviceListings'
ALTER TABLE [dbo].[SeviceListings]
ADD CONSTRAINT [PK_SeviceListings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sliders'
ALTER TABLE [dbo].[Sliders]
ADD CONSTRAINT [PK_Sliders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Slides'
ALTER TABLE [dbo].[Slides]
ADD CONSTRAINT [PK_Slides]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubCates'
ALTER TABLE [dbo].[SubCates]
ADD CONSTRAINT [PK_SubCates]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubChlidMenus'
ALTER TABLE [dbo].[SubChlidMenus]
ADD CONSTRAINT [PK_SubChlidMenus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'submenus'
ALTER TABLE [dbo].[submenus]
ADD CONSTRAINT [PK_submenus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubRelgions'
ALTER TABLE [dbo].[SubRelgions]
ADD CONSTRAINT [PK_SubRelgions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tiers'
ALTER TABLE [dbo].[Tiers]
ADD CONSTRAINT [PK_Tiers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Towns'
ALTER TABLE [dbo].[Towns]
ADD CONSTRAINT [PK_Towns]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UrduPages'
ALTER TABLE [dbo].[UrduPages]
ADD CONSTRAINT [PK_UrduPages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PurchaseBoxImages'
ALTER TABLE [dbo].[PurchaseBoxImages]
ADD CONSTRAINT [PK_PurchaseBoxImages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Teams'
ALTER TABLE [dbo].[Teams]
ADD CONSTRAINT [PK_Teams]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FAQs'
ALTER TABLE [dbo].[FAQs]
ADD CONSTRAINT [PK_FAQs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ItemId] in table 'BillingShippings'
ALTER TABLE [dbo].[BillingShippings]
ADD CONSTRAINT [FK_BillingShipping_Item]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[Items]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillingShipping_Item'
CREATE INDEX [IX_FK_BillingShipping_Item]
ON [dbo].[BillingShippings]
    ([ItemId]);
GO

-- Creating foreign key on [UserId] in table 'BillingShippings'
ALTER TABLE [dbo].[BillingShippings]
ADD CONSTRAINT [FK_BillingShipping_Member]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillingShipping_Member'
CREATE INDEX [IX_FK_BillingShipping_Member]
ON [dbo].[BillingShippings]
    ([UserId]);
GO

-- Creating foreign key on [BillId] in table 'PaymentCards'
ALTER TABLE [dbo].[PaymentCards]
ADD CONSTRAINT [FK_PaymentCard_BillingShipping]
    FOREIGN KEY ([BillId])
    REFERENCES [dbo].[BillingShippings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentCard_BillingShipping'
CREATE INDEX [IX_FK_PaymentCard_BillingShipping]
ON [dbo].[PaymentCards]
    ([BillId]);
GO

-- Creating foreign key on [CategoryId] in table 'Blogs'
ALTER TABLE [dbo].[Blogs]
ADD CONSTRAINT [FK_Blog_BlogCategory1]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[BlogCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Blog_BlogCategory1'
CREATE INDEX [IX_FK_Blog_BlogCategory1]
ON [dbo].[Blogs]
    ([CategoryId]);
GO

-- Creating foreign key on [ItemId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_Cart_Item]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[Items]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cart_Item'
CREATE INDEX [IX_FK_Cart_Item]
ON [dbo].[Carts]
    ([ItemId]);
GO

-- Creating foreign key on [UserId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_Cart_Member]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cart_Member'
CREATE INDEX [IX_FK_Cart_Member]
ON [dbo].[Carts]
    ([UserId]);
GO

-- Creating foreign key on [CateId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_Item_Category]
    FOREIGN KEY ([CateId])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Item_Category'
CREATE INDEX [IX_FK_Item_Category]
ON [dbo].[Items]
    ([CateId]);
GO

-- Creating foreign key on [MainCate] in table 'SubCates'
ALTER TABLE [dbo].[SubCates]
ADD CONSTRAINT [FK_SubCate_Category]
    FOREIGN KEY ([MainCate])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubCate_Category'
CREATE INDEX [IX_FK_SubCate_Category]
ON [dbo].[SubCates]
    ([MainCate]);
GO

-- Creating foreign key on [RegionId] in table 'Cemeteries'
ALTER TABLE [dbo].[Cemeteries]
ADD CONSTRAINT [FK_Cemetery_Origins]
    FOREIGN KEY ([RegionId])
    REFERENCES [dbo].[Origins]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Cemetery_Origins'
CREATE INDEX [IX_FK_Cemetery_Origins]
ON [dbo].[Cemeteries]
    ([RegionId]);
GO

-- Creating foreign key on [CemeteryId] in table 'CemeteryImages'
ALTER TABLE [dbo].[CemeteryImages]
ADD CONSTRAINT [FK_CemeteryImages_Cemetery]
    FOREIGN KEY ([CemeteryId])
    REFERENCES [dbo].[Cemeteries]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CemeteryImages_Cemetery'
CREATE INDEX [IX_FK_CemeteryImages_Cemetery]
ON [dbo].[CemeteryImages]
    ([CemeteryId]);
GO

-- Creating foreign key on [CemeteryId] in table 'MainSections'
ALTER TABLE [dbo].[MainSections]
ADD CONSTRAINT [FK_MainSections_Cemetery]
    FOREIGN KEY ([CemeteryId])
    REFERENCES [dbo].[Cemeteries]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MainSections_Cemetery'
CREATE INDEX [IX_FK_MainSections_Cemetery]
ON [dbo].[MainSections]
    ([CemeteryId]);
GO

-- Creating foreign key on [CemeteryId] in table 'CemeteryLayers'
ALTER TABLE [dbo].[CemeteryLayers]
ADD CONSTRAINT [FK_CemeteryLayers_Graves]
    FOREIGN KEY ([CemeteryId])
    REFERENCES [dbo].[Graves]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CemeteryLayers_Graves'
CREATE INDEX [IX_FK_CemeteryLayers_Graves]
ON [dbo].[CemeteryLayers]
    ([CemeteryId]);
GO

-- Creating foreign key on [CountryId] in table 'Counties'
ALTER TABLE [dbo].[Counties]
ADD CONSTRAINT [FK_Counties_Countries]
    FOREIGN KEY ([CountryId])
    REFERENCES [dbo].[Countries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Counties_Countries'
CREATE INDEX [IX_FK_Counties_Countries]
ON [dbo].[Counties]
    ([CountryId]);
GO

-- Creating foreign key on [CountyId] in table 'ServiceListingPlans'
ALTER TABLE [dbo].[ServiceListingPlans]
ADD CONSTRAINT [FK_ServiceListingPlans_Counties]
    FOREIGN KEY ([CountyId])
    REFERENCES [dbo].[Counties]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceListingPlans_Counties'
CREATE INDEX [IX_FK_ServiceListingPlans_Counties]
ON [dbo].[ServiceListingPlans]
    ([CountyId]);
GO

-- Creating foreign key on [CountyId] in table 'Towns'
ALTER TABLE [dbo].[Towns]
ADD CONSTRAINT [FK_Towns_Counties]
    FOREIGN KEY ([CountyId])
    REFERENCES [dbo].[Counties]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Towns_Counties'
CREATE INDEX [IX_FK_Towns_Counties]
ON [dbo].[Towns]
    ([CountyId]);
GO

-- Creating foreign key on [FuneralServiceId] in table 'FuneralProducts'
ALTER TABLE [dbo].[FuneralProducts]
ADD CONSTRAINT [FK_FuneralProduct_FuneralServices]
    FOREIGN KEY ([FuneralServiceId])
    REFERENCES [dbo].[FuneralServices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FuneralProduct_FuneralServices'
CREATE INDEX [IX_FK_FuneralProduct_FuneralServices]
ON [dbo].[FuneralProducts]
    ([FuneralServiceId]);
GO

-- Creating foreign key on [BusinessId] in table 'ServiceListingPlans'
ALTER TABLE [dbo].[ServiceListingPlans]
ADD CONSTRAINT [FK_ServiceListingPlans_FuneralServices]
    FOREIGN KEY ([BusinessId])
    REFERENCES [dbo].[FuneralServices]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceListingPlans_FuneralServices'
CREATE INDEX [IX_FK_ServiceListingPlans_FuneralServices]
ON [dbo].[ServiceListingPlans]
    ([BusinessId]);
GO

-- Creating foreign key on [FuneralServiceId] in table 'SeviceListings'
ALTER TABLE [dbo].[SeviceListings]
ADD CONSTRAINT [FK_SeviceListing_FuneralServices1]
    FOREIGN KEY ([FuneralServiceId])
    REFERENCES [dbo].[FuneralServices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeviceListing_FuneralServices1'
CREATE INDEX [IX_FK_SeviceListing_FuneralServices1]
ON [dbo].[SeviceListings]
    ([FuneralServiceId]);
GO

-- Creating foreign key on [SectionId] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_Cemetery]
    FOREIGN KEY ([SectionId])
    REFERENCES [dbo].[MainSections]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Graves_Cemetery'
CREATE INDEX [IX_FK_Graves_Cemetery]
ON [dbo].[Graves]
    ([SectionId]);
GO

-- Creating foreign key on [Id] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_Graves]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Graves]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_Graves1]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Graves]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ReligionId] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_Relgion]
    FOREIGN KEY ([ReligionId])
    REFERENCES [dbo].[Relgions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Graves_Relgion'
CREATE INDEX [IX_FK_Graves_Relgion]
ON [dbo].[Graves]
    ([ReligionId]);
GO

-- Creating foreign key on [SectId] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_SubRelgion]
    FOREIGN KEY ([SectId])
    REFERENCES [dbo].[SubRelgions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Graves_SubRelgion'
CREATE INDEX [IX_FK_Graves_SubRelgion]
ON [dbo].[Graves]
    ([SectId]);
GO

-- Creating foreign key on [TierId] in table 'Graves'
ALTER TABLE [dbo].[Graves]
ADD CONSTRAINT [FK_Graves_Tiers]
    FOREIGN KEY ([TierId])
    REFERENCES [dbo].[Tiers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Graves_Tiers'
CREATE INDEX [IX_FK_Graves_Tiers]
ON [dbo].[Graves]
    ([TierId]);
GO

-- Creating foreign key on [CemeteryId] in table 'OrderCemeteries'
ALTER TABLE [dbo].[OrderCemeteries]
ADD CONSTRAINT [FK_OrderCemetery_Graves]
    FOREIGN KEY ([CemeteryId])
    REFERENCES [dbo].[Graves]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderCemetery_Graves'
CREATE INDEX [IX_FK_OrderCemetery_Graves]
ON [dbo].[OrderCemeteries]
    ([CemeteryId]);
GO

-- Creating foreign key on [UserId] in table 'PaymentCards'
ALTER TABLE [dbo].[PaymentCards]
ADD CONSTRAINT [FK_PaymentCard_Member]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentCard_Member'
CREATE INDEX [IX_FK_PaymentCard_Member]
ON [dbo].[PaymentCards]
    ([UserId]);
GO

-- Creating foreign key on [MemberId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_Members]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members1]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_Members'
CREATE INDEX [IX_FK_Orders_Members]
ON [dbo].[Orders]
    ([MemberId]);
GO

-- Creating foreign key on [PartnerId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_Reviews_Members]
    FOREIGN KEY ([PartnerId])
    REFERENCES [dbo].[Members1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reviews_Members'
CREATE INDEX [IX_FK_Reviews_Members]
ON [dbo].[Reviews]
    ([PartnerId]);
GO

-- Creating foreign key on [menuId] in table 'submenus'
ALTER TABLE [dbo].[submenus]
ADD CONSTRAINT [FK_submenu_submenu]
    FOREIGN KEY ([menuId])
    REFERENCES [dbo].[Menus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_submenu_submenu'
CREATE INDEX [IX_FK_submenu_submenu]
ON [dbo].[submenus]
    ([menuId]);
GO

-- Creating foreign key on [OrderId] in table 'OrderCemeteries'
ALTER TABLE [dbo].[OrderCemeteries]
ADD CONSTRAINT [FK_OrderCemetery_Orders]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderCemetery_Orders'
CREATE INDEX [IX_FK_OrderCemetery_Orders]
ON [dbo].[OrderCemeteries]
    ([OrderId]);
GO

-- Creating foreign key on [PartnerId] in table 'OrderPlans'
ALTER TABLE [dbo].[OrderPlans]
ADD CONSTRAINT [FK_OrderPlan_Partners]
    FOREIGN KEY ([PartnerId])
    REFERENCES [dbo].[Partners]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPlan_Partners'
CREATE INDEX [IX_FK_OrderPlan_Partners]
ON [dbo].[OrderPlans]
    ([PartnerId]);
GO

-- Creating foreign key on [ServiceListingId] in table 'OrderPlans'
ALTER TABLE [dbo].[OrderPlans]
ADD CONSTRAINT [FK_OrderPlan_SeviceListing]
    FOREIGN KEY ([ServiceListingId])
    REFERENCES [dbo].[SeviceListings]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPlan_SeviceListing'
CREATE INDEX [IX_FK_OrderPlan_SeviceListing]
ON [dbo].[OrderPlans]
    ([ServiceListingId]);
GO

-- Creating foreign key on [OrderPlanId] in table 'OrderPlanItems'
ALTER TABLE [dbo].[OrderPlanItems]
ADD CONSTRAINT [FK_OrderPlanItem_OrderPlan]
    FOREIGN KEY ([OrderPlanId])
    REFERENCES [dbo].[OrderPlans]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPlanItem_OrderPlan'
CREATE INDEX [IX_FK_OrderPlanItem_OrderPlan]
ON [dbo].[OrderPlanItems]
    ([OrderPlanId]);
GO

-- Creating foreign key on [ServiceListingPlanId] in table 'OrderPlanItems'
ALTER TABLE [dbo].[OrderPlanItems]
ADD CONSTRAINT [FK_OrderPlanItem_ServiceListingPlans]
    FOREIGN KEY ([ServiceListingPlanId])
    REFERENCES [dbo].[ServiceListingPlans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPlanItem_ServiceListingPlans'
CREATE INDEX [IX_FK_OrderPlanItem_ServiceListingPlans]
ON [dbo].[OrderPlanItems]
    ([ServiceListingPlanId]);
GO

-- Creating foreign key on [Page] in table 'PageBoxes'
ALTER TABLE [dbo].[PageBoxes]
ADD CONSTRAINT [FK_PageBox_Page]
    FOREIGN KEY ([Page])
    REFERENCES [dbo].[Pages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PageBox_Page'
CREATE INDEX [IX_FK_PageBox_Page]
ON [dbo].[PageBoxes]
    ([Page]);
GO

-- Creating foreign key on [BoxUrl] in table 'ServiceBoxes'
ALTER TABLE [dbo].[ServiceBoxes]
ADD CONSTRAINT [FK_ServiceBox_Page]
    FOREIGN KEY ([BoxUrl])
    REFERENCES [dbo].[Pages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceBox_Page'
CREATE INDEX [IX_FK_ServiceBox_Page]
ON [dbo].[ServiceBoxes]
    ([BoxUrl]);
GO

-- Creating foreign key on [Box] in table 'PageBoxes'
ALTER TABLE [dbo].[PageBoxes]
ADD CONSTRAINT [FK_PageBox_ServiceBox]
    FOREIGN KEY ([Box])
    REFERENCES [dbo].[ServiceBoxes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PageBox_ServiceBox'
CREATE INDEX [IX_FK_PageBox_ServiceBox]
ON [dbo].[PageBoxes]
    ([Box]);
GO

-- Creating foreign key on [UrduPage] in table 'PageBoxes'
ALTER TABLE [dbo].[PageBoxes]
ADD CONSTRAINT [FK_PageBox_UrduPage]
    FOREIGN KEY ([UrduPage])
    REFERENCES [dbo].[UrduPages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PageBox_UrduPage'
CREATE INDEX [IX_FK_PageBox_UrduPage]
ON [dbo].[PageBoxes]
    ([UrduPage]);
GO

-- Creating foreign key on [PartnerPlanId] in table 'Partners'
ALTER TABLE [dbo].[Partners]
ADD CONSTRAINT [FK_Partners_PartnerPlan]
    FOREIGN KEY ([PartnerPlanId])
    REFERENCES [dbo].[PartnerPlans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Partners_PartnerPlan'
CREATE INDEX [IX_FK_Partners_PartnerPlan]
ON [dbo].[Partners]
    ([PartnerPlanId]);
GO

-- Creating foreign key on [PlanId] in table 'ServiceListingPlans'
ALTER TABLE [dbo].[ServiceListingPlans]
ADD CONSTRAINT [FK_ServiceListingPlans_PartnerPlan]
    FOREIGN KEY ([PlanId])
    REFERENCES [dbo].[PartnerPlans]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceListingPlans_PartnerPlan'
CREATE INDEX [IX_FK_ServiceListingPlans_PartnerPlan]
ON [dbo].[ServiceListingPlans]
    ([PlanId]);
GO

-- Creating foreign key on [PartnerId] in table 'SeviceListings'
ALTER TABLE [dbo].[SeviceListings]
ADD CONSTRAINT [FK_SeviceListing_Partners]
    FOREIGN KEY ([PartnerId])
    REFERENCES [dbo].[Partners]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeviceListing_Partners'
CREATE INDEX [IX_FK_SeviceListing_Partners]
ON [dbo].[SeviceListings]
    ([PartnerId]);
GO

-- Creating foreign key on [RelgioId] in table 'SubRelgions'
ALTER TABLE [dbo].[SubRelgions]
ADD CONSTRAINT [FK_SubRelgion_Relgion]
    FOREIGN KEY ([RelgioId])
    REFERENCES [dbo].[Relgions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubRelgion_Relgion'
CREATE INDEX [IX_FK_SubRelgion_Relgion]
ON [dbo].[SubRelgions]
    ([RelgioId]);
GO

-- Creating foreign key on [ServiceListingId] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_Reviews_SeviceListing1]
    FOREIGN KEY ([ServiceListingId])
    REFERENCES [dbo].[SeviceListings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reviews_SeviceListing1'
CREATE INDEX [IX_FK_Reviews_SeviceListing1]
ON [dbo].[Reviews]
    ([ServiceListingId]);
GO

-- Creating foreign key on [ServiceListId] in table 'ServiceListingPlans'
ALTER TABLE [dbo].[ServiceListingPlans]
ADD CONSTRAINT [FK_ServiceListingPlans_SeviceListing]
    FOREIGN KEY ([ServiceListId])
    REFERENCES [dbo].[SeviceListings]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceListingPlans_SeviceListing'
CREATE INDEX [IX_FK_ServiceListingPlans_SeviceListing]
ON [dbo].[ServiceListingPlans]
    ([ServiceListId]);
GO

-- Creating foreign key on [SliderId] in table 'Slides'
ALTER TABLE [dbo].[Slides]
ADD CONSTRAINT [FK_Slides_Slider]
    FOREIGN KEY ([SliderId])
    REFERENCES [dbo].[Sliders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Slides_Slider'
CREATE INDEX [IX_FK_Slides_Slider]
ON [dbo].[Slides]
    ([SliderId]);
GO

-- Creating foreign key on [MenuId] in table 'SubChlidMenus'
ALTER TABLE [dbo].[SubChlidMenus]
ADD CONSTRAINT [FK_SubChlidMenu_submenu]
    FOREIGN KEY ([MenuId])
    REFERENCES [dbo].[submenus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubChlidMenu_submenu'
CREATE INDEX [IX_FK_SubChlidMenu_submenu]
ON [dbo].[SubChlidMenus]
    ([MenuId]);
GO

-- Creating foreign key on [Id] in table 'UrduPages'
ALTER TABLE [dbo].[UrduPages]
ADD CONSTRAINT [FK_UrduPage_UrduPage]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[UrduPages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CountyId] in table 'PostCodes'
ALTER TABLE [dbo].[PostCodes]
ADD CONSTRAINT [FK_PostCodes_Counties]
    FOREIGN KEY ([CountyId])
    REFERENCES [dbo].[Counties]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PostCodes_Counties'
CREATE INDEX [IX_FK_PostCodes_Counties]
ON [dbo].[PostCodes]
    ([CountyId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------