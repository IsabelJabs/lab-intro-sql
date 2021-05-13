# 1. Write a SELECT statement that lists the customerid along with their account number, type, the city the customer lives in and their postalcode.
SELECT c.CustomerID, c.AccountNumber, c.CustomerType, a.City, a.PostalCode
FROM adventureworks.customer c
JOIN customeraddress ca on c.CustomerID = ca.CustomerID
JOIN address a on a.AddressID = ca.AddressID;

# 2. Write a SELECT statement that lists the 20 most recently launched products, their name and colour
SELECT p.ProductID, p.name, p.color
FROM adventureworks.product p 
ORDER BY sellstartdate DESC
LIMIT 20;

# 3. Write a SELECT statement that shows how many products are on each shelf in 2/5/98, broken down by product category and subcategory
SELECT pi.shelf, pi.productID, pi.quantity, pc.name, count(ProductID) FROM adventureworks.productinventory pi
JOIN product p on p.productID = pi.productID
JOIN Productsubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
JOIN Productcategory pc ON pc.ProductCategoryID = ps.ProductCategoryID
WHERE pi.ModifiedDate= '1998-05-02 00:00:00'
GROUP BY pi.shelf, ps.ProductSubcategoryID, pi.ModifiedDate

# 4. I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?
#vendor>vendorcontact>contact
SELECT c.FirstName, c.MiddleName, c.LastName, c.EmailAddress
FROM adventureworks.contact c
JOIN vendorcontact vc ON c.contactID = vc.contactID
JOIN vendor v on vc.vendorID = v.vendorID
WHERE c.FirstName='Stuart' 

# 5. What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?
SELECT * FROM salesterritory
# name GERMANY, CountryRegionCode: DE, TerritoryID 8
SELECT sum(TaxAmt)
FROM salesorderheader
WHERE TerritoryID = 8 

# 6. Summarise the distinct # transactions by month
SELECT count(TransactionID), MONTH(TransactionDate)
FROM transactionhistory
GROUP BY MONTH(TransactionDate)

# 7. Which ( if any) of the sales people exceeded their sales quota this year and last year?
SELECT (sum(salesYTD) -sum(salesquota)) as exceeded_salesTY, SalesPersonID
FROM salesperson
GROUP BY SalesPersonID 

SELECT (sum(saleslastyear) -sum(salesquota)) as exceeded_salesLY, SalesPersonID
FROM salesperson
GROUP BY SalesPersonID 

# 8. Do all products in the inventory have photos in the database and a text product descriptions? 
#productphoto: productphotoID
#productproductphoto: productID + productphotoID
#productinventory: ProductID
#productdescription: ProductDescriptionID

# 9. What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?
SELECT round(avg(unitprice),2), p.name
FROM purchaseorderdetail pd
JOIN product p on p.ProductID = pd.ProductID
WHERE RejectedQty > 0
GROUP BY p.name
ORDER BY p.name ASC

# 10. How many engineers are on the employee list? Have they taken any sickleave?
SELECT employeeID, title, sickleavehours 
FROM employee
WHERE title LIKE '%engineer%'

# 11. How many days difference on average between the planned and actual end date of workorders in the painting stages?
SELECT OperationSequence, avg(date(ScheduledEndDate) - date(ActualEndDate)) as diff FROM workorderrouting
GROUP BY OperationSequence 
