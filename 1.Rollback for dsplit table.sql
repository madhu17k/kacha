/*Server :SYDRPTSQL501 */

--1.Rollback table for dsplit table--

-- Rollback Table 
Use [OAR]

IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[dsplit_ultimate_reference]'))
       DROP TABLE [dsplit_ultimate_reference]
GO