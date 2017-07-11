/*  Server :SYDRPTSQL501 */


--2.RollOut Table for split.
-- Rollout Table 
USE [OAR]

-- Create Table for the Data Model 
Create table [OAR].dbo.dsplit_ultimate_ref 
(
      
       ID   int IDENTITY(1,1 ) primary key ,
	   row_date   date,
       split   int ,
       acdcalls int,
       abncalls int,
       anstime int,
       acceptable int,
       maxocwtime int,
       Callsoffered int,
       LOB nvarchar(30),
       GEO nvarchar(30),
       Client nvarchar(30),
       Channel nvarchar(30),
       [Queue Name] nvarchar(30),
       Vector nvarchar(30),
       [Valid Date Start] date,
       [Valid Date End] date,
	[CreatedBy] [nvarchar](128) NOT NULL DEFAULT (suser_sname()),
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ModifiedBy] [nvarchar](128) NOT NULL DEFAULT (suser_sname()),
	[ModifiedDate] [datetime] NOT NULL DEFAULT (getdate())


)
