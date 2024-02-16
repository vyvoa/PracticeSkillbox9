with first_join as (      
    select dep.department_id,
            emp.employee_id,
            emp.first_name,
            emp.last_name,
            emp.salary,
            emp.hire_date,
            emp.job_id,
            emp.email
from departments dep
inner join /*+append*/employees emp
        on dep.department_id = emp.department_id
) , return as (
    select             
            f_jn.hire_date,
            f_jn.job_id,
            f_jn.employee_id,
            empe.enter_date,
            f_jn.first_name,
            f_jn.last_name,
            f_jn.email
    from first_join f_jn
    inner join employee_entrances empe
        on empe.employee_id =  f_jn.employee_id
)
select last_name,EMPLOYEE_ID,HIRE_DATE,JOB_ID,email
from return;


create table employee_entrances (employee_id     number,
                                 enter_date      date)
partition by range (enter_date)
interval(numtoyminterval(1,'month'))(partition p_min values less than (date'1900-01-01'));
--drop table employee_entrances;
insert into employee_entrances (
                                employee_id,
                                 enter_date
                                ) 
select  distinct employee_id,hire_date from employees;
commit;
select * from employee_entrances;

select * from employees;

