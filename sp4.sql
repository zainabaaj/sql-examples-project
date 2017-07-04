/*stored procedure that takes a custmerid and search for its orders 
** from the view that links the products and orders and customers together
**then it prints each order with the time that it has been ordered by 
**the function that gives the period of the order date
**and prints the values of each order*/
IF ( OBJECT_ID('dbo.spCursor') IS NOT NULL ) 
   DROP PROCEDURE dbo.spCursor
GO


create procedure spCursor (@customerId int)
as
declare @oDate date
declare @cName nvarchar (200)
declare @p nvarchar (50)
declare @ago varchar(50)

declare customer_orders cursor for
(select  vw.customer , vw.OrderDate , vw.ProductName
from vwSales vw where vw.customerId = @customerId)


open customer_orders 
fetch next from customer_orders into @cName , @oDate,@p
       while @@FETCH_STATUS = 0  
begin
	
	set @ago = dbo.function3(@oDate)
    print @cName +' ' + @ago +' made an order for '+@p
    fetch  next from customer_orders into @cName , @oDate,@p
    end
	close customer_orders
	deallocate customer_orders
	GO
	spCursor 1