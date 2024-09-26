Database: https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all
1.Вывести имена и ID пяти самых покупаемых продуктов. А также сколько их было продано.
SELECT ProductID, ProductName, SUM (OrderDetails.Quantity) as ProductSum FROM Products
JOIN OrderDetails on Products.ProductID = OrderDetails.ProductID
GROUP BY ProductID, ProductName
ORDER BY ProducctSum DESC LIMIT 5;

2.Покажите сколько заказов было сделано каждым грузоотправителем. Отобразите имена грузоотправителей и количество выполненных ими заказов.
SELECT COUNT (OrderID) AS OrderQuan, ShipperName from Shippers
JOIN Orders ON Shippers.ShipperID=Orders.ShipperID
GROUP BY ShipperName;

3. Получитe имена клиентов и средний чек заказов, который сумма которого составляет от 1000 долларов(включительно).  Среднюю сумму заказа необходимо округлить до двух сотых.
SELECT CustomerName, ROUND (AVG (Products.Price * OrderDetails.Quantity), 2) AS AvgBill FROM Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderID=OrderDetails.OrderID
JOIN Products on OrderDetails.ProductID=Products.ProductID
GROUP BY CustomerName
HAVING AvgBill >= 1000;

