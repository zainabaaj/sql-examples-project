--stored procedure to insert values to customer table
IF ( OBJECT_ID('dbo.spCustomerInsert') IS NOT NULL ) 
   DROP PROCEDURE dbo.spCustomerInsert
GO

CREATE PROCEDURE dbo.spCustomerInsert
                      
       @FirstName                      VARCHAR(40) = NULL  , 
       @Lastname                       VARCHAR(40) = NULL  , 
       @City                           VARCHAR(40) = NULL  , 
       @Country                        VARCHAR(40) = NULL  , 
       @Phone                          VARCHAR(20) = NULL  
      
	  AS 
BEGIN 
     SET NOCOUNT ON 

     INSERT INTO dbo.Customer
          ( 
          
            FirstName ,
            LastName  ,
            City      ,
            Country   ,
            Phone                  
          ) 
     VALUES 
          ( 
             
			  @FirstName , 
			  @Lastname  , 
			  @City      , 
              @Country   , 
              @Phone                   
      
          ) 

END 
GO
spCustomerInsert   @FirstName= 'w', @LastName = 'khalifa',@City = 'istanbul', @Country ='turkey',@Phone='5350535654';

