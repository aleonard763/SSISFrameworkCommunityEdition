CREATE TABLE [custom].[Packages]
(
	[PackageID]		INT IDENTITY(1,1)	NOT NULL,
	[PackageName]	NVARCHAR(130)			NULL,
	[ProjectName]	NVARCHAR(260)			NULL,
	[FolderName]	NVARCHAR(260)			NULL,
	CONSTRAINT [UX_custom_Packages_PackageName_Plus] UNIQUE NONCLUSTERED 
	(
		[PackageName] ASC,
		[ProjectName] ASC,
		[FolderName] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
) ON [Data];
GO
