--1 question
begin
    dbms_output.put_line('����������� �����');
end;

--2 question
begin
    if round(dbms_random.value(0, 10), 2) <= 3 then
        dbms_output.put_line('��1');
    elsif round(dbms_random.value(0, 10), 2) = 5 then
        dbms_output.put_line('��2');
    else
        dbms_output.put_line('����');
    end if;
end;

--3 question
begin
    if mod(round(dbms_random.value(1, 5)),2) = 1 then
        dbms_output.put_line('��������');
    else
        dbms_output.put_line('������');
    end if;
    
end;

