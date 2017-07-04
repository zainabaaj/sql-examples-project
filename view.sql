if object_id ('dbo.vwSales') is not null 
begin 
drop view vwSales
end 
go 
-- a table that joins many values we can't reach easily at once 
--basically getting values from product table with order table through orderitem table 
create view vwSales as
select 
ROW_NUMBER() over(Partition by Customer.Id order by Product.ProductName asc) as [Product taken by customer],
Customer.Id as customerId,
Customer.FirstName+' ' +Customer.LastName  customer,
Product.ProductName,
o.OrderDate ,
OrderItem.UnitPrice , 
O.TotalAmount 
from Customer
join [Order] as o on Customer.Id = o.CustomerId
join OrderItem on o.Id = orderItem.OrderId
join Product on OrderItem.ProductId = Product.Id
go
-- i used the view in more efficient way in sp4
select customer,[Product taken by customer],Supplier.CompanyName ,ProductName
from vwSales join Supplier on Supplier.Id in (select Product.SupplierId from Product)
  