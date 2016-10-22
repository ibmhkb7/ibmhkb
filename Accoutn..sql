
//Account Table Creatation 

create table AccountDetails(AccountId bigint identity(100,1) primary key,Customer_SSN_ID bigint,AccountType varchar(30),Status varchar(30),Balanace Decimal,LastUpdate date, foreign key (Customer_SSN_ID) references  CustomerCreation(Customer_SSN_ID),  unique(Customer_SSN_ID,AccountType))

Drop table AccountDetails
//select Selection
select * from  AccountDetails

	
select * from AccountDetails

insert into AccountDetails values(100000000,'Saving','Active',10000.90,'2015-5-5')

	  create proc InsertAccount(
	    @AccountId bigint out,
	    @CustomerID bigint,
	    @AccountType varchar(30),
	    @Status varchar(30),
	    @Bal decimal,
	    @LastUpdate date)
	    as
		   
	    	begin
	   	       insert into AccountDetails values(@CustomerID, @AccountType, @Status, @Bal, @LastUpdate)
	  	       set @AccountId=@@IDENTITY
	  	 end

		 create proc Check_Account_Existance
		 (@CustomerID bigint,
		 @AccountType varchar(50))
		 as
		 begin
		 select AccountId from AccountDetails where @CustomerID=Customer_SSN_ID and @AccountType=AccountType
		 end

		 exec Check_Account_Existance 100000000,'Saving'

	create proc Update_Account_Status(@AccountID bigint )
	as
	begin 
	update  AccountDetails
	set Status='Deactive'
	where AccountId=@AccountId
	end


	create proc View_Account_Status
	as
	select * from AccountDetails
   
    exec View_Account_Status


	   
	  exec InsertAccount 0,100000000,'Current','Active',10000.90,'2015-5-5'



