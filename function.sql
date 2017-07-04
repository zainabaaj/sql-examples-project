-- a fuction that calculates the time since the customer has ordered 
GO
if object_id ('dbo.function3') is not null 
begin 
drop function function3
end 
go 

create  FUNCTION [dbo].[function3] (@date DATETIME) 
RETURNS VARCHAR(50) AS
BEGIN 
	DECLARE @diffYear INT = DATEDIFF(yy, @date, GETDATE());
	DECLARE @diffMonth INT = DATEDIFF(mm, @date, GETDATE());
	DECLARE @diffDay INT = DATEDIFF(dd, @date, GETDATE());
	
	declare @y nvarchar(20);
	declare @m nvarchar(20);
	declare @d nvarchar(20);

	IF @diffYear > 0
		set @y = CAST(@diffYear AS nVARCHAR(4)) + ' year(s)';

	IF @diffMonth <12
		set @m = CAST(@diffMonth AS VARCHAR(4)) + ' month(s)';
	if @diffMonth>12
	 set @m = CAST((@diffMonth-(@diffYear*12)) AS nVARCHAR(4)) + ' month(s)';
	IF @diffDay < 365
		set @d = CAST(@diffDay AS VARCHAR(4)) + ' day(s) ';
		if @diffDay>365
		set @d = CAST(@diffDay-(@diffYear*365)-((@diffMonth-(@diffYear*12))*30) AS VARCHAR(4)) + ' day(s) ';


	RETURN @y+''+@m+''+ @d +'ago';
END



