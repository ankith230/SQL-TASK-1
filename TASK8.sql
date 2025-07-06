CREATE TABLE Employee (
  EmpID INT PRIMARY KEY,
  Name VARCHAR(50),
  DeptID INT
);

CREATE TABLE Department (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50)
);

CREATE TABLE Task (
  TaskID INT PRIMARY KEY,
  EmpID INT,
  TaskName VARCHAR(100),
  Completed BIT
);

-- Insert sample data
INSERT INTO Department VALUES
  (1, 'HR'), (2, 'Engineering'), (3, 'Sales');

INSERT INTO Employee VALUES
  (1, 'Alice', 2),
  (2, 'Bob',   2),
  (3, 'Cara',  1),
  (4, 'Dave',  3);

INSERT INTO Task VALUES
  (101, 1, 'Build API',     0),
  (102, 1, 'Write Tests',   1),
  (103, 2, 'Fix Bug #123',  0);




  CREATE PROCEDURE GetEmpTasksOrColleagues
  @EmpID INT
AS
BEGIN
  SET NOCOUNT ON;

  IF EXISTS (SELECT 1 FROM Task WHERE EmpID = @EmpID)
  BEGIN
    SELECT
      e.EmpID, e.Name AS Employee,
      t.TaskName,
      CASE WHEN t.Completed = 1 THEN '✔ Completed' ELSE '✖ Pending' END AS Status
    FROM Employee e
    JOIN Task t ON e.EmpID = t.EmpID
    WHERE e.EmpID = @EmpID;
  END
  ELSE
  BEGIN
    DECLARE @dept INT = (SELECT DeptID FROM Employee WHERE EmpID = @EmpID);
    SELECT
      e.EmpID, e.Name AS Employee, d.DeptName
    FROM Employee e
    JOIN Department d ON e.DeptID = d.DeptID
    WHERE e.DeptID = @dept AND e.EmpID <> @EmpID;
  END
END;

EXEC GetEmpTasksOrColleagues @EmpID = 1;

CREATE FUNCTION dbo.fn_GetEmpMetric
(
  @EmpID INT,
  @ReturnMode BIT = 0
)
RETURNS VARCHAR(100)
AS
BEGIN
  DECLARE @result VARCHAR(100);

  IF @ReturnMode = 1
    RETURN (
      SELECT ISNULL(d.DeptName, 'Unknown Dept')
      FROM Employee e
      JOIN Department d USING (DeptID)
      WHERE e.EmpID = @EmpID
    );

  e
  RETURN (
    SELECT CAST(COUNT(*) AS VARCHAR(10))
    FROM Task
    WHERE EmpID = @EmpID AND Completed = 0
  );
END;

EXEC GetEmpTasksOrColleagues @EmpID = 3;



  CREATE FUNCTION dbo.fn_GetEmpMetric
(
  @EmpID INT,
  @ReturnMode BIT = 0    -- 0 = pending task count, 1 = department name
)
RETURNS VARCHAR(100)
AS
BEGIN
  IF @ReturnMode = 1
  BEGIN
    RETURN ISNULL(
      (SELECT d.DeptName
       FROM Employee e
       JOIN Department d
         ON e.DeptID = d.DeptID
       WHERE e.EmpID = @EmpID),
      'Unknown Dept'
    );
  END

  -- No ELSE needed—this is the default path
  RETURN CAST(
    ISNULL((SELECT COUNT(*) FROM Task WHERE EmpID = @EmpID AND Completed = 0), 0)
    AS VARCHAR(10)
  );
END;
GO
