-- stored procedure that selects customers and their orders details
IF ( OBJECT_ID('dbo.spCustomerSelect') IS NOT NULL ) 
   DROP PROCEDURE dbo.spCustomerSelect
GO

CREATE PROCEDURE dbo.spCustomerSelect
                      
      
	  AS 
      BEGIN
	  select
            ROW_NUMBER() over(Partition by Customer.Id order by Product.ProductName asc) as [Product taken by customer],
			Customer.FirstName+' ' +Customer.LastName as Customer,

			Product.ProductName, 
			Supplier.CompanyName , 
			Supplier.Country as [Supplier Country],

			OrderItem.UnitPrice , 
			O.TotalAmount 

			from Customer
			join [Order] as o on Customer.Id = o.CustomerId
			join OrderItem on o.Id = orderItem.OrderId
			join Product on OrderItem.ProductId = Product.Id
			join Supplier on Supplier.Id = Product.SupplierId
      END
	  GO

spCustomerSelect
