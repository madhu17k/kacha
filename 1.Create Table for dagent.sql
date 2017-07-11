
/*  Server :SYDRPTSQL501 */

--1.Rollout table for dagent. 
-- Rollout Table 
USE [OAR]

-- Create Table for the Data Model 
Create table [OAR].dbo.dagent_ultimate_ref
(
   	
ID   int  primary key ,
row_date   date,
acd   int ,
split   int ,
logid   nvarchar(15) ,
loc_id   int ,
acdcalls   int ,
acdtime   int ,
acwtime   int ,
holdcalls   int ,
holdtime   int ,
holdabncalls   int ,
transferred   int ,
conference   int ,
abncalls   int ,
abntime   int ,
ringcalls   int ,
ringtime   int ,
ansringtime   int ,
noansredir   int ,
incomplete   int ,
acdauxoutcalls   int ,
holdacdtime   int ,
logid_int   int ,
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
