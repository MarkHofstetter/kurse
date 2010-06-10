CREATE OR REPLACE PROCEDURE fill_dep_emp
   IS

   TYPE emp_table_type IS TABLE OF emp_list
      INDEX BY varchar2(100);

   t_emp    emp_table_type;
   v_index  varchar2(100);

BEGIN

/*
   for r_ed in (select department_name from dep_emp) loop
      t_emp(r_ed.department_name) := emp_list();
   end loop; */

   for r_ed in (SELECT FIRST_NAME||' '||LAST_NAME e_name, DEPARTMENT_NAME
                       FROM DEPARTMENTS , EMPLOYEES
                      WHERE ( (DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID) ))
   loop
      if (not t_emp.exists(r_ed.department_name)) then
         t_emp(r_ed.department_name) := emp_list();
      end if;
     t_emp(r_ed.department_name).extend;
     t_emp(r_ed.department_name)(t_emp(r_ed.department_name).last) := r_ed.e_name;
   end loop;

   v_index := t_emp.first;
   loop
     exit when v_index is null;
     update dep_emp set emp_names = t_emp(v_index)
     where department_name = v_index;
     v_index := t_emp.next(v_index);
   end loop;

END; -- Procedure
