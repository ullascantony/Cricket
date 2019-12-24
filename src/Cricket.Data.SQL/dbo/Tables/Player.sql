CREATE TABLE [dbo].[Player] (
	[PlayerID]			INT				IDENTITY (1, 1) NOT NULL,
	[TeamID]			INT				NOT NULL,
	[GivenName]			VARCHAR (50)	NOT NULL,
	[OtherGivenNames]	VARCHAR (100)	NULL,
	[FamilyName]		VARCHAR (50)	NOT NULL,
	[DateOfBirth]		DATE			NOT NULL,
	[DateCreated]		DATETIME2(7)	CONSTRAINT [DF_Player_DateCreated] DEFAULT (GETDATE()) NOT NULL,
	[DateUpdated]		DATETIME2(7)	NULL,
	[DateArchived]		DATETIME2(7)	NULL,
	CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED ([PlayerID] ASC),
	CONSTRAINT [FK_Player_Team] FOREIGN KEY ([TeamID]) REFERENCES [dbo].[Team] ([TeamID])
);
