
GO
/****** Object:  StoredProcedure [dbo].[proc_useRegPushAPI]    Script Date: 2019/6/17 8:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<CharlesChiu>
-- Create date: <2019-04-18>
-- Description:	<调用消息推送接口>
-- =============================================
ALTER PROCEDURE [dbo].[proc_useRegPushAPI]
	@CSTUDYID varchar(32),
	@CBESPEAKTIME datetime,
	@CQUEUENO int,
	@CCHECKSERIALNUM varchar(32),
	@CDEVICEID varchar(32),
	@CDEVICENAME varchar(64),
	@CSIMPLECODE varchar(32),
	@CDIAGID varchar(80),
	@COPERATETIME datetime,
	@CDEVICETYPENAME varchar(32)
AS
BEGIN

	declare @url varchar(4000)	--接口路由
	declare @object int			--OLE对象实例
	declare @responseText varchar(4000) --文本

	if  @CQUEUENO is null
	begin
		set @CQUEUENO=0
	end
	if @CSTUDYID is null
		set @CSTUDYID=''
	if @CBESPEAKTIME is null
		set @CBESPEAKTIME=''
	if @CCHECKSERIALNUM is null
		set @CCHECKSERIALNUM=''
	if @CDEVICEID is null
		set @CDEVICEID=''
	if @CDEVICENAME is null
		set @CDEVICENAME=''
	if @CSIMPLECODE is null
		set @CSIMPLECODE=''
	if @CDIAGID is null
		set @CDIAGID=''
	if @COPERATETIME is null
		set @COPERATETIME=''
	if @CDEVICETYPENAME is null
	begin
		set @CDEVICETYPENAME=''
	end
	--Base64
	set @CDEVICETYPENAME=CONVERT(nvarchar(max), [dbo].[FnBase64Encode](@CDEVICETYPENAME))
	set @CDEVICENAME=CONVERT(nvarchar(max), [dbo].[FnBase64Encode](@CDEVICENAME))
	--print @CDEVICETYPENAME


	set @url = 'http://localhost:8080/reg_push_war_exploded/reg?CSTUDYID='+@CSTUDYID+'&CBESPEAKTIME='+CONVERT(varchar(100),@CBESPEAKTIME,120)
	+'&CQUEUENO='+CONVERT(varchar(6),@CQUEUENO)+'&CCHECKSERIALNUM='+@CCHECKSERIALNUM
	+'&CDEVICEID='+@CDEVICEID+'&CDEVICENAME='+@CDEVICENAME+'&CSIMPLECODE='+@CSIMPLECODE
	+'&CDIAGID='+@CDIAGID+'&COPERATETIME='+CONVERT(varchar(100),@COPERATETIME,120)+'&CDEVICETYPENAME='+@CDEVICETYPENAME
	--print @url

	declare @err int,@src varchar(255),@desc varchar(255)
	declare @obj int

	
	exec @err=sp_OACreate'MSXML2.XMLHTTP',@object out

	print @err
	if @err<>0 goto lberr

	exec sp_OAMethod @object,'open',null,'get',@url,'false'

	exec sp_OAMethod @object,'send'

	exec sp_OAMethod @object,'responseText',@responseText output

	--print @responseText

	exec sp_OADestroy @object

	SET NOCOUNT ON;
	return
	

	lberr:
	exec sp_oageterrorinfo 0,@src out,@desc out
	select cast(@err as varbinary(4)) as 错误号
	,@src as 错误源,@desc as 错误描述 

END