-- ===================================================================
-- Author: Antony Ullas
-- Create date: 2019-Jul-30
-- Description: Set User data
-- Sample: EXEC [dbo].[SetUser]
----------------------------------------------------------------------
-- ChangedOn	ChangedBy		Reason
----------------------------------------------------------------------
-- 
-- ===================================================================

CREATE PROCEDURE [dbo].[SetUser]
(
	 @UserID INT = NULL OUTPUT
	,@UserName VARCHAR(256) = NULL
	,@UserDisplayName VARCHAR(256) = NULL
	,@UserIsAdmin BIT = NULL
	,@UpdatedBy INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION;

		DECLARE @AffectedRowCount INT;
		
		SET @UserID = CASE WHEN COALESCE(@UserID, 0) <= 0 THEN NULL ELSE @UserID END;
		SET @UserName = CASE WHEN COALESCE(LTRIM(RTRIM(@UserName)), '') = '' THEN NULL ELSE LTRIM(RTRIM(@UserName)) END;
		SET @UserDisplayName = CASE WHEN COALESCE(LTRIM(RTRIM(@UserDisplayName)), '') = '' THEN NULL ELSE LTRIM(RTRIM(@UserDisplayName)) END;
		SET @UserIsAdmin = CASE WHEN @UserIsAdmin IS NULL THEN 0 ELSE @UserIsAdmin END;
		SET @UpdatedBy = CASE WHEN COALESCE(@UpdatedBy, 0) <= 0 THEN NULL ELSE @UpdatedBy END;

		IF(@UpdatedBy IS NULL)
		BEGIN
			RAISERROR('Updated by User ID should be provided to create or update User', 16, 1);
			RETURN;
		END
		ELSE IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [UserID] = @UpdatedBy AND [IsAdmin] = 1 AND [DateArchived] IS NULL)
		BEGIN
			RAISERROR('User does not have enough permissions to perform this action', 16, 1);
			RETURN;
		END

		IF @UserID IS NULL
		BEGIN
			IF @UserName IS NULL
			BEGIN
				RAISERROR('User Name should be provided to create new User', 16, 1);
				RETURN;
			END
			ELSE IF @UserDisplayName IS NULL
			BEGIN
				RAISERROR('Display Name should be provided to create new User', 16, 1);
				RETURN;
			END
			ELSE IF EXISTS (SELECT 1 FROM [dbo].[User] WHERE [DateArchived] IS NULL AND [UserName] = @UserName)
			BEGIN
				RAISERROR('Another User exists with provided User Name', 16, 1);
				RETURN;
			END

			INSERT [dbo].[User]
			(
				 [UserName]
				,[DisplayName]
				,[IsAdmin]
			)
			VALUES
			(
				 @UserName
				,@UserDisplayName
				,@UserIsAdmin
			);
			SELECT @UserID = SCOPE_IDENTITY();
			SELECT @AffectedRowCount = CASE WHEN @@ERROR = 0 THEN @@ROWCOUNT ELSE 0 END;
		END
		ELSE
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM [dbo].[User] WHERE [UserID] = @UserID AND [DateArchived] IS NULL)
			BEGIN
				RAISERROR('User with provided ID not found', 16, 1);
				RETURN;
			END
			ELSE IF EXISTS (SELECT 1 FROM [dbo].[User] WHERE [UserID] <> @UserID AND [DateArchived] IS NULL AND [UserName] = @UserName)
			BEGIN
				RAISERROR('Another User exists with provided User Name', 16, 1);
				RETURN;
			END

			UPDATE [dbo].[User]
			SET
				 [DisplayName] = @UserDisplayName
				,[IsAdmin] = @UserIsAdmin
				,[DateUpdated] = GETDATE()
			WHERE 
				[UserID] = @UserID;
			SELECT @AffectedRowCount = CASE WHEN @@ERROR = 0 THEN @@ROWCOUNT ELSE 0 END;
		END

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(3000) = ERROR_MESSAGE();
		IF(XACT_STATE() <> 0) ROLLBACK TRANSACTION;
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH

	RETURN COALESCE(@AffectedRowCount, 0);
END
GO

GRANT EXECUTE ON [dbo].[SetUser] TO PUBLIC AS [dbo];
GO
