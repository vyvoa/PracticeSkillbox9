-- 2nd question
declare
    manag_name varchar2(32);
    manag_last_name varchar2(32);
begin
    for item in (select 
                    emp.first_name,
                    emp.last_name,
                    emp.salary,
                    emp.manager_id
                from HR.employees emp
                inner join HR.departments dep
                        on emp.department_id = dep.department_id and
                        dep.department_name = 'IT'
                ) loop
        select 
                first_name, 
                last_name
                into manag_name,
                    manag_last_name
        from  HR.employees
        where employee_id = item.manager_id;
        DBMS_OUTPUT.PUT_LINE (item.first_name|| ' ' ||item.last_name || ' _________ ' || item.salary ||'  '|| manag_name ||' '|| manag_last_name || ' ________________ ');
    end loop;   
end;
