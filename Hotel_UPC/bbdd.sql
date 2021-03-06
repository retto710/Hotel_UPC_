USE [HotelUPC]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[RoomStateID] [int] NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomsByReservation]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsByReservation](
	[ID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
 CONSTRAINT [PK_RoomsByReservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomState]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoomState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[NumberOfBeds] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Document] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsForeign] [bit] NOT NULL,
	[DoB] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 30/05/2018 08:49:21 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (1, 1, 1, 201)
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (2, 2, 1, 202)
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (3, 1, 1, 203)
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (4, 3, 1, 301)
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (5, 3, 1, 302)
INSERT [dbo].[Rooms] ([ID], [RoomTypeID], [RoomStateID], [Number]) VALUES (6, 3, 1, 401)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[RoomState] ON 

INSERT [dbo].[RoomState] ([ID], [Description]) VALUES (1, N'Available')
INSERT [dbo].[RoomState] ([ID], [Description]) VALUES (2, N'Maintance')
INSERT [dbo].[RoomState] ([ID], [Description]) VALUES (3, N'Cleaning')
INSERT [dbo].[RoomState] ([ID], [Description]) VALUES (4, N'Ocupated')
SET IDENTITY_INSERT [dbo].[RoomState] OFF
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([ID], [Description], [NumberOfBeds], [Price]) VALUES (1, N'Single', 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[RoomTypes] ([ID], [Description], [NumberOfBeds], [Price]) VALUES (2, N'Double', 2, CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[RoomTypes] ([ID], [Description], [NumberOfBeds], [Price]) VALUES (3, N'Triple', 3, CAST(250.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserTypeId], [Email], [Name], [Document], [Password], [IsForeign], [DoB]) VALUES (4, 2, N'asa@.com', N'asda', N'132', N'123', 0, CAST(N'1959-10-10 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([ID], [Description]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypes] ([ID], [Description]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_User]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomState] FOREIGN KEY([RoomStateID])
REFERENCES [dbo].[RoomState] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomState]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomTypes] ([ID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes]
GO
ALTER TABLE [dbo].[RoomsByReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomsByReservation_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ID])
GO
ALTER TABLE [dbo].[RoomsByReservation] CHECK CONSTRAINT [FK_RoomsByReservation_Reservations]
GO
ALTER TABLE [dbo].[RoomsByReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomsByReservation_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([ID])
GO
ALTER TABLE [dbo].[RoomsByReservation] CHECK CONSTRAINT [FK_RoomsByReservation_Rooms]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserTypes]
GO
