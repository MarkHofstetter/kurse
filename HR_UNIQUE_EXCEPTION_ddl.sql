-- Start of DDL Script for Procedure HR.UNIQUE_EXCEPTION
-- Generated 10-Jun-2010 13:36:06 from HR@ORCL

CREATE OR REPLACE 
PROCEDURE unique_exception
   ( p_first_name IN working_salary.first_name%TYPE,
     p_last_name IN working_salary.last_name%TYPE)
   IS

   e_uk_violated EXCEPTION;

   pragma EXCEPTION_INIT
    (e_uk_violated, -00001);

BEGIN
    insert into working_salary (first_name, last_name, hire_date ) values (p_first_name, p_last_name, sysdate);

EXCEPTION
    WHEN e_uk_violated THEN
        dbms_output.put_line(SQLERRM||' '||SQLCODE);
        err_log(SQLERRM, SQLCODE);
END; -- Procedure
/

-- das hat der bernhard sehr schoen gemacht


-- End of DDL Script for Procedure HR.UNIQUE_EXCEPTION

