--1st question
declare
    v_tries number :=1;
begin
    loop
        DBMS_OUTPUT.PUT_LINE ('Time '|| v_tries ||' : ' || CURRENT_TIMESTAMP);
        v_tries := v_tries + 1;
        dbms_session.sleep(2);
        exit when v_tries > 5;
    end loop;
end;
end;