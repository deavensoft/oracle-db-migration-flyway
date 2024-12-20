-- Create Company Table
CREATE TABLE company (
                         company_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                         name VARCHAR2(100) NOT NULL,
                         location VARCHAR2(100)
);

-- Create Department Table
CREATE TABLE department (
                            department_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                            department_name VARCHAR2(100) NOT NULL,
                            company_id NUMBER NOT NULL,
                            FOREIGN KEY (company_id) REFERENCES company(company_id)
);

-- Create Employees Table
CREATE TABLE employees (
                           employee_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                           first_name VARCHAR2(50),
                           last_name VARCHAR2(50),
                           email VARCHAR2(100),
                           department_id NUMBER NOT NULL,
                           FOREIGN KEY (department_id) REFERENCES department(department_id)
);