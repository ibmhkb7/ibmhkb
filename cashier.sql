
//Transfored Table Creataaion
create table Trasfer_Bank(TransferId bigint identity(100,1) primary key, SourceAccount bigint foreign key references AccountDetails(AccountId) null, TargetAccount bigint foreign key references AccountDetails(AccountId) null,TransitionType varchar(30),updated date,TransferAmount int,comments varchar(40))

select * from AccountDetails

//select table
select *from transfer123

//insert table
insert into Trasfer_Bank  (TransitionType,updated,TransferAmount,comments) values ('savings','1997-7-7',20,'active')

//	 
	 create proc view_transferamount
	 as
	 begin
	 select *from Trasfer_Bank
	 end

	 drop procedure Deposit


	 create proc Deposit
	 (
	 @TransferId bigint out ,
	  @SourceAccount bigint,
	  @TargetAccount bigint,
	  @TransitionType varchar(30),
	  @TransferAmount int,
	  @update date,
	  @comments varchar(40))
	  
	  as
	  begin
	  set nocount on
	  --deposit--
	  if @TransitionType='Deposit'
	     begin 
		 insert into Trasfer_Bank (SourceAccount,TransitionType,updated,TransferAmount,comments) values(@SourceAccount,@TransitionType,@update,@TransferAmount,@comments)
		 update AccountDetails 
		 set Balanace=Balanace+(@TransferAmount)
		 where AccountId=@SourceAccount
		 end

	  if @TransitionType='Withdraw'
	     begin 
		 insert into Trasfer_Bank (SourceAccount,TransitionType,updated,TransferAmount,comments) values(@SourceAccount,@TransitionType,@update,@TransferAmount,@comments)
         update AccountDetails 
		 set Balanace=Balanace-(@TransferAmount)
		 where AccountId=@SourceAccount
		 end

		  if @TransitionType='Transfer'
	     begin 
		 insert into Trasfer_Bank (SourceAccount,TargetAccount,TransitionType,updated,TransferAmount,comments) values(@SourceAccount,@TargetAccount,@TransitionType,@update,@TransferAmount,@comments)

		  update AccountDetails 
		  set Balanace=Balanace-(@TransferAmount)
		  where AccountId=@SourceAccount

		  update AccountDetails 
		 set Balanace=Balanace+(@TransferAmount)
		 where AccountId=@TargetAccount
		 end

end

exec Deposit 1,100,101,'Transfer',400,'1995-4-4','Successfully'

select * from AccountDetails

select * from Trasfer_Bank