--1 question
begin
    dbms_output.put_line('Исправления вечны');
end;

--2 question
begin
    if round(dbms_random.value(0, 10), 2) <= 3 then
        dbms_output.put_line('БС1');
    elsif round(dbms_random.value(0, 10), 2) = 5 then
        dbms_output.put_line('БС2');
    else
        dbms_output.put_line('счёт');
    end if;
end;

--3 question
begin
    if mod(round(dbms_random.value(1, 5)),2) = 1 then
        dbms_output.put_line('Нечетное');
    else
        dbms_output.put_line('Четное');
    end if;
    
end;

