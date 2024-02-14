drop view security.V_DUTY;
drop table hr.duty;
create table security.duty (id number generated as identity);
grant select on hr.employees to security;

create or replace view security.duty_employees
as
select * from security.duty dt
full join HR.employees emp
        on emp.employee_id = dt.id;