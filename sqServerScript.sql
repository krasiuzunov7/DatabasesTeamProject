USE [master]
GO
/****** Object:  Database [SaleReportsDB]    Script Date: 7/23/2013 10:19:47 AM ******/
CREATE DATABASE [SaleReportsDB]
 CONTAINMENT = NONE
  


ALTER DATABASE [SaleReportsDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleReportsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleReportsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleReportsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleReportsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleReportsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleReportsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleReportsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SaleReportsDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SaleReportsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleReportsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleReportsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleReportsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleReportsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleReportsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleReportsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleReportsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleReportsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleReportsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleReportsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleReportsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleReportsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleReportsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleReportsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleReportsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleReportsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleReportsDB] SET  MULTI_USER 
GO
ALTER DATABASE [SaleReportsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleReportsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleReportsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleReportsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SaleReportsDB]
GO
/****** Object:  Table [dbo].[Measures]    Script Date: 7/23/2013 10:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measures](
	[MeasureId] [int] NOT NULL,
	[MeasureName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Measures] PRIMARY KEY CLUSTERED 
(
	[MeasureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/23/2013 10:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[BasePrice] [decimal](18, 2) NOT NULL,
	[MeasureId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 7/23/2013 10:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[SupermarketId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Sum] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Sales] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supermarkets]    Script Date: 7/23/2013 10:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supermarkets](
	[SupermarketId] [int] IDENTITY(1,1) NOT NULL,
	[SupermarketName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Supermarkets] PRIMARY KEY CLUSTERED 
(
	[SupermarketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 7/23/2013 10:19:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorId] [int] NOT NULL,
	[VendorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Measures] ([MeasureId], [MeasureName]) VALUES (1, N'Litters')
INSERT [dbo].[Measures] ([MeasureId], [MeasureName]) VALUES (2, N'Units')
INSERT [dbo].[Measures] ([MeasureId], [MeasureName]) VALUES (3, N'Kg')
INSERT [dbo].[Measures] ([MeasureId], [MeasureName]) VALUES (4, N'Gram')
INSERT [dbo].[Measures] ([MeasureId], [MeasureName]) VALUES (5, N'Meter')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (1, N'Bira-Zagorka', CAST(0.80 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (2, N'Bira-Becks', CAST(0.90 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (3, N'Bira-Kamenitsa', CAST(0.70 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (4, N'Bira-Astika', CAST(0.60 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (5, N'Shokolad-Nestle', CAST(0.55 AS Decimal(18, 2)), 2, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (6, N'Bonboni-Nestle', CAST(1.20 AS Decimal(18, 2)), 2, 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (7, N'LapTop-Asus', CAST(970.00 AS Decimal(18, 2)), 2, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (8, N'Telefon-Asus', CAST(400.00 AS Decimal(18, 2)), 2, 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (9, N'LapTop-HP', CAST(1100.00 AS Decimal(18, 2)), 2, 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (10, N'Tablet-HP', CAST(2000.00 AS Decimal(18, 2)), 2, 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (11, N'IPhone', CAST(1300.00 AS Decimal(18, 2)), 2, 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (12, N'MacBook', CAST(2000.00 AS Decimal(18, 2)), 2, 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (13, N'Sladoled-Delta', CAST(1.30 AS Decimal(18, 2)), 2, 7)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (14, N'Biskviti-Pobeda', CAST(0.90 AS Decimal(18, 2)), 2, 8)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (15, N'Biskviti-Miraj', CAST(1.30 AS Decimal(18, 2)), 2, 8)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (16, N'Vafla-Prestij', CAST(0.30 AS Decimal(18, 2)), 2, 10)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (17, N'Vafla-Borovets', CAST(0.40 AS Decimal(18, 2)), 2, 10)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (18, N'MineralnaVoda-Devin', CAST(0.50 AS Decimal(18, 2)), 1, 11)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (19, N'MineralnaVoda-Bankya', CAST(0.45 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (20, N'Coca-cola', CAST(1.00 AS Decimal(18, 2)), 2, 13)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (21, N'Fanta', CAST(1.00 AS Decimal(18, 2)), 2, 13)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (22, N'Pepsi-Cola', CAST(0.90 AS Decimal(18, 2)), 2, 14)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (23, N'7up', CAST(0.80 AS Decimal(18, 2)), 2, 14)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (24, N'Krenvirshi-Tandem', CAST(2.41 AS Decimal(18, 2)), 4, 15)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (25, N'Lukanka-Tandem', CAST(5.29 AS Decimal(18, 2)), 4, 15)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (26, N'File-Elena', CAST(10.50 AS Decimal(18, 2)), 4, 15)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (27, N'Lukankov-Salam', CAST(4.30 AS Decimal(18, 2)), 4, 15)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (28, N'Krenvirshi-Sachi', CAST(1.30 AS Decimal(18, 2)), 3, 16)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (29, N'Nadenica-Sachi', CAST(2.00 AS Decimal(18, 2)), 3, 16)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (30, N'Xperia', CAST(900.00 AS Decimal(18, 2)), 2, 17)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (31, N'Telvizor', CAST(500.00 AS Decimal(18, 2)), 2, 17)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (32, N'Shokolad-Milka', CAST(1.10 AS Decimal(18, 2)), 2, 18)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (33, N'Mlqko-Milka', CAST(1.30 AS Decimal(18, 2)), 1, 18)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (34, N'Snikers', CAST(0.80 AS Decimal(18, 2)), 2, 19)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (35, N'Mars', CAST(0.60 AS Decimal(18, 2)), 2, 19)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (36, N'Bounty', CAST(0.90 AS Decimal(18, 2)), 2, 19)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (37, N'Twix', CAST(1.10 AS Decimal(18, 2)), 2, 19)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (38, N'Duvki-Orbit', CAST(0.70 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (39, N'Mentovi-Bonboni-Orbit', CAST(0.90 AS Decimal(18, 2)), 2, 20)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (40, N'JeamBeam BG', CAST(19.00 AS Decimal(18, 2)), 1, 21)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (41, N'Rakia-Kirovska', CAST(5.00 AS Decimal(18, 2)), 1, 21)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (42, N'JackDaniels', CAST(25.00 AS Decimal(18, 2)), 1, 21)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (43, N'Jameson', CAST(30.00 AS Decimal(18, 2)), 2, 22)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (44, N'Teachers', CAST(35.00 AS Decimal(18, 2)), 2, 22)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (45, N'Tollomore Dew', CAST(40.00 AS Decimal(18, 2)), 2, 22)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (46, N'Jonny Walker', CAST(50.00 AS Decimal(18, 2)), 2, 22)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (47, N'Lukanka-Karlovksa', CAST(12.00 AS Decimal(18, 2)), 3, 23)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (48, N'File-Orehite', CAST(19.00 AS Decimal(18, 2)), 3, 23)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (49, N'Bivolska Lukanka', CAST(25.00 AS Decimal(18, 2)), 3, 23)
INSERT [dbo].[Products] ([ProductId], [ProductName], [BasePrice], [MeasureId], [VendorId]) VALUES (50, N'ShunkaBut', CAST(9.00 AS Decimal(18, 2)), 3, 23)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (1, 1, CAST(0x0000A20100000000 AS DateTime), 1, 13, CAST(4.22 AS Decimal(18, 2)), CAST(54.86 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (2, 1, CAST(0x0000A20100000000 AS DateTime), 2, 19, CAST(10.10 AS Decimal(18, 2)), CAST(191.90 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (3, 1, CAST(0x0000A20100000000 AS DateTime), 3, 23, CAST(20.60 AS Decimal(18, 2)), CAST(473.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (4, 1, CAST(0x0000A20100000000 AS DateTime), 4, 25, CAST(8.60 AS Decimal(18, 2)), CAST(215.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (5, 1, CAST(0x0000A20100000000 AS DateTime), 5, 12, CAST(0.60 AS Decimal(18, 2)), CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (6, 1, CAST(0x0000A20100000000 AS DateTime), 6, 15, CAST(0.80 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (7, 1, CAST(0x0000A20100000000 AS DateTime), 7, 53, CAST(1.10 AS Decimal(18, 2)), CAST(58.30 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (8, 1, CAST(0x0000A20100000000 AS DateTime), 8, 24, CAST(0.90 AS Decimal(18, 2)), CAST(21.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (9, 1, CAST(0x0000A20100000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (10, 1, CAST(0x0000A20100000000 AS DateTime), 10, 356, CAST(1.80 AS Decimal(18, 2)), CAST(640.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (11, 1, CAST(0x0000A20100000000 AS DateTime), 11, 36, CAST(1.50 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (12, 1, CAST(0x0000A20100000000 AS DateTime), 12, 46, CAST(1.20 AS Decimal(18, 2)), CAST(55.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (13, 1, CAST(0x0000A20100000000 AS DateTime), 13, 20, CAST(1.20 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (14, 1, CAST(0x0000A20100000000 AS DateTime), 14, 12, CAST(2.30 AS Decimal(18, 2)), CAST(27.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (15, 1, CAST(0x0000A20100000000 AS DateTime), 15, 23, CAST(0.70 AS Decimal(18, 2)), CAST(16.10 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (16, 2, CAST(0x0000A20100000000 AS DateTime), 1, 37, CAST(4.42 AS Decimal(18, 2)), CAST(163.54 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (17, 2, CAST(0x0000A20100000000 AS DateTime), 2, 4, CAST(10.50 AS Decimal(18, 2)), CAST(42.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (18, 2, CAST(0x0000A20100000000 AS DateTime), 3, 23, CAST(20.50 AS Decimal(18, 2)), CAST(471.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (19, 2, CAST(0x0000A20100000000 AS DateTime), 4, 20, CAST(8.60 AS Decimal(18, 2)), CAST(172.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (20, 2, CAST(0x0000A20100000000 AS DateTime), 5, 12, CAST(0.60 AS Decimal(18, 2)), CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (21, 2, CAST(0x0000A20100000000 AS DateTime), 6, 12, CAST(0.85 AS Decimal(18, 2)), CAST(10.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (22, 2, CAST(0x0000A20100000000 AS DateTime), 7, 53, CAST(1.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (23, 2, CAST(0x0000A20100000000 AS DateTime), 8, 12, CAST(0.90 AS Decimal(18, 2)), CAST(10.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (24, 2, CAST(0x0000A20100000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (25, 2, CAST(0x0000A20100000000 AS DateTime), 10, 24, CAST(1.80 AS Decimal(18, 2)), CAST(43.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (26, 2, CAST(0x0000A20100000000 AS DateTime), 11, 36, CAST(1.50 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (27, 2, CAST(0x0000A20100000000 AS DateTime), 12, 35, CAST(1.25 AS Decimal(18, 2)), CAST(43.75 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (28, 2, CAST(0x0000A20100000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (29, 2, CAST(0x0000A20100000000 AS DateTime), 14, 10, CAST(2.30 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (30, 2, CAST(0x0000A20100000000 AS DateTime), 15, 23, CAST(0.75 AS Decimal(18, 2)), CAST(17.25 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (31, 3, CAST(0x0000A20100000000 AS DateTime), 1, 35, CAST(4.42 AS Decimal(18, 2)), CAST(154.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (32, 3, CAST(0x0000A20100000000 AS DateTime), 2, 14, CAST(12.00 AS Decimal(18, 2)), CAST(168.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (33, 3, CAST(0x0000A20100000000 AS DateTime), 3, 23, CAST(20.50 AS Decimal(18, 2)), CAST(471.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (34, 3, CAST(0x0000A20100000000 AS DateTime), 4, 25, CAST(8.60 AS Decimal(18, 2)), CAST(215.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (35, 3, CAST(0x0000A20100000000 AS DateTime), 5, 12, CAST(0.65 AS Decimal(18, 2)), CAST(7.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (36, 3, CAST(0x0000A20100000000 AS DateTime), 6, 23, CAST(1.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (37, 3, CAST(0x0000A20100000000 AS DateTime), 7, 53, CAST(1.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (38, 3, CAST(0x0000A20100000000 AS DateTime), 8, 32, CAST(0.90 AS Decimal(18, 2)), CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (39, 3, CAST(0x0000A20100000000 AS DateTime), 9, 24, CAST(1.65 AS Decimal(18, 2)), CAST(39.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (40, 3, CAST(0x0000A20100000000 AS DateTime), 10, 36, CAST(1.80 AS Decimal(18, 2)), CAST(64.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (41, 3, CAST(0x0000A20100000000 AS DateTime), 11, 36, CAST(1.50 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (42, 3, CAST(0x0000A20100000000 AS DateTime), 12, 46, CAST(1.50 AS Decimal(18, 2)), CAST(69.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (43, 3, CAST(0x0000A20100000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (44, 3, CAST(0x0000A20100000000 AS DateTime), 14, 125, CAST(2.35 AS Decimal(18, 2)), CAST(293.75 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (45, 3, CAST(0x0000A20100000000 AS DateTime), 15, 23, CAST(0.70 AS Decimal(18, 2)), CAST(16.10 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (46, 3, CAST(0x0000A20200000000 AS DateTime), 1, 54, CAST(4.40 AS Decimal(18, 2)), CAST(237.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (47, 3, CAST(0x0000A20200000000 AS DateTime), 2, 12, CAST(12.00 AS Decimal(18, 2)), CAST(144.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (48, 3, CAST(0x0000A20200000000 AS DateTime), 3, 24, CAST(20.50 AS Decimal(18, 2)), CAST(492.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (49, 3, CAST(0x0000A20200000000 AS DateTime), 4, 20, CAST(8.60 AS Decimal(18, 2)), CAST(172.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (50, 3, CAST(0x0000A20200000000 AS DateTime), 5, 12, CAST(0.64 AS Decimal(18, 2)), CAST(7.68 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (51, 3, CAST(0x0000A20200000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (52, 3, CAST(0x0000A20200000000 AS DateTime), 7, 12, CAST(1.20 AS Decimal(18, 2)), CAST(14.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (53, 3, CAST(0x0000A20200000000 AS DateTime), 8, 64, CAST(0.90 AS Decimal(18, 2)), CAST(57.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (54, 3, CAST(0x0000A20200000000 AS DateTime), 9, 12, CAST(1.60 AS Decimal(18, 2)), CAST(19.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (55, 3, CAST(0x0000A20200000000 AS DateTime), 10, 36, CAST(1.80 AS Decimal(18, 2)), CAST(64.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (56, 3, CAST(0x0000A20200000000 AS DateTime), 11, 36, CAST(1.50 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (57, 3, CAST(0x0000A20200000000 AS DateTime), 12, 24, CAST(1.20 AS Decimal(18, 2)), CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (58, 3, CAST(0x0000A20200000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (59, 3, CAST(0x0000A20200000000 AS DateTime), 14, 12, CAST(2.40 AS Decimal(18, 2)), CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (60, 3, CAST(0x0000A20200000000 AS DateTime), 15, 23, CAST(0.60 AS Decimal(18, 2)), CAST(13.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (61, 1, CAST(0x0000A20200000000 AS DateTime), 1, 37, CAST(4.55 AS Decimal(18, 2)), CAST(168.35 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (62, 1, CAST(0x0000A20200000000 AS DateTime), 2, 17, CAST(11.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (63, 1, CAST(0x0000A20200000000 AS DateTime), 3, 23, CAST(20.50 AS Decimal(18, 2)), CAST(471.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (64, 1, CAST(0x0000A20200000000 AS DateTime), 4, 54, CAST(8.90 AS Decimal(18, 2)), CAST(480.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (65, 1, CAST(0x0000A20200000000 AS DateTime), 5, 12, CAST(0.60 AS Decimal(18, 2)), CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (66, 1, CAST(0x0000A20200000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (67, 1, CAST(0x0000A20200000000 AS DateTime), 7, 52, CAST(1.70 AS Decimal(18, 2)), CAST(88.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (68, 1, CAST(0x0000A20200000000 AS DateTime), 8, 64, CAST(0.90 AS Decimal(18, 2)), CAST(57.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (69, 1, CAST(0x0000A20200000000 AS DateTime), 9, 23, CAST(1.60 AS Decimal(18, 2)), CAST(36.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (70, 1, CAST(0x0000A20200000000 AS DateTime), 10, 36, CAST(2.00 AS Decimal(18, 2)), CAST(72.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (71, 1, CAST(0x0000A20200000000 AS DateTime), 11, 36, CAST(1.55 AS Decimal(18, 2)), CAST(55.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (72, 1, CAST(0x0000A20200000000 AS DateTime), 12, 25, CAST(1.20 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (73, 1, CAST(0x0000A20200000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (74, 1, CAST(0x0000A20200000000 AS DateTime), 14, 10, CAST(2.35 AS Decimal(18, 2)), CAST(23.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (75, 1, CAST(0x0000A20200000000 AS DateTime), 15, 12, CAST(0.75 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (76, 2, CAST(0x0000A20200000000 AS DateTime), 1, 54, CAST(4.53 AS Decimal(18, 2)), CAST(244.62 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (77, 2, CAST(0x0000A20200000000 AS DateTime), 2, 14, CAST(10.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (78, 2, CAST(0x0000A20200000000 AS DateTime), 3, 40, CAST(20.50 AS Decimal(18, 2)), CAST(820.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (79, 2, CAST(0x0000A20200000000 AS DateTime), 4, 20, CAST(8.60 AS Decimal(18, 2)), CAST(172.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (80, 2, CAST(0x0000A20200000000 AS DateTime), 5, 12, CAST(0.65 AS Decimal(18, 2)), CAST(7.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (81, 2, CAST(0x0000A20200000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (82, 2, CAST(0x0000A20200000000 AS DateTime), 7, 53, CAST(1.30 AS Decimal(18, 2)), CAST(68.90 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (83, 2, CAST(0x0000A20200000000 AS DateTime), 8, 64, CAST(1.00 AS Decimal(18, 2)), CAST(64.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (84, 2, CAST(0x0000A20200000000 AS DateTime), 9, 10, CAST(2.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (85, 2, CAST(0x0000A20200000000 AS DateTime), 10, 10, CAST(1.80 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (86, 2, CAST(0x0000A20200000000 AS DateTime), 11, 10, CAST(1.60 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (87, 2, CAST(0x0000A20200000000 AS DateTime), 12, 46, CAST(1.20 AS Decimal(18, 2)), CAST(55.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (88, 2, CAST(0x0000A20200000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (89, 2, CAST(0x0000A20200000000 AS DateTime), 14, 10, CAST(2.40 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (90, 2, CAST(0x0000A20200000000 AS DateTime), 15, 55, CAST(0.70 AS Decimal(18, 2)), CAST(38.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (91, 4, CAST(0x0000A20200000000 AS DateTime), 1, 21, CAST(4.20 AS Decimal(18, 2)), CAST(88.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (92, 4, CAST(0x0000A20200000000 AS DateTime), 2, 11, CAST(10.00 AS Decimal(18, 2)), CAST(110.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (93, 4, CAST(0x0000A20200000000 AS DateTime), 3, 23, CAST(20.50 AS Decimal(18, 2)), CAST(471.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (94, 4, CAST(0x0000A20200000000 AS DateTime), 4, 21, CAST(8.60 AS Decimal(18, 2)), CAST(180.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (95, 4, CAST(0x0000A20200000000 AS DateTime), 5, 15, CAST(0.80 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (96, 4, CAST(0x0000A20200000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (97, 4, CAST(0x0000A20200000000 AS DateTime), 7, 53, CAST(0.70 AS Decimal(18, 2)), CAST(37.10 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (98, 4, CAST(0x0000A20200000000 AS DateTime), 8, 44, CAST(0.90 AS Decimal(18, 2)), CAST(39.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (99, 4, CAST(0x0000A20200000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (100, 4, CAST(0x0000A20200000000 AS DateTime), 10, 36, CAST(1.80 AS Decimal(18, 2)), CAST(64.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (101, 4, CAST(0x0000A20200000000 AS DateTime), 11, 23, CAST(1.50 AS Decimal(18, 2)), CAST(34.50 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (102, 4, CAST(0x0000A20200000000 AS DateTime), 12, 46, CAST(1.60 AS Decimal(18, 2)), CAST(73.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (103, 4, CAST(0x0000A20200000000 AS DateTime), 13, 12, CAST(1.20 AS Decimal(18, 2)), CAST(14.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (104, 4, CAST(0x0000A20200000000 AS DateTime), 14, 10, CAST(2.20 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (105, 4, CAST(0x0000A20200000000 AS DateTime), 15, 24, CAST(0.70 AS Decimal(18, 2)), CAST(16.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (106, 1, CAST(0x0000A20300000000 AS DateTime), 1, 17, CAST(4.42 AS Decimal(18, 2)), CAST(75.14 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (107, 1, CAST(0x0000A20300000000 AS DateTime), 2, 34, CAST(10.00 AS Decimal(18, 2)), CAST(340.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (108, 1, CAST(0x0000A20300000000 AS DateTime), 3, 15, CAST(20.55 AS Decimal(18, 2)), CAST(308.25 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (109, 1, CAST(0x0000A20300000000 AS DateTime), 4, 22, CAST(8.60 AS Decimal(18, 2)), CAST(189.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (110, 1, CAST(0x0000A20300000000 AS DateTime), 5, 12, CAST(0.60 AS Decimal(18, 2)), CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (111, 1, CAST(0x0000A20300000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (112, 1, CAST(0x0000A20300000000 AS DateTime), 7, 33, CAST(1.00 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (113, 1, CAST(0x0000A20300000000 AS DateTime), 8, 64, CAST(0.95 AS Decimal(18, 2)), CAST(60.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (114, 1, CAST(0x0000A20300000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (115, 1, CAST(0x0000A20300000000 AS DateTime), 10, 16, CAST(1.80 AS Decimal(18, 2)), CAST(28.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (116, 1, CAST(0x0000A20300000000 AS DateTime), 11, 12, CAST(1.56 AS Decimal(18, 2)), CAST(18.72 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (117, 1, CAST(0x0000A20300000000 AS DateTime), 12, 46, CAST(1.20 AS Decimal(18, 2)), CAST(55.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (118, 1, CAST(0x0000A20300000000 AS DateTime), 13, 12, CAST(1.10 AS Decimal(18, 2)), CAST(13.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (119, 1, CAST(0x0000A20300000000 AS DateTime), 14, 10, CAST(2.30 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (120, 1, CAST(0x0000A20300000000 AS DateTime), 15, 12, CAST(0.70 AS Decimal(18, 2)), CAST(8.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (121, 2, CAST(0x0000A20300000000 AS DateTime), 1, 37, CAST(4.42 AS Decimal(18, 2)), CAST(163.54 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (122, 2, CAST(0x0000A20300000000 AS DateTime), 2, 14, CAST(10.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (123, 2, CAST(0x0000A20300000000 AS DateTime), 3, 23, CAST(20.70 AS Decimal(18, 2)), CAST(476.10 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (124, 2, CAST(0x0000A20300000000 AS DateTime), 4, 0, CAST(8.60 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (125, 2, CAST(0x0000A20300000000 AS DateTime), 5, 22, CAST(0.60 AS Decimal(18, 2)), CAST(13.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (126, 2, CAST(0x0000A20300000000 AS DateTime), 6, 12, CAST(0.80 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (127, 2, CAST(0x0000A20300000000 AS DateTime), 7, 43, CAST(1.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (128, 2, CAST(0x0000A20300000000 AS DateTime), 8, 64, CAST(0.90 AS Decimal(18, 2)), CAST(57.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (129, 2, CAST(0x0000A20300000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (130, 2, CAST(0x0000A20300000000 AS DateTime), 10, 36, CAST(1.85 AS Decimal(18, 2)), CAST(66.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (131, 2, CAST(0x0000A20300000000 AS DateTime), 11, 36, CAST(1.50 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (132, 2, CAST(0x0000A20300000000 AS DateTime), 12, 45, CAST(1.20 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (133, 2, CAST(0x0000A20300000000 AS DateTime), 13, 17, CAST(1.10 AS Decimal(18, 2)), CAST(18.70 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (134, 2, CAST(0x0000A20300000000 AS DateTime), 14, 50, CAST(2.30 AS Decimal(18, 2)), CAST(115.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (135, 2, CAST(0x0000A20300000000 AS DateTime), 15, 3, CAST(0.70 AS Decimal(18, 2)), CAST(2.10 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (136, 4, CAST(0x0000A20300000000 AS DateTime), 1, 37, CAST(4.42 AS Decimal(18, 2)), CAST(163.54 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (137, 4, CAST(0x0000A20300000000 AS DateTime), 2, 14, CAST(10.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (138, 4, CAST(0x0000A20300000000 AS DateTime), 3, 26, CAST(20.55 AS Decimal(18, 2)), CAST(534.30 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (139, 4, CAST(0x0000A20300000000 AS DateTime), 4, 15, CAST(8.60 AS Decimal(18, 2)), CAST(129.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (140, 4, CAST(0x0000A20300000000 AS DateTime), 5, 12, CAST(0.60 AS Decimal(18, 2)), CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (141, 4, CAST(0x0000A20300000000 AS DateTime), 6, 15, CAST(0.80 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (142, 4, CAST(0x0000A20300000000 AS DateTime), 7, 53, CAST(1.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (143, 4, CAST(0x0000A20300000000 AS DateTime), 8, 64, CAST(0.90 AS Decimal(18, 2)), CAST(57.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (144, 4, CAST(0x0000A20300000000 AS DateTime), 9, 24, CAST(1.60 AS Decimal(18, 2)), CAST(38.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (145, 4, CAST(0x0000A20300000000 AS DateTime), 10, 36, CAST(1.80 AS Decimal(18, 2)), CAST(64.80 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (146, 4, CAST(0x0000A20300000000 AS DateTime), 11, 24, CAST(1.55 AS Decimal(18, 2)), CAST(37.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (147, 4, CAST(0x0000A20300000000 AS DateTime), 12, 46, CAST(1.20 AS Decimal(18, 2)), CAST(55.20 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (148, 4, CAST(0x0000A20300000000 AS DateTime), 13, 17, CAST(1.20 AS Decimal(18, 2)), CAST(20.40 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (149, 4, CAST(0x0000A20300000000 AS DateTime), 14, 12, CAST(2.30 AS Decimal(18, 2)), CAST(27.60 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleId], [SupermarketId], [Date], [ProductId], [Quantity], [UnitPrice], [Sum]) VALUES (150, 4, CAST(0x0000A20300000000 AS DateTime), 15, 23, CAST(0.70 AS Decimal(18, 2)), CAST(16.10 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[Supermarkets] ON 

INSERT [dbo].[Supermarkets] ([SupermarketId], [SupermarketName]) VALUES (1, N'\Bourgas-Plaza')
INSERT [dbo].[Supermarkets] ([SupermarketId], [SupermarketName]) VALUES (2, N'\Kaspichan-Center')
INSERT [dbo].[Supermarkets] ([SupermarketId], [SupermarketName]) VALUES (3, N'\Zmeyovo')
INSERT [dbo].[Supermarkets] ([SupermarketId], [SupermarketName]) VALUES (4, N'\Plovdiv-Stolipinovo')
SET IDENTITY_INSERT [dbo].[Supermarkets] OFF
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (1, N'Zagorka AD')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (2, N'Kamenitsa AD')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (3, N'Nestle')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (4, N'Asus')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (5, N'HP')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (6, N'Apple')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (7, N'Craft foods')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (8, N'Pobeda')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (9, N'Svoge')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (10, N'Prestij')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (11, N'Devin')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (12, N'Bankya')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (13, N'Coca-cola')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (14, N'Pepsico')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (15, N'Tandem')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (16, N'Sachi')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (17, N'Sony')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (18, N'Milka')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (19, N'Mars Co.')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (20, N'Orbit')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (21, N'Tsar Kiro')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (22, N'Maxium')
INSERT [dbo].[Vendors] ([VendorId], [VendorName]) VALUES (23, N'Mesokombinat Karlovo')
/****** Object:  Index [IX_MeasureId]    Script Date: 7/23/2013 10:19:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_MeasureId] ON [dbo].[Products]
(
	[MeasureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VendorId]    Script Date: 7/23/2013 10:19:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_VendorId] ON [dbo].[Products]
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 7/23/2013 10:19:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[Sales]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupermarketId]    Script Date: 7/23/2013 10:19:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_SupermarketId] ON [dbo].[Sales]
(
	[SupermarketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Measures_MeasureId] FOREIGN KEY([MeasureId])
REFERENCES [dbo].[Measures] ([MeasureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Measures_MeasureId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Vendors_VendorId] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([VendorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Vendors_VendorId]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sales_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_dbo.Sales_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sales_dbo.Supermarkets_SupermarketId] FOREIGN KEY([SupermarketId])
REFERENCES [dbo].[Supermarkets] ([SupermarketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_dbo.Sales_dbo.Supermarkets_SupermarketId]
GO
USE [master]
GO
ALTER DATABASE [SaleReportsDB] SET  READ_WRITE 
GO
