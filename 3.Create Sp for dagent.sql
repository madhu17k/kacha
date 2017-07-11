/*  Server :SYDRPTSQL501 */

--3.RollOut Stored procedure for dagent--

-- Rollout 

Use [OAR]
GO

Create PROCEDURE [dbo].[usp_dagent_ultimate_refference_v]  


AS


/*exec #usp_dagent_ultimate_refference_v */

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET ANSI_WARNINGS OFF

--BEGIN 

-- Check if  Temp Table Exists  Step 1 
IF OBJECT_ID(N'.dbo.#TableMappingForTheSplit') IS NOT NULL
BEGIN
    DROP TABLE #TableMappingForTheSplit
END


-- Create Temp Table Step 2 

Create Table  #TableMappingForTheSplit 
(
  Split int ,
  GEO nvarchar (20),
  Client nvarchar (20),
  Channel nvarchar (20),
  LOB nvarchar (20),
  [Queue Name] nvarchar (50),
  Vector  nvarchar (15),
  [Valid Date Start] Date,
  [Valid Date End] Date
  )

-- Insert into  Temp Table Step 3

insert  into #TableMappingForTheSplit 
(
	Split,
	GEO,
	Client ,
	Channel,
	LOB,
	[Queue Name],
	Vector ,
	[Valid Date Start] ,
	[Valid Date End] 
)

select 2,'Australia','Telstra','Call','Support','PDS / CS Team','Support','1/1/2013',GetDate()
UNION ALL  select 10,'Australia','Telstra','Call','Soluto','S 1 Soluto IVR','Inbound','1/1/2013',GetDate()
UNION ALL  select 20,'Australia','Telstra','Call','Mobility','M 1 General IVR','Inbound','1/1/2013',GetDate()
UNION ALL  select 30,'Australia','Telstra','Call','Support','E Help Desk','Support','1/1/2013',GetDate()
UNION ALL  select 40,'Australia','Telstra','Call','Mobility','M 2 OOW IVR','Inbound','1/1/2013',GetDate()
UNION ALL  select 50,'Australia','Telstra','Call','Support','TM Escalations','Support','1/1/2013',GetDate()
UNION ALL  select 60,'Australia','Telstra','Call','Mobility','M 3 IW IVR','Inbound','1/1/2013','12/31/2016'
UNION ALL  select 61,'Australia','Telstra','Call','Mobility','M 4 IW XFER','Transfer','1/1/2013','12/31/2016'
UNION ALL  select 62,'Australia','Telstra','Call','Support','CS NPF','Support','1/1/2013',GetDate()
UNION ALL  select 64,'Australia','Telstra','Call','Soluto','S 3 Soluto XFER','Transfer','1/1/2013',GetDate()
UNION ALL  select 65,'Australia','Telstra','Call','Mobility','M 5 OOW XFER','Transfer','1/1/2013',GetDate()
UNION ALL  select 66,'Australia','Telstra','Call','Test','Test','Test','1/1/2013',GetDate()
UNION ALL  select 67,'Australia','Telstra','Call','TB','TB Out of Warranty','Inbound','1/1/2013',GetDate()
UNION ALL  select 68,'Australia','Telstra','Call','TB','TB In Warranty','Inbound','1/1/2013',GetDate()
UNION ALL  select 69,'Australia','Telstra','Call','TB','TB Soluto','Inbound','1/1/2013',GetDate()
UNION ALL  select 70,'Australia','Telstra','Call','TB','TB General Enquiry','Inbound','1/1/2013',GetDate()
UNION ALL  select 75,'Australia','Telstra','Call','Test','Test','Test','1/1/2013',GetDate()
UNION ALL  select 76,'Australia','Telstra','Call','Support','StarTrack','Support','1/1/2013',GetDate()
UNION ALL  select 78,'Australia','Telstra','Call','TB','TB FLA to Soluto','Transfer','1/1/2013',GetDate()
UNION ALL  select 79,'Australia','Telstra','Call','TB','TB Soluto to FLA','Transfer','1/1/2013',GetDate()
UNION ALL  select 80,'Australia','Telstra','Call','Test','Test','Test','1/1/2013',GetDate()
UNION ALL  select 82,'Australia','Telstra','Call','Soluto','Asurion Friends','Inbound','1/1/2013',GetDate()
UNION ALL  select 83,'Australia','Telstra','Call','TB','Telstra Business Transfer','Transfer','1/1/2013',GetDate()
UNION ALL  select 90,'Australia','Telstra','Call','Soluto','S 2 Soluto C2C','Inbound','1/1/2013',GetDate()
UNION ALL  select 100,'Australia','Telstra','Call','Soluto','ST Outbound','Outbound','1/1/2013',GetDate()
UNION ALL  select 110,'Australia','Telstra','Call','Mobility','FLA Outbound','Outbound','1/1/2013',GetDate()
UNION ALL  select 120,'Australia','Telstra','Call','Mobility','MT Outbound','Outbound','1/1/2013',GetDate()
UNION ALL  select 130,'Australia','Telstra','Call','Support','CST Outbound','Outbound','1/1/2013',GetDate()
UNION ALL  select 140,'Australia','Telstra','Call','Support','Other Outbound','Outbound','1/1/2013',GetDate()
UNION ALL  select 150,'Australia','Telstra','Chat','Soluto','Chat','Inbound','1/1/2013',GetDate()
UNION ALL  select 155,'Australia','Telstra','Chat','Soluto','Chat Transfer','Transfer','1/1/2013',GetDate()
UNION ALL  select 800,'Australia','Asurion','Chat','A Friends','Chat','Inbound','1/1/2013',GetDate()
UNION ALL  select 801,'Australia','Asurion','Chat','A Friends','Chat Transfer','Transfer','1/1/2013',GetDate()
UNION ALL  select 802,'Taiwan','FET','Chat','Soluto','Chat','Inbound','1/1/2013',GetDate()
UNION ALL  select 803,'Taiwan','FET','Chat','Soluto','Chat Transfer','Transfer','1/1/2013',GetDate()
UNION ALL  select 804,'','KL','Chat','Soluto','Chat','Inbound','1/1/2013',GetDate()
UNION ALL  select 805,'','KL','Chat','Soluto','Chat Transfer','Transfer','1/1/2013',GetDate()
UNION ALL  select 60,'Australia','Telstra','Call','Soluto','S 4 IW IVR','Inbound','1/1/2017',GetDate()
UNION ALL  select 61,'Australia','Telstra','Call','Soluto','S 5 IW XFER','Transfer','1/1/2017',GetDate()
UNION ALL  select 84,'Australia','Telstra','Call','Soluto','S 6 In-Warranty Stores','Inbound','1/20/2017',GetDate()


-- truncate dagent_ultimate_ref

truncate table [OAR].dbo.dagent_ultimate_ref

-- Insert data into Temp table  Step 6   

insert into [OAR].dbo.dagent_ultimate_ref
(
	ID,
	row_date,
	acd,
	split,
	logid,
    loc_id,acdcalls,acdtime,acwtime,holdcalls,holdtime,holdabncalls,transferred,conference,
   abncalls,abntime,ringcalls,ringtime,ansringtime,noansredir,incomplete,acdauxoutcalls,holdacdtime,
   logid_int,  LOB,GEO,Client,Channel,[Queue Name],
   Vector,[Valid Date Start],[Valid Date End]
   )
-- Insert data into #dagent_ultimate_ref   

SELECT   "ID", 
	CONVERT (DATE, row_date) as "row_date",
	"acd", "split", "logid", "loc_id", "acdcalls", 
	"acdtime", "acwtime",  "holdcalls", "holdtime",
    "holdabncalls", "transferred", "conference", "abncalls",
    "abntime", "ringcalls", "ringtime", "ansringtime",  "noansredir",
    "incomplete", "acdauxoutcalls", "holdacdtime" , Cast("logid" as int) as "logid_int",
	NULL LOB,NULL GEO,Null Client,Null Channel,Null [Queue Name],Null Vector,
	Null [Valid Date Start],Null [Valid Date End]
FROM [Call_Telstra].[dbo].[dagent]

where datepart(Year,row_date) > (datepart(Year,sysdatetime()))-2

  
-- Update  data for #dagent_ultimate_ref

update [OAR].dbo.dagent_ultimate_ref  with (rowlock)
set
	 LOB = b.LOB,
	 GEO = b.GEO,
	 Client=b.Client,
	Channel=b.Channel,
	[Queue Name]=b.[Queue Name],
	Vector=b.Vector,
	[Valid Date Start]=b.[Valid Date Start],
	[Valid Date End]=b.[Valid Date End]

--select b.LOB,GEO,Client,Channel,[Queue Name],Vector,[Valid Date Start],[Valid Date End],
from 

[OAR].dbo.dagent_ultimate_ref  a Inner join #TableMappingForTheSplit b on --a.deliverydate = b.deliverydate 
      a.split = b.split  and   a.row_date between b.[Valid Date Start] and  b.[Valid Date End]

-- Step 8 Returning Result 

select  
	ID,
	row_date,
	acd,
	split,
	logid,
    loc_id,acdcalls,acdtime,acwtime,holdcalls,holdtime,holdabncalls,transferred,conference,
   abncalls,abntime,ringcalls,ringtime,ansringtime,noansredir,incomplete,acdauxoutcalls,holdacdtime,
   logid_int,  LOB,GEO,Client,Channel,[Queue Name],
   Vector,[Valid Date Start],[Valid Date End]


from 
	[OAR].dbo.dagent_ultimate_ref
order by(row_date)

--END 
SET NOCOUNT OFF
SET ANSI_WARNINGS ON
----
-- SP Ends  Here 