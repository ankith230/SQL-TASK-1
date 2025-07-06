CREATE VIEW vw_EmployeeTaskSummary AS
SELECT
  e.EmpID,
  e.Name AS EmployeeName,
  d.DeptName,
  SUM(CASE WHEN t.Completed = 0 THEN 1 ELSE 0 END) AS PendingTasks,
  SUM(CASE WHEN t.Completed = 1 THEN 1 ELSE 0 END) AS CompletedTasks,
  COUNT(t.TaskID) AS TotalTasks
FROM Employee e
LEFT JOIN Department d
  ON e.DeptID = d.DeptID
LEFT JOIN Task t
  ON e.EmpID = t.EmpID
GROUP BY
  e.EmpID, e.Name, d.DeptName;


  --.Use views for abstraction and security
 
 SELECT * FROM vw_EmployeeTaskSummary WHERE PendingTasks > 0;



  CREATE VIEW vw_PublicEmployeeTasks AS
SELECT
  e.EmpID,
  e.Name AS EmployeeName,
  d.DeptName,
  t.TaskName,
  CASE WHEN t.Completed = 1 THEN 'Completed' ELSE 'Pending' END AS Status
FROM Employee e
JOIN Department d
  ON e.DeptID = d.DeptID
JOIN Task t
  ON e.EmpID = t.EmpID;

