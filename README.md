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
mvn flyway:baseline # This will establish the baseline
```

# Migrations
Execute the following command to create a new migration:

```bash
mvn flyway:migrate # This will apply the new migrations to your Oracle database
```

# Migrations Info
Execute the following command to get the information about the migrations:

```bash
mvn flyway:info # This will show the information about the migrations
```

# Changing parameters
Override the default Flyway Database configuration via the command line arguments. 
For example, to change the database host, username, and password, you can use the following command:

```bash
mvn clean -Ddatabase.name=my_database -Ddatabase.user=some_user -Ddatabase.password=my_secret_pass flyway:migrate
```

# Additional Information
DB Migration files are stored in the `src/main/resources/db/migration` directory. 
They are separated by version and type. The version is a timestamp that is used to order the migrations. 
The type is either `V` for versioned migrations or `R` for repeatable migrations. Versioned migrations are applied once and never again. 
Repeatable migrations are applied every time the schema is migrated and the `R` file checksum changes. 
So, if you need to change a repeatable migration, you can change the file and Flyway will apply it again.

The idea is to use the versioned migrations for schema and data changes, like tables, sequences, etc. and the repeatable migrations for package code changes.
That way you can have a complete history of package changes in the database. The package changes can be merged from different branches and potential conflicts resolved inside IDE.

For the versioned migrations, the file name should be in the following format:

```
V{version}__{description}.sql
```

For `version` you can use a timestamp in the following format: `yyyy_MM_dd_HH_mm`. It's not that likely that two developers will create a migration at the exact same minute.
The Flyway will order the migrations by the timestamp. Additionally, by enabling the `outOfOrder` option, you can apply the migrations that are only merged into the main code branch sometime later.
Where Flyway needs to apply some versioned and some repeatable migrations, it will apply the versioned migrations first and then the repeatable migrations.

For the repeatable migrations, the file name should be in the following format:

```
R__{package_name}.sql
``` 

# Rollback
Flyway does not support rollback out of the box. However, you can create a new migration that will revert the changes made by the previous migration.
For example if you created a table in the previous migration, you can create a new migration that will drop the table.
For packages you just need to revert the version in repeatable migration file and Flyway will apply the changes again.

# Commercial Features of Flyway Teams and Enterprise
Commercial version of Flyway offers additional features like:
* DB State based changes (store and share all the database objects in version control)
* Undo migrations (with automatically generate the undo scripts in Enterprise version)
* Automated state-based deployment (Enterprise version)
* Schema comparison tool (Enterprise version)
* Schema snapshot tool (Enterprise version)

# Links
* [Redgate Flyway Community](https://www.red-gate.com/products/flyway/community/)
* [Flyway Editions - compare features](https://www.red-gate.com/products/flyway/editions)
* [Flyway Teams - Commercial](https://www.red-gate.com/products/flyway/teams/)