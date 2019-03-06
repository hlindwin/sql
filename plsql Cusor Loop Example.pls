-- use https://livesql.oracle.com/
-- returns people that have at least the given salary
declare
    v_fname varchar2(20);
    v_lname varchar2(20);
    v_salary number(10);
    CURSOR cur_getName(param_salary number := 7000) is
    select First_name, Last_name, salary
    from ad.ad_faculty_details
    where salary > param_salary;
begin
    open cur_getName();
    loop
        fetch cur_getName into v_fname, v_lname, v_salary;
        exit when cur_getName%NOTFOUND;
        dbms_output.put_line(v_fname ||' '||v_lname||' gets paid '||v_salary);
    end loop;
    close cur_getName;
end;
/

declare
    v_fname varchar2(20);
    v_lname varchar2(20);
    v_salary number(10);
    CURSOR cur_getName(param_salary number := 7000) is
    select First_name, Last_name, salary
    from ad.ad_faculty_details
    where salary > param_salary;
begin
    open cur_getName(0);
    loop
        fetch cur_getName into v_fname, v_lname, v_salary;
        exit when cur_getName%NOTFOUND;
        dbms_output.put_line(v_fname ||' '||v_lname||' gets paid '||v_salary);
    end loop;
    close cur_getName;
end;

/* results is

First one:
Statement processed.
Lex De Haan gets paid 15000
Alexander Hunold gets paid 9000
Valli Pataballa gets paid 28000
Diana Lorentz gets paid 18000
Nancy Greenberg gets paid 21200
Daniel Faviet gets paid 39000

Second one:
Statement processed.
Steven King gets paid 4000
Neena Kochhar gets paid 6000
Lex De Haan gets paid 15000
Alexander Hunold gets paid 9000
Bruce Ernst gets paid 6000
David Austin gets paid 4800
Valli Pataballa gets paid 28000
Diana Lorentz gets paid 18000
Nancy Greenberg gets paid 21200
Daniel Faviet gets paid 39000

*/
