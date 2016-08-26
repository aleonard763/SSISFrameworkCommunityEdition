CREATE TABLE [custom].[Applications]
(
	[ApplicationID]		INT IDENTITY(1,1)	NOT NULL,
	[ApplicationName]	NVARCHAR(130)			NULL,
	CONSTRAINT [UX_custom_Applications_ApplicationName] UNIQUE NONCLUSTERED 
	(
		[ApplicationName] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
) ON [Data];
GO
