/* Stored procedure 4 */
/* For each book that is loaned out from the 'Sharpstown' branch and whose DueDate is today,
retrieve the book title, the borrower's name, and the borrower's address */

USE db_Library
GO

CREATE PROC dbo.uspProcedure4
AS
SELECT
a4.Title AS 'Book Title', a3.Name AS 'Borrower Name', 
a3.Address AS 'Borrower Address'
FROM book_loans a1
INNER JOIN library_branch a2 ON a1.BranchID = a2.BranchID
INNER JOIN borrower a3 ON a1.CardNo = a3.CardNo
INNER JOIN books a4 ON a1.BookID = a4.BookID
WHERE a1.DateDue = CONVERT(DATE, GETDATE())
AND a2.BranchName = 'Sharpstown'
GO

[dbo].[uspProcedure4]
