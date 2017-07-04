-- stored procedure for deleting from customer table
IF OBJECT_ID ( 'dbo.spCustomerDelete' ) IS NOT NULL   
    DROP PROCEDURE dbo.spCustomerDelete;  
GO  
CREATE PROCEDURE  spCustomerDelete @Id  int 
AS  
BEGIN
    DELETE FROM Customer
    WHERE Id = @Id
END
   
GO  
spCustomerDelete @Id = 90 ;