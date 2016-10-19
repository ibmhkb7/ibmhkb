create table CustomerCreation(Customer_SSN_ID bigint identity(100000000,1) primary key,CustomerName varchar(20),Age int ,Dob date ,AddressLine1 varchar(200),AddressLine2 varchar(200),City varchar(20),State varchar(20));

create table CustomerStatus(Customer_SSN_ID bigint primary key,Message Varchar(100),Status varchar(200),LastUpdate date)


Create Table State
(
StateId Int Primary Key,
StateName Varchar(30)
)
select * from state

Create Table StateCity
(
CityId Int,
StateId Int Foreign Key References State(StateId),
City Varchar(30)
)

select * from StateCity;

Insert Into State Values(1001,'U.P')
Insert Into State Values(1002,'Kerala')
Insert Into State Values(1003,'Kasmir')
Insert Into State Values(3001,'Punjab')
Insert Into State Values(3003,'Sind')

Insert Into StateCity Values(11,1001,'Kanpur')
Insert Into StateCity Values(31,1003,'Jammu')
Insert Into StateCity Values(32,1003,'Manali')

Insert Into StateCity Values(42,1001,'Agra')
Insert Into StateCity Values(52,1001,'Alahbad')
Insert Into StateCity Values(62,1001,'Aligarh')

Insert Into StateCity Values(71,1002,'Kochi')
Insert Into StateCity Values(72,1002,'Tiruanantpuram')
Insert Into StateCity Values(73,1002,'Kollam')

Insert Into StateCity Values(81,1003,'Shrinagar')
Insert Into StateCity Values(82,1003,'Anantnag')



Insert Into StateCity Values(91,3001,'Amritsar')
Insert Into StateCity Values(92,3001,'Bhatinda')
Insert Into StateCity Values(93,3001,'Ludhiana')



select * from  StateCity

select * from  State

create table CustomerStatus(Customer_SSN_ID bigint primary key,Message Varchar(100),Status varchar(200),LastUpdate date, foreign key(Customer_SSN_ID) references CustomerCreation(Customer_SSN_ID))
create procedure usp_Customer_Creation
	(@Customer_SSN_ID bigint out,
@CustomerName varchar(50),
@Age int,
@Dob date,
@AddressLine1 varchar(200),
@AddressLine2 varchar(200),
@City varchar(20),
@State varchar(20),
@Status varchar(100),
@Message varchar(200),
@LastUpdate date)
AS
Begin
insert into CustomerCreation values(@CustomerName,@Age,@Dob,@AddressLine1,@AddressLine2 ,@City,@State) 
set @Customer_SSN_ID=@@identity
insert into CustomerStatus values(@Customer_SSN_ID,@Message,@Status,@LastUpdate)
End

exec usp_Customer_Creation 1,'Hanumanth','12','2016-8-9','Bangalore','Karnataka','Davangere','hkb','Active','Pending','2015-9-7'

select * from CustomerStatus
select *from CustomerCreation
drop procedure usp_Customer_Creation

create proc View_Customer as
select * from CustomerCreation;


create proc View_Customer_By_Id(@Customer_SSN_ID bigint)
 as
 begin 
select * from CustomerCreation  where @Customer_SSN_ID=Customer_SSN_ID
end

exec View_Customer_By_Id 100000000

select * from UserDetails1
insert into UserDetails1 values('Executive001','Executive001','Executive');




	insert into Login values(3,'hkbhkb7','hkbhkb7','executive')

	


	select * from CustomerStatus 
	insert into CustomerStatus values(100000001,'Active','Cstomer in Progress','2016-09-15')

	create proc usp_Update_Status(@CustomerId bigint)
	as
	begin
	update CustomerStatus 
	set Status='Deactive'
	where CustomerStatus.Customer_SSN_ID=@CustomerId
	end