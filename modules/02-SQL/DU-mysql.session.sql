SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    e.deptno
FROM emp e
WHERE e.deptno IN (
    SELECT deptno
    FROM emp
    GROUP BY deptno
    HAVING COUNT(*) > 5
)
ORDER BY e.deptno, e.empno;