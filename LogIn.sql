//LogIn Table

create table Login(UserId  int primary key not null,UserName varchar(20) not null,Password varchar(50) not null,RoleName varchar(50) not null)

//Inserting the Data
insert into Login values(1,'Executive001','Executive001','Executive')
insert into Login values(2,'Cashier002','Cashier002','Cashier')

//Inserting Executive and Cashier credentials
select * from Login

//stored procedure creatation for  Login
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
					  SELECT -2 [UserId], '' [Roles]
				END
		  END
     
	END

	drop procedure Validate_User