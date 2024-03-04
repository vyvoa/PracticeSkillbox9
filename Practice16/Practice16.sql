create or replace package pkg_agg_emp
is
    
    type sal_record is record (
                            salary          number,
                            min_salary      number,
                            max_salary      number,
                            dep_emp         varchar2(1024)
                            );
    type sal_record_tbl is table of sal_record;
    
    function row_returner return sal_record_tbl pipelined;
    
end pkg_agg_emp;

create or replace package body pkg_agg_emp
is
    
    function row_returner return sal_record_tbl pipelined
    is
    cursor c_emp_dep_jobs is
    select 
            sum(emp.salary) as sum_sal,
            sum(jobs.min_salary) as sum_min_sal,
            sum(jobs.max_salary) as sum_max_sal,
            listagg (emp.first_name||' '|| emp.last_name||' ') as dep_emp
    from hr.employees emp
    inner join HR.departments dep
                on dep.department_id = emp.department_id
    inner join HR.jobs jobs
                on jobs.job_id = emp.job_id
    group by dep.department_id;
                
    return_row sal_record;
     
    begin
    
        for  item in c_emp_dep_jobs loop
            
            return_row := null;
            return_row.salary := item.sum_sal;
            return_row.min_salary := item.sum_min_sal;
            return_row. max_salary := item.sum_max_sal;
            return_row.dep_emp := item.dep_emp;
            
            pipe row (return_row);
            
        end loop;
        
        return;
    end row_returner;
    
end pkg_agg_emp;




select * from table(pkg_agg_emp.row_returner);


