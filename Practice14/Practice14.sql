create or replace package pkg_job_description
as 
    function get_min_max_salary(p_job_id varchar2 default 'AD_PRES') return varchar2;
    procedure print_employee_name(p_emp_id number);
end pkg_job_description;

create or replace package body pkg_job_description
as 

--begin print_employee_name
    procedure print_employee_name(p_emp_id number)
    as 
    jb_id varchar2(32);
    name varchar2(64);
    begin
        select 
                first_name,
                job_id
                
            into 
                name,
                jb_id
        from HR.employees
        where employee_id = p_emp_id;
        
        DBMS_OUTPUT.put_line(name || ' is ' ||get_min_max_salary(jb_id));
    end print_employee_name;
--end print_employee_name
    
--begin get_min_max_salary 
    function get_min_max_salary(p_job_id varchar2 default 'AD_PRES') return varchar2
    as
    max_sal number;
    min_sal number;
    jb_title varchar2(32);
    begin
        select 
                max_salary,
                min_salary,
                job_title
            into 
                max_sal,
                min_sal, 
                jb_title 
        from HR.jobs
        where job_id = p_job_id;
        return ( jb_title ||' Min salary - ' || to_char(min_sal)|| ' , Max salary - ' || to_char(max_sal));
    end get_min_max_salary; 
--end get_min_max_salary

end pkg_job_description;

select pkg_job_description.get_min_max_salary('FI_MGR')
from dual;

begin
    pkg_job_description.print_employee_name(100);
end;

