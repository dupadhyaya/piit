# My SQL Connection
pacman::p_load(DBI, RMySQL)
search() #noRMySQL

# Connection details
host1 <- "127.0.0.1"                # or your server's IP (e.g., "192.168.1.50")
port1 <- 3306                       # default MySQL port
user1 <- "piuser"
password1 <- "Pass@123"
dbname1 <- "piit"

# Connect
con2 <- dbConnect(RMySQL::MySQL(),  host = host1, user = user1, password = password1, dbname = dbname1)
print(con2) # should show <MySQLConnection:0,1>

#0 → no active results are being fetched yet.
#1 → the connection is currently open and valid.

dbListTables(con2)
dbListFields(con2, "students")   # replace with your table

df <- dbGetQuery(con2, "SELECT * FROM students LIMIT 5;")
df

students <- dbReadTable(con2, "students")
head(students)
str(students)

pacman::p_load(dbplyr, tidyverse)

students_tbl <- tbl(con2, "students")
students_tbl
tbl(con2, "student_scores")
(avg_by_subject <- students_tbl %>%  group_by(branch) %>%  summarise(avg_mark = mean(score, na.rm = TRUE)) %>% arrange(desc(avg_mark)))

avg_by_subject_df <- collect(avg_by_subject)
avg_by_subject_df 

dbListTables (con2)
# Parameterized query pattern (avoid paste() for safety)
tbl(con2, "student_scores")
tbl(con2, "students")
query <- "SELECT 
    st.id,     st.name,    st.branch,    st.score    AS overall_score,
    st.exam_date,    st.remarks,    ss.subject,
    ss.examdate AS subject_examdate,    ss.score    AS subject_score
FROM students st
JOIN student_scores ss ON st.id = ss.id;"

df <- dbGetQuery(con2, query)
head(df)

#disconnect
dbDisconnect(con2)
#end here

#redocheck-------
con2 <- dbConnect(RMySQL::MySQL(),  host = host1, user = user1, password = password1, dbname = dbname1)
print(con2) 
students_tbl <- tbl(con2, "students")
scores_tbl   <- tbl(con2, "student_scores")
joined_tbl <- students_tbl %>%   inner_join(scores_tbl, by = "id")
# Preview query SQL
joined_tbl

# Pull into R
df <- collect(joined_tbl)
head(df)
str(df)
