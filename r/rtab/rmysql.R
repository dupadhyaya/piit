# login to mysql

pacman::p_load(DBI, RMariaDB, dplyr)
dbname1='piit'; user1='root'; pswd1 = 'Mysql@123'
con <- dbConnect(  RMariaDB::MariaDB(),  host  = "localhost",  port = 3306,  dbname = dbname1,  user     = user1,  password = pswd1)
con
# Test the connection
dbGetQuery(con, "SELECT VERSION() AS mysql_version")

# Example query
dbGetQuery(con, 'show databases')
tables1 <- dbGetQuery(con, "show tables;")
tables1


#tablerows------
emp <- dbReadTable(con, "emp")
head(emp)
dept <- dbReadTable(con, "dept")
head(dept)


# Retrieve selected rows
rows2 <- dbGetQuery(  con,  "SELECT * FROM emp LIMIT 10")
rows2
head(emp,10)

# Filter rows safely
rows3a <- dbGetQuery(con,"SELECT * FROM emp WHERE deptno = ?", params = list(10))
rows3a
emp %>% filter(deptno == '10')

rows3b <- dbGetQuery(con,"SELECT * FROM emp WHERE deptno IN (?,?)", params = list(10,20))
rows3b
emp %>% filter(deptno %in% c(10,20))

#Other SQL queries-----
dept_sum <- dbGetQuery(con,'SELECT deptno, count(*) as empCount, avg(sal) as avgSal from emp group by deptno order by deptno')
dept_sum

aboveAvgSal <- dbGetQuery(con, "  SELECT empno, ename, sal  FROM emp  WHERE sal > (   SELECT AVG(sal) FROM emp  )  ORDER BY sal DESC")
aboveAvgSal

#JoinTable----
empDepts <- dbGetQuery(con, "  SELECT    e.empno,  e.ename,  e.sal,d.dname, d.loc FROM emp AS e  INNER JOIN dept AS d ON e.deptno = d.deptno  ORDER BY d.dname, e.ename")
empDepts
emp %>% merge(., dept, by='deptno')
#windowFuncts----
#Window functions calculate across related rows without combining them into one row. 
#Rank employees by salary within each department:
ranked_employees <- dbGetQuery(con, "   SELECT    empno,    ename,    deptno,    sal,    RANK() OVER ( PARTITION BY deptno ORDER BY sal DESC ) AS salary_rank  FROM emp  ORDER BY deptno,salary_rank
")
ranked_employees

emp %>%  select(ename, deptno, sal) %>% group_by(deptno) %>%  mutate(rowno = row_number(desc(sal)), rank_value= min_rank(desc(sal)), dense_rank_value  = dense_rank(desc(sal))) %>%   arrange(deptno, rowno) %>%   ungroup()

.
employee_comparison <- dbGetQuery(con, "  SELECT    ename,    deptno,    sal,    AVG(sal) OVER (PARTITION BY deptno) AS department_average,  sal - AVG(sal) OVER (PARTITION BY deptno) AS difference_from_average
  FROM emp  ORDER BY deptno, sal DESC")
employee_comparison

#CTE------
#A CTE—Common Table Expression—is a temporary named result set created with WITH. It is not a function or permanent table; it exists only while one SQL statement runs.
dept_summary <- dbGetQuery(con, " WITH department_stats AS 
(SELECT   deptno, COUNT(*) AS employee_count, AVG(sal) AS average_salary    FROM emp    GROUP BY deptno )
SELECT *   FROM department_stats   WHERE average_salary > 2500  ORDER BY average_salary DESC ")
dept_summary
#eq to
dbGetQuery(con,'SELECT   deptno, COUNT(*) AS employee_count, AVG(sal) AS average_salary    FROM emp    GROUP BY deptno' ) # from this show only those dept where avgsal > 2500-> which is 1 dept only
#WITH department_stats AS (...) SELECT * FROM department_stats;
