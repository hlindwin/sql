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
