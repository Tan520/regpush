SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[FnBase64Encode](@src varchar(max))
　　RETURNS VARCHAR(max)
as 
begin
　　declare @bin varbinary(max)
　　set @bin=Convert(varbinary(max), @src)
　　return cast(N'' as xml).value('xs:base64Binary(xs:hexBinary(sql:variable("@bin")))', 'varchar(max)')
end
