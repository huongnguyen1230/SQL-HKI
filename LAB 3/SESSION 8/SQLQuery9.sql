USE AdventureWorks2016CTP3
CREATE TABLE OrgHierarchy(
	[DeptHID] [hierarchyid] Primary Key,
	[DeptID] [int] NULL,
	[DeptName] [varchar](50) NULL,
	[HeadOfDept] [varchar](25) NULL
)
INSERT INTO OrgHierarchy (DeptHID, DeptId, DeptName, HeadOfDept)
VALUES (hierarchyid::GetRoot(), 1, 'IT Department','Peter Jones')

CREATE PROCEDURE InsertDeptDetail(@OrgId as Int, @DeptId AS INT,
@DeptName VARCHAR(50), @HeadOfDept VARCHAR(25)) AS
BEGIN
DECLARE @OrgHID AS hierarchyid
DECLARE @LastOrgID AS hierarchyid
SELECT @OrgHID = DeptHID FROM OrgHierarchy WHERE DeptId = @OrgId
SELECT @LastOrgId = Max(DeptHID) FROM OrgHierarchy
WHERE DeptHID.GetAncestor(1) = @OrgHID

INSERT INTO OrgHierarchy VALUES
(@OrgHID.GetDescendant(@LastOrgID,Null), @DeptId, @DeptName,
@HeadOfDept)
RETURN @@RowCount
END

EXEC InsertDeptDetail 1,2,'Software Development','Martin Smith'
EXEC InsertDeptDetail 2,5,'External Projects','William Defoe'
EXEC InsertDeptDetail 2,6,'Internal Projects','Bob Richards'
EXEC InsertDeptDetail 1,3,'Hardware and Networking','Michael OReilly'
EXEC InsertDeptDetail 3,7,'Support','Roger Jennings'
EXEC InsertDeptDetail 1,4,'Operations','Julia Cameron'