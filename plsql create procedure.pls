-- Example of create procedure, calling a procedure, %ROWTYPE
-- use https://livesql.oracle.com/

create or replace procedure procedure_highestPaidStaffer
as
v_highestPaidStaffer ad.ad_faculty_details%ROWTYPE;
begin
select faculty.* into v_highestPaidStaffer
  from ad.ad_faculty_details faculty
  where salary = (select max(salary) from ad.ad_faculty_details);

dbms_output.put_line('The highest paid staffer is '
    ||v_highestPaidStaffer.first_name ||' '||v_highestPaidStaffer.last_name);

end;
/
begin
procedure_highestPaidStaffer;
end;

/*
The result is 

Procedure created.
Statement processed.
The highest paid staffer is Daniel Faviet

*/
