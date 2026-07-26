SELECT e.*, d.*
FROM emp AS e
JOIN dept AS d
	ON e.deptno = d.deptno;
