/* Stored procedure 5 */
/* For each library branch, retrieve the branch name and the 
total number of books loaned out from that branch */

USE db_Library
GO

CREATE PROC uspProcedure5
AS
SELECT 
a1.BranchName AS 'Library Branch', COUNT(a2.BookID) AS 'Number of books checked out'
FROM library_branch a1
INNER JOIN book_loans a2 ON a1.BranchID = a2.BranchID
GROUP BY a1.BranchName
GO

[dbo].[uspProcedure5]
