/* Stored procedure 1 */
/* How many copies of the book titled 'The Lost Tribe' are owned by the library 
branch whose name is 'Sharpstown'? */

USE db_Library
GO

CREATE PROCEDURE dbo.uspProcedure1
AS
SELECT 
a1.Number_Of_Copies
FROM book_copies a1
INNER JOIN library_branch a2 ON a1.BranchID = a2.BranchID
INNER JOIN books a3 ON a1.BookID = a3.BookID
WHERE a2.BranchName = 'Sharpstown' 
AND a3.Title = 'The Lost Tribe'
GO

[dbo].[uspProcedure1]