sp_configure 'show advanced options', 1;
GO
RECONFIGURE WITH OVERRIDE;
GO
sp_configure 'Ole Automation Procedures', 1;
GO
RECONFIGURE WITH OVERRIDE;
GO
EXEC sp_configure 'Ole Automation Procedures';
GO
