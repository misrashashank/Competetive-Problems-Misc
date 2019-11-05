/*
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 
as the second highest salary. If there is no second highest salary, 
then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
*/

# METHOD 1
# SELECT MAX(Salary) as SecondHighestSalary
# FROM Employee
# WHERE Salary < (SELECT MAX(Salary) FROM Employee)

# METHOD 2
SELECT MAX(e1.Salary) as SecondHighestSalary
FROM Employee e1, Employee e2
WHERE e1.Salary < e2.Salary

# METHOD 3 - Using LIMIT
SELECT IFNULL((SELECT DISTINCT Salary 
       FROM Employee
       ORDER BY Salary DESC
       LIMIT 1, 1), null) as SecondHighestSalary
