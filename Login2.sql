Create PROCEDURE [dbo].[Validate_User]
		  @Username NVARCHAR(50),
		  @Password NVARCHAR(50)
	AS
	BEGIN
		  SET NOCOUNT ON;
		  DECLARE @UserId INT,  @RoleName varchar(50) 
  
		  SELECT @UserId= UserId, @RoleName= RoleName
		  FROM Login WHERE UserName = @Username AND [Password] = @Password
   
		  BEGIN
				  IF @UserId IS NOT NULL
				  BEGIN
					  SELECT UserId,RoleName [Roles] ,UserName,Password from Login where @UserID=UserId
				END
				ELSE
				BEGIN
					  SELECT -2 [UserId], '' [Roles],''[UserName],''[Password]
				END
		  END
     
	END

	drop procedure Validate_User