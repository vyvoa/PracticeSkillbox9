declare
    cursor c_emp (dep_name varchar2)
    is 
    select 
            emp.first_name as F_name,
            emp.last_name as L_name,
            emp.salary as sal,
            dep.department_name as dep_n
            
    from HR.employees emp
    left outer join HR.departments dep
                on emp.department_id = dep.department_id and
                dep.department_name like '%'||dep_name||'%';
    
    status varchar2(32);
    sal_error exception;
    chr number := 0;
    pragma EXCEPTION_INIT (sal_error, -20001);
begin

    for item in c_emp('') loop

        if item.sal <= 1000 then
            RAISE_APPLICATION_ERROR(-20001, 'Name: '||item.F_name||' surname: '||item.L_name||' salary: '||item.sal||' from department: '||item.dep_n|| ' status: TOO LOW');
        elsif item.sal between 1000 and 2000 then
            status := 'LOW';
        elsif item.sal between 2000 and 4000 then
            status := 'OK';
        elsif item.sal between 4000 and 5000 then
            status := 'HIGH';
        else
            status := 'TOO HIGH';
        end if;
        chr := chr + 1;
        DBMS_OUTPUT.PUT_LINE('Name: '||item.F_name||' surname: '||item.L_name||' salary: '||item.sal||' from department: '||item.dep_n|| ' status: '||status);
    end loop;
    DBMS_OUTPUT.put_line(chr);
EXCEPTION
    when sal_error then DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;