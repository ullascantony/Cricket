-- ===================================================================
-- Author: Antony Ullas
-- Create date: 2019-Jul-25
-- Description: Get User data
-- Sample: EXEC [dbo].[GetUser]
----------------------------------------------------------------------
-- ChangedOn	ChangedBy		Reason
----------------------------------------------------------------------
-- 
-- ===================================================================

CREATE PROCEDURE [dbo].[GetUser]
(
	 @UserID INT = NULL
	,@UserName VARCHAR(256) = NULL
	,@UserIsAdmin BIT = NULL
	,@IncludeArchived BIT = NULL
	,@Rows INT = NULL
	,@Page INT = NULL
)
AS
BEGIN
	SET @UserID = CASE WHEN COALESCE(@UserID, 0) <= 0 THEN NULL ELSE @UserID END;
	SET @UserName = CASE WHEN COALESCE(LTRIM(RTRIM(@UserName)), '') = '' THEN NULL ELSE LTRIM(RTRIM(@UserName)) END;
	SET @IncludeArchived = CASE WHEN @IncludeArchived IS NULL THEN 0 ELSE @IncludeArchived END;
	SET @Rows = CASE WHEN COALESCE(@Rows, 0) <= 0 THEN 50 ELSE @Rows END;
	SET @Page = CASE WHEN COALESCE(@Page, 0) <= 0 THEN 0 ELSE @Page END;

	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 usr.[UserID]
			,usr.[UserName]
			,usr.[DisplayName] AS [UserDisplayName]
			,usr.[IsAdmin] AS [UserIsAdmin]
			,usr.[DateCreated]
			,usr.[DateUpdated]
			,usr.[DateArchived]
			,COUNT(1) OVER() AS [ResultCount]
		FROM
			[dbo].[User] AS usr
		WHERE
			usr.[UserID] = COALESCE(@UserID, usr.[UserID])
			AND usr.[UserName] = COALESCE(@UserName, usr.[UserName])
			AND ((usr.[IsAdmin] = @UserIsAdmin) OR @UserIsAdmin IS NULL)
			AND ((@IncludeArchived = 0 AND usr.[DateArchived] IS NULL) OR @IncludeArchived = 1)
		ORDER BY
			usr.[UserID] ASC
		OFFSET (@Rows * @Page) ROWS
		FETCH NEXT @Rows ROWS ONLY;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(3000) = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH
END
GO

GRANT EXECUTE ON [dbo].[GetUser] TO PUBLIC AS [dbo];
GO
