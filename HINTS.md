



## Hello World Package

Creating a simple "Hello World" Oracle package involves creating both a package specification and a package body. The specification declares the public procedures, while the package body contains the actual implementation. Below is an example of a simple Oracle package that includes a procedure to print "Hello, World!" using PL/SQL.

### Step 1: Create the Package Specification

The package specification declares the elements of the package that are accessible to users, such as procedures and functions.

```sql
CREATE OR REPLACE PACKAGE hello_world_pkg IS
  PROCEDURE say_hello;
END hello_world_pkg;
/
```

### Step 2: Create the Package Body

The package body contains the actual implementation of the procedures and functions declared in the specification.

```sql
CREATE OR REPLACE PACKAGE BODY hello_world_pkg IS

  PROCEDURE say_hello IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, World!');
  END say_hello;

END hello_world_pkg;
/
```

### Step 3: Use the Package

Once the package is created, you can execute the procedure from a PL/SQL block or an Oracle client like SQL*Plus, SQL Developer, etc.

```sql
BEGIN
  hello_world_pkg.say_hello;
END;
/
```

### Notes:

- **DBMS_OUTPUT.PUT_LINE**: This Oracle-provided procedure outputs the specified string to the console. Make sure the server output is enabled if you are using an Oracle tool to see the output.

- **Enabling Server Output**: If you're using SQL*Plus or SQL Developer, ensure that server output is enabled to see the output:
  ```sql
  SET SERVEROUTPUT ON;
  ```

This simple package serves as a template for more complex packages where you can encapsulate multiple related procedures, functions, and other elements for organized and reusable PL/SQL code.