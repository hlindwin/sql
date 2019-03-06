-- Example of row number
-- use https://livesql.oracle.com/

select 
  faculty.first_name
  , faculty.last_name
  , faculty.Salary
  , jobs.Job_Title
  , row_number() over(partition by faculty.job_id order by faculty.salary desc) HighestPaidByJob

from ad.ad_faculty_details faculty
left join ad.ad_jobs jobs 
  on faculty.job_id = jobs.job_id

/* result is

FIRST_NAME	LAST_NAME	SALARY	JOB_TITLE	HIGHESTPAIDBYJOB
Lex	De Haan	15000	Associate Faculty	1
Alexander	Hunold	9000	Associate Faculty	2
Daniel	Faviet	39000	Head of the Department	1
Nancy	Greenberg	21200	Head of the Department	2
Valli	Pataballa	28000	Principal Faculty	1
Diana	Lorentz	18000	Principal Faculty	2
Bruce	Ernst	6000	Senior Faculty	1
David	Austin	4800	Senior Faculty	2
Neena	Kochhar	6000	Staff Faculty	1
Steven	King	4000	Staff Faculty	2
Download CSV
10 rows selected.

*/
