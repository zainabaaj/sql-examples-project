--stored procedure for updating data in customer table
IF OBJECT_ID ( 'dbo.spCustomerUpdate' ) IS NOT NULL   
    DROP PROCEDURE dbo.spCustomerUpdate;  
GO  
CREATE PROCEDURE  spCustomerUpdate  
	   @Id                             int        ,
       @FirstName                      VARCHAR(40) = NULL  , 
       @Lastname                       VARCHAR(40) = NULL  , 
       @City                           VARCHAR(40) = NULL  , 
       @Country                        VARCHAR(40) = NULL  , 
       @Phone                          VARCHAR(20) = NULL  
       
AS  
BEGIN SET NOCOUNT ON 
  
    UPDATE Customer SET
            FirstName =  @firstName,
			LastName = @Lastname  ,
            City = @City           ,
			Country = @Country     ,
			Phone = @Phone
      WHERE id = @id

END
GO  
spCustomerUpdate @Id = 90 , @firstName= 'za', @LastName = 'B',@City = 'istanbul', @Country ='turkey',@Phone='5352816000';