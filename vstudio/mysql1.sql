-- show all data from emp table
select * from emp;
-- join emp and dept table to show all data from both tables
select e.*, d.* from emp as e join dept as d on e.deptno = d.deptno;SELECT *
FROM emp;SELECT e.*, d.*
FROM emp AS e
JOIN dept AS d
	ON e.deptno = d.deptno;
-- find department name and employee name for all employees for dept no 10
SELECT e.ename, d.dname
FROM emp AS e
JOIN dept AS d
	ON e.deptno = d.deptno
WHERE e.deptno = 10;
-- show all employees earning more than 3000
-- show employees ordered by salary descending
-- find average salary department wise
-- count employees in each department
