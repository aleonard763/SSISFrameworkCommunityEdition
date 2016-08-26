/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
ADD LOG FILE
(
	NAME = [SSISFramework_Log],
	FILENAME = '$(DefaultLogPath)$(DefaultFilePrefix)_Log.ldf',
	SIZE = 10 MB,
	FILEGROWTH = 10 MB
)
