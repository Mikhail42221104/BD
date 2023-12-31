USE [master]
GO
/****** Object:  Database [Employee work schedule]    Script Date: 01.12.2023 14:08:22 ******/
CREATE DATABASE [Employee work schedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee work schedule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Employee work schedule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee work schedule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Employee work schedule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Employee work schedule] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee work schedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee work schedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee work schedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee work schedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee work schedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee work schedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee work schedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee work schedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee work schedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee work schedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee work schedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee work schedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee work schedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee work schedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee work schedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee work schedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee work schedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee work schedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee work schedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee work schedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee work schedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee work schedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee work schedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee work schedule] SET RECOVERY FULL 
GO
ALTER DATABASE [Employee work schedule] SET  MULTI_USER 
GO
ALTER DATABASE [Employee work schedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee work schedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee work schedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee work schedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee work schedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Employee work schedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employee work schedule', N'ON'
GO
ALTER DATABASE [Employee work schedule] SET QUERY_STORE = ON
GO
ALTER DATABASE [Employee work schedule] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Employee work schedule]
GO
/****** Object:  Table [dbo].[Absences]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absences](
	[AbsenceID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[AbsenceType] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAbsences]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAbsences](
	[AbsenceID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[AbsenceType] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AbsenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Position] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[HolidayID] [int] NOT NULL,
	[HolidayDate] [date] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheduleID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleTemplates]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTemplates](
	[TemplateID] [int] NOT NULL,
	[TemplateName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftID] [int] NOT NULL,
	[ShiftName] [nvarchar](100) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkGroups]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkGroups](
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkSchedulesPerDay]    Script Date: 01.12.2023 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkSchedulesPerDay](
	[ScheduleID] [int] NULL,
	[DayOfWeek] [int] NULL,
	[ShiftID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Absences]  WITH CHECK ADD  CONSTRAINT [FK_Absences_Holidays] FOREIGN KEY([AbsenceID])
REFERENCES [dbo].[Holidays] ([HolidayID])
GO
ALTER TABLE [dbo].[Absences] CHECK CONSTRAINT [FK_Absences_Holidays]
GO
ALTER TABLE [dbo].[EmployeeAbsences]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[ScheduleTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleTemplates_Schedules] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[ScheduleTemplates] CHECK CONSTRAINT [FK_ScheduleTemplates_Schedules]
GO
ALTER TABLE [dbo].[WorkGroups]  WITH CHECK ADD  CONSTRAINT [FK_WorkGroups_Employees] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[WorkGroups] CHECK CONSTRAINT [FK_WorkGroups_Employees]
GO
ALTER TABLE [dbo].[WorkSchedulesPerDay]  WITH CHECK ADD FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[WorkSchedulesPerDay]  WITH CHECK ADD FOREIGN KEY([ShiftID])
REFERENCES [dbo].[Shifts] ([ShiftID])
GO
USE [master]
GO
ALTER DATABASE [Employee work schedule] SET  READ_WRITE 
GO
