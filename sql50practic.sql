use org;
--  Query1
-- Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
desc worker;
select FIRST_NAME as WORKER_NAME from worker;
-- Query 2
-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select ucase(FIRST_NAME) as WORKER_NAME from worker;
-- Query 3
-- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct (department) from worker;
-- Query 4
-- Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- SUBSTRING(string, start, length)
-- The start position. The first position in string is 1.
select substring(FIRST_NAME ,1,3) as WORKER_NAME from worker;

-- Query 5
--  Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
/*
The Below Query Would give me the Entries where the first Name is Amitabh.
SELECT * FROM Worker 
WHERE first_name = 'Amitabh';

Now to find the position of a SubString s2 in a String1, we use INSTR Function
INSTR(string1, string2)
String1 - the main string to be searched in
String2 - The string to be searched in string1 - 0 returned if not found
Note: Ye Function Case Insensitive Search Karta Hai, meaning that case ka farak ni padta isse - both would be treated in a Similar Manner.
*/
select INSTR(first_name, 'b') from worker where first_name='Amitabh';

-- Query 6
-- Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- LTRIM() would remove it from the left Side.
select RTRIM(first_name) from worker;

-- Query 7
-- Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select LTRIM(DEPARTMENT) from worker;

-- Query 8
-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
-- Length() Function is used to find the length of the string in a Table.
SELECT DISTINCT(DEPARTMENT) ,LENGTH(DEPARTMENT) FROM worker;

-- Query 9
-- Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
-- REPLACE(string, from_string, new_string)
select replace(FIRST_NAME , 'a' ,'A') from worker;

-- Query 10
-- Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them and the concat Function can take Whatever number of Arguments are given to it.
-- CONCAT(expression1, expression2, expression3,...)
select concat(FIRST_NAME," ",LAST_NAME) AS COMPLETE_NAME from worker;

-- Query 11
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
-- By default, the Order that is given out would be in Ascending Order, therefore it is not important to mention the 'ASC' Clause
SELECT * FROM WORKER ORDER BY FIRST_NAME;

-- Query 12
-- Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
-- The order by clause can be passed multiple statements & not just ordering by some single column!
SELECT * FROM WORKER ORDER BY FIRST_NAME  ASC  , DEPARTMENT desc;

-- Query 13
-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
-- 'IN' Keyword can be used to pass Multiple Possible Arguments for the column being asked values from.
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Vipul','Satish');
-- Query 14
-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
-- The 'NOT' Keyword would exclude the values given in the Arguments mentioned by the user.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Query 15
-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
-- The '%' means that after the 'admin' text you can have any text & it would be still shown in the results.
-- Therefore, we'll be using Wildcards here.
select * FROM worker WHERE DEPARTMENT like'Admin%';

-- Query 16
-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
-- The '%' sign is helpul where there are no characters [NULL Character] or even when they are there, there can be n number of characters
SELECT * from WORKER WHERE FIRST_NAME LIKE '%a%';
-- Query 17
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * from WORKER WHERE FIRST_NAME LIKE '%a';

-- Query 18
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- Now here, we can't place '%' because it can then be replaced with any number of characters - but here all we want are 6 total alphaberts in the output.
-- Since we are sure about the number of alphabets, we'll be using the '_'.
-- Therefore, the h character would be placed at the 6th position in the String like -> '_____ h'
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____h';

-- Query 19
-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
-- We'll be using the 'BETWEEN' Keyword.
SELECT * FROM WORKER WHERE SALARY between 100000 and 500000;
-- Query 20
-- Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE JOINING_DATE LIKE '2014-02-%';

SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)=2014 and month(JOINING_DATE)=02;

-- Query 21
-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
-- We'll Have to use the 'Aggregate' functions here - they perform calculations on a set of values & return a single value.
select department ,count(department) from worker group by department having DEPARTMENT='Admin';

select department ,count(department) from worker where DEPARTMENT='Admin';

-- Query 22
-- Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.fro  (Salary >= 50000 AND Salary <= 100000)
select concat(first_name,' ',last_name) from worker where (Salary >= 50000 AND Salary <= 100000);

-- Query 23
-- Write an SQL query to fetch the no. of workers for each department in the descending order.
-- Clearly, Grouping requires to be done here!
select department ,count(department) as "Total Workers" from worker group by department order by count(DEPARTMENT) desc;
select department ,count(WORKER_ID) as "Total Workers" from worker group by department order by count(DEPARTMENT) desc;

-- Query 24
-- Write an SQL query to print details of the Workers who are also Managers.
-- We've the worker details in the 'Workers' table & all the title details in the 'titles' table.
-- We'll apply an inner join on 'Workers' table with 'title' table
-- Since after applying Join, we would get all the column titles from both the tables, if you want to get only one table's columns, you can write it like
-- 'SELECT w.*' FROM ...
select * from worker as w inner join title as t on t.WORKER_REF_ID=w.WORKER_ID where t.WORKER_TITLE='Manager';

-- Query 25
-- Write an SQL query to fetch number (more than 1) of DIFFERENT titles in the ORG;
-- We clearly need the Aggregation Function to Group the same worker tiles together
-- And if we've to put the filtering on the group values being returned, we'll be using the 'Having' Keyword.
SELECT * FROM worker inner join title where worker.WORKER_ID=title.worker_ref_id;

select w.*  ,count(t.WORKER_TITLE) from worker w 
inner join title as t 
on w.WORKER_ID=t.WORKER_REF_ID
group by w.WORKER_ID having count(t.WORKER_TITLE)>1;

SELECT w.*, COUNT(t.WORKER_TITLE) AS TitleCount
FROM worker w
INNER JOIN title t ON w.WORKER_ID = t.WORKER_REF_ID
GROUP BY w.WORKER_ID
HAVING COUNT(t.WORKER_TITLE) > 1;

SELECT w.*, GROUP_CONCAT(t.WORKER_TITLE) AS Titles, COUNT(t.WORKER_TITLE) AS TitleCount
FROM worker w
INNER JOIN title t ON w.WORKER_ID = t.WORKER_REF_ID
GROUP BY w.WORKER_ID
HAVING COUNT(t.WORKER_TITLE) > 1;

select WORKER_TITLE ,count(*) from title group by WORKER_TITLE having count(*)>1;

-- Query 26 [An IMPORTANT interesting Query]
-- Write an SQL query to show only odd rows from a table. auto inc id isliye
select * from worker where mod(WORKER_ID ,2) !=0 ;

-- Query 27
-- Write an SQL query to show only even rows from a table.
select * from worker where mod(WORKER_ID ,2) =0 ;

-- Query 28
-- Write an SQL query to clone a new table from another table.
create table worker_clone LIKE worker;
-- same data inset
INSERT INTO WORKER_CLONE 
SELECT * FROM Worker;

-- Query 29
-- Write an SQL query to fetch INTERSECTING records of two tables.
-- There is no Keyword like Intersect in SQL, & therefore we'lll be using the JOIN Keyword.
select worker.* from worker inner join worker_clone using(worker_id);

-- Query 30
-- Write an SQL query to show records from one table that another table does not have.
-- Here, we'll use the MINUS SET Operation
-- The result Set where the Match doesn't happen for the WORKER_IDs get shown.
select * from worker left join worker_clone using(WORKER_ID) where worker_clone.WORKER_ID=null;

-- Query 31
-- Write an SQL query to show the current date and time.
-- For current Date And Time Operation, we are going to use the Dual Table.
-- The DUAL is special one row, one column table present by default in all Oracle databases.
-- The DUAL is special one row, one column table present by default in all Oracle databases.
select curdate();

-- For time, we use the now() function - but it gives the complete date & time [the timestamp]
-- The time returned back are that of the server, it might not necessarily be similar to that of your current Location.
SELECT now();

-- Query 32
-- Write an SQL query to determine the n (say n=5)  record highest salary from a table.
-- The 'Limit' Keyword restricts the number of values being returned.
select * from worker order by SALARY desc LIMIT 5;

-- Query 33
-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- There are two ways of doing it

-- way 1
-- There are two ways of doing it:
-- Way 1 [by using the limit keyword And the Offset Keyword]
-- The 'OFFSET' argument is used to identify the starting point to return rows from a result set. Basically, it excludes the first set of records.
-- The 'limit' keyword would be restricting the number of rows that should be given as an output.
-- The value of the OFFSET Keyword is 'n-1', it means that to get the nth highest record, you wish to start printing the values from n-1th row as indexing starts from 0.
select distinct(salary) from worker  order by salary desc limit 1 offset 4;

-- or n-1, 1 --<nth
select distinct(salary) from worker  order by salary desc limit 4,1;

-- OR it can also be done by this 
-- SELECT DISTINCT(Salary) 
-- FROM Worker
-- ORDER BY Salary DESC
-- LIMIT 1 OFFSET n-1;

-- Way 2 [by using Correlated sub-query] Shown in the Query 34
-- Query 34
-- Write an SQL query to determine the 5th highest salary without using LIMIT keyword.

select * from worker as w where 5 =(
	select count(distinct (w2.salary)) from worker as w2 where w.salary <= w2.salary
);

-- Query 35
-- Write an SQL query to fetch the list of employees with the same salary.
-- The below query [a default Inner Join] would also do the comparison of the employee with himself/herself but we don't want this.
select w1.* from worker w1 inner join worker w2 on w1.salary=w2.salary and w1.worker_id != w2.worker_id;

-- without using join
select w1.* from worker w1 ,worker w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;

-- Query 36
-- Write an SQL query to show the second highest salary from a table using sub-query.  no sub query n2 no limit
select max(salary) from worker where salary not in (select max(salary) from worker) ;

-- Query 37
-- Write an SQL query to show one row twice in results from a table. [Not a that useful query but it is useful in clearing the concept about Unions]
-- union gives disntict
-- union all gives both tbale entry
select * from worker
union all
select * from worker order by worker_id;

-- Query 38
-- Write an SQL query to list worker_id who does not get bonus.
select worker.* from worker left join bonus b on b.worker_ref_id=worker.worker_id where b.worker_ref_id is null;

-- way 2
select * from worker where worker_id not in (select worker_ref_id from bonus);

-- Query 39
-- Write an SQL query to fetch the first 50% records from a table.
-- 8 aaya inner se then 4 and 4 se k print as autoinc hai
select * from worker where worker_id <= (select count(worker_id)/2 from worker);

-- Query 40
-- Write an SQL query to fetch the departments that have less than 4 people in it. dont use where invalid snatc
select department ,count(department) from worker group by department having count(department)<4;

-- Query 41
-- Write an SQL query to show all departments along with the number of people in there.
select department ,count(department) from worker group by department;

-- Query 42 [Interesting]
-- Write an SQL query to show the last record from a table. 
-- jiski worker id last hai auto inc hora that means max term
select * from worker where worker_id = (select max(worker_id) from worker);

-- Query 43
-- Write an SQL query to fetch the first row of a table. same as ab 
select * from worker where worker_id = (select min(worker_id) from worker);

-- Query 44
-- Write an SQL query to fetch the last five records from a table. n=5 
select * from worker where worker_id order by worker_id limit 3,5;

-- Again, we use the Auto Incrmenting Property of Worker_id & order them in the descending order & then limit the results
SELECT * 
FROM Worker
ORDER BY worker_id DESC
LIMIT 5;
-- But the above query is actually reversing the order in which how the values were present in the table, so we need to correct this well & reverse its output to get the original way how the rows were stored in the Table
(select * from worker order by worker_id desc limit 5) order by worker_id;

-- Query 45
-- Write an SQL query to print the name of employees having the highest salary in each department.
-- this gives salary only we want name
SELECT department, MAX(Salary) 
FROM Worker 
GROUP BY department;

-- i want 3 max
select w.department, w.first_name, w.salary  from
 (select max(salary) as maxsal ,department from worker group by department) temp
 inner join worker
 on temp.department = w.department and temp.maxsal=w.salary
;

-- Query 46
-- Write an SQL query to fetch three max salaries from a table using co-related subquery. no limit
-- if limit
(select * from worker order by salary desc limit 3) order by worker_id;

-- no limit
-- iknew inly condi from 3rd hightes is = here >=
select distinct(w1.salary) from worker  w1
where 3>= (
	select count(distinct w2.salary) from worker w2 where w1.salary<=w2.salary) order by w1.salary desc
;
-- Query 47
-- Write an SQL query to fetch three min salaries from a table using co-related subquery
select distinct(w1.salary) from worker  w1
where 3>= (
	select count(distinct w2.salary) from worker w2 where w1.salary>=w2.salary) order by w1.salary
;

-- For obtaining the 'n' Minimum salaries, we can have a general form for the query like below with just the comparison values changed:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary >= w1.Salary
-- ) ORDER By Salary;

-- using limit
-- SELECT Distinct(Salary)
-- From Worker 
-- ORDER By Salary DESC
-- LIMIT n;

-- Query 48
-- Write an SQL query to fetch nth max salaries from a table.
-- For obtaining the 'n' Maximum salaries, we can have a general form for the query like below:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary <= w1.Salary
-- ) ORDER By Salary;

-- Query 49
-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department ,sum(salary) from worker group by department;

-- Query 50
-- Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT first_name, salary
FROM Worker Where 
Salary = (
  SELECT Max(Salary)
  FROM Worker
);


-- select f_name, max(salary) from worker ;  this wrong as it returns only max salary not full row

-- Query 51
-- Remove the Reversed Number Pair from the given Table


create table pairs(
	A int ,
	B int
);

insert into pairs values (1,2) ,(2,4) ,(2,1),(3,2),(4,2),(5,6),(6,5),(7,8);
select * from pairs;

select p1.* from pairs  p1
left join
pairs  p2
on p1.a=p2.b and p1.b=p2.a where p2.a is null OR p1.a<p2.a;

-- p2.a IS NULL: This condition ensures that only one of each reversed pair is selected. If no reversed pair is found, p2.a will be NULL, which means this is not a reversed pair (or the pair has no reverse).

-- p1.a < p2.a: If a reversed pair exists, this ensures that only one instance of the pair is selected, keeping the pair where p1.a < p2.a (i.e., where the a value is smaller). This avoids keeping both pairs (1, 2 and 2, 1), ensuring only one of them is in the result

-- using coorelated sbquery
select * from pairs p1 where not exists (select * from pairs p2 where p1.a=p2.b and p1.b=p2.a and p1.a>p2.a);