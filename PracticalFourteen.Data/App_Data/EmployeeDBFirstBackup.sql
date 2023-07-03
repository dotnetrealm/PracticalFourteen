USE [EmployeeDBFirst]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03-07-2023 20:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (8, N'Vipul', CAST(N'1999-07-16' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (9, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (11, N'Bhavin', CAST(N'2002-09-02' AS Date), 21)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (12, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (13, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (14, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (15, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (16, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (17, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (18, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (19, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (20, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (21, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (22, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (23, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (24, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (25, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (26, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (27, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (28, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (29, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (30, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (31, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (32, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (33, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (34, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (35, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (36, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (37, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (38, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (39, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (40, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (41, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (42, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (43, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (44, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (45, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (46, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (47, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (48, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (49, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (50, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (51, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (52, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (53, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (54, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (55, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (56, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (57, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (58, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (59, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (60, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (61, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (62, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (63, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (64, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (65, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (66, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (67, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (68, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (70, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (71, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (72, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (73, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (74, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (75, N'Bhavin', CAST(N'2002-09-02' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (76, N'Vipul', CAST(N'1999-07-07' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (77, N'Jil', CAST(N'2023-01-01' AS Date), 22)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (78, N'Abhi', CAST(N'2000-01-01' AS Date), 24)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (79, N'Test', CAST(N'2023-07-15' AS Date), 1212)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (80, N'Test', CAST(N'2023-07-15' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (81, N'Test', CAST(N'2023-07-15' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (82, N'Test', CAST(N'2023-07-15' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (83, N'Test', CAST(N'2023-07-13' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (84, N'afdasdf', CAST(N'2023-07-05' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (85, N'fdasfd', CAST(N'2023-07-26' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (86, N'fdasfd', CAST(N'2023-07-26' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (87, N'fdasfd', CAST(N'2023-07-26' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (88, N'fdasfd', CAST(N'2023-07-26' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (89, N'fdasfd', CAST(N'2023-07-26' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (90, N'Test', CAST(N'2023-07-19' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (91, N'Test', CAST(N'2023-07-05' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (92, N'fdasfd', CAST(N'0001-01-01' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (93, N'Test', CAST(N'2022-11-08' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (94, N'fdasfd', CAST(N'2001-02-01' AS Date), 12)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (95, N'Test', CAST(N'2000-01-19' AS Date), 123)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (96, N'Test', CAST(N'2000-01-01' AS Date), NULL)
GO
INSERT [dbo].[Employees] ([Id], [Name], [DOB], [Age]) VALUES (97, N'Test', CAST(N'2000-01-01' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
