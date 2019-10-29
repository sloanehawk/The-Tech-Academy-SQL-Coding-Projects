/* Stored procedure 3 */
/* Retrieve the names of all borrowers who do not have any books checked out */

USE db_Library
GO

CREATE PROC dbo.uspProcedure3
AS
SELECT 
a1.Name
FROM borrower a1
LEFT JOIN book_loans a2 ON a1.CardNo = a2.CardNo
WHERE a2.CardNo IS NULL
GO

[dbo].[uspProcedure3]