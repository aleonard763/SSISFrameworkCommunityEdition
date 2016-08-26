/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [SSISFramework_Data3],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_Data3.ndf',
		SIZE = 1MB,
		FILEGROWTH = 1MB
	) TO FILEGROUP [Data]
