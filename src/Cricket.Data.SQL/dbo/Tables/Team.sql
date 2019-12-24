CREATE TABLE [dbo].[Team] (
	[TeamID]			INT				IDENTITY (1, 1) NOT NULL,
	[Code]				VARCHAR (5)		NOT NULL,
	[Name]				VARCHAR (50)	NOT NULL,
	[ColourPrimary]		VARCHAR (6)		NOT NULL,
	[ColourSecondary]	VARCHAR (6)		NOT NULL,
	[DateCreated]		DATETIME2(7)	CONSTRAINT [DF_Team_DateCreated] DEFAULT (GETDATE()) NOT NULL,
	[DateUpdated]		DATETIME2(7)	NULL,
	[DateArchived]		DATETIME2(7)	NULL,
	CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED ([TeamID] ASC)
);
