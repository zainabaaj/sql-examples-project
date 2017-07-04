-- transaction to update the stock and the total amount value after we insert another order
BEGIN TRANSACTION
	DECLARE @orderId INT = 1;
	DECLARE @productId INT = 6;
	DECLARE @unitPrice INT = 3;
	DECLARE @quantity INT = 2;

	INSERT OrderItem (OrderId, ProductId, UnitPrice, Quantity) VALUES (@orderId, @productId, @unitPrice, @quantity);
	UPDATE [Order] SET TotalAmount = TotalAmount + (@unitPrice * @quantity) WHERE Id = @orderId;

	DECLARE @currentStock INT = (SELECT Stock FROM Product WHERE Id = @productId);
	IF @quantity > @currentStock
	BEGIN
		RAISERROR('Not enough stock', 10, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	UPDATE Product SET Stock = Stock - @quantity WHERE Id = @productId;
COMMIT TRANSACTION