-- ===================================================================
-- Author: Antony Ullas
-- Create date: 2019-Jul-17
-- Description: Get Team data
-- Sample: EXEC [dbo].[GetTeam]
----------------------------------------------------------------------
-- ChangedOn	ChangedBy		Reason
----------------------------------------------------------------------
-- 
-- ===================================================================

CREATE PROCEDURE [dbo].[GetTeam]
(
	 @TeamID INT = NULL
	,@TeamCode VARCHAR(5) = NULL
	,@IncludeArchived BIT = NULL
	,@Rows INT = NULL
	,@Page INT = NULL
)
AS
BEGIN
	SET @TeamID = CASE WHEN COALESCE(@TeamID, 0) <= 0 THEN NULL ELSE @TeamID END;
	SET @TeamCode = CASE WHEN COALESCE(LTRIM(RTRIM(@TeamCode)), '') = '' THEN NULL ELSE LTRIM(RTRIM(@TeamCode)) END;
	SET @IncludeArchived = CASE WHEN @IncludeArchived IS NULL THEN 0 ELSE @IncludeArchived END;
	SET @Rows = CASE WHEN COALESCE(@Rows, 0) <= 0 THEN 50 ELSE @Rows END;
	SET @Page = CASE WHEN COALESCE(@Page, 0) <= 0 THEN 0 ELSE @Page END;

	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 tm.[TeamID]
			,tm.[Code] AS [TeamCode]
			,tm.[Name] AS [TeamName]
			,tm.[ColourPrimary] AS [TeamColourPrimary]
			,tm.[ColourSecondary] AS [TeamColourSecondary]
			,tm.[DateCreated]
			,tm.[DateUpdated]
			,tm.[DateArchived]
			,COUNT(1) OVER() AS [ResultCount]
		FROM
			[dbo].[Team] AS tm
		WHERE
			tm.[TeamID] = COALESCE(@TeamID, tm.[TeamID])
			AND tm.[Code] = COALESCE(@TeamCode, tm.[Code])
			AND ((@IncludeArchived = 0 AND tm.[DateArchived] IS NULL) OR @IncludeArchived = 1)
		ORDER BY
			tm.[Name] ASC
		OFFSET (@Rows * @Page) ROWS
		FETCH NEXT @Rows ROWS ONLY;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(3000) = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH
END
GO

GRANT EXECUTE ON [dbo].[GetTeam] TO PUBLIC AS [dbo];
GO
