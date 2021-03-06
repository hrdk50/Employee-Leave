USE [master]
GO
/****** Object:  Database [EmployeeLeaveDb]    Script Date: 27-03-2020 19:45:27 ******/
CREATE DATABASE [EmployeeLeaveDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeLeaveDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EmployeeLeaveDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeLeaveDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EmployeeLeaveDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EmployeeLeaveDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeLeaveDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeLeaveDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeLeaveDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeLeaveDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeLeaveDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeLeaveDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeLeaveDb] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeLeaveDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeLeaveDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeLeaveDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeLeaveDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeLeaveDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeLeaveDb] SET QUERY_STORE = OFF
GO
USE [EmployeeLeaveDb]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27-03-2020 19:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](20) NOT NULL,
	[PresentDate] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leave]    Script Date: 27-03-2020 19:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[FirstDate] [date] NOT NULL,
	[LastDate] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Leave]  WITH CHECK ADD  CONSTRAINT [FK_Leave_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Leave] CHECK CONSTRAINT [FK_Leave_Employee]
GO
USE [master]
GO
ALTER DATABASE [EmployeeLeaveDb] SET  READ_WRITE 
GO
