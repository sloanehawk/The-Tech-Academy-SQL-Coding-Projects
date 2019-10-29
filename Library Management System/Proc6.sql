/* Stored procedure 6 */
/* Retrieve the names, addresses, and the number of books checked
out for all borrowers who have more than five books checked out */

USE db_Library
GO

CREATE PROC uspProcedure6
AS
SELECT 
a2.Name AS 'Borrower Name', a2.Address,
COUNT(a1.CardNo) AS 'Number of Books Checked Out'
FROM book_loans a1
INNER JOIN borrower a2 ON a1.CardNo = a2.CardNo
GROUP BY 
a2.Name, a2.Address, a1.CardNo
HAVING COUNT(a1.CardNo) > 5
GO 

[dbo].[uspProcedure6]