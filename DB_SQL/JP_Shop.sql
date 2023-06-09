USE [master]
GO
/****** Object:  Database [JP_ShopThoitrang]    Script Date: 03/12/2023 10:15:34 PM ******/
CREATE DATABASE [JP_ShopThoitrang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JP_ShopThoitrang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\JP_ShopThoitrang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JP_ShopThoitrang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\JP_ShopThoitrang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JP_ShopThoitrang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JP_ShopThoitrang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JP_ShopThoitrang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ARITHABORT OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JP_ShopThoitrang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JP_ShopThoitrang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JP_ShopThoitrang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JP_ShopThoitrang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JP_ShopThoitrang] SET  MULTI_USER 
GO
ALTER DATABASE [JP_ShopThoitrang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JP_ShopThoitrang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JP_ShopThoitrang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JP_ShopThoitrang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JP_ShopThoitrang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JP_ShopThoitrang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JP_ShopThoitrang] SET QUERY_STORE = OFF
GO
USE [JP_ShopThoitrang]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catalogs]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalogs](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[catalog_id] [varchar](50) NOT NULL,
	[catalog_name] [nvarchar](max) NULL,
	[catalog_image] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[transactions_id] [varchar](100) NOT NULL,
	[product_id] [varchar](100) NULL,
	[quantity] [int] NULL,
	[total_price] [int] NULL,
	[data] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[catalog_id] [varchar](50) NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[image_main] [text] NULL,
	[image_sub] [text] NULL,
	[price] [int] NULL,
	[content] [nvarchar](max) NULL,
	[discount] [int] NULL,
	[quantity] [int] NULL,
	[quantity_sold] [int] NULL,
	[status] [int] NULL,
	[created] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[transactions_id] [varchar](100) NOT NULL,
	[status] [int] NULL,
	[user_id] [int] NULL,
	[username] [nvarchar](max) NOT NULL,
	[phonenumber] [varchar](13) NULL,
	[gmail] [varchar](100) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[total_price] [int] NULL,
	[payment] [varchar](50) NULL,
	[payment_info] [text] NULL,
	[message] [nvarchar](max) NULL,
	[security] [varchar](100) NULL,
	[created] [smalldatetime] NULL,
	[shipping] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[transactions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/12/2023 10:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[gmail] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[username] [nvarchar](max) NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone] [varchar](13) NULL,
	[avatar] [text] NULL,
	[position] [int] NULL,
	[created] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admins] ON 

INSERT [dbo].[admins] ([id], [name], [username], [password]) VALUES (1, N'Nguyễn Văn Nam', N'thienthan10x99', N'0123456')
SET IDENTITY_INSERT [dbo].[admins] OFF
GO
SET IDENTITY_INSERT [dbo].[catalogs] ON 

INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (11, N'20230308191423catalog_id', N'Đồ Chơi - Mẹ & Bé', N'22420230308191423Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (12, N'20230308194134catalog_id', N'Điện Thoại - Máy Tính Bảng', N'21320230308194134Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (13, N'20230308194241catalog_id', N'Thời Trang Nam', N'90320230308194241Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (14, N'20230308194255catalog_id', N'Thời Trang Nữ', N'27120230308194255Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (15, N'20230308194308catalog_id', N'Đồng Hồ', N'77020230308194308Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (16, N'20230308194320catalog_id', N'Máy Ảnh', N'68420230308194320Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (17, N'20230308194522catalog_id', N'Điện Gia Dụng', N'68220230308194522Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (18, N'20230308194559catalog_id', N'Ô Tô - Xe Máy - Xe Đạp', N'55720230308194559Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (19, N'20230308194652catalog_id', N'Điện Tử - Điện Lạnh', N'31420230308194652Danhmuc.jpg')
INSERT [dbo].[catalogs] ([id], [catalog_id], [catalog_name], [catalog_image]) VALUES (20, N'20230311225831catalog_id', N'Điện thoại', N'2320230311225831Danhmuc.jpg')
SET IDENTITY_INSERT [dbo].[catalogs] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (57, N'67520230310235955transactions', N'20230308195925products', 3, 259000, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (58, N'67520230310235955transactions', N'20230308201615products', 1, 5410000, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (59, N'29920230312184521transactions', N'20230308200403products', 3, 54138, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (60, N'29920230312184521transactions', N'20230308200245products', 7, 1090000, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (61, N'75620230312184858transactions', N'20230308195104products', 4, 215000, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (62, N'75620230312184858transactions', N'20230308200533products', 4, 673000, NULL, NULL)
INSERT [dbo].[orders] ([id], [transactions_id], [product_id], [quantity], [total_price], [data], [status]) VALUES (63, N'75620230312184858transactions', N'20230308201818products', 4, 3550000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (30, N'20230308195104products', N'20230308194522catalog_id', N'Máy Vắt Cam Lock&Lock EJJ231 (40W) - Hàng chính hãng', N'76320230308195104Products.jpg', NULL, 215000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<h3>Chất liệu bền bỉ</h3>

<p><strong>M&aacute;y Vắt Cam Lock&amp;Lock EJJ231</strong>&nbsp;được l&agrave;m bằng nhựa PP, ABS bền đẹp, chắc chắn. Chất liệu nhựa nhẹ, dễ vệ sinh sau khi sử dụng. M&aacute;y c&oacute; c&ocirc;ng suất 40W cho khả năng hoạt động ổn định, &ecirc;m &aacute;i v&agrave; kh&ocirc;ng tốn nhiều điện năng.</p>

<h3>Thiết kế khoa học</h3>

<p>Đặc biệt, sản phẩm trang bị b&igrave;nh đựng trong suốt gi&uacute;p bạn quan s&aacute;t được lượng &eacute;p b&ecirc;n trong. Nắp đậy bảo vệ b&ecirc;n ngo&agrave;i v&agrave; nắp đậy đầu vắt b&ecirc;n trong gi&uacute;p bảo vệ k&iacute;n đ&aacute;o, ngăn ngừa bụi bẩn, vi khuẩn x&acirc;m nhập hiệu quả. Quai cầm d&agrave;y chắc kết hợp c&ugrave;ng miệng r&oacute;t tr&ecirc;n b&igrave;nh đựng gi&uacute;p bạn thực hiện c&aacute;c thao t&aacute;c cầm nắm, r&oacute;t nước &eacute;p dễ d&agrave;ng.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/d4/31/03/d2bf5a63d5fe9b8d4f0f79a4583e5bcb.jpg" style="height:1014px; width:750px" /></p>

<h3>Dễ d&agrave;ng sử dụng</h3>

<p>M&aacute;y sử dụng đơn giản, nhẹ nh&agrave;ng, bạn chỉ cần ấn nhẹ miếng tr&aacute;i c&acirc;y đặt tr&ecirc;n n&oacute;n &eacute;p l&agrave; đ&atilde; khởi động cho thiết bị thực hiện c&ocirc;ng việc &eacute;p nước cam. Sản phẩm sở hữu thiết kế nhỏ gọn với m&agrave;u sắc trang nh&atilde;, kh&ocirc;ng chỉ mang đến cho gia đ&igrave;nh bạn những ly nước tr&aacute;i c&acirc;y thơm ngon, bổ dưỡng m&agrave; c&ograve;n g&oacute;p phần t&ocirc; điểm cho kh&ocirc;ng gian bếp th&ecirc;m tiện nghi, hiện đại.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/33/cf/a3/54db81fa599d5256a3e576ece245025b.jpg" style="height:1157px; width:750px" /></p>

<h3>Hướng dẫn sử dụng</h3>

<ul>
	<li>Mở d&acirc;y ho&agrave;n to&agrave;n trước khi cắm v&agrave;o.</li>
	<li>Nối thiết bị v&agrave;o nguồn điện.</li>
	<li>Cắt tr&aacute;i c&acirc;y th&agrave;nh một nửa.</li>
	<li>Đặt ly ở phễu r&oacute;t nước &eacute;p của thiết bị.</li>
	<li>Đặt miếng tr&aacute;i c&acirc;y l&ecirc;n n&oacute;n &eacute;p, bật thiết bị bằng c&aacute;ch ấn miếng tr&aacute;i c&acirc;y xuống.</li>
	<li>Để ngừng thiết bị, chỉ cần dừng ấn n&oacute;n &eacute;p.</li>
	<li>Th&aacute;o n&oacute;n &eacute;p v&agrave; bộ lọc ra khỏi b&igrave;nh.</li>
	<li>R&oacute;t nước &eacute;p v&agrave;o ly.</li>
	<li>Nếu bạn xử l&yacute; một lượng lớn tr&aacute;i c&acirc;y, bạn phải định kỳ l&agrave;m sạch bộ lọc v&agrave; loại bỏ phần c&ograve;n lại của cặn.</li>
</ul>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/eb/06/35/81136bc6f6dca65bdee80697f8b92041.jpg" style="height:1292px; width:750px" /></p>

<h3>Th&ocirc;ng số sản phẩm</h3>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/1c/ef/cb/d9d44dcaf9d04b95f0cf2dedd4cded51.jpg" style="height:405px; width:750px" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1219, 4, 1, CAST(N'2023-03-08T19:51:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (31, N'20230308195925products', N'20230308194522catalog_id', N'Máy vắt cam 0.7lit LB389 Lebenlang (Hàng nhập khẩu)', N'97120230308195925Products.jpg', NULL, 259000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>M&aacute;y vắt cam Lebenlang model LB389</p>

<p>- Công suất: 40W. Dung tích: 0.7L</p>

<p><br />
Máy vắt cam LB389 được làm bằng nhựa PP, ABS, AS và SUS430 bền đẹp, chắc chắn. Chất liệu nhựa nhẹ, dễ vệ sinh sau khi sử dụng.<br />
Máy có công suất 40W cho khả năng hoạt động ổn định, êm ái và không tốn nhiều điện năng.<br />
Nắp đậy bảo vệ bên ngoài và nắp đậy đầu vắt bên trong giúp bảo vệ kín đáo, ngăn ngừa bụi bẩn, vi khuẩn xâm nhập hiệu quả.<br />
Thiết kế sang trọng, lịch sự.</p>

<h3><img alt="" src="https://salt.tikicdn.com/ts/tmp/87/06/01/291f752cc6bf30530d8636c7203e59f2.jpg" style="height:1088px; width:750px" /></h3>

<p>Thiết kế khoa học</p>

<p>Đặc biệt, sản phẩm trang bị b&igrave;nh đựng trong suốt gi&uacute;p bạn quan s&aacute;t được lượng &eacute;p b&ecirc;n trong. Nắp đậy bảo vệ b&ecirc;n ngo&agrave;i v&agrave; nắp đậy đầu vắt b&ecirc;n trong gi&uacute;p bảo vệ k&iacute;n đ&aacute;o, ngăn ngừa bụi bẩn, vi khuẩn x&acirc;m nhập hiệu quả. Quai cầm d&agrave;y chắc kết hợp c&ugrave;ng miệng r&oacute;t tr&ecirc;n b&igrave;nh đựng gi&uacute;p bạn thực hiện c&aacute;c thao t&aacute;c cầm nắm, r&oacute;t nước &eacute;p dễ d&agrave;ng.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/df/f7/15/d2b52b646a7437f5c1eefdde62f7a4dd.jpg" style="height:1021px; width:750px" /></p>

<p>Dễ d&agrave;ng sử dụng</p>

<p>M&aacute;y sử dụng đơn giản, nhẹ nh&agrave;ng, bạn chỉ cần ấn nhẹ miếng tr&aacute;i c&acirc;y đặt tr&ecirc;n n&oacute;n &eacute;p l&agrave; đ&atilde; khởi động cho thiết bị thực hiện c&ocirc;ng việc &eacute;p nước cam. Sản phẩm sở hữu thiết kế nhỏ gọn với m&agrave;u sắc trang nh&atilde;, kh&ocirc;ng chỉ mang đến cho gia đ&igrave;nh bạn những ly nước tr&aacute;i c&acirc;y thơm ngon, bổ dưỡng m&agrave; c&ograve;n g&oacute;p phần t&ocirc; điểm cho kh&ocirc;ng gian bếp th&ecirc;m tiện nghi, hiện đại.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/6e/cf/9f/43e2914dda9e68726fa41bbd384916ac.jpg" style="height:750px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/8b/ff/0e/3b48cc752506201e3bf6992a727a9ee4.jpg" style="height:750px; width:750px" /></p>

<p>Hướng dẫn sử dụng</p>

<p>Mở d&acirc;y ho&agrave;n to&agrave;n trước khi cắm v&agrave;o.</p>

<p>Nối thiết bị v&agrave;o nguồn điện.</p>

<p>Cắt tr&aacute;i c&acirc;y th&agrave;nh một nửa.</p>

<p>Đặt ly ở phễu r&oacute;t nước &eacute;p của thiết bị.</p>

<p>Đặt miếng tr&aacute;i c&acirc;y l&ecirc;n n&oacute;n &eacute;p, bật thiết bị bằng c&aacute;ch ấn miếng tr&aacute;i c&acirc;y xuống.</p>

<p>Để ngừng thiết bị, chỉ cần dừng ấn n&oacute;n &eacute;p.</p>

<p>Th&aacute;o n&oacute;n &eacute;p v&agrave; bộ lọc ra khỏi b&igrave;nh.</p>

<p>R&oacute;t nước &eacute;p v&agrave;o ly.</p>

<p>Nếu bạn xử l&yacute; một lượng lớn tr&aacute;i c&acirc;y, bạn phải định kỳ l&agrave;m sạch bộ lọc v&agrave; loại bỏ phần c&ograve;n lại của cặn.</p>

<p>M&Aacute;Y VẮT CAM LB389 ĐƯỢC BẢO H&Agrave;NH 2 NĂM CH&Iacute;NH H&Atilde;NG THEO PHIẾU BẢO H&Agrave;NH K&Egrave;M THEO TRONG HỘP SẢN PHẨM/.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/14/15/8f/99cd499275d489ec672ea8743f7d0743.jpg" style="height:630px; width:750px" /></p>

<p>&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4563, 3, 1, CAST(N'2023-03-08T19:59:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (32, N'20230308200245products', N'20230308194522catalog_id', N'Máy Vắt Cam Hafele GS-401 - Hàng Chính Hãng', N'5620230308200245Products.jpg', NULL, 1090000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p><strong>M&aacute;y Vắt Nước Cam HAFELE GS-401 - 535.43.089</strong>&nbsp;c&oacute; thiết kế nhỏ gọn, tốc độ quay vắt ổn định, gi&uacute;p bạn nhanh ch&oacute;ng c&oacute; được những cốc nước cam bổ dưỡng. M&aacute;y c&oacute; chức năng đ&oacute;ng mở chống nhỏ giọt, đảm bảo vệ sinh hơn. V&igrave; vậy, sản phẩm n&agrave;y rất ph&ugrave; hợp d&ugrave;ng cho qu&aacute;n nước giải kh&aacute;t, qu&aacute;n c&agrave; ph&ecirc;.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/8b/3a/a2/6ddf063c99a7d094bc6f3216a25738a3.jpg" style="height:750px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/55/0f/fd/0d5e5d8d93700b36cf989712ee812144.jpg" style="height:750px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/e8/53/9a/3f99f84eef7d74afab8b1bc324ba2e5b.jpg" style="height:750px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/8f/46/21/a34afc92b1af76762a34c345582c57f2.jpg" style="height:750px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/55/50/bd/5f07c9c3b3b3b035b42609cfb31e8d86.jpg" style="height:750px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/0e/de/b5/41100a38a4aa912b1a2592e0e6cc07b7.jpg" style="height:750px; width:750px" /></p>

<p>&nbsp;</p>

<p><strong>T&Iacute;NH NĂNG SẢN PHẨM</strong><br />
Thiết kế h&igrave;nh trụ chống bụi x&acirc;m nhập<br />
M&aacute;y c&oacute; thiết kế h&igrave;nh trụ chống bụi x&acirc;m nhập, vỏ ngo&agrave;i bằng th&eacute;p kh&ocirc;ng gỉ v&agrave; lưới lọc bằng nhựa, nắp đậy trong suốt rất đẹp v&agrave; ấn tượng. M&aacute;y c&oacute; ch&acirc;n cao su chống trượt hiệu quả, khi vận h&agrave;nh m&aacute;y kh&ocirc;ng k&ecirc;u ồn, gi&uacute;p bạn an t&acirc;m hơn về tuổi thọ v&agrave; độ bền của m&aacute;y. C&aacute;c bộ phận m&aacute;y c&oacute; thể th&aacute;o rời để dễ d&agrave;ng vệ sinh.</p>

<p>Chức năng chống nhỏ giọt<br />
M&aacute;y vắt nước cam Hafele c&oacute; chức năng đ&oacute;ng mở chống nhỏ giọt, đảm bảo vệ sinh hơn. V&igrave; vậy, sản phẩm n&agrave;y rất ph&ugrave; hợp d&ugrave;ng cho qu&aacute;n nước giải kh&aacute;t, qu&aacute;n c&agrave; ph&ecirc;.</p>

<p>&Iacute;t tiếng ồn khi vận h&agrave;nh, ch&acirc;n cao su chống trượt<br />
M&aacute;y vắt nước cam Hafele c&oacute; thiết kế nhỏ gọn, dễ sử dụng v&agrave; tiện di chuyển. Ch&acirc;n đế thiết kế chống trượt bằng cao su n&ecirc;n khi m&aacute;y hoạt động sẽ &iacute;t bị rung lắc, đảm bảo an to&agrave;n khi sử dụng.</p>

<p>Vắt kiệt v&agrave; &eacute;p nước triệt để hơn hẳn c&aacute;c loại m&aacute;y vắt cam thủ c&ocirc;ng<br />
M&aacute;y c&oacute; khả năng &eacute;p tự động, khi bạn &eacute;p tr&aacute;i c&acirc;y xuống v&agrave; phễu bắt đầu xoay, v&agrave; sẽ tắt ngay sau khi &aacute;p lực giảm tr&ecirc;n phễu. L&uacute;c n&agrave;y đ&acirc;y, phễu gạt b&atilde; ra ngo&agrave;i v&agrave; chỉ vắt nước cốt từ quả, nước chảy qua bầu lọc v&agrave;o trong bầu đựng nước từ đ&oacute; sẽ chảy v&agrave;o b&ecirc;n trong cốc v&agrave; đầu lọc giữ lại phần b&atilde; v&agrave; hạt.</p>

<p>&nbsp;</p>

<p><strong>TH&Ocirc;NG SỐ KỸ THUẬT</strong><br />
Hiệu điện thế: 220-240V<br />
Tần số: 50/60 Hz<br />
C&ocirc;ng suất: 100 W<br />
Xuất xứ thương hiệu: Đức<br />
Nơi sản xuất: Trung Quốc</p>

<p>&nbsp;</p>

<p><strong>TH&Ocirc;NG TIN THƯƠNG HIỆU</strong><br />
Được thành l&acirc;̣p từ năm 1923 tại thành ph&ocirc;́ Nagold Đức, với thành c&ocirc;ng trong lĩnh vực phụ ki&ecirc;̣n n&ocirc;̣i th&acirc;́t, phụ ki&ecirc;̣n c&ocirc;ng trình cao c&acirc;́p và h&ecirc;̣ th&ocirc;́ng khóa đi&ecirc;̣n tử ti&ecirc;n ti&ecirc;́n. HAFELE ngày nay là m&ocirc;̣t trong những c&ocirc;ng ty cung c&acirc;́p c&ocirc;ng ngh&ecirc;̣ phụ ki&ecirc;̣n lớn nh&acirc;́t tr&ecirc;n th&ecirc;́ giới với 37 c&ocirc;ng ty con và dòng sản ph&acirc;̉m đa dạng hi&ecirc;̣n di&ecirc;̣n tại hơn 150 qu&ocirc;́c gia. N&ecirc;̀n tảng với hơn 90 năm kinh nghi&ecirc;̣m và kh&ocirc;ng ngừng đ&ocirc;̉i mới, sáng tạo đã giúp HAFELE phát tri&ecirc;̉n ngày càng mạnh mẽ và trở thành 1 doanh nghi&ecirc;̣p hàng đ&acirc;̀u mang lại các giải pháp t&ocirc;́i ưu cho nhà ở và c&ocirc;ng trình.</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4559, 7, 1, CAST(N'2023-03-08T20:03:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (33, N'20230308200403products', N'20230308194522catalog_id', N'Bình nước giữ nhiệt có đen led báo nhiệt độ 500ml', N'96420230308200403Products.jpg', NULL, 54138, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<ul>
	<li>B&igrave;nh nước giữ nhiệt c&oacute; đen led b&aacute;o nhiệt độ 500ml c&oacute; thiết kế rất đẹp, bắt mắt c&ugrave;ng với chất lượng cao cấp. Với dung t&iacute;ch 500ml, b&igrave;nh ph&ugrave; hợp mang đi tập thể dục, đi học, đi l&agrave;m, cho c&aacute;c chuyến d&atilde; ngoại, picnic m&agrave; kh&ocirc;ng sợ cồng kềnh, dễ d&agrave;ng cho v&agrave;o balo hoặc t&uacute;i x&aacute;ch.</li>
	<li>Sản phẩm được thiết kế bằng 3 lớp, một lớp vỏ b&ecirc;n ngo&agrave;i, một lớp ch&acirc;n kh&ocirc;ng giữ nhiệt v&agrave; b&ecirc;n trong l&agrave; lớp inox 304 an to&agrave;n tuyệt đối cho sức khỏe, b&igrave;nh c&oacute; thể giữ nhiệt l&ecirc;n tới 24tiếng m&agrave; kh&ocirc;ng sợ bị nguội.</li>
	<li>Với 3lớp nắp giữ nhiệt đảm bảo nước v&agrave; thức ăn b&ecirc;n trong lu&ocirc;n được giữ k&iacute;n v&agrave; giữ nhiệt tối đa. Sản phẩm ph&ugrave; hợp cho c&aacute;c bạn sử dụng v&agrave; l&agrave;m qu&agrave; tặng cho bạn b&egrave;, người th&acirc;n.</li>
	<li>Dung t&iacute;ch: 500ml</li>
</ul>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; ho&aacute; đơn VAT kh&ocirc;ng được cung cấp trong trường hợp n&agrave;y.</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1231, 3, 1, CAST(N'2023-03-08T20:04:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (34, N'20230308200533products', N'20230308194522catalog_id', N'Bình Giữ Nhiệt Lock&Lock New Giant Hot Tank LHC1427 (1.8l)', N'93420230308200533Products.jpg', NULL, 673000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p><strong><img alt="" src="https://salt.tikicdn.com/ts/tmp/6d/8c/66/693273069394a8e52c22ea3d717f1f03.jpg" style="height:4020px; width:651px" /></strong></p>

<ul>
	<li><strong>B&igrave;nh Giữ Nhiệt Lock&amp;Lock New Giant Hot Tank LHC1427</strong>&nbsp;c&oacute; thiết kế nhỏ gọn, hiện đại, kiểu x&aacute;ch tay dễ d&agrave;ng cho việc mang theo.&nbsp;</li>
	<li>M&agrave;u sắc nổi bật mang đển cảm gi&aacute;c trẻ trung khi sử dụng. Th&acirc;n b&igrave;nh c&ograve;n c&oacute; phần đai nhựa c&oacute; thể t&aacute;ch ra kiểu tay cầm, cho bạn sử dụng tiện lợi hơn.</li>
	<li>B&igrave;nh được sản xuất bằng chất liệu th&eacute;p kh&ocirc;ng gỉ, bền đẹp gi&uacute;p giữ nhiệt l&acirc;u v&agrave; an to&agrave;n khi sử dụng. Chất liệu th&eacute;p cao cấp gi&uacute;p thức uống của bạn sẽ kh&ocirc;ng bị biến đổi hương vị.&nbsp;</li>
	<li>Lớp tr&aacute;ng b&ecirc;n trong b&igrave;nh gi&uacute;p hiệu quả giữ nhiệt được gia tăng tối ưu. Nắp b&igrave;nh k&iacute;n kh&iacute;t gi&uacute;p thức uống kh&ocirc;ng bị tr&agrave;n ra ngo&agrave;i khi di chuyển đồng thời tăng khả năng giữ nhiệt b&ecirc;n trong.&nbsp;</li>
	<li>Ngo&agrave;i ra, phần nắm c&oacute; thể th&aacute;o rời d&ugrave;ng l&agrave;m ly uống nước rất tiện dụng.</li>
	<li>B&igrave;nh c&oacute; dung t&iacute;ch 1.8 l&iacute;t gi&uacute;p bạn thoải m&aacute;i giữ ấm, giữ lạnh c&aacute;c loại đồ uống như tr&agrave;, c&agrave; ph&ecirc;, nước giải kh&aacute;t&hellip; hoặc thậm ch&iacute; cả kem trong thời gian d&agrave;i.</li>
</ul>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1240, 4, 1, CAST(N'2023-03-08T20:06:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (35, N'20230308200649products', N'20230308194522catalog_id', N'Bình Giữ Nhiệt Lock&Lock LHC1439 Dung Tích 1000ml - Hồng', N'45320230308200649Products.jpg', NULL, 379400, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<h3>-&nbsp;<em>B&igrave;nh Giữ Nhiệt Lock&amp;Lock New Giant Hot Tank LHC1439&nbsp;</em>, c&oacute; thiết kế nhỏ gọn, hiện đại, kiểu x&aacute;ch tay dễ d&agrave;ng cho việc mang theo.</h3>

<h3>&nbsp;- M&agrave;u sắc nổi bật mang đển cảm gi&aacute;c trẻ trung khi sử dụng.</h3>

<h3>- B&igrave;nh được sản xuất bằng chất liệu th&eacute;p kh&ocirc;ng gỉ, bền đẹp gi&uacute;p giữ nhiệt l&acirc;u v&agrave; an to&agrave;n khi sử dụng. Chất liệu th&eacute;p cao cấp gi&uacute;p thức uống của bạn sẽ kh&ocirc;ng bị biến đổi hương vị.</h3>

<h3>&nbsp;- Lớp tr&aacute;ng b&ecirc;n trong b&igrave;nh gi&uacute;p hiệu quả giữ nhiệt được gia tăng tối ưu. Nắp b&igrave;nh k&iacute;n kh&iacute;t gi&uacute;p thức uống kh&ocirc;ng bị tr&agrave;n ra ngo&agrave;i khi di chuyển đồng thời tăng khả năng giữ nhiệt b&ecirc;n trong.&nbsp;</h3>

<h3>- Ngo&agrave;i ra, phần nắm c&oacute; thể th&aacute;o rời d&ugrave;ng l&agrave;m ly uống nước rất tiện dụng.</h3>

<h3>-&nbsp; B&igrave;nh c&oacute; dung t&iacute;ch 1l&iacute;t gi&uacute;p bạn thoải m&aacute;i giữ ấm, giữ lạnh c&aacute;c loại đồ uống như tr&agrave;, c&agrave; ph&ecirc;, nước giải kh&aacute;t&hellip; hoặc thậm ch&iacute; cả kem trong thời gian d&agrave;i.</h3>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;<strong>HƯỚNG DẪN SỬ DỤNG</strong>:</p>

<p><em>-&nbsp; Rửa sạch bằng nước ấm hoặc lạnh trước khi sử dụng sẽ duy tr&igrave; được hiệu quả giữ n&oacute;ng hoặc giữ lạnh của sản phẩm.</em></p>

<p><em>-&nbsp; Đổ nước đầy b&igrave;nh đến khi c&aacute;ch miệng cốc 2cm, để nắp b&igrave;nh thẳng, khớp với th&acirc;n b&igrave;nh rồi đ&oacute;ng lại.</em></p>

<p><em>- B&igrave;nh nước kh&ocirc;ng gỉ nhưng cũng c&oacute; thể xuất hiện những đốm m&agrave;u đỏ do nước. Khi đ&oacute;, chỉ cần cho dấm v&agrave;o nước ấm, đổ đầy b&igrave;nh, kh&ocirc;ng cần đậy nắp, giữ khoảng 30 ph&uacute;t, sau đ&oacute; rửa sạch bằng miếng xốp mềm th&igrave; c&aacute;c vết đốm sẽ biến mất.</em></p>

<p><em>- Tr&aacute;nh l&agrave;m rơi sản phẩm.</em></p>

<p><em>- Kh&ocirc;ng sử dụng trong l&ograve; vi s&oacute;ng, m&aacute;y rửa b&aacute;t.</em></p>

<p><em>- Kh&ocirc;ng n&ecirc;n d&ugrave;ng vật cứng để ch&ugrave;i rửa b&igrave;nh.&nbsp;</em></p>

<p><em>- Kh&ocirc;ng khử tr&ugrave;ng nắp b&igrave;nh bằng c&aacute;ch luộc l&ecirc;n.</em></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4655, 0, 1, CAST(N'2023-03-08T20:07:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (36, N'20230308201201products', N'20230308194522catalog_id', N'Máy Hút Bụi Cầm Tay Không Dây Damas XC628 - Chính Hãng', N'53320230308201201Products.jpg', NULL, 439000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Thương hiệu</td>
			<td>Damas</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Korea / China / Vietnam</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>XC628</td>
		</tr>
		<tr>
			<td>C&ocirc;ng suất</td>
			<td>120W</td>
		</tr>
		<tr>
			<td>Dung t&iacute;ch chứa bụi</td>
			<td>500ml</td>
		</tr>
		<tr>
			<td>Độ ồn</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>Kiểu m&aacute;y h&uacute;t bụi</td>
			<td>Cầm tay</td>
		</tr>
		<tr>
			<td>Chiều d&agrave;i d&acirc;y điện</td>
			<td>Kh&ocirc;ng d&acirc;y</td>
		</tr>
		<tr>
			<td>Hướng dẫn sử dụng</td>
			<td>
			<p>1. Kiểm tra xem sạc đ&atilde; đầy chưa (N&ecirc;n sạc điện trước khi sử dụng v&igrave; trong qu&aacute; tr&igrave;nh lưu kho c&oacute; thể lượng pin trong thiết bị gần cạn kiệt dẫn đến m&aacute;y sẽ h&uacute;t yếu)<br />
			2. Bật c&ocirc;ng tắc nguồn để sử dụng sản phẩm<br />
			3. Thay thế v&ograve;i h&uacute;t theo c&aacute;c mục đ&iacute;ch sử dụng kh&aacute;c nhau<br />
			4. M&aacute;y c&oacute; chức năng h&uacute;t bụi k&eacute;p: H&uacute;t bụi kh&ocirc; v&agrave; ướt, khi h&uacute;t nước cần ch&uacute; &yacute; mở nắp để tho&aacute;t nước kịp thời<br />
			5. Khi sạc pin, đ&egrave;n Led tr&ecirc;n c&aacute;p sạc USB hoặc tr&ecirc;n Adaptor sẽ hiển thị m&agrave;u đỏ v&agrave; chuyển qua m&agrave;u xanh l&aacute; c&acirc;y khi đ&atilde; sạc đầy<br />
			6. Thời gian sạc khoảng 2-3 giờ sẽ đầy, c&oacute; thể sử dụng tối đa khoảng 30 ph&uacute;t<br />
			(XEM HƯỚNG DẪN SỬ DỤNG TIẾNG VIỆT V&Agrave; BẢO H&Agrave;NH TRONG SẢN PHẨM)&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>Hướng dẫn bảo quản</td>
			<td>
			<p>Hướng dẫn bảo quản m&aacute;y h&uacute;t bụi Damas XC628<br />
			- Bộ lọc cần phải để trong m&aacute;y khi sử dụng<br />
			- Kh&ocirc;ng để m&aacute;y tiếp x&uacute;c trực tiếp với &aacute;nh s&aacute;ng mặt trời, nơi c&oacute; nhiệt độ cao<br />
			- Kh&ocirc;ng sử dụng xăng hoặc chất tẩy rửa để lau ch&ugrave;i, vệ sinh sản phẩm<br />
			- Kh&ocirc;ng được th&aacute;o đầu lọc sản sản phẩm khi đang sử dụng<br />
			- Để h&uacute;t bụi hiệu quả hơn, cần phải vệ sinh bộ lọc thường xuy&ecirc;n<br />
			- Khi kh&ocirc;ng sử dụng, vui l&ograve;ng sạc đầy pin v&agrave; cất giữ.</p>

			<p>Hướng dẫn th&aacute;o lắp bộ lọc ra khỏi hộp bụi để vệ sinh:<br />
			1. Nhấn n&uacute;t bấm tr&ecirc;n lưng sản phẩm để th&aacute;o rời hộp bụi.<br />
			2. Sử dụng tay tr&aacute;i cầm hộp bụi, sao cho đầu c&oacute; bộ lọc hướng về ph&iacute;a m&igrave;nh<br />
			3. Tay phải cầm v&agrave;o thanh ngang của bộ lọc v&agrave; từ từ r&uacute;t thẳng bộ lọc ra ngo&agrave;i.<br />
			4. Sau khi vệ sinh xong bộ lọc, ta thao t&aacute;c ngược lại với c&aacute;c bước tr&ecirc;n.</p>
			</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>500gr</td>
		</tr>
	</tbody>
</table>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4444, 0, 1, CAST(N'2023-03-08T20:12:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (37, N'20230308201339products', N'20230308194522catalog_id', N'Robot Hút Bụi - Robot Tự Động Lau Nhà Thông Minh Thế Hệ Mới Công Nghệ AI, Máy Hút Bụi Mini Cao Cấp 3 Trong 1: Quét Nhà, Hút Bụi Và Lau Nhà.', N'13320230308201339Products.jpg', NULL, 324900, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<h1><strong>Robot h&uacute;t bụi lau nh&agrave; th&ocirc;ng minh 3 in 1 c&ocirc;ng nghệ AI</strong></h1>

<p>- Robot h&uacute;t bụi lau nh&agrave; th&ocirc;ng minh 3 in 1 c&ocirc;ng nghệ AI l&agrave; một bước tiến đột ph&aacute; mới của nền c&ocirc;ng nghệ 4.0, với t&iacute;nh năng như một chiếc m&aacute;y h&uacute;t bụi th&ocirc;ng thường nhưng được trang bị hệ thống b&aacute;nh xe th&ocirc;ng minh c&ugrave;ng cảm biến tiệm cận gi&uacute;p robot c&oacute; thể tự động di chuyển quanh s&agrave;n nh&agrave; v&agrave; thực hiện nhiệm vụ h&uacute;t sạch bụi bẩn.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/ca/35/31/cff53059b03857ecd64f68109e4a9790.jpeg" style="height:750px; width:750px" /></p>

<p>&nbsp;</p>

<p>- Robot h&uacute;t bụi lau nh&agrave; th&ocirc;ng minh 3 in 1 c&ocirc;ng nghệ AI được&nbsp;thết kế kiểu d&aacute;ng hiện đại, nhỏ gọn gi&uacute;p robot c&oacute; thể di chuyển dễ d&agrave;ng v&agrave; tiếp cận những nơi kh&oacute; lau ch&ugrave;i như gầm b&agrave;n, giường, tủ, ghế sofa. Vỏ Robot được l&agrave;m bằng chất liệu nhựa ABS si&ecirc;u bền, sử dụng pin sạc Lion cho thời gian hoạt động li&ecirc;n tục l&ecirc;n đến 100 ph&uacute;t, khay chứa bụi 0.3l c&oacute; m&agrave;ng chắn dễ d&agrave;ng vệ sinh khi kh&ocirc;ng sử dụng.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/2a/4a/7f/056e1b27326004e8e6052369b9de1b32.jpg" style="height:565px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/ee/c5/a3/d5c975f35e1ff0a55731785e4ad56c8f.jpg" style="height:1103px; width:600px" /></p>

<h3><strong>C&aacute;c t&iacute;nh năng Robot lau nh&agrave; th&ocirc;ng minh:</strong></h3>

<p>- H&uacute;t si&ecirc;u mạnh.<br />
- Tự động di chuyển v&agrave; l&agrave;m sạch s&agrave;n nh&agrave;.<br />
- Tự động thay đổi hướng khi bạn gặp phải những bức tường v&agrave; chướng ngại vật.</p>

<p>- Tự động t&igrave;m bụi bẩn để qu&eacute;t, để h&uacute;t v&agrave; lau nh&agrave; sạch sẽ.</p>

<p>- Lau nh&agrave; bằng vải ướt k&egrave;m theo m&aacute;y rất tiện lợi.</p>

<p>- M&aacute;y vận h&agrave;nh mạnh v&agrave; kh&ocirc;ng g&acirc;y nhiều tiếng ồn.</p>

<p>- Vận h&agrave;nh m&aacute;y dễ d&agrave;ng chỉ 1 n&uacute;t nhấn.</p>

<p>- Thời gian sạc đầy pin: 2-3h.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/4f/89/91/96a21620fb1672c2ae30b9c3778ac7ed.jpeg" style="height:600px; width:600px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/be/f1/2b/8f6ba4065a814b098d8189dceffa61fb.jpg" style="height:868px; width:600px" /></p>

<p>- Đặc biệt, Robot c&oacute; c&ocirc;ng suất cao để h&uacute;t mạnh với sức h&uacute;t l&ecirc;n đến 600Pa, gi&uacute;p bạn l&agrave;m sạch hiệu quả v&agrave; loại bỏ bụi bẩn nhanh ch&oacute;ng. Kết hợp với bộ lọc si&ecirc;u vệ sinh EPA12 gi&uacute;p lọc hiệu quả đến 99,5% hạt bụi mịn trong khi lọc kh&iacute; thải, giữ bụi an to&agrave;n trong th&ugrave;ng chứa, ngăn ngừa &ocirc; nhiễm v&agrave; dễ d&agrave;ng l&agrave;m sạch hộc chứa bụi.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/11/78/d5/67dbbd4967ad9c2a4e5742345526db18.jpg" style="height:610px; width:749px" /></p>

<p><strong>Chế độ hoạt động:</strong></p>

<p>- Chế độ chuyển đổi: Nhấn n&uacute;t m&aacute;y chủ v&agrave; bộ qu&eacute;t v&agrave;o đ&egrave;n l&agrave;m việc ở chế độ l&agrave;m việc để s&aacute;ng l&ecirc;n. Nhấn n&uacute;t m&aacute;y chủ một lần nữa v&agrave; tắt bộ qu&eacute;t.</p>

<p>- Chế độ sạc: Kết nối đầu Micro USB của c&aacute;p USB với cổng sạc của bộ qu&eacute;t v&agrave; kết nối đầu USB với bộ chuyển đổi để sạc.</p>

<p>- Trạng th&aacute;i sạc: Đ&egrave;n b&aacute;o sạc được bật, cho biết qu&aacute; tr&igrave;nh sạc đang diễn ra v&agrave; t&ugrave;y chọn TẮT cho biết qu&aacute; tr&igrave;nh sạc đ&atilde; ho&agrave;n tất v&agrave; thời gian sạc chung l&agrave; khoảng 2 đến 3 giờ.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/6e/28/3b/a0a6ce24f55f41caefda3f7b5da463ea.jpg" style="height:750px; width:750px" /></p>

<p><strong>L&agrave;m sạch hộp bụi:</strong></p>

<p>- Bụi bẩn c&oacute; thể bị trục xuất khỏi lối v&agrave;o, v&igrave; vậy vui l&ograve;ng l&agrave;m trống hộp bụi sau mỗi lần sử dụng.</p>

<p>- Hộp bụi nằm dưới đ&aacute;y m&aacute;y, r&uacute;t ​​ph&iacute;ch cắm ra.</p>

<p>- Mở hộp bụi, lau sạch bụi bẩn b&ecirc;n trong, lau sạch phần c&ograve;n lại bằng vải kh&ocirc;, ẩm.</p>

<p>- Đặt hộp bụi trở lại trong m&aacute;y.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/be/11/e5/e12dfb4ab32afc816d8b8e7d01ba304d.jpg" style="height:679px; width:679px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/1c/ba/d0/d4704d9db7220abcf99d005d6b9ad38c.jpg" style="height:750px; width:750px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 7894, 0, 1, CAST(N'2023-03-08T20:14:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (38, N'20230308201615products', N'20230308194134catalog_id', N'Điện thoại Samsung Galaxy A23 (4GB/128GB) - Hàng chính hãng', N'9720230308201615Products.jpg', NULL, 5410000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Dung lượng pin</td>
			<td>5000 mAh</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v5.0</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Samsung</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>H&agrave;n Quốc</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>Ch&iacute;nh 50 MP &amp; Phụ 5 MP, 2 MP, 2 MP</td>
		</tr>
		<tr>
			<td>Camera trước</td>
			<td>8 MP</td>
		</tr>
		<tr>
			<td>Chip đồ họa (GPU)</td>
			<td>Adreno 610</td>
		</tr>
		<tr>
			<td>Chip set</td>
			<td>Snapdragon 680 8 nh&acirc;n</td>
		</tr>
		<tr>
			<td>Tốc độ CPU</td>
			<td>4 nh&acirc;n 2.4 GHz &amp; 4 nh&acirc;n 1.9 GHz</td>
		</tr>
		<tr>
			<td>Đ&egrave;n Flash</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>D&agrave;i 165.4 mm - Ngang 76.9 mm - D&agrave;y 8.4 mm</p>
			</td>
		</tr>
		<tr>
			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>PLS TFT LCD</td>
		</tr>
		<tr>
			<td>Ghi &acirc;m</td>
			<td>Ghi &acirc;m mặc định, Ghi &acirc;m cuộc gọi</td>
		</tr>
		<tr>
			<td>GPS</td>
			<td>GPS, GLONASS, GALILEO, QZSS, BEIDOU</td>
		</tr>
		<tr>
			<td>H&ocirc;̃ trợ 4G</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>
			<p>S&aacute;ch hướng dẫn, C&acirc;y lấy sim, C&aacute;p Type C, Củ sạc nhanh rời đầu Type A</p>
			</td>
		</tr>
		<tr>
			<td>Jack tai nghe</td>
			<td>3.5 mm</td>
		</tr>
		<tr>
			<td>Bộ nhớ khả dụng</td>
			<td>105.1 GB</td>
		</tr>
		<tr>
			<td>Số sim</td>
			<td>2 Nano SIM</td>
		</tr>
		<tr>
			<td>Loại pin</td>
			<td>Li-Po</td>
		</tr>
		<tr>
			<td>Loại Sim</td>
			<td>2 Nano SIM</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Khung &amp; Mặt lưng nhựa</td>
		</tr>
		<tr>
			<td>Nghe nhạc</td>
			<td>WAV, AAC, OGG, MP3, AMR, Midi, FLAC</td>
		</tr>
		<tr>
			<td>Cổng sạc</td>
			<td>Type-C</td>
		</tr>
		<tr>
			<td>Quay phim</td>
			<td>FullHD 1080p@30fps</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải</td>
			<td>1080 x 2408 (FHD+)</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128 GB</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>6.6 inch</td>
		</tr>
		<tr>
			<td>Hỗ trợ thẻ tối đa</td>
			<td>MicroSD, hỗ trợ tối đa 1 TB</td>
		</tr>
		<tr>
			<td>T&iacute;nh năng camera</td>
			<td>Chuy&ecirc;n nghiệp (Pro), Tự động lấy n&eacute;t (AF), HDR, To&agrave;n cảnh (Panorama), Chống rung quang học (OIS), Ban đ&ecirc;m (Night Mode), Quay chậm (Slow Motion), X&oacute;a ph&ocirc;ng, G&oacute;c rộng (Wide), Zoom kỹ thuật số, Si&ecirc;u cận (Macro), G&oacute;c si&ecirc;u rộng (Ultrawide), Bộ lọc m&agrave;u</td>
		</tr>
		<tr>
			<td>Wifi</td>
			<td>Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, Dual-band (2.4 GHz/5 GHz)</td>
		</tr>
		<tr>
			<td>Xem phim</td>
			<td>MP4, 3GP, AVI, MKV, FLV</td>
		</tr>
		<tr>
			<td>C&oacute; thuế VAT</td>
			<td>C&oacute;</td>
		</tr>
	</tbody>
</table>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 7898, 1, 1, CAST(N'2023-03-08T20:16:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (39, N'20230308201818products', N'20230308194134catalog_id', N'Điện thoại Samsung Galaxy A13 (4GB/128GB) - Hàng chính hãng', N'14620230308201818Products.jpg', NULL, 3550000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<h2>Th&ocirc;ng số kỹ thuật</h2>

<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>Ch&iacute;nh: 6.6 inch, TFT LCD, FHD+, 1200 x 2408 Pixels</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>50.0 MP + 5.0 MP + 2.0 MP + 2.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>8.0 MP</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>128 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>Exynos 850</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>5000 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2 - 2 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 12</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam / Trung Quốc</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>2022</td>
		</tr>
	</tbody>
</table>

<p><strong>Samsung Galaxy A13&nbsp;đem đến cho bạn sự lựa chọn xuất sắc trong ph&acirc;n kh&uacute;c b&igrave;nh d&acirc;n với thiết kế thanh lịch v&agrave; đơn giản, m&agrave;n h&igrave;nh 6.6 inch rộng r&atilde;i c&ugrave;ng vi&ecirc;n pin lớn 5.000 mAh ấn tượng. Hệ thống camera tr&ecirc;n mặt lưng với độ ph&acirc;n giải cao gi&uacute;p bạn dễ d&agrave;ng lưu trữ những khoảnh khắc ấn tượng trong cuộc sống.</strong></p>

<h3><strong>M&agrave;n h&igrave;nh 6.6 inch rộng r&atilde;i v&agrave; sắc sảo</strong></h3>

<p>Samsung Galaxy A13 được trang bị kh&ocirc;ng gian hiển thị rộng 6.6 inch v&agrave; ghi nhận độ ph&acirc;n giải Full HD+ (1.200 x 2.408 pixels).&nbsp;Mỗi khu&ocirc;n h&igrave;nh được t&aacute;i hiện tr&ecirc;n Galaxy A13 đều cực kỳ sắc sảo, c&oacute; m&agrave;u sắc trung thực v&agrave; sống động. H&atilde;y thoải m&aacute;i thực hiện c&aacute;c t&aacute;c vụ từ l&agrave;m việc, học tập v&agrave; giải tr&iacute; đa phương tiện tr&ecirc;n kh&ocirc;ng gian trải nghiệm h&igrave;nh ảnh thực sự xuất sắc.</p>

<p><img alt="Samsung Galaxy A13 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-1.JPG" /></p>

<h3><strong>Thiết kế đơn giản với phong c&aacute;ch hiện đại</strong></h3>

<p>Tr&ecirc;n Galaxy A13, bạn sẽ t&igrave;m thấy phong c&aacute;ch thiết kế hết sức đơn giản với kiểu d&aacute;ng hiện đại, loại bỏ những chi tiết rườm r&agrave; tr&ecirc;n th&acirc;n m&aacute;y. M&agrave;n h&igrave;nh 6.6 inch được tối ưu theo phong c&aacute;ch Infinity-V nhằm tối ưu kh&ocirc;ng gian mặt trước v&agrave; tạo cảm gi&aacute;c thanh lịch trong cấu tr&uacute;c thẩm mỹ. Ở ph&iacute;a sau, to&agrave;n bộ hệ thống camera được sắp xếp hợp l&yacute; như đang được đặt trực tiếp tr&ecirc;n mặt lưng, tr&aacute;nh sự hiện diện của module g&acirc;y rườm r&agrave; như c&aacute;c d&ograve;ng sản phẩm kh&aacute;c tr&ecirc;n thị trường.</p>

<p><img alt="Thiết kế đơn giản với phong cách hiện đại 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-2.JPG" /></p>

<h3><strong>Để mỗi khu&ocirc;n h&igrave;nh bạn chụp lu&ocirc;n thật ấn tượng</strong></h3>

<p>Hiểu được tầm quan trọng của t&iacute;nh năng chụp ảnh với trải nghiệm người d&ugrave;ng tr&ecirc;n smartphone hiện tại,&nbsp;Samsung&nbsp;đem đến cho Galaxy A13 hệ thống bốn&nbsp;camera tr&ecirc;n mặt lưng, trong đ&oacute; bao gồm camera ch&iacute;nh 50MP khẩu độ F/1.8, camera macro 2MP khẩu độ F/2.4,&nbsp;camera đo chiều s&acirc;u khu&ocirc;n h&igrave;nh 2MP khẩu độ F/2.4 c&ugrave;ng camera ultra wide&nbsp;5MP khẩu độ F/2.2. Sự kết hợp của bộ bốn&nbsp;camera n&agrave;y sẽ đem tới loạt t&iacute;nh năng quay phim hết sức chụp h&igrave;nh thực sự&nbsp;ấn tượng.</p>

<p><img alt="Để mỗi khuôn hình bạn chụp luôn thật ấn tượng 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-3.JPG" /></p>

<h3><strong>Camera macro tập trung v&agrave;o từng chi tiết nhỏ</strong></h3>

<p>Nhờ sự hỗ trợ của&nbsp;camera macro&nbsp;2MP, Galaxy A13 dễ d&agrave;ng bắt cận những chi tiết nhỏ trong khu&ocirc;n h&igrave;nh. Với những bạn c&oacute; niềm đam m&ecirc; chụp ảnh v&agrave; muốn lưu lại nhiều bức h&igrave;nh cận cảnh tự nhi&ecirc;n, kh&ocirc;ng vỡ n&eacute;t, c&ocirc;ng nghệ n&agrave;y sẽ đem đến sự hỗ trợ tốt nhất d&agrave;nh cho bạn.</p>

<p><img alt="Camera Samsung Galaxy A13" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TamNeniPhone7/samsung-galaxy-a13-4.JPG" /></p>

<h3><strong>Tinh chỉnh độ mờ hậu cảnh trong khu&ocirc;n h&igrave;nh</strong></h3>

<p>Ngo&agrave;i camera macro, Samsung Galaxy A13 c&ograve;n được trang bị th&ecirc;m camera 2MP phụ tr&aacute;ch đo chiều s&acirc;u trường ảnh. Chỉ với một c&uacute; chạm đơn giản, bạn sẽ dễ d&agrave;ng thiết lập độ mờ bối cảnh ph&iacute;a sau chủ thể khu&ocirc;n h&igrave;nh để c&oacute; được những bức ảnh chất lượng cao v&agrave; thực sự nổi bật.</p>

<p><img alt="Camera macro Samsung Galaxy A13" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TamNeniPhone7/samsung-galaxy-a13-5.JPG" /></p>

<h3><strong>Những khu&ocirc;n h&igrave;nh selfie đầy phong c&aacute;ch</strong></h3>

<p>Với camera trước 8MP, Galaxy A13 mang tới hiệu ứng x&oacute;a ph&ocirc;ng ngay trong mỗi bức h&igrave;nh selfie của bạn. Nhờ đ&oacute;, mỗi khu&ocirc;n h&igrave;nh &ldquo;tự sướng&rdquo; của bạn đều đẹp lung linh m&agrave; kh&ocirc;ng cần đến sự hỗ trợ từ c&aacute;c ứng dụng chỉnh sửa b&ecirc;n thứ ba n&agrave;o.</p>

<p><img alt="Những khuôn hình selfie đầy phong cách 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-7.JPG" /></p>

<h3><strong>Pin lớn hơn, trải nghiệm d&agrave;i l&acirc;u hơn</strong></h3>

<p>Vi&ecirc;n pin 5.000 mAh m&agrave; Samsung Galaxy A13 dễ d&agrave;ng đ&aacute;p ứng nhu cầu năng lượng lớn m&agrave;&nbsp;m&agrave;n h&igrave;nh 6.6 inch&nbsp;v&agrave; chip xử l&yacute; mạnh mẽ cần đến trong qu&aacute; tr&igrave;nh vận h&agrave;nh. Ước t&iacute;nh, chiếc&nbsp;điện thoại&nbsp;c&oacute; thể k&eacute;o d&agrave;i thời gian trải nghiệm trong hai ng&agrave;y với những t&aacute;c vụ th&ocirc;ng thường.</p>

<p><img alt="Pin lớn hơn, trải nghiệm dài lâu hơn 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-8(1).JPG" /></p>

<h3><strong>Sức mạnh của chip xử l&yacute; t&aacute;m nh&acirc;n</strong></h3>

<p>Tr&ecirc;n Galaxy A13, bạn sẽ t&igrave;m thấy bộ vi xử l&yacute; t&aacute;m nh&acirc;n với t&ecirc;n gọi&nbsp;Exynos 850, con chip n&agrave;y ghi nhận tốc độ xung nhịp tối đa 2.0 GHz v&agrave; c&oacute; thể xử l&yacute; tốt c&aacute;c t&aacute;c vụ phức tạp. Những th&ocirc;ng số kh&aacute;c của Galaxy A13 như 4GB RAM, 128GB bộ nhớ trong đều cho thấy sự nổi bật, đảm bảo khả năng đa nhiệm v&agrave; lưu trữ xuất sắc m&agrave; Galaxy A13 đem đến.</p>

<p><img alt="chip xử lý Samsung Galaxy A13" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TamNeniPhone7/samsung-galaxy-a13-8.JPG" /></p>

<h3><strong>Android xuất sắc với One UI ấn tượng</strong></h3>

<p>Cầm Galaxy A13 tr&ecirc;n tay, bạn sẽ thoải m&aacute;i tải xuống v&agrave; tận hưởng những ứng dụng Google mới nhất d&agrave;nh cho nền tảng Android. Kh&ocirc;ng chỉ vậy, nền tảng One UI m&agrave; Samsung t&ugrave;y biến cũng đem đến giao diện người d&ugrave;ng đơn giản, tinh tế, gi&uacute;p bạn dễ d&agrave;ng tập trung v&agrave;o những t&iacute;nh năng tiện dụng v&agrave; hỗ trợ thực hiện đa nhiệm tốt tr&ecirc;n c&ugrave;ng một kh&ocirc;ng gian hiển thị.</p>

<p><img alt="Android xuất sắc với One UI ấn tượng 1" src="https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BaoPK/TestLumia950/samsung-galaxy-a13-9.JPG" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4565, 4, 1, CAST(N'2023-03-08T20:18:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (40, N'20230308201919products', N'20230308194134catalog_id', N'Điện thoại vivo Y22s (8GB - 128GB) - Hàng Chính Hãng', N'75320230308201919Products.jpg', NULL, 5040000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Dung lượng pin</td>
			<td>5000mAh (TYP)</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>Bluetooth 5.0</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Vivo</td>
		</tr>
		<tr>
			<td>Chip set</td>
			<td>Qualcomm Snapdragon 680</td>
		</tr>
		<tr>
			<td>Đ&egrave;n Flash</td>
			<td>camera sau</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>164.30&times;76.10&times;8.38mm</p>
			</td>
		</tr>
		<tr>
			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>LCD</td>
		</tr>
		<tr>
			<td>H&ocirc;̃ trợ 4G</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>Hỗ trợ 5G</td>
			<td>kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>
			<p>Y22s, S&aacute;ch hướng dẫn, D&acirc;y USB, Củ sạc USB, Que lấy SIM, Ốp lưng, Miếng d&aacute;n m&agrave;n h&igrave;nh (d&aacute;n sẵn)</p>
			</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>Y22s</td>
		</tr>
		<tr>
			<td>Bộ nhớ khả dụng</td>
			<td>128</td>
		</tr>
		<tr>
			<td>Số sim</td>
			<td>2</td>
		</tr>
		<tr>
			<td>Loại Sim</td>
			<td>Nano SIM</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Polymer cao cấp 2.5D</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>Cổng sạc</td>
			<td>Type C</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>192g</td>
		</tr>
		<tr>
			<td>Quay phim</td>
			<td>MP4</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>8GB</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải</td>
			<td>HD+ (720 x 1600 pixels)</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128GB</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>6.55 inch</td>
		</tr>
		<tr>
			<td>T&iacute;nh năng camera</td>
			<td>Chụp đ&ecirc;m (trước v&agrave; sau), Ch&acirc;n dung, Chụp ảnh, Quay video, Độ ph&acirc;n giải cao, Chụp to&agrave;n cảnh, Live Photo, Quay chuyển động chậm, Quay tua nhanh thời gian, Chế độ chuy&ecirc;n nghiệp, DOC</td>
		</tr>
		<tr>
			<td>Wifi</td>
			<td>2.4GHz /5GHz</td>
		</tr>
		<tr>
			<td>C&oacute; thuế VAT</td>
			<td>C&oacute;</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 34444, 0, 1, CAST(N'2023-03-08T20:19:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (41, N'20230308202058products', N'20230308194134catalog_id', N'Điện thoại Gaming Tecno POVA 3 (6+5GB)/128GB-Helio G88|7000 mAh|Sạc nhanh 33W-Hàng Chính hãng', N'70620230308202058Products.jpg', NULL, 3850000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>POVA 3 - Si&ecirc;u phẩm Gaming từ Tecno sẽ ch&iacute;nh thức ra mặt tại việt nam v&agrave;o th&aacute;ng 6.</p>

<p><img alt="sg-11134202-22120-j6sopmnp4qkvf4" src="https://cf.shopee.vn/file/sg-11134202-22120-j6sopmnp4qkvf4" /></p>

<p><img alt="sg-11134202-22120-4so9uzxo4qkv58" src="https://cf.shopee.vn/file/sg-11134202-22120-4so9uzxo4qkv58" /><img alt="sg-11134202-22120-uzhalzxo4qkv86" src="https://cf.shopee.vn/file/sg-11134202-22120-uzhalzxo4qkv86" /><img alt="sg-11134202-22120-v3ic8xxo4qkvba" src="https://cf.shopee.vn/file/sg-11134202-22120-v3ic8xxo4qkvba" /><img alt="sg-11134202-22120-s8jdjwxo4qkv36" src="https://cf.shopee.vn/file/sg-11134202-22120-s8jdjwxo4qkv36" /><img alt="sg-11134202-22120-4l59mxxo4qkv1d" src="https://cf.shopee.vn/file/sg-11134202-22120-4l59mxxo4qkv1d" /><img alt="sg-11134202-22120-bnxd8xxo4qkv4e" src="https://cf.shopee.vn/file/sg-11134202-22120-bnxd8xxo4qkv4e" /><img alt="sg-11134202-22120-9opelzxo4qkv50" src="https://cf.shopee.vn/file/sg-11134202-22120-9opelzxo4qkv50" /><img alt="sg-11134202-22120-vbzn1dyo4qkv42" src="https://cf.shopee.vn/file/sg-11134202-22120-vbzn1dyo4qkv42" /></p>

<p>Th&ocirc;ng số kỹ thuật:</p>

<p>+ Thời gian ra mắt: 06/2022</p>

<p>+ Xuất Xứ: Trung Quốc</p>

<p>+ RAM: 11GB* （6GB + 5GB RAM mở rộng）</p>

<p>+ ROM: 128GB</p>

<p>+ K&iacute;ch thước: 173.1*78.46* 9.44mm</p>

<p>+ Chipset: MediaTek G88, Octa core</p>

<p>+ M&agrave;n h&igrave;nh: 6.95&rdquo;FHD+ H, 90 Hz RefreshRate</p>

<p>+ Kết nối: Wifi, BL 5.0</p>

<p>+ Pin: 7000 mAh - Sạc nhanh 33W</p>

<p>+ Android 12</p>

<p>+ Sim: 2 SIM Nano</p>

<p>+ Camera: 8M/50M+2M+Q</p>

<p>&nbsp;</p>

<p>Bảo h&agrave;nh 13 Th&aacute;ng - Đổi mới trong v&ograve;ng 30 m&agrave;y.</p>

<p>Bộ sản phẩm bao gồm: Điện thoại, ốp lưng, củ sạc, d&acirc;y c&aacute;p, s&aacute;ch HDSD.</p>

<p>Mặc d&ugrave; chỉ nằm trong ph&acirc;n kh&uacute;c gi&aacute; rẻ nhưng Tecno POVA 3 lại c&oacute; ngoại h&igrave;nh kh&aacute; bắt mắt. M&aacute;y được thiết kế rất sang trọng v&agrave; kh&ocirc;ng hề thua k&eacute;m c&aacute;c smartphone trong ph&acirc;n kh&uacute;c cao cấp hay tầm trung. M&aacute;y c&oacute; k&iacute;ch thước v&agrave; trọng lượng kh&aacute; lớn n&ecirc;n khi cầm rất đầm tay. Nếu sử dụng l&acirc;u c&oacute; thể g&acirc;y mỏi tay.</p>

<p>Mặt lưng v&agrave; c&aacute;c cạnh được bo cong khi cầm rất &ocirc;m tay. D&ugrave; chỉ được ho&agrave;n thiện từ chất liệu nhựa nhưng m&aacute;y kh&ocirc;ng hề ọp ẹp. Giữa mặt lưng c&oacute; một đường thẳng chạy dọc được tr&aacute;ng gương tạo điểm nhấn cho m&aacute;y.</p>

<p>Ngo&agrave;i đường thẳng tr&aacute;ng gương nằm giữa mặt lưng, Tecno POVA 3 c&ograve;n nổi bật với cụm camera với 3 ống k&iacute;nh được sắp xếp th&agrave;nh một đường thẳng. Tecno đ&atilde; loại bỏ phần khung viền camera rườm ra gi&uacute;p thiết kế tổng thể của m&aacute;y nổi bật hơn.</p>

<p>Mặt trước Tecno POVA 3 cũng rất ấn tượng với thiết kế đục lỗ thời thượng vượt trội so với đối thủ. Ngo&agrave;i ra, m&aacute;y c&ograve;n sở hữu k&iacute;ch thước m&agrave;n h&igrave;nh si&ecirc;u lớn 6,95 inch, độ ph&acirc;n giải cao full HD+ cho chất lượng h&igrave;nh ảnh hiển thị ấn tượng.</p>

<p>Chưa hết, m&aacute;y c&ograve;n được hỗ trợ tần số qu&eacute;t 90Hz đem đến trải nghiệm v&ocirc; c&ugrave;ng mượt m&agrave;. Đ&acirc;y l&agrave; điểm gi&uacute;p Tecno POVA 3 cạnh tranh với nhiều đối thủ sừng sỏ trong c&ugrave;ng ph&acirc;n kh&uacute;c.</p>

<p>C&aacute;c cạnh viền của m&aacute;y cũng được tối ưu kh&aacute; mỏng gi&uacute;p n&acirc;ng tầm trải nghiệm v&agrave; khả năng hiển thị. Khi tr&ecirc;n tay Tecno POVA 3 v&agrave; trải nghiệm c&aacute;c bạn sẽ cảm nhận r&otilde; c&aacute;c ưu điểm n&agrave;y của m&aacute;</p>

<p>Về mặt cấu h&igrave;nh, Tecno POVA 3 kh&ocirc;ng hề thua k&eacute;m c&aacute;c đối thủ. M&aacute;y được trang bị vi xử l&yacute; Helio G88 (d&ograve;ng chip được sản xuất hỗ trợ chơi game), RAM 4GB/6GB v&agrave; ROM 64GB/128GB. Điểm đặc biệt của POVA 3 l&agrave; m&aacute;y được t&iacute;ch hợp t&iacute;nh năng RAM ảo tăng tối đa th&ecirc;m 5GB RAM được lấy từ bộ nhớ trong. Nhờ vậy, POVA 3 c&oacute; thể đảm bảo mọi t&aacute;c vụ, đặc biệt l&agrave; đa nhiệm diễn ra mượt m&agrave; v&agrave; trơn tru.</p>

<p>Về khả năng chơi game, Tecno POVA 3 hoạt động mượt m&agrave; với nhiều tự game khi được c&agrave;i đặt cấu h&igrave;nh cao như: Call OF Duty, Mobile Legends: Bang Bang, Pokemon Unite. Hiện tượng giật rất &iacute;t khi xảy ra.</p>

<p>Về camera, POVA 3 được trang bị 3 camera sau gồm: cảm biến ch&iacute;nh 50MP khẩu độ f/1.6, cảm biến đo chiều s&acirc;u 2MP v&agrave; cảm biến macro 2MP. M&aacute;y cũng đi k&egrave;m camera selfie 8MP.</p>

<p>Tecno cũng t&iacute;ch hợp th&ecirc;m c&ocirc;ng nghệ AI v&agrave; nhiều c&ocirc;ng nghệ kh&aacute;c gi&uacute;p n&acirc;ng cấp khả năng xử l&yacute; h&igrave;nh ảnh v&agrave; cho ra những bức h&igrave;nh chất lượng.</p>

<p>Một số h&igrave;nh ảnh chụp từ POVA 3 dưới đ&acirc;y sẽ chứng minh cho điều đ&oacute;</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/b9/7c/4a/498293cadc6b106d7d586b858f5da8d8.png" style="height:375px; width:750px" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 6666, 0, 1, CAST(N'2023-03-08T20:21:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (42, N'20230308202228products', N'20230308194134catalog_id', N'Điện thoại Samsung Galaxy S22 Ultra 5G (8GB/128GB) - Hàng Chính Hãng', N'51420230308202228Products.jpg', NULL, 23740000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Dung lượng pin</td>
			<td>5000 mAh</td>
		</tr>
		<tr>
			<td>Bluetooth</td>
			<td>v5.2</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Samsung</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</td>
		</tr>
		<tr>
			<td>Camera trước</td>
			<td>40 MP</td>
		</tr>
		<tr>
			<td>Chip đồ họa (GPU)</td>
			<td>Adreno 730</td>
		</tr>
		<tr>
			<td>Chip set</td>
			<td>Snapdragon 8 Gen 1 8 nh&acirc;n</td>
		</tr>
		<tr>
			<td>Kết nối kh&aacute;c</td>
			<td>NFC</td>
		</tr>
		<tr>
			<td>Tốc độ CPU</td>
			<td>1 nh&acirc;n 3 GHz, 3 nh&acirc;n 2.5 GHz &amp; 4 nh&acirc;n 1.79 GHz</td>
		</tr>
		<tr>
			<td>Đ&egrave;n Flash</td>
			<td>Đ&egrave;n LED k&eacute;p</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>D&agrave;i 163.3 mm - Ngang 77.9 mm - D&agrave;y 8.9 mm</p>
			</td>
		</tr>
		<tr>
			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>Dynamic AMOLED 2X</td>
		</tr>
		<tr>
			<td>Ghi &acirc;m</td>
			<td>Ghi &acirc;m mặc định, Ghi &acirc;m cuộc gọi</td>
		</tr>
		<tr>
			<td>GPS</td>
			<td>GPS, GALILEO, GLONASS, QZSS, BEIDOU</td>
		</tr>
		<tr>
			<td>Hỗ trợ 5G</td>
			<td>C&oacute;</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>S22 Ultra</td>
		</tr>
		<tr>
			<td>Jack tai nghe</td>
			<td>Type-C</td>
		</tr>
		<tr>
			<td>Loại pin</td>
			<td>Li-Ion</td>
		</tr>
		<tr>
			<td>Loại Sim</td>
			<td>2 Nano SIM hoặc 1 Nano SIM + 1 eSIM</td>
		</tr>
		<tr>
			<td>Nghe nhạc</td>
			<td>MP3, OGG, AAC, AMR, WAV, M4A</td>
		</tr>
		<tr>
			<td>Cổng sạc</td>
			<td>Type-C</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>228g</td>
		</tr>
		<tr>
			<td>Quay phim</td>
			<td>4K 2160p@60fps, FullHD 1080p@30fps, HD 720p@30fps, FullHD 1080p@60fps, HD 720p@960fps, 8K 4320p@24fps, FullHD 1080p@240fps, 4K 2160p@30fps</td>
		</tr>
		<tr>
			<td>RAM</td>
			<td>8GB</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải</td>
			<td>2K+ (1440 x 3088 Pixels)</td>
		</tr>
		<tr>
			<td>ROM</td>
			<td>128GB</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>6.8 inch</td>
		</tr>
		<tr>
			<td>T&iacute;nh năng camera</td>
			<td>Tr&ocirc;i nhanh thời gian (Time Lapse), Quay chậm (Slow Motion), Tự động lấy n&eacute;t (AF), Chống rung quang học (OIS), Zoom quang học, To&agrave;n cảnh (Panorama), L&agrave;m đẹp, X&oacute;a ph&ocirc;ng, Ban đ&ecirc;m (Night Mode), Chuy&ecirc;n nghiệp (Pro), Chụp bằng giọng n&oacute;i, Chụp bằng cử chỉ, Quay Si&ecirc;u chậm (Super Slow Motion), HDR, Bộ lọc m&agrave;u, Live Photo, G&oacute;c rộng (Wide), Zoom kỹ thuật số, AI Camera, G&oacute;c si&ecirc;u rộng (Ultrawide), Quay video hiển thị k&eacute;p</td>
		</tr>
		<tr>
			<td>Wifi</td>
			<td>Wi-Fi Direct, Wi-Fi hotspot, Dual-band (2.4 GHz/5 GHz), Wi-Fi 802.11 a/b/g/n/ac/ax</td>
		</tr>
		<tr>
			<td>Xem phim</td>
			<td>3GP, MP4, AVI, FLV, MKV</td>
		</tr>
		<tr>
			<td>C&oacute; thuế VAT</td>
			<td>
			<p>C&oacute;</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1111, 0, 1, CAST(N'2023-03-08T20:22:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (43, N'20230308202339products', N'20230308194134catalog_id', N'Điện thoại Samsung Galaxy Z Flip 4 (8GB/256GB) - Hàng chính hãng', N'49720230308202339Products.jpg', NULL, 20490000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/28/b9/3e/f839483bbe33bdd935b826ec3ccf70f6.png" style="height:8635px; width:750px" /></p>

<h3>Nhỏ gọn trong l&ograve;ng b&agrave;n tay của bạn</h3>

<p><strong>Samsung Galaxy Z Flip4 256GB</strong>&nbsp;sở hữu ngoại h&igrave;nh bắt trend với c&aacute;c cạnh được gia c&ocirc;ng phẳng một c&aacute;ch tinh tế. Ra mắt với 4 phi&ecirc;n bản m&agrave;u sắc gi&uacute;p người d&ugrave;ng c&oacute; th&ecirc;m nhiều sự lựa chọn d&agrave;nh cho bản th&acirc;n, c&ugrave;ng với tone m&agrave;u trẻ trung thời thượng gi&uacute;p người d&ugrave;ng to&aacute;t l&ecirc;n được vẻ ngo&agrave;i sang trọng v&agrave; đầy t&iacute;nh hiện đại.</p>

<p>Lần ra mắt n&agrave;y Samsung cho biết h&atilde;ng đ&atilde; n&acirc;ng cấp phần bản lề để tăng tổng số lần gập tr&ecirc;n Flip4, gi&uacute;p thiết bị c&oacute; thể đồng h&agrave;nh với người d&ugrave;ng trong khoảng thời gian l&acirc;u d&agrave;i hơn m&agrave; &iacute;t khi khi gặp phải c&aacute;c t&igrave;nh trạng hỏng h&oacute;c.</p>

<p>Tổng thể chiếc Galaxy Z Flip4 được bao bọc bởi bộ khung l&agrave;m từ vật liệu nh&ocirc;m Armor Aluminum cao cấp, kh&ocirc;ng chỉ gia tăng độ bền cho m&aacute;y m&agrave; n&oacute; c&ograve;n gi&uacute;p cho điện thoại to&aacute;t l&ecirc;n được vẻ ngo&agrave;i sang trọng v&agrave; đẳng cấp nhờ khả năng phản quang &oacute;ng &aacute;nh.</p>

<p>Galaxy Z Flip4 sẽ c&oacute; một th&acirc;n h&igrave;nh thon gọn nhờ ứng dụng tỉ lệ m&agrave;n h&igrave;nh 22:9, điều n&agrave;y gi&uacute;p cho qu&aacute; tr&igrave;nh cầm nắm của bạn trở n&ecirc;n dễ chịu hơn bởi bề rộng của m&aacute;y được tối ưu đi. Với k&iacute;ch thước chiều d&agrave;i sau khi gập l&agrave; 84.9 mm, v&igrave; thế thiết bị c&oacute; thể dễ d&agrave;ng nằm gọn trong l&ograve;ng b&agrave;n tay để bạn c&oacute; thể cầm nắm một c&aacute;ch chắc chắn.</p>

<p>Samsung cho biết đ&acirc;y l&agrave; điện thoại gập c&oacute; hỗ trợ chuẩn kh&aacute;ng nước IPX8, giờ đ&acirc;y mọi người c&oacute; thể an t&acirc;m hơn trong những t&igrave;nh huống khi v&ocirc; t&igrave;nh tiếp x&uacute;c với nước.</p>

<h3>Hiển thị h&igrave;nh ảnh sinh động</h3>

<p>Trang bị tr&ecirc;n m&aacute;y l&agrave; tấm nền Dynamic AMOLED 2X cao cấp đến từ nh&agrave; Samsung với khả năng t&aacute;i hiện h&igrave;nh ảnh c&oacute; m&agrave;u sắc sống động v&agrave; rực rỡ. M&agrave;u đen tr&ecirc;n m&agrave;n h&igrave;nh cũng được hiển thị s&acirc;u gi&uacute;p cho người d&ugrave;ng c&oacute; thể trải nghiệm nội dung tr&ecirc;n c&aacute;c tựa game hay bộ phim h&agrave;nh động trở n&ecirc;n ch&acirc;n thực hơn.</p>

<p>Mật độ điểm ảnh được gia tăng l&ecirc;n 425 PPI v&igrave; m&aacute;y được trang bị m&agrave;n h&igrave;nh k&iacute;ch thước 6.7 inch c&ugrave;ng độ ph&acirc;n giải Full HD+ (1080 x 2640 Pixels). C&aacute;c t&aacute;c vụ chỉnh sửa ảnh sẽ được xử l&yacute; dễ d&agrave;ng hơn tr&ecirc;n chiếc Galaxy Z Flip4 bởi độ sắc n&eacute;t m&agrave; n&oacute; mang lại l&agrave; rất cao.</p>

<p>Phần mặt lưng của m&aacute;y sẽ được trang bị một m&agrave;n h&igrave;nh phụ c&oacute; k&iacute;ch thước 1.9 inch gi&uacute;p người d&ugrave;ng c&oacute; thể đọc nhanh những th&ocirc;ng b&aacute;o, thậm ch&iacute; ở phi&ecirc;n bản n&agrave;y m&aacute;y c&ograve;n hỗ trợ nhận cuộc gọi trực tiếp từ m&agrave;n h&igrave;nh phụ m&agrave; kh&ocirc;ng kh&ocirc;ng cần phải mở điện thoại.</p>

<p>Với tần số qu&eacute;t l&ecirc;n đến 120 Hz ở m&agrave;n h&igrave;nh ch&iacute;nh gi&uacute;p cho mọi thao t&aacute;c h&agrave;ng ng&agrave;y của bạn được diễn ra mượt hơn hẳn, ngo&agrave;i ra m&aacute;y c&ograve;n c&oacute; khả năng tự động điều chỉnh xuống c&ograve;n 1 Hz cho những t&aacute;c vụ kh&ocirc;ng cần cuộn lướt qu&aacute; nhiều để tiết kiệm điện năng ti&ecirc;u thụ.</p>

<p>Độ s&aacute;ng của Galaxy Z Flip4 đạt mức tối đa l&agrave; 1200 nits, gi&uacute;p thiết bị c&oacute; khả năng hiển thị h&igrave;nh ảnh được r&otilde; r&agrave;ng hơn mỗi khi người d&ugrave;ng sử dụng điện thoại ở ngo&agrave;i trời c&oacute; độ s&aacute;ng cao. Điều n&agrave;y thực sự hữu &iacute;ch trong những t&igrave;nh huống như chụp ảnh ngo&agrave;i trời hay xem bản đồ trong l&uacute;c di chuyển ngo&agrave;i đường.</p>

<h3>Chụp ảnh quay phim sắc n&eacute;t</h3>

<p>Galaxy Z Flip4 sở hữu ở phần mặt lưng l&agrave; bộ đ&ocirc;i camera c&oacute; c&ugrave;ng độ ph&acirc;n giải 12 MP với khả năng thu lại h&igrave;nh ảnh sắc n&eacute;t, cũng như gi&uacute;p bạn c&oacute; thể quay được những thước phim đạt chuẩn 4K.</p>

<p>Đi k&egrave;m với đ&oacute; sẽ l&agrave; t&iacute;nh năng chụp ảnh g&oacute;c si&ecirc;u rộng l&ecirc;n đến 123 độ, giờ đ&acirc;y người d&ugrave;ng c&oacute; thể ghi lại những tấm ảnh c&oacute; độ bao qu&aacute;t tốt hơn để mang trọn khung cảnh h&ugrave;ng vĩ v&agrave;o trong bức h&igrave;nh. Chống rung quang học OIS cũng sẽ được bổ sung tr&ecirc;n m&aacute;y, đ&acirc;y chắc hẳn l&agrave; t&iacute;nh năng rất hữu &iacute;ch d&agrave;nh cho c&aacute;c bạn vlogger bởi sự giảm thiểu độ rung lắc tr&ecirc;n khung h&igrave;nh m&agrave; bạn quay được.</p>

<p>Ph&iacute;a mặt trước của m&aacute;y sẽ l&agrave; camera 10 MP được thiết kế theo dạng nốt ruồi quen thuộc. C&ugrave;ng với đ&oacute; sẽ l&agrave; nhiều t&iacute;nh năng hữu &iacute;ch gi&uacute;p xử l&yacute; da của bạn trở n&ecirc;n mịn m&agrave;ng hơn, người d&ugrave;ng c&oacute; thể tự tin chia sẻ những bức ảnh tự chụp l&ecirc;n c&aacute;c trang mạng x&atilde; hội để khoe với bạn b&egrave;.</p>

<p>Ngo&agrave;i ra bạn cũng c&oacute; thể selfie bằng cụm camera sau một c&aacute;ch dễ d&agrave;ng nhờ sự hỗ trợ đến từ m&agrave;n h&igrave;nh phụ, bởi m&agrave;n h&igrave;nh n&agrave;y sẽ cho bạn biết chất lượng ảnh m&agrave; m&aacute;y sẽ thu lại ra sao để từ đ&oacute; t&igrave;m c&aacute;ch điều chỉnh khung h&igrave;nh hay gương mặt sao cho bức ảnh trở n&ecirc;n ưng &yacute; nhất.</p>

<h3>C&acirc;n mọi t&aacute;c vụ với chipset h&agrave;ng đầu đến từ Qualcomm</h3>

<p>Bộ vi xử l&yacute; Snapdragon 8+ Gen 1 l&agrave; c&aacute;i t&ecirc;n được Samsung chọn để trang bị tr&ecirc;n chiếc điện thoại flagship n&agrave;y, với hiệu năng mạnh mẽ n&ecirc;n mọi t&aacute;c vụ cơ bản h&agrave;ng ng&agrave;y kh&oacute; m&agrave; l&agrave;m chiếc Galaxy Z Flip4 xảy ra t&igrave;nh trạng giật lag. Hơn thế nữa, ở mức cấu h&igrave;nh khủng như vậy th&igrave; m&aacute;y ho&agrave;n to&agrave;n đ&aacute;p ứng cho bạn khả năng chơi mượt nhiều tựa game đồ họa cao đang hiện h&agrave;nh.</p>

<p>Điện thoại RAM 8 GB n&ecirc;n người d&ugrave;ng c&oacute; thể an t&acirc;m hơn trong việc mở đồng thời nhiều ứng dụng m&agrave; kh&ocirc;ng cần tắt đa nhiệm, bởi đ&acirc;y được xem l&agrave; mức dung lượng kh&aacute; cao cho việc lưu trữ c&aacute;c th&ocirc;ng tin tạm thời m&agrave; kh&ocirc;ng cần qu&aacute; lo lắng đến việc m&aacute;y sẽ giật lag hay tải lại ứng dụng.</p>

<h3>Lấp đầy vi&ecirc;n pin chỉ trong t&iacute;ch tắc</h3>

<p>B&ecirc;n trong một thiết bị c&oacute; th&acirc;n h&igrave;nh thanh mảnh sẽ l&agrave; vi&ecirc;n pin c&oacute; dung lượng 3700 mAh, mặc d&ugrave; con số n&agrave;y được xem l&agrave; kh&ocirc;ng qu&aacute; lớn nhưng đ&acirc;y vẫn đủ để bạn c&oacute; thể sử dụng cho việc li&ecirc;n lạc hay nghe nhạc cả ng&agrave;y.</p>

<p>Với c&ocirc;ng nghệ sạc nhanh 25 W n&ecirc;n việc lấp đầy vi&ecirc;n pin tr&ecirc;n Galaxy Z Flip4 sẽ chỉ c&ograve;n trong t&iacute;ch tắc, ngo&agrave;i ra người d&ugrave;ng c&ograve;n thể sử dụng t&iacute;nh năng sạc kh&ocirc;ng d&acirc;y hết sức thuận tiện khi kh&ocirc;ng phải loay hoay trong việc t&igrave;m jack cắm.</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 6544, 0, 1, CAST(N'2023-03-08T20:24:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (44, N'20230308202509products', N'20230308194134catalog_id', N'Laptop Dell Inspiron T7420 N4I5021W - Silver ( Intel Core i5 - 1235U (Up to 4.4 Ghz, 12Mb Cache ), 8G DDR4 3200Mhz, 512Gb SSD NVMe, 14" FHD 1920 x 1200 Truelife Touch, FingerPrint, 4 cell - 54Whr Battery, W11, Silver, Office H&S 2021 ) - Hàng Chính Hãng', N'79720230308202509Products.jpg', NULL, 22990000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p><strong>Laptop Dell Inspiron T7420 2 in 1 N4I5021W</strong>&nbsp;được chế t&aacute;c từ chất liệu bền chắc với nắp lưng được thiết kế từ kim loại cao cấp c&ugrave;ng m&agrave;u bạc thanh lịch. Trọng lượng 1.57 kg v&agrave; d&agrave;y 18.5 mm, tạo n&ecirc;n một phi&ecirc;n bản di động v&agrave; nổi bật, đồng h&agrave;nh c&ugrave;ng bạn đến bất kỳ đ&acirc;u.</p>

<p><strong>Laptop Dell Inspiron T7420 2 in 1 N4I5021W</strong>&nbsp;sở hữu m&agrave;n h&igrave;nh 14 inch cảm ứng đa điểm, c&ugrave;ng độ ph&acirc;n giải Full HD + (1920 x 1200) đem đến khung ảnh r&otilde; n&eacute;t, hoạt cảnh giải tr&iacute; sống động</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/product/d0/42/9d/7a97d1f8fe5c0a038593538e388ec3e6.jpg" style="height:600px; width:600px" /></p>

<p>C&oacute; khả năng biến đổi th&agrave;nh một chiếc m&aacute;y t&iacute;nh bảng nhanh ch&oacute;ng nhờ khả năng gập mở 360 độ v&agrave; m&agrave;n h&igrave;nh cảm ứng, cho bạn thỏa sức s&aacute;ng tạo, tr&igrave;nh b&agrave;y &yacute; tưởng.</p>

<p>Trang bị CPU Intel Core i5-1235U cho ph&eacute;p người d&ugrave;ng vận h&agrave;nh tốt c&aacute;c ứng dụng văn ph&ograve;ng như Word, Excel, hay thiết kế đồ họa c&ugrave;ng Photoshop, Ai,&hellip;.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/product/0c/44/6c/cce3b4b265a5e406a4f3e8e36b19ac59.jpg" /></p>

<p>Mở nhiều ứng dụng c&ugrave;ng l&uacute;c m&agrave; kh&ocirc;ng lo t&igrave;nh trạng giật hay lag m&aacute;y nhờ RAM 8GB chuẩn DDR4 với tốc độ Bus RAM 3200 MHz, gi&uacute;p bạn ho&agrave;n th&agrave;nh c&ocirc;ng việc nhanh ch&oacute;ng v&agrave; hiệu quả hơn.</p>

<p>Ổ cứng SSD NVMe PCle dung lượng lớn vừa cung cấp kh&ocirc;ng gian lớn để lưu trữ nhiều dữ liệu y&ecirc;u th&iacute;ch, vừa gi&uacute;p tiết kiệm tối đa thời gian mở v&agrave; vận h&agrave;nh m&aacute;y.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/product/e6/06/9d/e9885b1a3db61d7667525de5e4b5812d.jpg" /></p>

<p><strong>B&agrave;n ph&iacute;m của Laptop Dell Inspiron T7420 2 in 1 N4I5021W</strong>&nbsp;sở hữu h&agrave;nh tr&igrave;nh s&acirc;u, n&uacute;t bấm &ecirc;m, độ nảy tốt, được trang bị đ&egrave;n nền, hỗ trợ bạn l&agrave;m việc nhanh ch&oacute;ng m&agrave; kh&ocirc;ng sợ nhầm lẫn. B&ecirc;n cạnh đ&oacute;, bạn c&ograve;n c&oacute; thể đăng nhập một chạm nhờ bảo mật v&acirc;n tay, gi&uacute;p bạn truy cập v&agrave;o m&aacute;y nhanh ch&oacute;ng m&agrave; kh&ocirc;ng cần phải ghi nhớ v&agrave; nhập mật khẩu mất thời gian.</p>

<p>Hai b&ecirc;n của laptop được trang bị c&aacute;c cổng kết nối phổ biến hỗ trợ người d&ugrave;ng truyền xuất dữ liệu với nhiều thiết bị kh&aacute;c nhau.</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4796, 0, 1, CAST(N'2023-03-08T20:25:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (45, N'20230308202623products', N'20230308194134catalog_id', N'Máy tính xách tay - Laptop Asus ExpertBook B1500 (Chip Intel Core i5-1235U | RAM 8GB | SSD 512GB NVMe | 15.6'' Full HD | Bảo mật vân tay | Bảo mật TPM 2.0 | Độ bền chuẩn quân đội US) - Hàng Chính Hãng', N'48820230308202623Products.jpg', NULL, 16290000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>Kh&ocirc;ng chỉ tập trung v&agrave;o những mẫu laptop thuộc ph&acirc;n kh&uacute;c cao cấp phục vụ cho gaming. Asus cũng tập trung v&agrave;o ph&acirc;n kh&uacute;c người d&ugrave;ng phổ th&ocirc;ng. Đem đến c&aacute;c lựa chọn m&aacute;y t&iacute;nh x&aacute;ch tay c&oacute; cấu h&igrave;nh ổn định với gi&aacute; th&agrave;nh phải chăng. Gần đ&acirc;y nhất, thương hiệu c&ocirc;ng nghệ đến từ Đ&agrave;i Loan cho ra d&ograve;ng sản phẩm&nbsp;ASUS ExpertBook chuy&ecirc;n biệt cho nh&oacute;m kh&aacute;ch h&agrave;ng doanh nghiệp hay x&ecirc; dịch. Laptop ExpertBook ASUS B1500 l&agrave; đại diện.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/75/18/8e/578bdfa787cbc571a03970f6d1abbb52.jpg" style="height:461px; width:750px" /></p>

<p>Chiếc laptop nhẹ c&acirc;n nhưng bền n&agrave;y được cung cấp đầy đủ số lượng v&agrave; c&aacute;c loại cổng kết nối. Thiết kế th&acirc;n thiện với m&ocirc;i trường l&agrave;m việc, với bản lề c&oacute; khả năng xoay 180 độ. Với hiệu năng ấn tượng, lựa chọn lưu trữ đ&ocirc;i v&agrave; bảo mật đạt cấp độ doanh nghiệp. Asus ExpertBook ASUS B1500 đem lại nhiều gi&aacute; trị, cả về mặt kinh tế lẫn c&ocirc;ng việc.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/cb/bc/8d/f9170a8c6c8f2d74eb3cc8055bda0a69.jpg" style="height:461px; width:750px" /></p>

<h2><strong>N&acirc;ng cao hiệu suất cho doanh nghiệp với Laptop ExpertBook ASUS B1500</strong></h2>

<p>ASUS ExpertBook B1500 được thiết kế ri&ecirc;ng cho doanh nghiệp. Trở th&agrave;nh lựa chọn th&ocirc;ng minh cho c&aacute;c c&ocirc;ng ty khởi nghiệp đầy tham vọng. C&aacute;c tổ chức gi&aacute;o dục v&agrave; c&aacute;c c&ocirc;ng ty đang ph&aacute;t triển ở mọi quy m&ocirc;. N&oacute; tự h&agrave;o c&oacute; hiệu suất cao. Độ bền cấp qu&acirc;n sự v&agrave; khả năng t&ugrave;y chỉnh s&acirc;u rộng để n&acirc;ng cao năng lực cho doanh nghiệp. N&oacute; cũng được thiết kế để tự tin xử l&yacute; bất kỳ t&aacute;c vụ n&agrave;o theo c&aacute;ch của bạn. Với một bộ đầy đủ c&aacute;c cổng I / O, WiFi 6 tốc độ v&agrave; c&ocirc;ng nghệ khử tiếng ồn AI ti&ecirc;n tiến. ExpertBook B1500 sắp xếp hợp l&yacute; quy tr&igrave;nh l&agrave;m việc của bạn để gi&uacute;p bạn l&agrave;m việc hiệu quả.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/ae/7c/1c/32affba177e34ecf6fada43e99cbf338.jpg" style="height:461px; width:750px" /></p>

<h2><strong>Hiệu suất tối đa cho mọi nhu cầu</strong></h2>

<p>Tận hưởng hiệu năng tr&ecirc;n ASUS ExpertBook B1, với bộ xử l&yacute; Intel Core thế hệ thứ 12. Mang lại hiệu suất mạnh mẽ m&agrave; bạn cần để ho&agrave;n th&agrave;nh c&ocirc;ng việc. C&ugrave;ng với bộ nhớ l&ecirc;n đến 48 GB v&agrave; dung lượng lưu trữ lớn. B1500 l&agrave; m&aacute;y t&iacute;nh x&aacute;ch tay doanh nh&acirc;n trang bị cho bạn ngay cả những c&ocirc;ng việc chuy&ecirc;n s&acirc;u nhất. Đảm bảo truy cập nhanh v&agrave;o nội dung bạn cần. N&oacute; cũng được ưu ti&ecirc;n cho khả năng kết nối kh&ocirc;ng ngừng. Với c&ocirc;ng nghệ WiFi 6 2 chống tắc nghẽn v&agrave; ASUS WiFi Master 3. Gi&uacute;p bạn tự động kết nối với t&iacute;n hiệu WiFi tốt nhất. Đảm bảo kết nối ổn định v&agrave; chắc chắn cho d&ugrave; bạn ở đ&acirc;u.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/52/1e/63/9527b8ef334544ba08a6e140b598df46.jpg" style="height:461px; width:750px" /></p>

<h2><strong>C&ocirc;ng nghệ Hiệu suất Tr&iacute; tuệ ASUS</strong></h2>

<p>ASUS ExpertBook B1 trang bị c&ocirc;ng nghệ Intelligent Performance Boost. Để đạt được sự linh hoạt v&agrave; hiệu suất m&aacute;y t&iacute;nh x&aacute;ch tay tốt nhất bằng c&aacute;ch điều chỉnh nhiệt b&ecirc;n trong. C&aacute;c thuật to&aacute;n độc quyền của ASUS kết hợp với tối đa 5 cảm biến th&ocirc;ng minh. Thiết kế kh&iacute; động học v&agrave; nguồn điện l&ecirc;n đến 90 watt 5 để quản l&yacute; hiệu suất CPU một c&aacute;ch th&ocirc;ng minh. Điều n&agrave;y cho ph&eacute;p bạn chuyển đổi dễ d&agrave;ng giữa c&aacute;c chế độ Hiệu suất, C&acirc;n bằng hoặc Th&igrave; thầm. Cho ph&eacute;p bạn bắt đầu c&ocirc;ng việc trong khi B1 xử l&yacute; năng lượng v&agrave; hiệu suất trong mọi t&igrave;nh huống.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/3c/8e/f9/47cca48d1be3c99b83942a37f8bb31f7.jpg" style="height:461px; width:750px" /></p>

<p>ASUS ExpertBook B1 l&agrave; một m&aacute;y t&iacute;nh x&aacute;ch tay doanh nh&acirc;n mỏng v&agrave; nhẹ, chỉ nặng 1,5 kg. V&igrave; vậy rất tiện dụng để mang theo bất cứ đ&acirc;u. Chỉ cần nhấc m&aacute;y v&agrave; đi!</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/66/f4/5e/cf2ebc313f967a44d91bd053ed056f49.jpg" style="height:683px; width:683px" /></p>

<h2><strong>Cổng kết nối to&agrave;n diện</strong></h2>

<p>Kết nối l&agrave; đặc biệt quan trọng trong một m&aacute;y t&iacute;nh x&aacute;ch tay kinh doanh để xử l&yacute; tất cả c&aacute;c khối lượng c&ocirc;ng việc. ASUS ExpertBook B1 được t&iacute;ch hợp nhiều lựa chọn cổng I / O, bao gồm Intel Thunderbolt 4 h&agrave;ng đầu trong ng&agrave;nh để truyền dữ liệu nhanh như chớp, l&ecirc;n đến 40 Gbps, đầu ra video với hỗ trợ hai m&agrave;n h&igrave;nh v&agrave; khả năng sạc nhanh. N&oacute; cũng c&oacute; hai USB 3.2 Gen 2 v&agrave; một USB 2.0 Type-A, HDMI 2.0, Ethernet v&agrave; một khe cắm thẻ nhớ microSD &ndash; v&igrave; vậy n&oacute; đ&atilde; sẵn s&agrave;ng v&agrave; sẵn s&agrave;ng cho m&ocirc; h&igrave;nh l&agrave;m việc từ xa hiện nay. Để n&acirc;ng cao độ tin cậy, c&aacute;c cổng được x&acirc;y dựng ki&ecirc;n cố được thử nghiệm để chịu được hơn 10.000 lần ch&egrave;n 10 .</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/39/bc/b1/0b9b45f09d9dcfba01e7f1fdff4ff8e1.jpg" style="height:461px; width:750px" /></p>

<h2><strong>ExpertBook ASUS Đạt chuẩn qu&acirc;n đội lu&ocirc;n sẵn s&agrave;ng h&agrave;nh động</strong></h2>

<p>ExpertBook B1 được thiết kế để đ&aacute;p ứng v&agrave; vượt qua c&aacute;c ngưỡng ch&iacute;nh x&aacute;c của ng&agrave;nh &ndash; bao gồm cả ti&ecirc;u chuẩn qu&acirc;n sự Mỹ MIL-STD 810H cực kỳ khắt khe.</p>

<p>N&oacute; được x&acirc;y dựng để tồn tại trong mọi khắc nghiệt, từ nhiệt độ đ&oacute;ng băng đến c&aacute;i n&oacute;ng gay gắt của c&aacute;c cơn b&atilde;o sa mạc, v&agrave; những c&uacute; sốc tốc độ cao cho đến những va chạm h&agrave;ng ng&agrave;y. B1 cũng trải qua thử nghiệm nghi&ecirc;m ngặt, bao gồm thử nghiệm &aacute;p suất, va đập v&agrave; thả để đảm bảo độ bền.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/b5/fa/57/c25b93c5e3d28e7da01a4684dab72575.jpg" style="height:461px; width:750px" /></p>

<h2>&nbsp;</h2>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 21355, 0, 1, CAST(N'2023-03-08T20:26:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (46, N'20230308203258products', N'20230308194241catalog_id', N'Áo sơ mi nam trơn tay dài cao cấp Lados - 779 chất kate lụa mềm mát, thấm hút mồ hôi', N'67520230308203258Products.jpg', NULL, 127000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/8f/37/15/68c31de886e8ab15088745db7c1a7334.jpg" style="height:749px; width:750px" /><br />
Th&ocirc;ng tin sản phẩm:<br />
Chất liệu: vải kate lụa mịn mềm, thấm h&uacute;t mồ h&ocirc;i tốt.<br />
Co gi&atilde;n nhẹ, mặc cực thoải m&aacute;i, &iacute;t nhăn<br />
Chất vải đẹp, kh&ocirc;ng x&ugrave; l&ocirc;ng, kh&ocirc;ng phai m&agrave;u<br />
Đường may cực tỉ mỉ cực đẹp<br />
C&oacute; thể mặc đi l&agrave;m, đi chơi, dễ phối đồ, kh&ocirc;ng k&eacute;n người mặc<br />
Kiểu d&aacute;ng: Thiết kế theo form rộng vừa,đơn giản , dễ mặc ..T&ocirc;n l&ecirc;n được sự trẻ trung năng động cho c&aacute;c bạn nam, k&egrave;m v&agrave;o đ&oacute; l&agrave; sự hoạt động thoải m&aacute;i khi mặc sản phẩm.</p>

<p>CH&Iacute;NH S&Aacute;CH.</p>

<p>Cam kết chất lượng v&agrave; mẫu m&atilde; sản phẩm giống với h&igrave;nh ảnh.<br />
Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả.<br />
ĐỔI TRẢ TRONG 7 NG&Agrave;Y NẾU KH&Ocirc;NG Đ&Uacute;NG MI&Ecirc;U TẢ<br />
CAM KẾT H&Agrave;NG CH&Iacute;NH H&Atilde;NG 100%<br />
CAM KẾT ẢNH SHOP TỰ CHỤP<br />
------------------------------------<br />
XEM C&Aacute;CH CHỌN SIZE TR&Ecirc;N H&Igrave;NH ĐỂ ĐƯỢC CH&Iacute;NH X&Aacute;C NHẤT<br />
HƯỚNG DẪN C&Aacute;CH ĐẶT H&Agrave;NG<br />
C&aacute;ch chọn size: Shop c&oacute; bảng size mẫu.</p>

<p>S (&gt;55kg)</p>

<p>M(55-62kg)</p>

<p>L (63-72kg)</p>

<p>XL (72-78kg)</p>

<p>XXL(75-83kg)</p>

<p>3XL(83-89kg)</p>

<p>Shop lu&ocirc;n sẵn s&agrave;ng trả lời inbox để tư vấn<br />
<img alt="" src="https://salt.tikicdn.com/ts/tmp/ac/69/a5/e9cd41529d6cc7c42e8b3af8971c49a5.jpg" style="height:736px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/75/06/85/8f470c78b17113fc51e3401fdb028a56.jpg" style="height:751px; width:750px" /><br />
<img alt="" src="https://salt.tikicdn.com/ts/tmp/8d/38/51/66e2855166e8dca33c526c78b26e04da.jpg" style="height:720px; width:750px" /><br />
<img alt="" src="https://salt.tikicdn.com/ts/tmp/3c/af/24/ee58e62e5a213c85fb1e7dde03561e41.jpg" style="height:750px; width:750px" /><br />
&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 3331, 0, 1, CAST(N'2023-03-08T20:33:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (47, N'20230308203446products', N'20230308194241catalog_id', N'Áo sơ mi tay ngắn dáng rộng họa tiết thêu cực chất, thời trang mùa hè dành cho nam', N'72220230308203446Products.jpg', NULL, 119000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<ul>
	<li>&nbsp;TH&Ocirc;NG TIN SẢN PHẨM:</li>
</ul>

<p>&Aacute;o sơ mi tay ngắn d&aacute;ng rộng họa tiết th&ecirc;u cực chất, thời trang m&ugrave;a h&egrave; d&agrave;nh cho nam nữ</p>

<p>&nbsp;Xuất xứ: Việt Nam</p>

<p>&nbsp;M&agrave;u sắc: Đen, trắng</p>

<p>&nbsp;Chất vải d&agrave;y dặn, mềm mịn, hoạt động thoải m&aacute;i. Mẫu &aacute;o n&agrave;y kh&aacute; dễ t&iacute;nh trong việc kết hợp với c&aacute;c loại trang phục như ch&acirc;n v&aacute;y, quần short, quần t&acirc;y,</p>

<ul>
	<li>&nbsp;HƯỚNG DẪN CHỌN SIZE:</li>
</ul>

<p>Bảng size ph&ugrave; hợp 80-90% kh&aacute;ch h&agrave;ng:</p>

<p>&nbsp;M: dưới 50kg, cao dưới 1m6</p>

<p>&nbsp;L: dưới 60kg, cao dưới 1m65</p>

<p>XL: dưới 75kg, cao dưới 1m75</p>

<p>Lưu &yacute;: Nếu chưa chắc chắn về chọn size sản phẩm INBOX trực tiếp cho shop để được tư vấn size nh&eacute;!</p>

<p>&nbsp;</p>

<ul>
	<li>&nbsp;HƯỚNG DẪN SỬ DỤNG:</li>
</ul>

<p>&nbsp;Ưu ti&ecirc;n giặt bằng tay</p>

<p>&nbsp;Lộn tr&aacute;i &aacute;o khi giặt v&agrave; phơi, tr&aacute;nh &aacute;nh nắng trực tiếp dễ bị phai bạc m&agrave;u, kh&ocirc;ng sử dụng chất tẩy c&oacute; chứa clo</p>

<p>&nbsp;Giặt với sản phẩm c&ugrave;ng m&agrave;u, kh&ocirc;ng n&ecirc;n giặt &aacute;o trong nước n&oacute;ng qu&aacute; 40 độ C, l&agrave; ủi ở nhiệt độ dưới 110 độ C</p>

<p>&nbsp;</p>

<ul>
	<li>&nbsp;CAM KẾT</li>
</ul>

<p>Sản phẩm 100% giống m&ocirc; tả. Kiểu d&aacute;ng ho&agrave;n to&agrave;n giống ảnh mẫu</p>

<p>Mẫu được kiểm tra kĩ c&agrave;ng, cẩn thận v&agrave; tư vấn nhiệt t&igrave;nh trước khi g&oacute;i h&agrave;ng giao cho Qu&yacute; Kh&aacute;ch</p>

<p>H&agrave;ng c&oacute; sẵn, giao h&agrave;ng ngay khi nhận được đơn</p>

<p>Giao h&agrave;ng tr&ecirc;n to&agrave;n quốc, nhận h&agrave;ng trả tiền</p>

<p>Lưu &yacute;: Do m&agrave;n h&igrave;nh v&agrave; điều kiện &aacute;nh s&aacute;ng kh&aacute;c nhau, m&agrave;u sắc thực tế của sản phẩm c&oacute; thể ch&ecirc;nh lệch khoảng 3-5% so với m&agrave;u thật của sản phẩm, kh&aacute;ch iu vui l&ograve;ng th&ocirc;ng cảm gi&uacute;p shop nha!</p>

<p><em>TRƯỚC KHI Đ&Aacute;NH GI&Aacute; DƯỚI 5 SAO, C&Aacute;C BẠN VUI L&Ograve;NG LI&Ecirc;N HỆ SHOP ĐỂ ĐƯỢC HỖ TRỢ GIẢI QUYẾT C&Aacute;C VẤN ĐỀ ĐỔI TRẢ.</em></p>

<p>&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; ho&aacute; đơn VAT kh&ocirc;ng được cung cấp trong trường hợp n&agrave;y.</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1234, 0, 1, CAST(N'2023-03-08T20:35:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (48, N'20230308203621products', N'20230308194241catalog_id', N'Áo sơ mi, áo sơ mi nam cộc tay phối màu cực chất, phom áo lên dáng siêu đẹp, sang chảnh, năng động - H63', N'53520230308203621Products.jpg', NULL, 200200, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>&Aacute;O GILE NAM THỜI TRANG CAO CẤP THIẾT KẾ ĐỘC QUYỀN SI&Ecirc;U RẺ !</p>

<p>CAM KẾT CỦA SHOP</p>

<p>Shop cam kết &aacute;o y như ảnh , ảnh chụp thật 100%</p>

<p>&Aacute;o may chuẩn size chuẩn phom</p>

<p>Tư vấn nhiệt t&igrave;nh</p>

<p>Đội ngũ may chuy&ecirc;n nghiệp tay nghề cao</p>

<p>Đổi trả trong v&ograve;ng 3 ng&agrave;y</p>

<p>TH&Ocirc;NG TIN &Aacute;O :</p>

<p>- &Aacute;o sơ mi thiết kế cao cấp thời trang nam t&iacute;nh mạnh mẽ, l&agrave; 1 lựa chọn h&agrave;ng đầu của c&aacute;c qu&yacute; &ocirc;ng th&iacute;ch sự lịch l&atilde;m sang trọng nhưng kh&ocirc;ng k&eacute;m phần l&atilde;ng mạn v&agrave; tinh tế</p>

<p>- Ph&ugrave; hợp với mọi lứa tuổi</p>

<p>- &Aacute;o sơ mi dễ phối đồ, dễ mặc v&agrave; cực sang chảnh</p>

<p>- Ph&ugrave; hợp mặc c&ocirc;ng sở , hay dự tiệc, hay 1 buổi cafe hẹn h&ograve; l&atilde;ng mạn hay dạo quanh những con phố</p>

<p>- Được chăm ch&uacute;t từ kh&acirc;u chọn vải đến kh&acirc;u thiết kế v&agrave; may để đem tới kh&aacute;ch h&agrave;ng 1 sản phảm tốt nhất v&agrave; đẹp nhất đ&aacute;p ứng được mọi ti&ecirc;u ch&iacute; đẹp v&agrave; chất lượng</p>

<p>- &Aacute;o c&oacute; 2 m&agrave;u : đen , xanh</p>

<p>- Thiết kế v&agrave; m&agrave;u sắc cực dễ phối đồ v&agrave; độc lạ, chỉ c&oacute; ở Umi style store</p>

<p>- Phong c&aacute;ch : phom &ocirc;m</p>

<p>- Cổ &aacute;o : cổ V</p>

<p>- Tay &aacute;o : kh&ocirc;ng tay</p>

<p>- M&ugrave;a : mặc 4 m&ugrave;a</p>

<p>- Kiểu : c&uacute;c c&agrave;i</p>

<p>- Hoạ tiết : trơn</p>

<p>Quy c&aacute;ch chọn size :M ( 45kg - 55kg )</p>

<p>L ( 55kg - 65kg )</p>

<p>XL ( 65kg - 75kg )</p>

<p>XXL ( 75kg - 80kg )</p>

<p>Chất liệu : Vải non nhật cao cấp nhập khẩu xuất ph&aacute;t bởi qu&aacute; tr&igrave;nh dệt thủ c&ocirc;ng khắt khe v&agrave; tỉ mỉ . Loại vải n&agrave;y c&oacute; độ bền l&yacute; tưởng tốt, rất ph&ugrave; hợp để may những loại &aacute;o gile , quần &acirc;u, vest,</p>

<p>Được chọn lọc kĩ lưỡng v&agrave; kiểm so&aacute;t kh&acirc;u may cắt 1 c&aacute;ch chặt chẽ v&agrave; tỉ mỉ</p>

<p>Đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp l&agrave;nh nghề, l&agrave; những thợ may giỏi nhất</p>

<p>Nh&acirc;n vi&ecirc;n tư vấn nhiệt t&igrave;nh v&agrave; th&acirc;n thiện</p>

<p>Qu&yacute; kh&aacute;ch vui l&ograve;ng quay video mở h&agrave;ng để đảm bảo quyền lợi cho kh&aacute;ch h&agrave;ng ạ ( quay r&otilde; n&eacute;t, quay m&atilde; vận đơn v&agrave; quay khi g&oacute;i h&agrave;ng chưa được mở )</p>

<p>HỆ THỐNG CỬA H&Agrave;NG :</p>

<p>Địa chỉ shop ở : CT10a- kđt Đại Thanh -tả thanh oai - thanh tr&igrave; - h&agrave; nội</p>

<p>️ UMI STYLE STORE XIN CẢM ƠN V&Agrave; MONG NHẬN ĐƯỢC SỰ ỦNG HỘ TỪ QU&Yacute; KH&Aacute;CH️<img alt="" src="https://salt.tikicdn.com/ts/tmp/e4/f0/3f/142fd273fc934bd2853c44a711e5f1fa.jpg" style="height:780px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/8b/a6/88/c1e3d94497a9098770a53579d7f51a36.jpg" style="height:780px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/71/72/4c/0356660e90eee29cd3aaea330e622f92.jpg" style="height:780px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/9e/3a/ec/d06705a0cb9d2cc345613391d126c137.jpg" style="height:780px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/2d/78/c5/4570354bffbfb6426a01902575ed82e4.jpg" style="height:780px; width:750px" /><img alt="" src="https://salt.tikicdn.com/ts/tmp/39/e0/83/6b242cb995504d8860bd6cbfb95c8dd1.jpg" style="height:780px; width:750px" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>

<p>Sản phẩm n&agrave;y l&agrave; t&agrave;i sản c&aacute; nh&acirc;n được b&aacute;n bởi Nh&agrave; B&aacute;n H&agrave;ng C&aacute; Nh&acirc;n v&agrave; kh&ocirc;ng thuộc đối tượng phải chịu thuế GTGT. Do đ&oacute; ho&aacute; đơn VAT kh&ocirc;ng được cung cấp trong trường hợp n&agrave;y.</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 6455, 0, 1, CAST(N'2023-03-08T20:36:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (49, N'20230308203808products', N'20230308194241catalog_id', N'Áo hoodie Cat Person giống NCT Jeamin Kpop cheap moment chất nỉ cryaotic10', N'63520230308203808Products.jpg', NULL, 180000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>M &lt; 50kg</p>

			<p>L &lt; 60kg</p>

			<p>XL &lt; 70kg</p>

			<p>XXL &lt; 80kg</p>
			</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>OEM</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 3215, 0, 1, CAST(N'2023-03-08T20:38:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (50, N'20230308203932products', N'20230308194255catalog_id', N'Áo Thun Cổ Lệch Chất Thun Cao Cấp Co Giãn Mềm Mịn 53TNC8001OT', N'61620230308203932Products.jpg', NULL, 255000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>1. TH&Ocirc;NG TIN SẢN PHẨM: &nbsp;&Aacute;o Thun Cổ Lệch Chất Thun Cao Cấp Co Gi&atilde;n Mềm Mịn</p>

<p>➤Thương hiệu: CChat Clothes</p>

<p>➤M&agrave;u sắc:&nbsp; Đen, Trắng</p>

<p>➤Chất liệu: Thun&nbsp;</p>

<p>➤Sản phẩm bao gồm: 1 &aacute;o thun nữ</p>

<p>➤&Aacute;o thun nữ ph&ugrave; hợp với phong c&aacute;ch nữ t&iacute;nh, thanh lịch.</p>

<p>➤Th&ocirc;ng số size: S,M,L</p>

<p>&nbsp;</p>

<p>2. ĐẶC ĐIỂM SẢN PHẨM: &nbsp;&Aacute;o Thun Cổ Lệch Chất Thun Cao Cấp Co Gi&atilde;n Mềm Mịn</p>

<p>➤ &Aacute;o được y&ecirc;u th&iacute;ch bởi chất thun d&agrave;y dặn co gi&atilde;n 4 chiều tạo cảm gi&aacute;c mềm mại thoải m&aacute;i khi mặc.&nbsp;</p>

<p>➤&Aacute;o thun nữ được thiết kế d&aacute;ng &ocirc;m t&ocirc;n d&aacute;ng si&ecirc;u đỉnh kh&ocirc;ng ch&uacute;t chỉ thừa. Lu&ocirc;n tỉ mỉ trong từng chi tiết đ&iacute;nh xếp thiết kế nơ lệch gi&uacute;p tổng thể &aacute;o th&ecirc;m lạ mắt kiểu c&aacute;ch v&agrave; thời trang hơn.&nbsp; &nbsp; &nbsp;&nbsp;</p>

<p>➤T&iacute;nh ứng dụng: &Aacute;o thun nữ ph&ugrave; hợp mặc đi chơi, đi l&agrave;m hoặc đi chơi, hẹn h&ograve; dạo phố, &hellip;</p>

<p>&nbsp;</p>

<p>3. HƯỚNG DẪN BẢO QUẢN SẢN PHẨM</p>

<p>➤Lộn tr&aacute;i sản phẩm khi giặt, kh&ocirc;ng giặt chung sản phẩm trắng với quần &aacute;o tối m&agrave;u.</p>

<p>➤Giặt với sản phẩm c&ugrave;ng m&agrave;u.</p>

<p>➤Sản phẩm đậm m&agrave;u h&atilde;ng khuyến c&aacute;o n&ecirc;n giặt nước trắng 2 -3 lần đầu.</p>

<p>➤Kh&ocirc;ng sử dụng h&oacute;a chất tẩy c&oacute; chứa Clo, kh&ocirc;ng ng&acirc;m sản phẩm.</p>

<p>➤Giặt m&aacute;y ở chế độ nhẹ, nhiệt độ thường.</p>

<p>➤Kh&ocirc;ng phơi trực tiếp dưới &aacute;nh nắng mặt trời.</p>

<p>➤Sấy kh&ocirc; ở nhiệt độ thấp.</p>

<p>➤L&agrave; ở nhiệt độ thấp, &le; 110&deg;C.</p>

<p>&nbsp;</p>

<p>4. Ch&iacute;nh s&aacute;ch giao h&agrave;ng v&agrave; đổi trả</p>

<p>➤H&agrave;ng giống như m&ocirc; tả, h&igrave;nh ảnh v&agrave; video 100%.</p>

<p>➤Hỗ trợ đổi miễn ph&iacute; với sản phẩm lỗi.</p>

<p>➤Hỗ trợ đổi/ trả tận nh&agrave; trong mọi trường hợp.</p>

<p>➤Hỗ trợ đổi size v&agrave; đổi m&agrave;u trong v&ograve;ng 7 ng&agrave;y kể từ khi nhận h&agrave;ng, sản phẩm đổi phải c&ograve;n nguy&ecirc;n tem m&aacute;c v&agrave; chưa qua sử dụng. V&agrave; chỉ hỗ trợ đổi 01 lần duy nhất.</p>

<p>➤Giao h&agrave;ng tr&ecirc;n to&agrave;n quốc theo h&igrave;nh thức COD, v&iacute; Airpay, Internet banking,</p>

<p>➤Nếu c&oacute; bất k&igrave; khiếu nại về sản phẩm, khi mở g&oacute;i h&agrave;ng, qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng quay lại video qu&aacute; tr&igrave;nh mở sản phẩm để được đảm bảo 100% đổi lại sản phẩm mới.</p>

<p>&nbsp;</p>

<p>#ao #thun #phong #nu #thoi #trang #kieu #colech #cogian #memmin #basic #taydai #dangom #aothun #aothunnu #aokieunu #aothuntrang #vaithunlanh #aothunformom #aothundep #cchat #cchatstyle #aothuncaocap #thoitrangnu #thoitrangcongso #cchatclothes</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 6458, 0, 1, CAST(N'2023-03-08T20:40:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (51, N'20230308204057products', N'20230308194255catalog_id', N'Áo Kiểu Nữ Bèo Vai Cổ Phối Dây Chất Voan Cao Cấp 22FDV8005ST', N'6120230308204057Products.jpg', NULL, 223000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>1. Th&ocirc;ng tin sản phẩm: &Aacute;o Kiểu Nữ B&egrave;o Vai Cổ Phối D&acirc;y Chất Voan Cao Cấp</p>

<p>➤Thương hiệu: CChat Clothes</p>

<p>➤M&agrave;u sắc: Trắng, Đen, Xanh</p>

<p>➤Chất liệu: Voan</p>

<p>➤Sản phẩm bao gồm: 1 &aacute;o kiểu nữ</p>

<p>➤&Aacute;o kiểu nữ ph&ugrave; hợp với phong c&aacute;ch b&aacute;nh b&egrave;o, nữ t&iacute;nh.</p>

<p>➤Th&ocirc;ng số size: S,M,L</p>

<p>&nbsp;</p>

<p>2. Đặc điểm sản phẩm: &Aacute;o Kiểu Nữ B&egrave;o Vai Cổ Phối D&acirc;y Chất Voan Cao Cấp</p>

<p>➤&Aacute;o kiểu nữ chất voan mềm mại bởi chất voan kh&ocirc;ng bị nhăn, mang lại cảm gi&aacute;c m&aacute;t mẻ, th&ocirc;ng tho&aacute;ng to&aacute;t l&ecirc;n vẻ sang trọng, dịu d&agrave;ng cho người mặc.</p>

<p>➤&Aacute;o kiểu nữ được thiết kế d&aacute;ng su&ocirc;ng được ưa chuộng bởi khả năng che khuyết điểm v&ograve;ng 2 cực đỉnh. Cực kỳ nữ t&igrave;nh c&ugrave;ng thiết kế b&egrave;o mềm mại phối c&ugrave;ng d&acirc;y nơ c&agrave;ng tăng l&ecirc;n vẻ thanh lịch điệu đ&agrave; cho người mặc.</p>

<p>➤T&iacute;nh ứng dụng: &Aacute;o kiểu nữ c&oacute; thể mặc đi l&agrave;m, đi chơi hay đi chơi, hẹn h&ograve; dạo phố, &hellip;</p>

<p>&nbsp;</p>

<p>3. Hướng dẫn bảo quản sản phẩm</p>

<p>➤Lộn tr&aacute;i sản phẩm khi giặt, kh&ocirc;ng giặt chung sản phẩm trắng với quần &aacute;o tối m&agrave;u.</p>

<p>➤Giặt với sản phẩm c&ugrave;ng m&agrave;u.</p>

<p>➤Sản phẩm đậm m&agrave;u h&atilde;ng khuyến c&aacute;o n&ecirc;n giặt nước trắng 2 -3 lần đầu.</p>

<p>➤Kh&ocirc;ng sử dụng h&oacute;a chất tẩy c&oacute; chứa Clo, kh&ocirc;ng ng&acirc;m sản phẩm.</p>

<p>➤Giặt m&aacute;y ở chế độ nhẹ, nhiệt độ thường.</p>

<p>➤Kh&ocirc;ng phơi trực tiếp dưới &aacute;nh nắng mặt trời.</p>

<p>➤Sấy kh&ocirc; ở nhiệt độ thấp.</p>

<p>➤L&agrave; ở nhiệt độ thấp, &le; 110&deg;C.</p>

<p>&nbsp;</p>

<p>4. Ch&iacute;nh s&aacute;ch giao h&agrave;ng v&agrave; đổi trả</p>

<p>➤H&agrave;ng giống như m&ocirc; tả, h&igrave;nh ảnh v&agrave; video 100%.</p>

<p>➤Hỗ trợ đổi miễn ph&iacute; với sản phẩm lỗi.</p>

<p>➤Hỗ trợ đổi/ trả tận nh&agrave; trong mọi trường hợp.</p>

<p>➤Hỗ trợ đổi size v&agrave; đổi m&agrave;u trong v&ograve;ng 7 ng&agrave;y kể từ khi nhận h&agrave;ng, sản phẩm đổi phải c&ograve;n nguy&ecirc;n tem m&aacute;c v&agrave; chưa qua sử dụng. V&agrave; chỉ hỗ trợ đổi 01 lần duy nhất.</p>

<p>➤Giao h&agrave;ng tr&ecirc;n to&agrave;n quốc theo h&igrave;nh thức COD, v&iacute; Airpay, Internet banking,</p>

<p>➤Nếu c&oacute; bất k&igrave; khiếu nại về sản phẩm, khi mở g&oacute;i h&agrave;ng, qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng quay lại video qu&aacute; tr&igrave;nh mở sản phẩm để được đảm bảo 100% đổi lại sản phẩm mới.</p>

<p>&nbsp;</p>

<p>#ao #so #mi #thoi #trang #kieu #beo #cophoiday #beovai #somi #kieunu #aodep&nbsp;#cchat #aotrend #congso #aonu #aokieu #aokieudep #kieuaodep #aokieunu #aosominukieucach #aothunkieu #aosominu #somicongso #trangphuccongso #aocoduc #cchatstyle #thoitrangnu #thoitrangcongso #cchatclothes</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1234, 0, 1, CAST(N'2023-03-08T20:41:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (52, N'20230308204752products', N'20230308194255catalog_id', N'Áo Len Nữ Dài Tay Xoắn Cổ NK Fashion Dáng Ôm Body Trẻ Trung Sang Trọng, Chất Liệu Cao Cấp Dày Dặn NKAL2210004', N'18320230308204752Products.jpg', NULL, 215000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/7b/f9/7a/742208a184043488b21d9875276eb864.jpg" style="height:750px; width:750px" /></p>
			</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>NK FASHION</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</div>

<p><strong>NK FASHION &ndash; T&Ocirc;N VINH PHONG C&Aacute;CH VIỆT</strong></p>

<p>Thương hiệu thời trang c&ocirc;ng sở từ 2013</p>

<p>- S&aacute;ng lập bởi &Ocirc;ng LEE YUN HYEONG từ H&agrave;n Quốc v&agrave; B&agrave; ĐỒNG THỊ DIỄM TRANG l&agrave; người Việt Nam</p>

<p>- Sau gần 10 năm hoạt động c&ocirc;ng ty đ&atilde; c&oacute;:</p>

<p>+ 15 showrooms tr&ecirc;n to&agrave;n quốc</p>

<p>+ Hơn 30 đại l&iacute; ph&acirc;n phối độc quyền</p>

<p>- Tầm nh&igrave;n chiến lược trong tương lai:</p>

<p>+ NK sẽ phủ s&oacute;ng c&aacute;c showrooms trong nước</p>

<p>+ Ph&aacute;t triển th&ecirc;m d&ograve;ng h&agrave;ng cao cấp tại trường Việt Nam v&agrave; mở rộng thị trường H&agrave;n Quốc.</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/2f/3b/3b/4d9d10cdf7b05ae30277f92b63a38e9a.jpg" style="height:750px; width:750px" /></p>

<p>- Chất liệu vải: Len</p>

<p>- Đặc điểm nổi bật &Aacute;o Len Nữ Xoắn Cổ :</p>

<p>+ Vải len cao cấp nhập H&agrave;n, co gi&atilde;n nhẹ, mềm mịn, thấm h&uacute;t mồ h&ocirc;i tốt, rất ph&ugrave; hợp với chị em trong m&ocirc;i trường c&ocirc;ng sở, văn ph&ograve;ng</p>

<p>+ &Aacute;o len d&agrave;i tay d&aacute;ng &ocirc;m trơn m&agrave;u, thiết kế xoắn cổ tinh tế. &Aacute;o c&oacute; thể mặc hằng ng&agrave;y c&ugrave;ng quần &acirc;u, ch&acirc;n v&aacute;y, &aacute;o kho&aacute;c ngo&agrave;</p>

<p>- M&agrave;u sắc: R&ecirc;u, Đen, Trắng</p>

<p>- Size: S, M, L, XL (Chi tiết qu&yacute; kh&aacute;ch xem ở bảng quy đổi k&iacute;ch cỡ)</p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/0c/53/d8/6cb9e8c2bac1561b3b938253b746e2a4.jpg" style="height:750px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/72/88/ff/da1759429cab670f9fe999fe80be6c78.jpg" style="height:750px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/20/cc/77/227fe54473fee8d6f398c1a813eb9b2f.jpg" style="height:750px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/a5/b7/f5/b322b6d4e024da69b9f1d18b41813877.jpg" style="height:750px; width:750px" /></p>

<p><img alt="" src="https://salt.tikicdn.com/ts/tmp/b9/35/ae/e727adbe273159a3ffe0460204284b1c.jpg" style="height:750px; width:750px" /></p>

<p>&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
', 0, 4555, 0, 1, CAST(N'2023-03-08T20:48:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (53, N'20230308205043products', N'20230308194308catalog_id', N'Đồng hồ nam chính hãng Teintop T7015-1', N'4920230308205043Products.jpg', NULL, 1250000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>Nh&atilde;n hiệu&nbsp;Teintop</p>

<p>M&atilde; sản phẩm&nbsp;T7015-1</p>

<p>Giới t&iacute;nh&nbsp;Nam</p>

<p>Kiểu m&aacute;y&nbsp;Quartz ( Chạy pin )</p>

<p>Đường k&iacute;nh mặt&nbsp;41 mm</p>

<p>Độ d&agrave;y&nbsp;10 mm</p>

<p>Chất liệu vỏ&nbsp;Th&eacute;p kh&ocirc;ng gỉ 316L</p>

<p>Chất liệu d&acirc;y&nbsp;D&acirc;y da cao cấp</p>

<p>Chất liệu mặt k&iacute;nh&nbsp;Sapphire</p>

<p>Khả năng chịu nước&nbsp;3 ATM</p>

<p><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/fb/8a/09/165d0de19c50500e28388785806c9ce8.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/e0/12/5d/f979c9382508ad52ac701b0bc20652c3.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/90/f4/09/5fd70f0f11ab4ff1b2b644fbfc614c15.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/52/17/ae/dd9fc8280ceeff0372a28e506fdd626f.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/86/8c/e4/119d466adb3724dc732ac489c6f9f960.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/84/d5/61/de351d364e1e6453208d9ac334adf0c7.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/af/22/38/b8b954ac15ca4f72e6634349a18ea4bf.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/d3/82/f4/4acf59f27f833848da6ce0f4c787099e.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/20/b4/9e/6e762f9af0c3c178dcceb8d772f78f48.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/55/eb/e2/d45afe6b3b1128f74432b2559af3efb1.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/c3/cb/ce/01ff87047e22711fb3dc216e05a7cb25.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/c3/af/3c/262be48a31684f24454640644adf5214.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/58/3c/84/b78071045c1700f16d8ac4e9a427b922.jpg" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 5487, 0, 1, CAST(N'2023-03-08T20:51:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (54, N'20230308205134products', N'20230308194308catalog_id', N'Đồng hồ nữ chính hãng Teintop T7018-5', N'41020230308205134Products.jpg', NULL, 1990000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>Nh&atilde;n hiệu&nbsp;Teintop</p>

<p>M&atilde; sản phẩm&nbsp;T7018-5</p>

<p>Giới t&iacute;nh&nbsp;Nữ</p>

<p>Kiểu m&aacute;y&nbsp;Quartz ( Chạy pin )</p>

<p>Đường k&iacute;nh mặt&nbsp;34x23 mm</p>

<p>Độ d&agrave;y&nbsp;5mm</p>

<p>Chất liệu vỏ&nbsp;Th&eacute;p kh&ocirc;ng gỉ 316L</p>

<p>Chất liệu d&acirc;y&nbsp;D&acirc;y da cao cấp</p>

<p>Chất liệu mặt k&iacute;nh&nbsp;Sapphire</p>

<p>Khả năng chịu nước&nbsp;3 ATM</p>

<p><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/19/d3/63/f22e989fe321940f4046df369443472a.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/35/ad/36/9ad73ee5e0be4a0658f06cd358eebea8.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/4a/f1/db/f71ab6a534e2b443654a7fe4e8882620.jpg" /><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/62/0e/4f/3f10cf77a63a4780a1bec254145cb06e.jpg" /></p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 5479, 0, 1, CAST(N'2023-03-08T20:52:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (55, N'20230308205336products', N'20230308194559catalog_id', N'Xe máy honda SH125i - Phiên bản Tiêu Chuẩn', N'64620230308205336Products.jpg', NULL, 84200000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>★ HONDA THẮNG LỢI ️Mua xe Online - Trả g&oacute;p l&atilde;i suất 0% - Trả trước 0 đồng - Kh&ocirc;ng giữ đăng k&yacute; ️</p>

<p>Nhận xe tại hệ thống HEAD ch&iacute;nh h&atilde;ng ngay sau khi đặt h&agrave;ng ️</p>

<p>Thắng Lợi 1: 25 Trần Kh&aacute;nh Dư, Ho&agrave;n Kiếm, H&agrave; Nội</p>

<p>Thắng Lợi 2: Tổ 7, Thị Trấn Đ&ocirc;ng Anh, H&agrave; Nội</p>

<p>Thắng Lợi 3: 545 Nguyễn Văn Cừ - Long Bi&ecirc;n, H&agrave; Nội</p>

<p>Lưu &yacute;: Gi&aacute; b&aacute;n xe đ&atilde; bao gồm thuế VAT, chưa bao gồm thuế trước bạ, biển số</p>

<p>Kh&aacute;ch h&agrave;ng nhận xe v&agrave; l&agrave;m thủ tục giấy tờ tại đại l&yacute; ủy nhiệm H&agrave;ng đ&atilde; nhận kh&ocirc;ng được đổi trả (điều kiện đổi trả theo quy định của Honda Việt Nam) Th&ocirc;ng tin bảo h&agrave;nh: 3 năm / 30.000 km (T&ugrave;y điều kiện n&agrave;o đến trước)</p>

<p><img alt="0T443tXrqazoctX5Ydr5.png" src="https://salt.tikicdn.com/ts/product/9b/e5/b4/888b33eb0d5cc6e9f23c83da1549cfd1.png" /></p>

<h3>Thiết kế</h3>

<p>Kế thừa tinh hoa của d&ograve;ng xe SH với những đường n&eacute;t thanh lịch, sang trọng mang hơi thở Ch&acirc;u &Acirc;u c&ugrave;ng động cơ cải tiến đột ph&aacute; v&agrave; c&ocirc;ng nghệ ti&ecirc;n tiến, SH160i/125i mới bổ sung phi&ecirc;n bản c&ugrave;ng m&agrave;u mới ấn tượng v&agrave; nổi bật.</p>

<p><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/77/85/b7/2820a39a9501ef4841594db1ae797c23.jpg" /></p>

<h3>Tem xe mới SH160i</h3>

<p>Tem xe SH160i đ&aacute;nh dấu t&ecirc;n gọi mới ph&ugrave; hợp với dung t&iacute;ch động cơ, mang lại cảm gi&aacute;c tự tin v&agrave; ki&ecirc;u h&atilde;nh cho chủ sở hữu.</p>

<p><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/2b/4b/34/2ed0c980cebd8771f79d1400b9914d2d.jpg" /></p>

<h3>Cụm đ&egrave;n trước v&agrave; thiết kế đầu xe ấn tượng</h3>

<p>Cụm đ&egrave;n trước được trang bị đồng bộ c&ocirc;ng nghệ LED hiện đại v&agrave; cao cấp, kết hợp h&agrave;i ho&agrave; c&ugrave;ng thiết kế phần đầu xe c&acirc;n đối, tem chữ SH tr&ecirc;n ốp mặt nạ ph&iacute;a trước của phi&ecirc;n bản thể thao v&agrave; phi&ecirc;n bản đặc biệt tạo th&ecirc;m điểm nhấn ấn tượng.<br />
Ngo&agrave;i ra, đ&egrave;n chiếu s&aacute;ng ph&iacute;a trước lu&ocirc;n s&aacute;ng gi&uacute;p n&acirc;ng cao khả năng hiện diện của xe khi lưu th&ocirc;ng tr&ecirc;n đường phố.</p>

<p><img alt="" src="https://salt.tikicdn.com/cache/w750/ts/product/a3/30/f5/364403545e6341a53d963f9d34e52edd.jpg" /></p>

<h3>Mặt đồng hồ th&ocirc;ng minh</h3>

<p>Đồng hồ với phần đo vận tốc lớn được đặt ở giữa, c&oacute; thiết kế đơn giản gi&uacute;p người l&aacute;i dễ d&agrave;ng quan s&aacute;t c&aacute;c th&ocirc;ng số tức th&igrave;.<br />
Đồng thời, đồng hồ tốc độ được thiết kế t&aacute;ch biệt với m&agrave;n h&igrave;nh hiển thị th&ocirc;ng số, đem đến n&eacute;t độc đ&aacute;o, hiện đại cho tổng thể cụm đồng hồ trung t&acirc;m.</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 1234, 0, 1, CAST(N'2023-03-08T20:54:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (56, N'20230308205434products', N'20230308194559catalog_id', N'Xe máy Honda AirBlade 2023-125 Tiêu chuẩn- Đỏ đen', N'61820230308205434Products.jpg', NULL, 42850000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Thương hiệu</td>
			<td>Honda</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
	</tbody>
</table>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 3215, 0, 1, CAST(N'2023-03-08T20:55:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (57, N'20230308205556products', N'20230308191423catalog_id', N'Xe Máy Honda Winner X 2022 Tiêu Chuẩn Smart Key Phanh Thường', N'4420230308205556Products.jpg', NULL, 32000000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<h2>Th&ocirc;ng Tin Chi Tiết</h2>

<table>
	<tbody>
		<tr>
			<td>Loại ch&igrave;a kh&oacute;a</td>
			<td>Smartkey</td>
		</tr>
		<tr>
			<td>Năm ra mắt</td>
			<td>2022</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Honda</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
	</tbody>
</table>

<h2>M&ocirc; Tả Sản Phẩm</h2>

<p><img src="https://salt.tikicdn.com/ts/product/9e/9d/4e/74ad12cee30229746d3471957e1c3df5.png" /></p>

<h3>Đặc điểm</h3>

<p>Cuộc đời l&agrave; một cuộc phi&ecirc;u lưu tr&agrave;n đầy những điều bất ngờ v&agrave; mỗi người đều c&oacute; một vạch đ&iacute;ch của ri&ecirc;ng m&igrave;nh. H&atilde;y tự tin tạo những c&uacute; k&iacute;ch để v&uacute;t xa v&agrave; tạo dấu ấn ri&ecirc;ng biệt c&ugrave;ng Honda WINNER X mới. Đ&aacute;nh dấu sự chuyển m&igrave;nh mạnh mẽ hướng tới h&igrave;nh ảnh một mẫu si&ecirc;u xe thể thao cỡ nhỏ h&agrave;ng đầu tại Việt Nam c&ugrave;ng những trang bị hiện đại v&agrave; tối t&acirc;n, WINNER X mới sẵn s&agrave;ng c&ugrave;ng c&aacute;c tay l&aacute;i bứt tốc tr&ecirc;n mọi h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute;.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/7f/10/4b/957310b2f5cbe2fa2be2813313b26c19.png" /></p>

<h3>Kiểu d&aacute;ng si&ecirc;u thể thao đậm chất kh&iacute; động lực</h3>

<p>Với phong c&aacute;ch thiết kế &quot;mạnh mẽ, năng động&quot; v&agrave; &quot;nam t&iacute;nh, nổi bật&quot;, WINNER X thế hệ mới sỡ hữu n&eacute;t sắc b&eacute;n v&agrave; chắc chắn với thiết kế liền mạch v&agrave; dứt kho&aacute;t từ sau ra trước gợi l&ecirc;n h&igrave;nh ảnh của một tay l&aacute;i đang tự tin bứt tốc trong d&ograve;ng chảy của &aacute;nh s&aacute;ng v&agrave; tốc độ. Những đường cắt sắc n&eacute;t tạo h&igrave;nh chữ V gi&uacute;p cho phần đầu xe sở hữu diện mạo chắc chắn v&agrave; đậm chất kh&iacute; động học, đặc biệt khi trải nghiệm ở những dải tốc độ cao.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/94/ab/a9/41943732f629a96b04d2db3f22fac10b.png" /></p>

<h3>Cụm đ&egrave;n xi nhan gọn g&agrave;ng</h3>

<p>Đ&egrave;n xi nhan ph&iacute;a trước với thiết kế ho&agrave;n to&agrave;n mới, gọn g&agrave;ng v&agrave; h&agrave;i h&ograve;a với th&acirc;n xe gi&uacute;p đem lại h&igrave;nh vẻ nhanh lẹ v&agrave; thanh tho&aacute;t. Đồng thời, trang bị c&ocirc;ng nghệ LED cho to&agrave;n bộ hệ thống đ&egrave;n gi&uacute;p tiết kiệm năng lượng v&agrave; tăng th&ecirc;m nhận diện độc đ&aacute;o cho chiếc xe.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/a1/9a/64/414f945f0a2f4fb3c008feecedd01f16.png" /></p>

<h3>Thiết kế hai b&ecirc;n nổi bật</h3>

<p>Nổi bật tr&ecirc;n mọi h&agrave;nh tr&igrave;nh với yếm xe mới được mở rộng với những khe gi&oacute; thiết kế kh&iacute; động lực tương tự như tr&ecirc;n mẫu si&ecirc;u m&ocirc; t&ocirc; thể thao c&agrave;ng l&agrave;m t&ocirc; đậm vẻ si&ecirc;u thể thao v&agrave; trẻ trung của mẫu xe.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/af/40/77/260b4a0aa432ef630fa1c903aff7fa1e.png" /></p>

<h3>Đu&ocirc;i xe thon gọn</h3>

<p>Đu&ocirc;i xe được thiết kế thon gọn, kiểu d&aacute;ng si&ecirc;u thể thao, đem lại h&igrave;nh ảnh trẻ trung v&agrave; tốc độ.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/ef/0f/8b/1f823d25ae3e681b7208ac17f07a3e03.png" /></p>

<h3>Ống xả thiết kế mới</h3>

<p>G&oacute;c ra v&ograve;i ống xả được điều chỉnh giảm 20 độ so với thế hệ trước gi&uacute;p ho&agrave;n thiện hơn trải nghiệm cho người l&aacute;i xe; v&agrave; th&acirc;n thiện cho phương tiện ph&iacute;a sau. Winner X vẫn giữ được chất &acirc;m thanh phấn kh&iacute;ch đặc trưng khơi gợi cảm x&uacute;c đỉnh cao của người l&aacute;i.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/05/bb/72/fb83ccb2ddc1916fd164cd373ff11696.png" /></p>

<h3>Động cơ DOHC 150cc đầy uy lực</h3>

<p>WINNER X tự tin chinh phục mọi cung đường với &quot;tr&aacute;i tim&quot; đầy uy lực v&agrave; nhiệt huyết. Khả năng vận h&agrave;nh của WINNER X thỏa m&atilde;n c&aacute;c yếu tố: Mạnh mẽ, Uy lực, Bền bỉ v&agrave; Phấn Kh&iacute;ch. Khối động cơ 150cc, DOHC, 06 số, l&agrave;m m&aacute;t bằng dung dịch sản sinh c&ocirc;ng suất tối đa 11,5kW/9.000 vòng/phút, m&ocirc;-men xoắn cực đại 13,5Nm/6.500 vòng/phút. Với động cơ hiệu suất cao k&egrave;m với ống xả thiết kế mới, WINNER X kh&ocirc;ng chỉ đem đến sự tăng tốc mạnh mẽ ở dải tốc độ thấp (từ 0 đến 200m chỉ trong 10.9 gi&acirc;y) m&agrave; mượt m&agrave; ở d&agrave;i tốc độ cao, từ đ&oacute; đem lại sự phấn kh&iacute;ch cho người l&aacute;i</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/a5/ef/6c/2705cf7fff2d805475cc38880f4fca16.png" /></p>

<h3>Hệ thống kh&oacute;a th&ocirc;ng minh ho&agrave;n to&agrave;n mới</h3>

<p>Thế hệ WINNER X mới được trang bị hệ thống kh&oacute;a th&ocirc;ng minh cho cả 3 phi&ecirc;n bản. Trang bị hiện đại n&agrave;y gi&uacute;p x&aacute;c định vị tr&iacute; xe v&agrave; mở kh&oacute;a th&ocirc;ng minh từ xa tiện lợi mang lại tiện &iacute;ch cao cấp cho người sử dụng. Đặc biệt, ổ kh&oacute;a th&ocirc;ng minh được gắn đ&egrave;n LED xanh mỗi khi hoạt động mang lại h&igrave;nh ảnh cao cấp v&agrave; thời trang hơn.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/a6/3f/07/1ca3cd7d4ecd5582df87a208b8b3d50c.png" /></p>

<h3>Mặt đồng hồ kỹ thuật số th&ocirc;ng minh</h3>

<p>Mặt đồng hồ kỹ thuật số dạng &acirc;m bản hiện đại, nhỏ gọn, h&igrave;nh khối thể thao, k&egrave;m th&ecirc;m đ&egrave;n b&aacute;o ch&igrave;a kh&oacute;a th&ocirc;ng minh mới mang lại tầm nh&igrave;n xuất sắc trong mọi điều kiện &aacute;nh s&aacute;ng.</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/22/4f/a3/b1482e9b311cef8217604db3b602d03c.png" /></p>

<h3>Cổng sạc USB tiện lợi</h3>

<p>Để n&acirc;ng cao gi&aacute; trị sử dụng, WINNER X ho&agrave;n to&agrave;n mới được trang bị cổng sạc USB loại A c&oacute; nắp chống nước đặt ở ph&iacute;a trước xe hỗ trợ người l&aacute;i, đặc biệt tr&ecirc;n những đoạn đường xa.<br />
* &Aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Thể thao</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/1d/19/a4/55440fdea2410edac5733282a390ab9d.png" /></p>

<h3>Hệ thống chống b&oacute; cứng phanh ABS</h3>

<p>Phấn kh&iacute;ch, mượt m&agrave; nhưng kh&ocirc;ng k&eacute;m phần ổn định v&agrave; an t&acirc;m l&agrave; cảm gi&aacute;c m&agrave; WINNER X mang lại cho c&aacute;c tay l&aacute;i. Hệ thống chống b&oacute; cứng phanh ABS được trang bị cho b&aacute;nh trước giúp &ocirc;̉n định tư th&ecirc;́ của xe bằng cách ch&ocirc;́ng khóa cứng bánh xe, đặc bi&ecirc;̣t khi đang di chuyển ở tốc độ cao. Trang bị n&agrave;y được tin tưởng l&agrave; tiện &iacute;ch đem lại sự h&agrave;i l&ograve;ng cao, n&acirc;ng tầm trải nghiệm l&aacute;i cho người d&ugrave;ng tr&ecirc;n mọi h&agrave;nh tr&igrave;nh.<br />
* &Aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Thể thao</p>

<p>&nbsp;</p>

<p><img src="https://salt.tikicdn.com/ts/product/49/a0/fc/b726c180d33c6332f87fde140b550430.png" /></p>

<h3>Hệ thống x&iacute;ch xe cải tiến</h3>

<p>Hệ thống x&iacute;ch xe của WINNER X mới được cải tiến với x&iacute;ch c&oacute; v&ograve;ng phớt O, k&eacute;o d&agrave;i tuổi thọ hơn 3 lần so với phi&ecirc;n bản cũ gi&uacute;p tiết kiệm thời gian bảo dưỡng xe v&agrave; gi&uacute;p xe vận h&agrave;nh &ecirc;m &aacute;i.<br />
* &Aacute;p dụng cho phi&ecirc;n bản Đặc biệt v&agrave; Thể thao</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 14578, 0, 1, CAST(N'2023-03-08T20:56:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (58, N'20230308205712products', N'20230308194320catalog_id', N'Máy Ảnh Kỹ Thuật Số Sony ZV-1 (Hàng Chính Hãng)', N'81720230308205712Products.jpg', NULL, 20569000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Bộ cảm biến ảnh</td>
			<td>1&quot; CMOS</td>
		</tr>
		<tr>
			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>LCD cảm ứng xoay lật</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>
			<p>&nbsp;0</p>
			</td>
		</tr>
		<tr>
			<td>Ống k&iacute;nh</td>
			<td>ZEISS 24-70mm f/1.8-2.8</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>3 inch</td>
		</tr>
		<tr>
			<td>Thẻ nhớ tương th&iacute;ch</td>
			<td>MicroSD</td>
		</tr>
		<tr>
			<td>Tốc độ chụp</td>
			<td>24 fps</td>
		</tr>
		<tr>
			<td>Tốc độ m&agrave;n trập</td>
			<td>1/2000 gi&acirc;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Sony</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>105.5 x 60 x 43.5&nbsp;mm</p>
			</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>ZV-1</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>294g</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải</td>
			<td>3840 x 2160 pixels</td>
		</tr>
	</tbody>
</table>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>[ Th&ocirc;ng tin Sản phẩm &amp; Bảo h&agrave;nh ]</p>

<p>&nbsp;</p>

<p>- Sản phẩm mới 100%</p>

<p>- Ch&iacute;nh h&atilde;ng Sony Vietnam</p>

<p>- Gi&aacute; đ&atilde; bao gồm VAT</p>

<p>- Bảo h&agrave;nh 24 th&aacute;ng ch&iacute;nh h&atilde;ng</p>

<p>- C&aacute;ch thức bảo h&agrave;nh: Bảo h&agrave;nh theo h&oacute;a đơn mua h&agrave;ng</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
', 0, 5479, 0, 1, CAST(N'2023-03-08T20:57:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (59, N'20230308205809products', N'20230308194320catalog_id', N'Máy ảnh Ricoh WG-80 - Hàng chính hãng', N'51520230308205809Products.jpg', NULL, 13709000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<table>
	<tbody>
		<tr>
			<td>Bộ cảm biến ảnh</td>
			<td>CMOS 1/2.3&quot; 16MP</td>
		</tr>
		<tr>
			<td>Loại/ C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>
			<td>LCD, phủ AR, 230K điểm</td>
		</tr>
		<tr>
			<td>Phụ kiện đi k&egrave;m</td>
			<td>
			<ul>
				<li>Ricoh WG-80 Digital Camera</li>
				<li>Rechargeable Li-Ion Battery D-L192</li>
				<li>Power Adapter AC-U2</li>
				<li>Power Plug</li>
				<li>USB Cable I-USB157</li>
				<li>Strap O-ST104</li>
				<li>Macro Stand O-MS1</li>
			</ul>

			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td>Ống k&iacute;nh</td>
			<td>Cố định, zoom quang 5x</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>
			<td>2.7 inch</td>
		</tr>
		<tr>
			<td>Thẻ nhớ tương th&iacute;ch</td>
			<td>SD</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Ricoh</td>
		</tr>
		<tr>
			<td>Xuất xứ thương hiệu</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>K&iacute;ch thước</td>
			<td>
			<p>121.9 x 61 x 30.5&nbsp;mm</p>
			</td>
		</tr>
		<tr>
			<td>Model</td>
			<td>WG-80</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>Trọng lượng sản phẩm</td>
			<td>193g</td>
		</tr>
	</tbody>
</table>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>[ M&aacute;y ảnh Ricoh WG-80 chuy&ecirc;n chụp ảnh ngo&agrave;i trời, dưới nước, thể thao, h&agrave;nh động ]</p>

<p>&nbsp;</p>

<p>- Thiết kế để chụp ảnh ngo&agrave;i trời v&agrave; dưới nước với khả năng chống nước 14m, chống sốc 1.6m, chống vỡ 100kgf, chống đ&oacute;ng băng -10 độ C.</p>

<p>&nbsp;</p>

<p>- Cảm biến ảnh 16MP,&nbsp;ISO 125-6400, quay phim Full HD, t&iacute;ch hợp chống rung.</p>

<p>&nbsp;</p>

<p>- T&iacute;ch hợp 6 đ&egrave;n LED macro quanh ống k&iacute;nh hỗ trợ chiếu s&aacute;ng trong điều kiện thiếu s&aacute;ng.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="sg-11134202-23010-le3roitjndmv79" src="https://cf.shopee.vn/file/sg-11134202-23010-le3roitjndmv79" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>[ Giới thiệu M&aacute;y ảnh Ricoh WG-80 ]</p>

<p>&nbsp;</p>

<p>Ricoh WG-80&nbsp;l&agrave; lựa chọn ho&agrave;n hảo để đồng h&agrave;nh c&ugrave;ng những chuyến h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute; ngo&agrave;i trời v&agrave; mạo hiểm của bạn.&nbsp;</p>

<p>&nbsp;</p>

<p>Thiết kế cho mọi m&ocirc;i trường ngo&agrave;i trời, kể cả dưới nước ở độ s&acirc;u đến 14m l&ecirc;n đến 2 giờ.&nbsp;Xuất sắc với th&acirc;n m&aacute;y bền bỉ v&agrave; cứng c&aacute;p c&oacute; thể chống chịu va đập, đ&oacute;ng băng v&agrave; sốc.</p>

<p>&nbsp;</p>

<p><img alt="sg-11134202-23010-909pqockndmvb1" src="https://cf.shopee.vn/file/sg-11134202-23010-909pqockndmvb1" /></p>

<p>&nbsp;</p>

<p>Cảm biến ảnh CMOS BSI với hiệu suất quang học cao v&agrave; độ ph&acirc;n giải 16MP, chip xử l&yacute; h&igrave;nh ảnh hiệu năng cao, m&agrave;n h&igrave;nh LCD khung rộng.</p>

<p>&nbsp;</p>

<p><img alt="sg-11134202-23010-02b59qiondmv75" src="https://cf.shopee.vn/file/sg-11134202-23010-02b59qiondmv75" /></p>

<p>&nbsp;</p>

<p>T&iacute;ch hợp 6 đ&egrave;n LED macro xung quanh ống k&iacute;nh l&ecirc;n để hỗ trợ chiếu s&aacute;ng cho cảnh, tạo hiệu ứng ba chiều.</p>

<p>&nbsp;</p>

<p><img alt="sg-11134202-23010-yetml3qnndmv4f" src="https://cf.shopee.vn/file/sg-11134202-23010-yetml3qnndmv4f" /></p>

<p>&nbsp;</p>

<p>Tận hưởng chất lượng h&igrave;nh ảnh n&eacute;t cao với ống k&iacute;nh cố định zoom quang học 5x bắt đầu từ g&oacute;c rộng 28mm (tương đương tr&ecirc;n 35mm) v&agrave; xử l&yacute; h&igrave;nh ảnh t&iacute;ch hợp c&ocirc;ng nghệ độ ph&acirc;n giải si&ecirc;u cao.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>[ Th&ocirc;ng tin Sản phẩm &amp; Bảo h&agrave;nh ]</p>

<p>&nbsp;</p>

<p>- Sản phẩm mới 100%</p>

<p>- Ch&iacute;nh h&atilde;ng Ricoh</p>

<p>- Gi&aacute; đ&atilde; bao gồm VAT</p>

<p>- C&aacute;ch thức bảo h&agrave;nh: Bảo h&agrave;nh theo h&oacute;a đơn mua h&agrave;ng</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
', 0, 87999, 0, 1, CAST(N'2023-03-08T20:58:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (60, N'20230308205930products', N'20230308191423catalog_id', N'Nước hoa Johnson''s Baby Cho Bé - Dung Tích 125ml', N'57920230308205930Products.jpg', NULL, 58000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<p>- Được chứng minh l&acirc;m s&agrave;ng về độ dịu nhẹ.<br />
- M&ugrave;i hương nhẹ nh&agrave;ng, tươi m&aacute;t<br />
- Nước hoa Hương ban mai JOHNSON&rsquo;S BABY COLOGNE Morning Dew kết hợp giữa m&ugrave;i hương hoa v&agrave; sương mai gi&uacute;p b&eacute; thơm m&aacute;t.<br />
<br />
Th&agrave;nh phần: Water, Fragrance, &hellip;(chi tiết xem tr&ecirc;n bao b&igrave;)<br />
<br />
Hướng dẫn sử dụng: Thoa nước hoa l&ecirc;n quần &aacute;o của trẻ, đậy k&iacute;n nắp sau khi sử dụng<br />
<br />
Xuất xứ: Trung Quốc<br />
<br />
HSD: 2 năm kể tuwg NSX</p>

<p>NSX: Vui l&ograve;ng xem tr&ecirc;n bao b&igrave; sản phẩm<br />
Lưu &yacute;: Sử dụng dưới sự gi&aacute;m s&aacute;t của người lớn. Để ngo&agrave;i tầm tay trẻ em.</p>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4567, 0, 1, CAST(N'2023-03-08T21:00:00' AS SmallDateTime))
INSERT [dbo].[products] ([id], [product_id], [catalog_id], [product_name], [image_main], [image_sub], [price], [content], [discount], [quantity], [quantity_sold], [status], [created]) VALUES (61, N'20230308210037products', N'20230308191423catalog_id', N'Sữa bột Abbott Pediasure 1.6kg', N'29120230308210037Products.jpg', NULL, 1050000, N'<p>
<audio class="audio-for-speech" src="">&nbsp;</audio>
</p>

<div class="translate-tooltip-mtz translator-hidden">
<div class="header">
<div class="header-controls">
<ul>
	<li>Bao b&igrave; thay đổi theo từng đợt nhập h&agrave;ng</li>
	<li><strong>Sữa bột Abbott Pediasure 1.6kg</strong>&nbsp;c&oacute; chứa 3 nguồn đạm, canxi v&agrave; Vitamin D gi&uacute;p c&acirc;n bằng v&agrave; duy tr&igrave; li&ecirc;n tục axit amin thiết yếu để ph&aacute;t triển cơ v&agrave; xương.</li>
	<li>Arginin gia tăng số lượng v&agrave; ho&agrave;n thiện c&aacute;c tế b&agrave;o ở đĩa sụn gi&uacute;p xương ph&aacute;t triển.</li>
	<li>Vitamin K2 tự nhi&ecirc;n gi&uacute;p tăng cường vận chuyển canxi gi&uacute;p tăng khối lượng v&agrave; cho xương chắc khỏe.</li>
	<li>Prebiotic, probiotic v&agrave; selenium v&agrave; kẽm gi&uacute;p hấp thụ v&agrave; tăng cường sức đề kh&aacute;ng tốt hơn.</li>
	<li>Đối tượng sử dụng: trẻ biếng ăn từ 1-10 tuổi.</li>
	<li>C&aacute;ch pha 1 ly PediaSure chuẩn: Cho 190ml nước ch&iacute;n nguội v&agrave;o ly, vừa từ từ cho v&agrave;o 5 muỗng gạt ngang vừa khuấy đều cho đến khi bột tan hết.</li>
</ul>

<p><strong>Bảo quản:</strong></p>

<ul>
	<li>Bảo quản hộp chưa mở ở nhiệt độ ph&ograve;ng.</li>
	<li>Hộp đ&atilde; mở phải được đậy k&iacute;n v&agrave; bảo quản ở nơi kh&ocirc; m&aacute;t (nhưng kh&ocirc;ng cho v&agrave;o tủ lạnh) v&agrave; sử dụng trong v&ograve;ng 3 tuần.</li>
	<li>PediaSure vừa pha phải được d&ugrave;ng ngay hay đậy k&iacute;n, cho v&agrave;o tủ lạnh v&agrave; d&ugrave;ng trong v&ograve;ng 24 giờ.</li>
</ul>

<p><strong>Lưu &yacute;:</strong></p>

<ul>
	<li>Kh&ocirc;ng d&ugrave;ng cho trẻ bị bệnh Galactosemia.</li>
	<li>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi, trừ khi được b&aacute;c sĩ chỉ định.</li>
	<li>Tham khảo b&aacute;c sĩ/chuy&ecirc;n vi&ecirc;n dinh dưỡng về nhu cầu dinh dưỡng cụ thể của con bạn.</li>
	<li>Kh&ocirc;ng d&ugrave;ng nu&ocirc;i ăn qua đường tĩnh mạch.</li>
	<li>Sản phẩm kh&ocirc;ng phải l&agrave; thuốc v&agrave; kh&ocirc;ng c&oacute; t&aacute;c dụng thay thế thuốc chữa bệnh.</li>
</ul>

<p>Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>
</div>

<div class="header-controls">&nbsp;</div>
</div>

<div class="translated-text">
<div class="words">&nbsp;</div>

<div class="sentences">&nbsp;</div>
</div>
</div>

<p>&nbsp;</p>
', 0, 4578, 0, 1, CAST(N'2023-03-08T21:01:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [transactions_id], [status], [user_id], [username], [phonenumber], [gmail], [address], [total_price], [payment], [payment_info], [message], [security], [created], [shipping]) VALUES (32, N'29920230312184521transactions', -1, NULL, N'Trần Ngọc Chiến', N'1245678', N'chienchien123@gmail.com', N'Thanh hải thanh hà hải fuinge', 7842414, N'vnpay', N'Thanh toan bang: vnpay', N'Giao tận Ngõ', N'080156', CAST(N'2023-03-12T18:45:00' AS SmallDateTime), 1)
INSERT [dbo].[transactions] ([id], [transactions_id], [status], [user_id], [username], [phonenumber], [gmail], [address], [total_price], [payment], [payment_info], [message], [security], [created], [shipping]) VALUES (31, N'67520230310235955transactions', 1, NULL, N'Nguyễn Thị Linh Ngọc', N'1221212122', N'nguyenvannam.nvn842000@gmail.com', N'Nam Sách Hải Dương', 6237000, N'zalopay', N'Thanh toan bang: zalopay', N'Giao đến Hà Nội', N'080156', CAST(N'2023-03-11T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[transactions] ([id], [transactions_id], [status], [user_id], [username], [phonenumber], [gmail], [address], [total_price], [payment], [payment_info], [message], [security], [created], [shipping]) VALUES (33, N'75620230312184858transactions', 0, NULL, N'Nguyễn Văn Nam', N'45645645', N'nguyenvannam842000@gmail.com', N'Taito - Tokto - Nhật Bản', 17774000, N'momo', N'Thanh toan bang: momo', N'Giao cho Crush tôi :0', N'080156', CAST(N'2023-03-12T18:49:00' AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (1, N'Nam@gmail.com', N'0123', N'zsonvec98', N'Thanh hải thanh hà hải fuinge', N'123456', NULL, 1, NULL)
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (2, N'Nam@gmail.com', N'0123456', N'thienthan10x99', N'Thanh hải thanh hà hải fuinge', N'123456', N'123456', 1, NULL)
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (3, N'', N'123', N'Nam', N'Nam', N'123', NULL, NULL, CAST(N'2023-02-23T01:17:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (4, N'ngovankhanh@gmail.com', N'123456', N'nguyenvannam842000@gmail.com', N'Thanh hải thanh hà hải fuinge', N'123456', NULL, NULL, CAST(N'2023-02-23T01:18:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (5, N'nam12345@gmail.com', N'123456', N'Nguy?n Van Nam', N'Thanh Hải - Thanh Hà - Hải Dương', N'1221212122', NULL, NULL, CAST(N'2023-02-23T18:18:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (6, N'nam12345@gmail.com', N'123456', N'Nguy?n Van Nam', N'Thanh Hải - Thanh Hà - Hải Dương', N'1221212122', NULL, NULL, CAST(N'2023-02-23T18:18:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (7, N'nam12345@gmail.com', N'123456', N'Nguy?n Van Nam', N'Thanh Hải - Thanh Hà - Hải Dương', N'1221212122', NULL, NULL, CAST(N'2023-02-23T18:18:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (8, N'Ngoc@gmail.com', N'123456', N'Nguyễn Thị Linh Ngọc', N'Taito - Tokto - Nhật Bản', N'055487923', NULL, NULL, CAST(N'2023-02-23T18:29:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (9, N'nguyenvannam.nvn842000@gmail.com', N'123456', N'Nguyễn Thị Linh Ngọc', N'Nam Sách Hải Dương', N'1221212122', NULL, NULL, CAST(N'2023-02-25T23:59:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (10, N'chienchien123@gmail.com', N'123456', N'Trần Ngọc Chiến', N'Thanh hải thanh hà hải fuinge', N'1245678', NULL, NULL, CAST(N'2023-03-12T18:45:00' AS SmallDateTime))
INSERT [dbo].[users] ([user_id], [gmail], [password], [username], [address], [phone], [avatar], [position], [created]) VALUES (11, N'nguyenvannam842000@gmail.com', N'123456', N'Nguyễn Văn Nam', N'Taito - Tokto - Nhật Bản', N'45645645', NULL, NULL, CAST(N'2023-03-12T18:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_catalogs] FOREIGN KEY([transactions_id])
REFERENCES [dbo].[transactions] ([transactions_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_catalogs]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_catalogs] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[catalogs] ([catalog_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_catalogs]
GO
USE [master]
GO
ALTER DATABASE [JP_ShopThoitrang] SET  READ_WRITE 
GO
