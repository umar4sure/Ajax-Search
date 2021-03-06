USE [master]
GO
/****** Object:  Database [FridayShoppingCart]    Script Date: 9/12/2017 1:21:28 AM ******/
CREATE DATABASE [FridayShoppingCart] 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FridayShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FridayShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FridayShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FridayShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FridayShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FridayShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FridayShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FridayShoppingCart] SET RECOVERY FULL 
GO
ALTER DATABASE [FridayShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [FridayShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FridayShoppingCart] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FridayShoppingCart', N'ON'
GO
USE [FridayShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllCategories]

AS
Begin
	select top 2 * from Categories	
End

GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllProducts]

AS
Begin
	select * from Products
End

GO
/****** Object:  StoredProcedure [dbo].[GetProductswithCategories]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetProductswithCategories]
@Id int  = 1
AS
Begin
	select p.Id,p.Name,c.Name as categoryname
	 from Products p 
	inner join Categories c on c.id = p.CategoryId
	
End

GO
/****** Object:  StoredProcedure [dbo].[loginuser]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[loginuser]
@email varchar(50),
@password varchar(50)
AS
Begin
	select top 1 * from users u
	where u.Email = @email and u.[Password] = @password

End
GO
/****** Object:  StoredProcedure [dbo].[SearchDb]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchDb]
@word as nvarchar(512)
As
Begin

	select * from Products p where 
	p.Name like '%' +@word + '%'
End
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [int] NULL,
	[ImageUrl] [varchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 9/12/2017 1:21:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'General')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Electronics')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Footwear')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Clothing')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (1, N'Microsoft Surface (Tab/Pad)', 60000, N'pro1.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (2, N'Ladies Bag Pink', 1500, N'pro2.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (3, N'Ladies Bag Pink in Leather', 2000, N'pro3.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (4, N'Black Half sleeves T shirt', 500, N'pro4.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (5, N'Burqa Blue', 4000, N'pro5.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (6, N'Gray Full Sleeves T Shirt', 800, N'pro6.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (7, N'Samsung Mobile', 16000, N'pro7.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (8, N'Mac IPAD', 55000, N'pro8.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (9, N'Maroon Maxy', 1800, N'pro9.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Price], [ImageUrl], [CategoryId]) VALUES (10, N'LED TV', 49000, N'pro10.jpg', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [Email], [Password]) VALUES (1, N'mazhar@aptech.com', N'123')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [FridayShoppingCart] SET  READ_WRITE 
GO
