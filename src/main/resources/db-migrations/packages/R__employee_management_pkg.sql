-- Create Package Specification
CREATE OR REPLACE PACKAGE employee_management_pkg IS
    -- Insert Operations
    PROCEDURE add_company(p_name VARCHAR2, p_location VARCHAR2);
PROCEDURE add_department(p_department_name VARCHAR2, p_company_id NUMBER);
PROCEDURE add_employee(p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_department_id NUMBER);
PROCEDURE inactivate_employee(p_employee_id NUMBER);

    -- Read Operations
FUNCTION get_company(p_company_id NUMBER) RETURN SYS_REFCURSOR;
FUNCTION get_department(p_department_id NUMBER) RETURN SYS_REFCURSOR;
FUNCTION get_employee(p_employee_id NUMBER) RETURN SYS_REFCURSOR;

    -- Update Operations
PROCEDURE update_company(p_company_id NUMBER, p_name VARCHAR2, p_location VARCHAR2);
PROCEDURE update_department(p_department_id NUMBER, p_department_name VARCHAR2, p_company_id NUMBER);
PROCEDURE update_employee(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_department_id NUMBER);

    -- Delete Operations
PROCEDURE delete_company(p_company_id NUMBER);
PROCEDURE delete_department(p_department_id NUMBER);
PROCEDURE delete_employee(p_employee_id NUMBER);
END employee_management_pkg;
/

-- Create Package Body
CREATE OR REPLACE PACKAGE BODY employee_management_pkg IS
    -- Insert Operations
    PROCEDURE add_company(p_name VARCHAR2, p_location VARCHAR2) IS
    BEGIN
INSERT INTO company (name, location) VALUES (p_name, p_location);
END add_company;

PROCEDURE add_department(p_department_name VARCHAR2, p_company_id NUMBER) IS
    BEGIN
INSERT INTO department (department_name, company_id) VALUES (p_department_name, p_company_id);
END add_department;

PROCEDURE add_employee(p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_department_id NUMBER) IS
    BEGIN
INSERT INTO employees (first_name, last_name, email, department_id) VALUES (p_first_name, p_last_name, p_email, p_department_id);
END add_employee;

-- Read Operations
FUNCTION get_company(p_company_id NUMBER) RETURN SYS_REFCURSOR IS
        l_cursor SYS_REFCURSOR;
    BEGIN
OPEN l_cursor FOR SELECT * FROM company WHERE company_id = p_company_id;
RETURN l_cursor;
END get_company;

FUNCTION get_department(p_department_id NUMBER) RETURN SYS_REFCURSOR IS
        l_cursor SYS_REFCURSOR;
    BEGIN
OPEN l_cursor FOR SELECT * FROM department WHERE department_id = p_department_id;
RETURN l_cursor;
END get_department;

FUNCTION get_employee(p_employee_id NUMBER) RETURN SYS_REFCURSOR IS
        l_cursor SYS_REFCURSOR;
    BEGIN
OPEN l_cursor FOR SELECT * FROM employees WHERE employee_id = p_employee_id;
RETURN l_cursor;
END get_employee;

-- Update Operations
PROCEDURE update_company(p_company_id NUMBER, p_name VARCHAR2, p_location VARCHAR2) IS
    BEGIN
UPDATE company SET name = p_name, location = p_location WHERE company_id = p_company_id;
END update_company;

PROCEDURE update_department(p_department_id NUMBER, p_department_name VARCHAR2, p_company_id NUMBER) IS
    BEGIN
UPDATE department SET department_name = p_department_name, company_id = p_company_id WHERE department_id = p_department_id;
END update_department;

PROCEDURE update_employee(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_department_id NUMBER) IS
    BEGIN
UPDATE employees SET first_name = p_first_name, last_name = p_last_name, email = p_email, department_id = p_department_id WHERE employee_id = p_employee_id;
END update_employee;

-- Delete Operations
PROCEDURE delete_company(p_company_id NUMBER) IS
    BEGIN
DELETE FROM company WHERE company_id = p_company_id;
END delete_company;

PROCEDURE delete_department(p_department_id NUMBER) IS
    BEGIN
DELETE FROM department WHERE department_id = p_department_id;
END delete_department;

PROCEDURE delete_employee(p_employee_id NUMBER) IS
    BEGIN
DELETE FROM employees WHERE employee_id = p_employee_id;
END delete_employee;

PROCEDURE inactivate_employee(p_employee_id NUMBER) IS
    BEGIN
UPDATE employees SET inactive = 0 WHERE employee_id = p_employee_id;
END inactivate_employee;

END employee_management_pkg;
/