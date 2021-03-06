USE [MvcShopping]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2019/10/24 9:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](5) NOT NULL,
	[Nickname] [nvarchar](10) NOT NULL,
	[RegisterOn] [datetime] NOT NULL,
	[UserId] [char](1) NOT NULL,
 CONSTRAINT [PK_dbo.Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2019/10/24 9:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[orderHeader_Id] [int] NOT NULL,
	[product_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 2019/10/24 9:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](40) NOT NULL,
	[ContractPhoneNo] [nvarchar](25) NOT NULL,
	[ContactAddress] [nvarchar](max) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Memo] [nvarchar](max) NULL,
	[BuyOn] [datetime] NOT NULL,
	[member_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2019/10/24 9:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019/10/24 9:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Color] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[PublishOn] [datetime] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[productCategory_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Email], [Password], [Name], [Nickname], [RegisterOn], [UserId]) VALUES (1, N'111@qq.com', N'111', N'管理员', N'管理员', CAST(0x0000AAEF017ABD8C AS DateTime), N'1')
INSERT [dbo].[Members] ([Id], [Email], [Password], [Name], [Nickname], [RegisterOn], [UserId]) VALUES (2, N'222@qq.com', N'222', N'用户1', N'小明', CAST(0x0000AAEF017B6894 AS DateTime), N'2')
INSERT [dbo].[Members] ([Id], [Email], [Password], [Name], [Nickname], [RegisterOn], [UserId]) VALUES (3, N'333@qq.com', N'333', N'小张', N'用户2', CAST(0x0000AAEF017B8938 AS DateTime), N'2')
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [Price], [Amount], [orderHeader_Id], [product_Id]) VALUES (1, 3699, 1, 1, 10)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Amount], [orderHeader_Id], [product_Id]) VALUES (2, 3199, 2, 1, 11)
INSERT [dbo].[OrderDetails] ([Id], [Price], [Amount], [orderHeader_Id], [product_Id]) VALUES (3, 4799, 8, 1, 12)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[OrderHeaders] ON 

INSERT [dbo].[OrderHeaders] ([Id], [ContactName], [ContractPhoneNo], [ContactAddress], [TotalPrice], [Memo], [BuyOn], [member_Id]) VALUES (1, N'啊明', N'15314020168', N'海大海安', 48489, N'尽快送达！', CAST(0x0000AAEF0184B5A2 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[OrderHeaders] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (1, N'笔记本电脑')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (2, N'平板电脑')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (3, N'台式电脑')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (4, N'数码相机')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (5, N'手机')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (6, N'mp4')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (7, N'mp3')
INSERT [dbo].[ProductCategories] ([Id], [Name]) VALUES (8, N'音响')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (6, N'Dell XPS13-5608', N'今年最新型号，功能强大，能够满足日常所有需求', N'灰色', 3699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/bijiben/Dell XPS13-5608.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (7, N'Hasee UI41 D2', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 4199, CAST(0x0000AAEF00000000 AS DateTime), N'/images/bijiben/Hasee UI41 D2.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (8, N'HP 430 G1', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 3799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/bijiben/HP 430 G1.png', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (9, N'Snoy SVF14314SC', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 4599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/bijiben/Snoy SVF14314SC.jpg', 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (10, N'Aigo PAD707', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 3699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/pinban/Aigo PAD707.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (11, N'Colorfly E708 Q1', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑、白色', 3199, CAST(0x0000AAEF00000000 AS DateTime), N'/images/pinban/Colorfly E708 Q1.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (12, N'Onda V819 3G', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 4799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/pinban/Onda V819 3G.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (13, N'Ramos w21', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 4599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/pinban/Ramos w21.jpg', 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (14, N'Acer SQN6120', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 5699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/taishiji/Acer SQN6120.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (15, N'ASUS CM6730-C42C', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 3899, CAST(0x0000AAEF00000000 AS DateTime), N'/images/taishiji/ASUS CM6730-C42C.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (16, N'DELL I2020-R338', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 4799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/taishiji/DELL I2020-R338.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (17, N'HP 400-010cx', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 3599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/taishiji/HP 400-010cx.jpg', 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (18, N'Aigo F360', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 2699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/xiangji/Aigo F360.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (19, N'Canon IXUS 240 HS', N'今年最新型号，功能强大，能够满足日常所有需求', N'蓝色', 3899, CAST(0x0000AAEF00000000 AS DateTime), N'/images/xiangji/Canon IXUS 240 HS.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (20, N'Samsung ES99', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 2799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/xiangji/Samsung ES99.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (21, N'Sony WX300', N'今年最新型号，功能强大，能够满足日常所有需求', N'红色', 4599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/xiangji/Sony WX300.jpg', 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (22, N'Acer AK330s', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 3699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/shouji/Acer AK330s.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (23, N'HTC A620D', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 2899, CAST(0x0000AAEF00000000 AS DateTime), N'/images/shouji/HTC A620D.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (24, N'Huawei G520', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 4799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/shouji/Huawei G520.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (25, N'iphone 5s', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 5599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/shouji/iphone 5s.jpg', 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (26, N'Aigo U228', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp4/Aigo U228.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (27, N'Colorfly CK5', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 899, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp4/Colorfly CK5.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (28, N'Onda VX530LE', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp4/Onda VX530LE.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (29, N'Soaiy V36', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp4/Soaiy V36.jpg', 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (30, N'Apple MD778CHA', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 399, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp3/Apple MD778CHA.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (31, N'ONN V1', N'今年最新型号，功能强大，能够满足日常所有需求', N'白色', 699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp3/ONN V1.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (32, N'PHILIPS SA4CLP02PN', N'今年最新型号，功能强大，能够满足日常所有需求', N'红色', 599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp3/PHILIPS SA4CLP02PN.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (33, N'Soaiy SA-650', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 299, CAST(0x0000AAEF00000000 AS DateTime), N'/images/mp3/Soaiy SA-650.jpg', 7)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (34, N'Edifier C2X', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 899, CAST(0x0000AAEF00000000 AS DateTime), N'/images/yinxiang/Edifier C2X.jpg', 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (35, N'Edifier e1100MKII', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 699, CAST(0x0000AAEF00000000 AS DateTime), N'/images/yinxiang/Edifier e1100MKII.jpg', 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (36, N'Hyundai F240', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 599, CAST(0x0000AAEF00000000 AS DateTime), N'/images/yinxiang/Hyundai F240.jpg', 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Color], [Price], [PublishOn], [Url], [productCategory_Id]) VALUES (37, N'Microlab M-200', N'今年最新型号，功能强大，能够满足日常所有需求', N'黑色', 799, CAST(0x0000AAEF00000000 AS DateTime), N'/images/yinxiang/Microlab M-200.jpg', 8)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.OrderHeaders_orderHeader_Id] FOREIGN KEY([orderHeader_Id])
REFERENCES [dbo].[OrderHeaders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.OrderHeaders_orderHeader_Id]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_product_Id] FOREIGN KEY([product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_product_Id]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderHeaders_dbo.Members_member_Id] FOREIGN KEY([member_Id])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_dbo.OrderHeaders_dbo.Members_member_Id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_productCategory_Id] FOREIGN KEY([productCategory_Id])
REFERENCES [dbo].[ProductCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_productCategory_Id]
GO
