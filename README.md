# Baseline
Flyway can be implemented on the already existing project. The key point here is to establish
the baseline. The baseline is the current state of the database schema. Flyway will then apply 
migrations to the schema to bring it to the desired state.

This needs to be executed on each environment exactly once.

The only caveat to this is that, as the documentation states, you must ensure that 
all your databases match this V1.0 that you're creating and marking as the baseline. 
Any deviation will cause errors as you introduce new changes and migrate them into place. 
As long as you've got matching baseline points, you should be able to proceed with different data in different environments with no issues.

```bash
mvn compile flyway:baseline # This will establish the baseline
```

# Migrations
Execute the following command to create a new migration:

```bash
mvn compile flyway:migrate # This will apply the new migrations to your Oracle database
```

# Changing parameters
Override the default Flyway Database configuration via the command line arguments. 
For example, to change the database host, username, and password, you can use the following command:

```bash
mvn clean compile -Ddatabase.name=my_database -Ddatabase.user=some_user -Ddatabase.password=my_secret_pass flyway:migrate
```