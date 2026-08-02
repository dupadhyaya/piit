-- =========================================
-- CREATE DEPT TABLE
-- =========================================

DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);

-- =========================================
-- INSERT DATA INTO DEPT
-- =========================================

INSERT INTO dept VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- =========================================
-- CREATE EMP TABLE
-- =========================================

CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    job VARCHAR(20),
    mgr INT NULL,
    hiredate DATE,
    sal DECIMAL(10,2),
    comm DECIMAL(10,2) NULL,
    deptno INT,
    
    FOREIGN KEY (deptno)
    REFERENCES dept(deptno)
);

-- =========================================
-- INSERT DATA INTO EMP
-- =========================================

INSERT INTO emp VALUES
(7369, 'SMITH',  'CLERK',     7902, '1980-12-17',  800,  NULL, 20),

(7499, 'ALLEN',  'SALESMAN',  7698, '1981-02-20', 1600,   300, 30),

(7521, 'WARD',   'SALESMAN',  7698, '1981-02-22', 1250,   500, 30),

(7566, 'JONES',  'MANAGER',   7839, '1981-04-02', 2975,  NULL, 20),

(7654, 'MARTIN', 'SALESMAN',  7698, '1981-09-28', 1250,  1400, 30),

(7698, 'BLAKE',  'MANAGER',   7839, '1981-05-01', 2850,  NULL, 30),

(7782, 'CLARK',  'MANAGER',   7839, '1981-06-09', 2450,  NULL, 10),

(7788, 'SCOTT',  'ANALYST',   7566, '1987-04-19', 3000,  NULL, 20),

(7839, 'KING',   'PRESIDENT', NULL, '1981-11-17', 5000,  NULL, 10),

(7844, 'TURNER', 'SALESMAN',  7698, '1981-09-08', 1500,     0, 30),

(7876, 'ADAMS',  'CLERK',     7788, '1987-05-23', 1100,  NULL, 20),

(7900, 'JAMES',  'CLERK',     7698, '1981-12-03',  950,  NULL, 30),

(7902, 'FORD',   'ANALYST',   7566, '1981-12-03', 3000,  NULL, 20),

(7934, 'MILLER', 'CLERK',     7782, '1982-01-23', 1300,  NULL, 10);

-- =========================================
-- VERIFY DATA
-- =========================================

SELECT * FROM dept;

SELECT * FROM emp;

-- INSERT YOUR DATA INTO EMP
INSERT INTO emp VALUES
(1234, 'DHIRAJ',  'ANALYST', 7839, '1988-12-17',  5000,  100, 10);
