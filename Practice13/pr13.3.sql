declare
    cnt_chapter constant number := 10;
    cnt_subchapter constant number := 3;
    v_curchp number := 0;
    v_totalchp number := 0;
    v_subchp number := 1;
begin
    while v_totalchp <  cnt_chapter
    loop
        v_curchp := v_curchp + 1;
        DBMS_OUTPUT.PUT_LINE('Глава' || v_curchp);
        v_subchp := 1;
        while v_subchp <= cnt_subchapter and v_totalchp <  cnt_chapter
        loop
            v_totalchp := v_totalchp + 1;
            DBMS_OUTPUT.PUT_LINE(v_curchp || '.' || v_subchp);
            v_subchp := v_subchp + 1; 
        end loop;
    end loop;
end;