/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [SSISFramework_PRIMARY],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_PRIMARY.mdf',
		SIZE = 10MB,
		FILEGROWTH = 1MB
	) TO FILEGROUP [PRIMARY];
