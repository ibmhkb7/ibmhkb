create table Login(RoleId int identity(1,1),UserName varchar(50),Password varchar(50),RoleName varchar(50))

insert into Login values('Admin','Admin','Admin');

create table Country(CountryID int identity(1,1) primary key,CountryName varchar(50));

create table State(StateID int identity(1,1) primary key,CountryID int ,StateName varchar(50), foreign key(CountryID) references Country(CountryID))

create table City(CityID int identity(1,1) primary key,StateID int ,CityName varchar(50), foreign key(StateID) references State(StateID))

create table Customer_Mvc(Customer_ID bigint identity(123456000,1) primary key,Customer_SSN_ID bigint unique,CustomerName varchar(50),Dob date,AddressLine1 varchar(50),AddressLine2 varchar(50),
Country varchar(50),State varchar(50),City varchar(50),Status varchar(50))


select * from Login


create proc View_Customer_Mvc
as
select * from Customer_Mvc;

create proc Insert_Customer_Mvc(@Customer_ID bigint out,
@Customer_SSN_ID bigint,
@CustomerName varchar(50),
@Dob date,
@AddressLine1 varchar(50),
@AddressLine2 varchar(50),
@Country varchar(50),
@State varchar(50),
@City varchar(50),
@Status varchar(50))
as
begin 
insert into Customer_Mvc values(@Customer_SSN_ID,@CustomerName,@Dob,@AddressLine1,@AddressLine2,@Country,@City,@State,@Status)
set @Customer_ID=@@IDENTITY
end

create proc Update_Customer_Mvc(@Customer_ID bigint,
@Customer_SSN_ID bigint,
@CustomerName varchar(50),
@Dob date,
@AddressLine1 varchar(50),
@AddressLine2 varchar(50),
@Country varchar(50),
@State varchar(50),
@City varchar(50),
@Status varchar(50))
as
begin 
update Customer_Mvc 
set Customer_SSN_ID=@Customer_SSN_ID,CustomerName=@CustomerName,Dob=@Dob,AddressLine1=@AddressLine1,AddressLine2=@AddressLine2,Country=@Country,City=@City,State=@State
 where @Customer_ID=Customer_ID
end

create proc Update_Status_Customer(@Customer_ID bigint,
@Status varchar(50))
as	
begin 
update Customer_Mvc
set Status=@Status
where Customer_ID=@Customer_ID
end

create proc Search_Customer_Mvc(@ID bigint
)
as
begin
select * from  Customer_Mvc where Customer_ID=@ID or Customer_SNN_ID=@ID
end




