
CREATE OR REPLACE PROCEDURE process_employee_performance IS


  TYPE ScoreArray IS VARRAY(5)  OF NUMBER;
  
  TYPE EmployeeRec IS RECORD (
     emp_id NUMBER,
     emp_name VARCHAR2(50),
     department VARCHAR2(40),
     scores ScoreArray
  );
  
  emp1 EmployeeRec;
  emp2 EmployeeRec;
  total_score NUMBER := 0;
  average_score NUMBER := 0;

BEGIN
  
  emp1.emp_id := 101;
  emp1.emp_name := 'Alice Uwimana';
  emp1.department := 'Finance';
  emp1.scores := ScoreArray(85, 90, 88, 92, 95);
  
  emp2.emp_id := 102;
  emp2.emp_name := 'John Iradukunda';
  emp2.department := 'IT';
  emp2.scores := ScoreArray(80, 85);
  
   --Process first employee 
  total_score := 0;
  IF emp1.scores.COUNT < 3 THEN
      DBMS_OUTPUT.PUT_LINE('Insufficient data for employee: ' || emp1.emp_name);
      GOTO NEXT_EMPLOYEE;
  END IF;
  
  FOR I IN 1 .. emp1.scores.COUNT LOOP
      total_score := total_score + emp1.scores(i);
  END LOOP;
  average_score := total_score / emp1.scores.COUNT;
  
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp1.emp_id);
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp1.emp_name);
  DBMS_OUTPUT.PUT_LINE('Department: ' || emp1.department);
  DBMS_OUTPUT.PUT_LINE('Performance Scores:');
  FOR i IN 1 .. emp1.scores.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Month ' || i || ': ' || emp1.scores(i));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Average Score: ' || average_score);
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  <<NEXT_EMPLOYEE>>
  total_score := 0;
  
  
  --Process second employee
  IF emp2.scores.COUNT < 3 THEN
      DBMS_OUTPUT.PUT_LINE('Insufficient data for employee: ' || emp2.emp_name);
      GOTO END_PROCEDURE;
  END IF;
  
  FOR i IN 1 .. emp2.scores.COUNT LOOP
      total_score := total_score + emp2.scores(i);
  END LOOP;
  average_score := total_score / emp2.scores.COUNT;

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp2.emp_id);
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp2.emp_name);
  DBMS_OUTPUT.PUT_LINE('Department: ' || emp2.department);
  DBMS_OUTPUT.PUT_LINE('Performance Scores:');
  FOR i IN 1 .. emp2.scores.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('Month ' || i || ': ' || emp2.scores(i));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Average Score: ' || average_score);
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
  
  <<END_PROCEDURE>>
  NULL;
END process_employee_performance;

   
  
  