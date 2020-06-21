# This is a template dotenv file. You should copy it and then modify it to fit
# your setup. These environment variables won't do anything unless copied into
# a file called `.env.test`. There, they'll be used to determine information
# about the test environment.
#
# This is useful because we want the test environment to have a different
# configuration from the development environment. That way, we can run
# the automated test suites without worrying about their impact on the database
# we use for development.
#
# For more information, see the Automated Testing Documentation.
# https://docs.suitecrm.com/developer/automatedtesting/


#== Install Test Suite:

# MYSQL or MSSQL
DATABASE_DRIVER={{ suitecrm.tests.database_driver }}

# Path to database server
DATABASE_HOST=localhost

# Name of the database
DATABASE_NAME={{ mysql.test_database }}

# Database user
DATABASE_USER={{ mysql.user }}

# Database password
DATABASE_PASSWORD={{ mysql.password }}


#== Acceptance, API, and Install Test Suites:

# URL of the SuiteCRM instance which the tester needs to access
INSTANCE_URL={{ suitecrm.url }}

# Admin username for SuiteCRM instance
INSTANCE_ADMIN_USER={{ suitecrm.tests.admin_user }}

# Admin password for SuiteCRM instance
INSTANCE_ADMIN_PASSWORD={{suitecrm.tests.admin_password }}


#== API Test Suite:

# API Client ID
INSTANCE_CLIENT_ID=suitecrm_client

# API Client Secret
INSTANCE_CLIENT_SECRET=secret

