
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<CharlesChiu>
-- Create date: <2019-04-18>
-- Description:	<Insert触发器>
-- =============================================
create TRIGGER [dbo].[reg_trigger] 

ON [dbo].[Biz_Exam]

AFTER insert

AS 
BEGIN
	declare @CSTUDYID varchar(32)
	declare @CBESPEAKTIME datetime
	declare @CQUEUENO int
	declare @CCHECKSERIALNUM varchar(32)
	declare @CDEVICEID varchar(32)
	declare @CDEVICENAME varchar(64)
	declare @CSIMPLECODE varchar(32)
	declare @CDIAGID varchar(80)
	declare @COPERATETIME datetime
	declare @CDEVICETYPENAME varchar(32)

	SELECT 
	@CSTUDYID=Exam_ID,@CBESPEAKTIME=Exam_WantToDate,@CQUEUENO=Exam_Order_ByETeam,@CCHECKSERIALNUM=Exam_ID,@CSIMPLECODE=Exam_Hosp_Code,@CDIAGID=Exam_HisCode,@COPERATETIME=Exam_Create_Datetime 
	FROM inserted
	
	set @CDEVICEID = ''
	set @CDEVICENAME = (select Team_Name from Dic_Team where Team_GUID=(select Exam_Team_GUID from inserted))
	set @CDEVICETYPENAME = '超声'
 
	exec proc_useRegPushAPI @CSTUDYID,@CBESPEAKTIME,@CQUEUENO,@CCHECKSERIALNUM,@CDEVICEID,@CDEVICENAME,@CSIMPLECODE,@CDIAGID,@COPERATETIME,@CDEVICETYPENAME --调用存储过程并传参
 
	SET NOCOUNT ON;
END
