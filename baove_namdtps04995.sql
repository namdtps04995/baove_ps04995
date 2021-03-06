/****** Object:  Table [dbo].[Bacsi]    Script Date: 8/29/2017 8:23:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bacsi](
	[mabs] [int] NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](100) NOT NULL,
 CONSTRAINT [Bacsi_pk] PRIMARY KEY CLUSTERED 
(
	[mabs] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Benhnhan]    Script Date: 8/29/2017 8:23:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benhnhan](
	[mabenhnhan] [int] NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[phai] [bit] NOT NULL,
	[ngaysinh] [datetime] NOT NULL,
	[diachi] [nvarchar](100) NOT NULL,
 CONSTRAINT [Benhnhan_pk] PRIMARY KEY CLUSTERED 
(
	[mabenhnhan] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Phieukham]    Script Date: 8/29/2017 8:23:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phieukham](
	[maphieu] [int] NOT NULL,
	[mabenhnhan] [int] NOT NULL,
	[bacsidieutri] [int] NOT NULL,
	[chuandoan] [nvarchar](max) NOT NULL,
	[chiphi] [money] NOT NULL,
 CONSTRAINT [Phieukham_pk] PRIMARY KEY CLUSTERED 
(
	[maphieu] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
INSERT [dbo].[Bacsi] ([mabs], [hoten], [diachi]) VALUES (1, N'Do Thanh Nam', N'Tan Binh, HCM')
INSERT [dbo].[Bacsi] ([mabs], [hoten], [diachi]) VALUES (2, N'Do Chi Thuan', N'Q.4, HCM')
INSERT [dbo].[Benhnhan] ([mabenhnhan], [hoten], [phai], [ngaysinh], [diachi]) VALUES (1, N'Bui Van Cuong', 1, CAST(N'1994-02-02 00:00:00.000' AS DateTime), N'Tan Binh, HCM')
INSERT [dbo].[Benhnhan] ([mabenhnhan], [hoten], [phai], [ngaysinh], [diachi]) VALUES (2, N'Nguyen Xuan Quangf', 0, CAST(N'1996-03-04 00:00:00.000' AS DateTime), N'Long An')
INSERT [dbo].[Phieukham] ([maphieu], [mabenhnhan], [bacsidieutri], [chuandoan], [chiphi]) VALUES (1, 1, 1, N'Ho ra mau', 100000.0000)
INSERT [dbo].[Phieukham] ([maphieu], [mabenhnhan], [bacsidieutri], [chuandoan], [chiphi]) VALUES (2, 2, 2, N'Sot', 50000.0000)
ALTER TABLE [dbo].[Phieukham]  WITH CHECK ADD  CONSTRAINT [Phieukham_Bacsi] FOREIGN KEY([bacsidieutri])
REFERENCES [dbo].[Bacsi] ([mabs])
GO
ALTER TABLE [dbo].[Phieukham] CHECK CONSTRAINT [Phieukham_Bacsi]
GO
ALTER TABLE [dbo].[Phieukham]  WITH CHECK ADD  CONSTRAINT [Phieukham_Benhnhan] FOREIGN KEY([mabenhnhan])
REFERENCES [dbo].[Benhnhan] ([mabenhnhan])
GO
ALTER TABLE [dbo].[Phieukham] CHECK CONSTRAINT [Phieukham_Benhnhan]
GO
