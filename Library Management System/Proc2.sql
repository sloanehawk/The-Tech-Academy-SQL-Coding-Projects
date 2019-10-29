/* Stored procedure 2 */
/* How many copies of the book titled 'The Lost Tribe' are owned by each library
branch? */

USE db_Library
GO

CREATE PROC dbo.uspProcedure2
AS
SELECT 
a1.Number_Of_Copies, a2.BranchName
FROM book_copies a1
INNER JOIN library_branch a2 ON a1.BranchID = a2.BranchID
INNER JOIN books a3 ON a1.BookID = a3.BookID
WHERE a3.Title = 'The Lost Tribe'
GO

[dbo].[uspProcedure2]

