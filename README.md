# PL/SQL Employee Performance Tracking

## Project Overview
This project demonstrates the use of **PL/SQL Collections, Records, and GOTO statements** to track and process employee performance data. The procedure `process_employee_performance` uses structured types and arrays to calculate performance averages and handle incomplete data using GOTO labels.

---

## Features
- **PL/SQL Collections (VARRAYs)** to store employee performance scores.
- **PL/SQL Records** to structure employee information (ID, Name, Department, Scores).
- **GOTO statements** to control the flow when data is insufficient.
- Simple employee performance tracking with output via `DBMS_OUTPUT`.

---

## Files
- `Employee_Perfotmance_tracking.sql` — Contains the main PL/SQL procedure and example usage.
- `README.md` — This documentation file.

---

## Procedure Details

### Procedure Name
`process_employee_performance`

### Purpose
- Stores employee data in records.
- Calculates total and average performance scores.
- Skips employees with insufficient data using GOTO statements.
- Displays detailed performance information.

### Types Used
- `ScoreArray` — A VARRAY to hold up to 5 performance scores.
- `EmployeeRec` — A RECORD type to store employee details including ID, Name, Department, and Scores.

### Example Employees
- Alice Uwimana — Finance, 5 performance scores.
- John Iradukunda — IT, 2 performance scores (to demonstrate GOTO skipping).

---

## How to Run
1. Open **Oracle SQL Developer** or any PL/SQL environment.
2. Load the script `Employee_Perfotmance_tracking.sql`.
3. Run the procedure:

```sql
BEGIN
    process_employee_performance;
END;
/
