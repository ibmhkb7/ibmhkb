 
//Account Table Creatation 

create table AccountDetails_Mvc(Account_ID bigint primary key identity(987654000,1),Customer_ID bigint,AccountType varchar(30),Status varchar(30),Balanace Decimal,LastUpdate date, foreign key (Customer_ID) references  Customer_Mvc(Customer_ID))

create proc View_Account_Mvc as
select * from  AccountDetails


	  create proc InsertAccount_Mvc(
	    @Account_ID bigint out,
	    @Customer_ID bigint,
	    @AccountType varchar(30),
	    @Status varchar(30),
	    @Bal decimal,
	    @LastUpdate date)
	    as
	    	begin

	   	 insert into AccountDetails_Mvc values(@Customer_ID, @AccountType, @Status, @Bal, @LastUpdate)
	  	 set @Account_ID=@@IDENTITY
	  	 end

	   

//Transfored Table Creataaion
create table transfer123(TransferId bigint identity(100,1) primary key, SourceAccount bigint foreign key references AccountDetails(AccountId), TargetAccount bigint foreign key references AccountDetails(AccountId),TransitionType varchar(30),updated date,TransferAmount int,comments varchar(40))

/select table
select *from transfer123
insert into transfer123 values('savings',12-3-1995,20,'active')
	 
	 create proc view_transferamount
	 as
	 begin
	 select *from transfer123
	 end