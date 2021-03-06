/****** Object:  Database [SurveyBeta]    Script Date: 06/21/2022 6:40:06 PM ******/
CREATE DATABASE [SurveyBeta] ON  PRIMARY 
( NAME = N'Survey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Survey.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Survey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Survey_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SurveyBeta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SurveyBeta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SurveyBeta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SurveyBeta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SurveyBeta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SurveyBeta] SET ARITHABORT OFF 
GO
ALTER DATABASE [SurveyBeta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SurveyBeta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SurveyBeta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SurveyBeta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SurveyBeta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SurveyBeta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SurveyBeta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SurveyBeta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SurveyBeta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SurveyBeta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SurveyBeta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SurveyBeta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SurveyBeta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SurveyBeta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SurveyBeta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SurveyBeta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SurveyBeta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SurveyBeta] SET RECOVERY FULL 
GO
ALTER DATABASE [SurveyBeta] SET  MULTI_USER 
GO
ALTER DATABASE [SurveyBeta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SurveyBeta] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SurveyBeta', N'ON'
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 06/21/2022 6:40:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedByUserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormSubmission]    Script Date: 06/21/2022 6:40:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormSubmission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormId] [int] NOT NULL,
	[DeviceId] [varchar](60) NOT NULL,
	[SubmittedOn] [datetime] NOT NULL,
	[SyncedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_FormSubmission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormSubmissionValues]    Script Date: 06/21/2022 6:40:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormSubmissionValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubmissionId] [int] NOT NULL,
	[QuestionText] [varchar](150) NOT NULL,
	[AnswerText] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/21/2022 6:40:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[RegisteredOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Forms] ON 

INSERT [dbo].[Forms] ([Id], [FormName], [CreatedOn], [CreatedByUserId], [IsActive], [IsDeleted]) VALUES (1, N'Test', CAST(N'2022-04-09T00:00:00.000' AS DateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Forms] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [LoginId], [Password], [RegisteredOn], [IsActive], [IsDeleted]) VALUES (1, N'Admin', N'admin', N'Admin@123@', CAST(N'2022-04-09T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [DF_Forms_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[FormSubmission] ADD  CONSTRAINT [DF_FormSubmission_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FormSubmission] ADD  CONSTRAINT [DF_FormSubmission_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Forms]  WITH CHECK ADD  CONSTRAINT [FK_Forms_Users] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Forms] CHECK CONSTRAINT [FK_Forms_Users]
GO
ALTER TABLE [dbo].[FormSubmission]  WITH CHECK ADD  CONSTRAINT [FK_FormSubmission_Forms] FOREIGN KEY([FormId])
REFERENCES [dbo].[Forms] ([Id])
GO
ALTER TABLE [dbo].[FormSubmission] CHECK CONSTRAINT [FK_FormSubmission_Forms]
GO
ALTER TABLE [dbo].[FormSubmissionValues]  WITH CHECK ADD  CONSTRAINT [FK_FormSubmissionValues_FormSubmission] FOREIGN KEY([SubmissionId])
REFERENCES [dbo].[FormSubmission] ([Id])
GO
ALTER TABLE [dbo].[FormSubmissionValues] CHECK CONSTRAINT [FK_FormSubmissionValues_FormSubmission]
GO
ALTER DATABASE [SurveyBeta] SET  READ_WRITE 
GO
