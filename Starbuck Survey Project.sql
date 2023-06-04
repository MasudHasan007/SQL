SELECT *
FROM Project1..Starbucks_Customer
ORDER BY 3

--Shows the total number of customer 

SELECT COUNT (*) AS TotalCustomer
FROM Project1..Starbucks_Customer

--Shows returning and nonreturning customers

SELECT Continue_Buying, COUNT (*) AS CustomerCount
FROM Project1..Starbucks_survey
GROUP BY Continue_Buying

--Shows Customer behaviour on visiting Starbucks

SELECT Visit, COUNT (*) AS VisitNumber
FROM Project1..Starbucks_survey
GROUP BY Visit

--Shows returning customer by gender

SELECT Continue_Buying, COUNT(*) AS CustomerCount, Gender
FROM Project1..Starbucks_Customer C
JOIN Project1..Starbucks_survey S ON C.ID = S.ID
WHERE Continue_Buying = 'Yes'
GROUP BY Continue_Buying, Gender

--Shows age wise top customers

SELECT Price_Rate, Age
FROM Project1..Starbucks_Customer C
JOIN Project1..Starbucks_survey S ON C.ID = S.ID
WHERE Price_Rate = 5
GROUP BY Age, Price_Rate

--Let's find out the total number of male and female customer 

SELECT Gender, COUNT(*) AS TotalCustomer
FROM Project1..Starbucks_Customer
GROUP BY Gender

--Let's find out the age wise total number of male and female customer 

SELECT Age, COUNT(*) AS TotalCustomer
FROM Project1..Starbucks_Customer
GROUP BY Age
ORDER BY TotalCustomer DESC

--Shows the customer number according to employment status

SELECT Status, COUNT(*) AS TotalCustomer
FROM Project1..Starbucks_Customer
GROUP BY Status
ORDER BY TotalCustomer DESC

--Shows likelihood of purchasing item by age

SELECT Frequently_Purchased_Item, COUNT(*) as ItemNumber, Age
FROM Project1..Starbucks_Customer C
JOIN Project1..Starbucks_survey S ON C.ID = S.ID
GROUP BY Frequently_Purchased_Item, Age
ORDER BY Frequently_Purchased_Item

--Shows distance wise customer number

SELECT Distance, COUNT(*) as Customer
FROM Project1..Starbucks_survey
GROUP BY Distance
ORDER BY Customer DESC

--Shows the number of membership

SELECT Membership, COUNT (*) AS Customer
FROM Project1..Starbucks_Customer C
JOIN Project1..Starbucks_survey S ON C.ID = S.ID
GROUP BY Membership
ORDER BY Customer DESC
















