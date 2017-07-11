/*  Server :SYDRPTSQL501 */

--2.Rollback table for dagent table--

Use [OAR]

-- Rollback Table Call_Telstra


IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[dagent_ultimate_ref]'))
       DROP TABLE [dbo.dagent_ultimate_ref]
GO
