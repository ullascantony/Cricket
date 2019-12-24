-- ===================================================================
-- Author: Antony Ullas
-- Create date: 2019-Jul-16
-- Description: Get World Cup Player data
-- Sample: EXEC [dbo].[GetWorldCupPlayer]
----------------------------------------------------------------------
-- ChangedOn	ChangedBy		Reason
----------------------------------------------------------------------
-- 
-- ===================================================================

CREATE PROCEDURE [dbo].[GetWorldCupPlayer]
(
	 @WorldCupPlayerID INT = NULL
	,@TeamID INT = NULL
	,@DateOfBirthRangeBegin DATE = NULL
	,@DateOfBirthRangeEnd DATE = NULL
	,@IncludeArchived BIT = NULL
	,@Rows INT = NULL
	,@Page INT = NULL
)
AS
BEGIN
	SET @WorldCupPlayerID = CASE WHEN COALESCE(@WorldCupPlayerID, 0) <= 0 THEN NULL ELSE @WorldCupPlayerID END;
	SET @TeamID = CASE WHEN COALESCE(@TeamID, 0) <= 0 THEN NULL ELSE @TeamID END;
	SET @DateOfBirthRangeBegin = CASE WHEN COALESCE(@DateOfBirthRangeBegin, '') = '' THEN CAST('1753-01-01' AS DATE) ELSE @DateOfBirthRangeBegin END;
	SET @DateOfBirthRangeEnd = CASE WHEN COALESCE(@DateOfBirthRangeEnd, '') = '' THEN CAST('9999-12-31' AS DATE) ELSE @DateOfBirthRangeEnd END;
	SET @IncludeArchived = CASE WHEN @IncludeArchived IS NULL THEN 0 ELSE @IncludeArchived END;
	SET @Rows = CASE WHEN COALESCE(@Rows, 0) <= 0 THEN 50 ELSE @Rows END;
	SET @Page = CASE WHEN COALESCE(@Page, 0) <= 0 THEN 0 ELSE @Page END;

	IF @DateOfBirthRangeBegin > @DateOfBirthRangeEnd
	BEGIN
		DECLARE @DateTemp DATE = @DateOfBirthRangeBegin;
		SELECT @DateOfBirthRangeBegin = @DateOfBirthRangeEnd;
		SELECT @DateOfBirthRangeEnd = @DateTemp;
	END

	DECLARE @DateTimeOfBirthRangeBegin DATETIME2(7) = CAST(FORMAT(@DateOfBirthRangeBegin, 'yyyy-MMM-dd 00:00:00.0000000') AS DATETIME2(7));
	DECLARE @DateTimeOfBirthRangeEnd DATETIME2(7) = CAST(FORMAT(@DateOfBirthRangeEnd, 'yyyy-MMM-dd 23:59:59.9999999') AS DATETIME2(7));

	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 wcp.[WorldCupPlayerID]
			,pr.[PlayerID]
			,pr.[GivenName]
			,pr.[OtherGivenNames]
			,pr.[FamilyName]
			,pr.[DateOfBirth]
			,tm.[TeamID]
			,tm.[Code] AS [TeamCode]
			,tm.[Name] AS [TeamName]
			,tm.[ColourPrimary] AS [TeamColourPrimary]
			,tm.[ColourSecondary] AS [TeamColourSecondary]
			,wcp.[SpanBegin]
			,wcp.[SpanEnd]
			,wcp.[Matches]
			,wcp.[Innings]
			,wcp.[NotOut]
			,wcp.[Runs]
			,wcp.[Highest]
			,wcp.[HighestIsNotOut]
			,wcp.[BallsFaced]
			,wcp.[Centuries]
			,wcp.[Fifties]
			,wcp.[Ducks]
			,wcp.[Fours]
			,wcp.[Sixes]
			,(CAST((wcp.[Runs] / CAST((wcp.[Innings] - wcp.[NotOut]) AS FLOAT)) AS DECIMAL(5,2))) AS [Average]
			,(CAST(((wcp.[Runs] / CAST(wcp.[BallsFaced] AS FLOAT)) * 100) AS DECIMAL(5,2))) AS [StrikeRate]
			,wcp.[DateCreated]
			,wcp.[DateUpdated]
			,wcp.[DateArchived]
			,COUNT(1) OVER() AS [ResultCount]
		FROM
			[dbo].[WorldCupPlayer] AS wcp
			INNER JOIN [dbo].[Player] AS pr
				ON pr.[PlayerID] = wcp.[PlayerID]
			INNER JOIN [dbo].[Team] AS tm
				ON tm.[TeamID] = pr.[TeamID]
		WHERE
			wcp.[WorldCupPlayerID] = COALESCE(@WorldCupPlayerID, wcp.[WorldCupPlayerID])
			AND tm.[TeamID] = COALESCE(@TeamID, tm.[TeamID])
			AND pr.[DateOfBirth] BETWEEN @DateTimeOfBirthRangeBegin AND @DateTimeOfBirthRangeEnd
			AND ((@IncludeArchived = 0 AND wcp.[DateArchived] IS NULL) OR @IncludeArchived = 1)
		ORDER BY
			wcp.[Runs] DESC
		OFFSET (@Rows * @Page) ROWS
		FETCH NEXT @Rows ROWS ONLY;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(3000) = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH
END
GO

GRANT EXECUTE ON [dbo].[GetWorldCupPlayer] TO PUBLIC AS [dbo];
GO
