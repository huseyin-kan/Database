USE [master]
GO
/****** Object:  Database [eCommerce]    Script Date: 29.11.2022 19:58:01 ******/
CREATE DATABASE [eCommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eCommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eCommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eCommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Turkish_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eCommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [eCommerce] SET  MULTI_USER 
GO
ALTER DATABASE [eCommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eCommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eCommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eCommerce', N'ON'
GO
ALTER DATABASE [eCommerce] SET QUERY_STORE = OFF
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [LAPTOP-HONK2CV0\HUAWEI]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [LAPTOP-HONK2CV0\HUAWEI] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'XpFlG9rx6AnB+RtK+0v04EkWdtLjjmL2DyPh4poSo+g=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 29.11.2022 19:58:01 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'B8hhg7dYmJkkBZv8pFGRYCaiXAxoC/BzaQ6ZOL8w4yM=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [LAPTOP-HONK2CV0\HUAWEI]
GO
USE [eCommerce]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admins](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) COLLATE Turkish_CI_AS NULL,
	[password] [varchar](15) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cards]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cards](
	[cardId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[cardNumber] [varchar](16) COLLATE Turkish_CI_AS NULL,
	[cardValidDate] [date] NULL,
	[cardScrty] [varchar](3) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_cards] PRIMARY KEY CLUSTERED 
(
	[cardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categories]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[computers]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[computers](
	[computerId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[ram] [int] NULL,
	[capacity] [int] NULL,
	[cpu] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[gpu] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_computers] PRIMARY KEY CLUSTERED 
(
	[computerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[consoles]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[consoles](
	[consoleId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[gamepadNumber] [int] NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK_consoles] PRIMARY KEY CLUSTERED 
(
	[consoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gamepads]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gamepads](
	[gamepadId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[relevance] [varchar](50) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_gamepads] PRIMARY KEY CLUSTERED 
(
	[gamepadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[headphones]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[headphones](
	[headphonesId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[isWireless] [bit] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[type] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[isGaming] [bit] NULL,
 CONSTRAINT [PK_headphones] PRIMARY KEY CLUSTERED 
(
	[headphonesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[keyboardmouse]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[keyboardmouse](
	[kmId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_keyboardmouse] PRIMARY KEY CLUSTERED 
(
	[kmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[keyboards]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[keyboards](
	[keyboardId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[isWireless] [bit] NULL,
	[isGaming] [bit] NULL,
 CONSTRAINT [PK_keyboards] PRIMARY KEY CLUSTERED 
(
	[keyboardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mousepads]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mousepads](
	[mPadId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[height] [int] NULL,
	[width] [int] NULL,
 CONSTRAINT [PK_mousepads] PRIMARY KEY CLUSTERED 
(
	[mPadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mouses]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mouses](
	[mouseId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[isWireless] [bit] NULL,
	[isGaming] [bit] NULL,
 CONSTRAINT [PK_mouses] PRIMARY KEY CLUSTERED 
(
	[mouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[price] [smallmoney] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[orderDate] [smalldatetime] NULL,
	[requiredDate] [smalldatetime] NULL,
	[isDelivered] [bit] NULL,
	[orderNumber] [varchar](11) COLLATE Turkish_CI_AS NULL,
	[orderTotal] [smallmoney] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phones]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phones](
	[phoneId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[capacity] [int] NULL,
	[color] [varchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_phones] PRIMARY KEY CLUSTERED 
(
	[phoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) COLLATE Turkish_CI_AS NULL,
	[productPrice] [smallmoney] NULL,
	[productDescription] [varchar](150) COLLATE Turkish_CI_AS NULL,
	[categoryId] [int] NULL,
	[categoryName] [varchar](50) COLLATE Turkish_CI_AS NULL,
	[productBrand] [varchar](50) COLLATE Turkish_CI_AS NULL,
	[unitsInStock] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[televisions]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[televisions](
	[tvId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[type] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[size] [int] NULL,
	[isAndroid] [bit] NULL,
	[isSmart] [bit] NULL,
	[ledType] [varchar](20) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_televisions] PRIMARY KEY CLUSTERED 
(
	[tvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 29.11.2022 19:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](25) COLLATE Turkish_CI_AS NULL,
	[userSurname] [varchar](25) COLLATE Turkish_CI_AS NULL,
	[userPhone] [varchar](10) COLLATE Turkish_CI_AS NULL,
	[userEmail] [varchar](50) COLLATE Turkish_CI_AS NULL,
	[userDateofBirth] [date] NULL,
	[userPassword] [varchar](20) COLLATE Turkish_CI_AS NULL,
	[userAddress] [varchar](255) COLLATE Turkish_CI_AS NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[cards]  WITH CHECK ADD  CONSTRAINT [FK_cards_users] FOREIGN KEY([customerId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[cards] CHECK CONSTRAINT [FK_cards_users]
GO
ALTER TABLE [dbo].[computers]  WITH CHECK ADD  CONSTRAINT [FK_computers_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[computers] CHECK CONSTRAINT [FK_computers_products]
GO
ALTER TABLE [dbo].[consoles]  WITH CHECK ADD  CONSTRAINT [FK_consoles_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[consoles] CHECK CONSTRAINT [FK_consoles_products]
GO
ALTER TABLE [dbo].[gamepads]  WITH CHECK ADD  CONSTRAINT [FK_gamepads_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[gamepads] CHECK CONSTRAINT [FK_gamepads_products]
GO
ALTER TABLE [dbo].[headphones]  WITH CHECK ADD  CONSTRAINT [FK_headphones_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[headphones] CHECK CONSTRAINT [FK_headphones_products]
GO
ALTER TABLE [dbo].[keyboardmouse]  WITH CHECK ADD  CONSTRAINT [FK_keyboardmouse_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[keyboardmouse] CHECK CONSTRAINT [FK_keyboardmouse_products]
GO
ALTER TABLE [dbo].[keyboards]  WITH CHECK ADD  CONSTRAINT [FK_keyboards_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[keyboards] CHECK CONSTRAINT [FK_keyboards_products]
GO
ALTER TABLE [dbo].[mousepads]  WITH CHECK ADD  CONSTRAINT [FK_mousepads_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[mousepads] CHECK CONSTRAINT [FK_mousepads_products]
GO
ALTER TABLE [dbo].[mouses]  WITH CHECK ADD  CONSTRAINT [FK_mouses_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[mouses] CHECK CONSTRAINT [FK_mouses_products]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetails_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([orderId])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetails_orders]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetails_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetails_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([customerId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[phones]  WITH CHECK ADD  CONSTRAINT [FK_phones_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[phones] CHECK CONSTRAINT [FK_phones_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories1] FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([categoryId])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories1]
GO
ALTER TABLE [dbo].[televisions]  WITH CHECK ADD  CONSTRAINT [FK_televisions_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[televisions] CHECK CONSTRAINT [FK_televisions_products]
GO
USE [master]
GO
ALTER DATABASE [eCommerce] SET  READ_WRITE 
GO
