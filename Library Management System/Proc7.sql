/* Stored procedure 7 */
/* For each book authored by Stephen King, retrieve the title and
the number of copies owned by the library branch whose name is Central. */

USE db_Library
GO

CREATE PROC uspProcedure7
AS
SELECT 
a2.Title, a1.Number_Of_Copies
FROM book_copies a1
INNER JOIN books a2 ON a1.BookID = a2.BookID
INNER JOIN library_branch a3 ON a1.BranchID = a3.BranchID
INNER JOIN book_authors a4 ON a1.BookID = a4.BookID
WHERE a3.BranchName = 'Central'
AND a4.AuthorName = 'Stephen King'
GO

[dbo].[uspProcedure7]