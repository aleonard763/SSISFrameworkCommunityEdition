CREATE TABLE [custom].[ApplicationPackages]
(
	[ApplicationPackageID]				INT IDENTITY(1,1)	NOT NULL,
	[ApplicationID]						INT						NULL,
	[PackageID]							INT						NULL,
	[ExecutionOrder]					INT						NULL,
	[FailApplicationOnPackageFailure]	BIT						NULL,
	CONSTRAINT [UX_custom_ApplicationPackages_PackageId_Plus] UNIQUE NONCLUSTERED 
	(
		[ApplicationID] ASC,
		[PackageID] ASC,
		[ExecutionOrder] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
) ON [Data];
GO
