GO
if object_id ('dbo.trgAfterInsert') is not null 
begin 
drop trigger trgAfterInsert
end 
go
CREATE TRIGGER trgAfterInsert ON [dbo].[customer] AFTER INSERT
AS
	declare @fName nvarchar(40);
	declare @lName nvarchar(40);
	declare @city nvarchar(40);
	declare @country nvarchar(40);
	declare @phone nvarchar(40);

	select @fName=i.FirstName from inserted i;	
	select @lName=i.LastName from inserted i;	
	select @city=i.City from inserted i;	
	select @country=i.Country from inserted i;	
	select @phone=i.Phone from inserted i;	

	insert into Customer
           (FirstName,LastName,City,Country,Phone) 
	values(@fName,@lName,@City,@Country,@Phone);

	PRINT 'AFTER INSERT trigger fired.'
GO
	insert into Customer
           (FirstName,LastName,City,Country,Phone) 
	values('zaina','baaj','yalova','turkey','053565458');